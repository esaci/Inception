FROM alpine:3.12.0

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && apk add openssl\
    && mkdir -p /run/nginx
RUN apk -U add nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/esaci.key -out /etc/ssl/certs/esaci.crt -subj '/C=FR/ST=75/L=Paris/O=42/OU=School/CN=esaci'
COPY ./conf/esacii.html /var/www/localhost/htdocs/esacii.html
COPY ./conf/nginx.conf /etc/nginx/nginx.conf


CMD     nginx;\
        sleep infinity & wait