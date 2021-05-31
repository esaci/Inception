FROM alpine:3.12.0

RUN mkdir -p /run/nginx
RUN apk update \
    && apk add openssl
RUN apk -U add nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/esaci.key -out /etc/ssl/certs/esaci.crt -subj '/C=FR/ST=75/L=Paris/O=42/OU=School/CN=esaci'
COPY ./conf/esaci.html /var/www/html/esaci.html
ADD conf/default /etc/nginx/conf.d/default.conf
CMD     nginx;\
        sleep infinity & wait