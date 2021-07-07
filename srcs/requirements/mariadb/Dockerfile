FROM 		alpine:3.13.0

RUN 		apk update && apk add mariadb mariadb-client && apk add bash

RUN			mkdir  /run/mysqld && mkdir  -p /var/lib/mysql \
			&& chown mysql:mysql /var/lib/mysql \
			&& chown -R mysql:mysql /run/mysqld \
			&& mariadb-install-db --user=mysql --datadir='/var/lib/mysql'

COPY		conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN 		chown -R mysql:mysql /etc/my.cnf.d

COPY 		conf/start.sh /tmp/start.sh
COPY		conf/initmysql.sh /tmp/initmysql.sh
RUN			chown -R mysql:mysql /tmp/

USER		mysql

WORKDIR 	/var/www/wordpress/

ENTRYPOINT	[ "sh", "/tmp/start.sh" ]
