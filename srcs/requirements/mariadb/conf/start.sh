#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
fi

mysql_install_db  --datadir=/var/lib/mysql/

