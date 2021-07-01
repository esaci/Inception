#! /bin/bash

set -e

if [ ! -f "wp-config.php" ]; then
	printf "Seems like wordpress volume is missing something. Let's try to solve the problem!\n"
	if ! wp core download; then
		printf "core was installed, but config was missing.\n"
	fi
	cp -r /var/www/wordpress/conf/wp-config.php .
fi

while !( mariadb -h mariadb -P 3306 -u wordpress -p wordpress); do
		sleep 1
		printf " Toujours pas connecte...\n"
	done
printf "Connection etablie.\n"

if [ "$(mariadb -h mariadb -P 3306 -u wordpress -p wordpress -e "USE wordpress; SHOW TABLES;")" == "" ]; then
	wp core install --url="http://localhost:9000" --title="Inception esaci" --admin_user="esaci"	\
		--admin_password="pwd" --admin_email="elias@gmail.com" --skip-email
	wp user create user1 user1@example.com --role=editor --user_pass=pass
	wp user create user2 user2@example.com --role=author --user_pass=pass
	wp user create user3 user3@example.com --role=contributor --user_pass=pass
	wp user create user4 user4@example.com --role=subscriber --user_pass=pass
	wp post create /tmp/article1.txt --post_author=user1 --post_category="Articles" --post_title="esaci Article 1" --post_status=publish  > /tmp/postid
	echo "<?php echo 'php-fpm works' ?>" > /tmp/test.php
	done
fi

php-fpm7 -F
