FROM alpine:3.12.0

RUN apk update && apk add mariadb mariadb-client
RUN apk update \
    && apk upgrade \
    && apk add bash \
    && apk add openssl \
    && apk add nginx \
    && apk add openssh \
    && mkdir -p /run/nginx \
    && apk add sudo
RUN mkdir /etc/nginx/sites-available/ && mkdir /etc/nginx/sites-enabled/
RUN chmod 777 /etc/nginx/sites-available/ && chmod 777 /etc/nginx/sites-enabled/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=France/L=Paris/O=42/CN=esaci.42.fr" \
	-keyout /etc/ssl/private/esaci.key -out /etc/ssl/certs/esaci.crt

COPY conf/esaci /etc/nginx/nginx.conf
COPY conf/index.html /var/www/nginx/html/
CMD sudo ln -s /etc/nginx/sites-available/ /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]
