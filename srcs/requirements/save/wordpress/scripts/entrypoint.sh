#! /bin/bash


function wait_for_db()
{
	i=1
	while ! mariadb -h$MARIADB_HOST -P${MARIADB_PORT} -u$MARIADB_USER -p$MARIADB_PASSWORD; do
		if [ $i -ge 60 ]; then
			printf "Failed to connect to mariadb\n"
			exit 1
		fi
		printf "Trying to reach mariadb... ($i/60 sec)\n"
		i=$((i+1))
		sleep 1
	done

	printf "Connection to mariadb established.\n"
}


set -e

# ------ INSTALL WORDPRESS _IF_ REQUIRED ------#

# In case wordpress volume got destroyed, download it again and copy the config file
if [ ! -f "wp-config.php" ]; then
	printf "Seems like wordpress volume is missing something. Let's try to solve the problem!\n"
	if ! wp core download; then
		printf "core was installed, but config was missing.\n"
	fi
	cp -r /config/wp-config.php .
fi

# If wordpress is not installed, i.e if database is not initialized properly, just do it.
wait_for_db
if [ "$(mariadb -h${MARIADB_HOST} -P${MARIADB_PORT} -u$MARIADB_USER -p$MARIADB_PASSWORD -e "USE $MARIADB_DATABASE; SHOW TABLES;")" == "" ]; then
	printf "Wordpress not installed, installing it...\n"
	#wp config create --dbhost="$MARIADB_HOST" --dbname="$MARIADB_DATABASE" --dbuser="$MARIADB_USER" --dbpass="$MARIADB_PASSWORD"
	wp core install --url="$WP_URL:$WP_PORT" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER"	\
		--admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email
	# to work with redis and use it as a cache	
	
	wp theme activate twentytwenty

	# populate wordpress website with some dummy content
	wp_users=("bob")
	# create each user and a related post
	userid=2
	for user in ${wp_users[@]}; do
		wp user create $user $user@example.com --role=author --user_pass=$user
		wp post create	--post_title="$user's post"	--post_content="Hello, my name is $user!"	\
						--post_status=publish --post_author=$userid
		userid=$((userid+1))
	done

	# test file which will be used by the wordpress action to ensure php-fpm works as expected.
	echo "<?php echo 'php-fpm works' ?>" > $PWD/test.php
fi

# ----- PHP-FPM ----- #


printf "Starting php-fpm7...\n"
php-fpm7 -F
