FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install mariadb-server -y

COPY	conf/create_db.sh /tmp/

ENTRYPOINT sh tmp/create_db.sh
