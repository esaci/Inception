FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=France/L=Paris/O=42/CN=esaci.42.fr" \
	-keyout /etc/ssl/private/esaci.key -out /etc/ssl/certs/esaci.crt

#COPY conf/nginx.conf /etc/nginx/
COPY conf/esaci /etc/nginx/sites-available/
COPY conf/index.html /var/www/esaci/html/
RUN ln -sf /etc/nginx/sites-available/esaci /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]
