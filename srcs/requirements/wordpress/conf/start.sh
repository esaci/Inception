#!/bin/sh

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

addgroup -S esaci && adduser -S elias -G esaci
mkdir -p /run/nginx
mkdir -p /usr/share/webapps
tar -xzf /tmp/latest.tar.gz  -C /usr/share/webapps/
mkdir -m 777 /usr/share/webapps/wordpress/wp-content/uploads
chown -R nginx:www-data /usr/share/webapps/

ln -s /usr/share/webapps/wordpress /var/www/wordpress

cd /usr/share/webapps/wordpress
mv  ./wp-config-sample.php wp-config.php

sed -i "s/database_name_here/wordpress/" wp-config.php
sed -i "s/password_here/password/" wp-config.php
sed -i "s/username_here/user/" wp-config.php
sed -i "s/localhost/0.0.0.0:3306/" wp-config.php

su -s /bin/sh -c "initwordpress.sh" nginx

nginx
php-fpm7


while sleep 20;
do
	if ! pgrep "nginx"
	then
		exit 1
	fi
	if ! pgrep "php-fpm"
	then
		exit 1
	fi
done

#! /bin/bash

while !( mariadb -h mariadb -P 3306 -u wordpress -p wordpress); do
		printf "Toujours pas connecte ....\n"
		sleep 1
	done
printf "Connection etablie ! \n"


if [ "$(mariadb -h mariadb -P 3306 -u wordpress -p wordpress -e "USE wordpress; SHOW TABLES;")" == "" ]; then
	wp core install --url="http://localhost:9000" --title="Inception esaci" --admin_user="esaci"	\
		--admin_password="pwd" --admin_email="elias@gmail.com" --skip-email
	wp user create user1 user1@example.com --role=editor --user_pass=pass
	wp user create user2 user2@example.com --role=author --user_pass=pass
	wp user create user3 user3@example.com --role=contributor --user_pass=pass
	wp user create user4 user4@example.com --role=subscriber --user_pass=pass
	wp post create /tmp/article1.txt --post_author=user1 --post_category="Articles" --post_title="esaci Article 1" --post_status=publish  > /tmp/postid
	done

	echo "<?php echo 'php-fpm works' ?>" > $PWD/test.php
fi

sed -i "s/listen = 9000/listen = ${PHP_FPM_PORT}/g" /etc/php7/php-fpm.d/www.conf

printf "Starting php-fpm7...\n"
php-fpm7 -F
