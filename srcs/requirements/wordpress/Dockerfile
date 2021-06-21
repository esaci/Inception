FROM debian:buster

RUN apt-get update && \
	apt-get install -y wordpress

COPY conf/wordpress/ /wordpress/

RUN cp /etc/hosts /wordpress/