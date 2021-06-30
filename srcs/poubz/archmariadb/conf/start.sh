#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
mkdir -p /run/mysqld
chown -R elias:esaci /run/mysqld
fi

mysql_install_db  --user=elias --datadir=/var/lib/mysql/
nohup /tmp/initmysql.sh &

exec /usr/bin/mysqld --datadir="/var/lib/mysql/"

