FROM alpine:3.12.0

RUN 		apk -U upgrade && apk add	php7				\
										php7-fpm			\
										php7-phar			\
										php7-json			\
										php7-mysqli			\
										php7-curl			\
										php7-iconv			\
										php7-pecl-mailparse	\
										curl				\
										mariadb-client		\
										bash

RUN         wget -P /tmp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x /tmp/wp-cli.phar && mv /tmp/wp-cli.phar /usr/sbin/wp


WORKDIR     /var/www/wordpress

COPY        ./conf/wordpress ./

ENV				MARIADB_DATABASE="wordpress"			\
				MARIADB_USER="wordpress"				\
				MARIADB_PASSWORD="wordpress"			\
				MARIADB_HOST="mariadb"					\
				MARIADB_PORT=3306						

RUN         addgroup -S nginx && adduser -S nginx
RUN		    mkdir /var/log/phpmodif

COPY	    ./conf/www.conf /etc/php7/php-fpm.d/www.conf
COPY	    ./conf/php-fpm.conf /etc/php7/php-fpm.conf

COPY	    ./conf/start.sh /tmp/start.sh
RUN 	    chmod +x /tmp/start.sh


COPY        ./conf/wp-config.php /var/www/wordpress/

ENTRYPOINT		[ "bash", "/tmp/start.sh" ]