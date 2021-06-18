FROM debian:buster

RUN apt-get update && \
	apt-get install -y mariadb-server

COPY ./conf/esacimaria.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/initdb.sql ./tmp/

RUN service mysql start && \
	mysql -u root --password= < /tmp/initdb.sql

CMD mysqld