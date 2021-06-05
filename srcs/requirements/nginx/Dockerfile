FROM alpine:3.12.0

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && apk add openssl \
    && apk add nginx \
    && apk add openssh \
    && mkdir -p /run/nginx \
    && mkdir /var/www/test

COPY conf/index.html /var/www/
COPY conf/indexx.html /var/www/
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/esaci.key -out /etc/ssl/certs/esaci.crt -subj '/C=FR/ST=75/L=Paris/O=42/OU=School/CN=esaci'

EXPOSE 80 443 30022

CMD nginx;\
    sleep infinity & wait
