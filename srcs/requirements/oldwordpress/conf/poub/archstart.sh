#!/bin/sh

addgroup -S esaci && adduser -S elias -G esaci
su -l elias -s /bin/bash
mkdir -p /run/nginx
mkdir -p /usr/share/webapps
tar -xzf /tmp/latest.tar.gz  -C /usr/share/webapps/
mkdir -m 777 /usr/share/webapps/wordpress/wp-content/uploads
chown -R elias /usr/share/webapps/

ln -s /usr/share/webapps/wordpress /var/www/wordpress

cd /usr/share/webapps/wordpress
mv  ./wp-config-sample.php wp-config.php

sed -i "s/database_name_here/wordpress/" wp-config.php
sed -i "s/password_here/password/" wp-config.php
sed -i "s/username_here/user/" wp-config.php

nginx
php-fpm7

