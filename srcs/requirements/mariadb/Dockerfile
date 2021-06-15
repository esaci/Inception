FROM alpine:3.12.0

RUN apk update && apk add mariadb mariadb-client

COPY conf/start.sh /tmp/start.sh
COPY conf/init_mysql.sh /tmp/init_mysql.sh

RUN chmod +x /tmp/start.sh
EXPOSE 3306
CMD /tmp/start.sh