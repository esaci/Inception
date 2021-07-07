#! /bin/bash

set -e

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	cp -r /conf/wp-config.php .
	if ! wp core download; then
		printf "\nwp-config manquant !\n"
	fi
fi

count=0
while [ $count -lt 60 ]; do
	printf "\nToujours pas connecte a Mariadb et il reste $((60-count)) secondes !\n"
	if mariadb -h${MARIADB_HOST} -P${MARIADB_PORT} -u${MARIADB_USER} -p${MARIADB_PASSWORD}; then
		printf "\nConnecte a Mariadb ! en $count secondes !\n"
		count=80
	fi
	count=$((count+1))
	sleep 1
done
if [ $count -lt 80 ]; then
	printf "\nConnection echoue !\n\n\n\n\n"
	exit 1
fi


if [ "$(mariadb -h${MARIADB_HOST} -P${MARIADB_PORT} -u${MARIADB_USER} -p${MARIADB_PASSWORD} -e "USE ${MARIADB_DATABASE}; SHOW TABLES;")" == "" ]; then
	wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USER}"	\
		--admin_password="${WP_ADMIN_PWD}" --admin_email="elias@gmail.com" --skip-email
	wp term create category "Elias Premier Article"
	wp user create user1 user1@example.com --role=editor --user_pass=pass
	wp user create user2 user2@example.com --role=author --user_pass=pass
	wp user create user3 user3@example.com --role=contributor --user_pass=pass
	wp user create user4 user4@example.com --role=subscriber --user_pass=pass
	wp post create /tmp/article1.txt --post_author=1 --post_category="Elias Premier Article" --post_title="Merci a tous" --post_status=publish  > /tmp/postid
fi

php-fpm7 -F
