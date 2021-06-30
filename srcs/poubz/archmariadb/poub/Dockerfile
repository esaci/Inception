FROM alpine:3.12.0

RUN apk update && apk add mariadb mariadb-client && apk add bash
RUN addgroup -S esaci && adduser -S elias -G esaci
COPY conf/my.cnf /etc/my.cnf
COPY conf/start.sh /tmp/start.sh
COPY conf/initmysql.sh /tmp/

CMD /tmp/start.sh 