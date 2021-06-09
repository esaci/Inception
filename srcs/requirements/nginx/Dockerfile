FROM alpine:3.12.0

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && apk add openssl \
    && apk add nginx \
    && apk add openssh \
    && mkdir -p /run/nginx
CMD sudo mkdir -p /var/www/esaci.42.fr/html \
    sudo chown -R 777 /var/www/esaci.42.fr/html 

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/esaci.key -out /etc/ssl/certs/esaci.crt -subj '/C=FR/ST=75/L=Paris/O=42/OU=School/CN=esaci'
COPY conf/esaci.html /var/www/esaci.42.fr/html/esaci.html
COPY conf/esaci.42.fr /etc/nginx/sites-available/esaci.42.fr
COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD sudo ln -s /etc/nginx/sites-available/ /etc/nginx/sites-enabled/


EXPOSE 80 443 30022


CMD nginx;\
    sleep infinity & wait
