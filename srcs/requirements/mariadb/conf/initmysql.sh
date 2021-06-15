#!/bin/sh

cat <<EOF > conf
SET PASSWORD FOR 'elias'@'localhost'=PASSWORD('password') ;
GRANT ALL ON *.* TO 'elias'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL ON wordpress.* TO 'elias'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
DROP DATABASE test;
FLUSH PRIVILEGES;
EOF

until mysql
do
	sleep 0.5
done

mysql < conf
