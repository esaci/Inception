#! /bin/bash


count=0
while ! mariadb -h$MARIADB_HOST -P${MARIADB_PORT} -u$MARIADB_USER -p$MARIADB_PASSWORD; do
		if [ $count -gt 60 ]; then
			printf "Erreur connection\n"
			exit 1
		fi
		count=$((count+1))
		sleep 1
	done
printf "Connection etablie.\n"

if [ "$(mariadb -h mariadb -P 3306 -u wordpress -p wordpress -e "USE wordpress; SHOW TABLES;")" == "" ]; then
	wp core install --url="http://localhost:9000" --title="Inception esaci" --admin_user="esaci"	\
		--admin_password="pwd" --admin_email="elias@gmail.com" --skip-email
	wp plugin update --all
	wp user create user1 user1@example.com --role=editor --user_pass=pass
	printf "Normalement c'est bon..... \n \n \n \n"
fi

php-fpm7 -F
