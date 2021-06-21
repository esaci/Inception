FROM alpine:3.11.0

RUN apk update && apk add nginx php7 php7-bcmath php7-ctype php7-curl php7-fpm php7-gd php7-iconv php7-intl php7-json php7-mbstring php7-mcrypt php7-mysqlnd php7-opcache php7-openssl php7-pdo php7-pdo_mysql php7-mysqli php7-pdo_pgsql php7-pdo_sqlite php7-phar php7-posix php7-session php7-soap php7-xml php7-zip 

COPY conf/wordpress/ /wordpress/wordpress
RUN rm -rf /wordpress/hosts
RUN cp /etc/hosts /wordpress/