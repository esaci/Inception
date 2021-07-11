#! /bin/sh

mariadbd &

if ! mysqladmin --wait=30 ping; then
	exit 1
fi


cat /tmp/.flagtest 2> /dev/null
if [ $? -ne 0 ]; then
	mariadb -e "$(eval "echo \"$(bash /tmp/initmysql.sh)\"")"
	printf "Mariadb lance .... \n"
	touch /tmp/.flagtest
fi

pkill mariadbd
mariadbd
