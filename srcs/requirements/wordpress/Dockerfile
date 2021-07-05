FROM alpine:3.12.0

RUN apk update  && apk add sudo && apk add bash \
    && apk add mariadb-client php7 php7-bcmath php7-ctype php7-curl php7-fpm php7-gd php7-iconv php7-intl php7-json php7-mbstring php7-mcrypt php7-mysqlnd php7-opcache php7-openssl php7-pdo php7-pdo_mysql php7-mysqli php7-pdo_pgsql php7-pdo_sqlite php7-phar php7-posix php7-session php7-soap php7-xml php7-zip 

RUN wget -P /tmp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x /tmp/wp-cli.phar && mv /tmp/wp-cli.phar /usr/sbin/wp

RUN addgroup -S nginx && adduser -S nginx
RUN		mkdir /var/log/phpmodif

COPY	./conf/www.conf /etc/php7/php-fpm.d/www.conf
COPY	./conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY	./conf/start.sh /tmp/start.sh
COPY    ./conf/wordpress /var/www/wordpress/
COPY    ./conf/wp-config.php /var/www/wordpress/
RUN 	chmod +x /tmp/start.sh

WORKDIR         /var/www/wordpress/

ENTRYPOINT		[ "bash", "/tmp/start.sh" ]