#!/bin/sh

mariadbd &
if [ ! -d "/run/mysqld" ]; then
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
fi

mariadb -e "$(bash /tmp/initmysql.sh)"
pkill mariadbd
mariadbd

