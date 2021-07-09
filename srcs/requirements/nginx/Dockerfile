FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl bash

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=France/L=Paris/O=42/CN=esaci.42.fr" \
	-keyout /etc/ssl/private/esaci.key -out /etc/ssl/certs/esaci.crt

COPY conf/esaci /etc/nginx/conf.d/default.conf
COPY conf/index.html /var/www/esaci/
COPY conf/start.sh /tmp/start.sh
ENTRYPOINT	[ "sh", "/tmp/start.sh" ]

