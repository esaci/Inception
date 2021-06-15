#!/bin/sh

cd /usr/share/webapps/wordpress

if $(wp core is-installed);then
	exit 0;
	fi
sleep 30

wp core install --url=http://SERV_IP:5050 --title="ft_services" --admin_user=user --admin_password=password --admin_email=esaci@42.fr --skip-email
wp term create category "Articles"

wp user create user1 user1@example.com --role=editor --user_pass=pass
wp user create user2 user2@example.com --role=author --user_pass=pass
wp user create user3 user3@example.com --role=contributor --user_pass=pass
wp user create user4 user4@example.com --role=subscriber --user_pass=pass

wp post create /tmp/article1.txt --post_author=1 --post_category="Articles" --post_title="esaci Article 1" --post_status=publish  > /tmp/postid


######

