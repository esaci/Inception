FROM alpine:3.12.0

RUN 		apk -U upgrade && apk add php7 php7-fpm php7-phar php7-json php7-mysqli php7-curl php7-iconv php7-pecl-mailparse curl mariadb-client bash

RUN         wget -P /tmp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x /tmp/wp-cli.phar && mv /tmp/wp-cli.phar /usr/sbin/wp


WORKDIR     /var/www/wordpress

RUN				wp core download


COPY			./conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY			./conf/www.conf		/etc/php7/php-fpm.d/www.conf
RUN         	addgroup -S nginx && adduser -S nginx
RUN				mkdir /var/log/php-fpm 

COPY			./conf/wp-config.php ./
COPY			./conf/wp-config.php /conf/
COPY			./conf/start.sh /tmp/start.sh
COPY			./conf/article1.txt /tmp/

ENTRYPOINT		[ "bash", "/tmp/start.sh" ]