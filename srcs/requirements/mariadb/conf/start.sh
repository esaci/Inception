#! /bin/sh

mariadbd &

if ! mysqladmin --wait=30 ping; then
	printf "Could not ping mariadb for 30 seconds, runtime configuration is not possible.\n"
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
