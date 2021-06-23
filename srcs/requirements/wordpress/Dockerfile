FROM debian:buster

RUN apt-get update && \
	apt-get install -y wordpress

COPY conf/wordpress/ /var/www/wordpress/
