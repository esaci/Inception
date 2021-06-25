CREATE DATABASE wordpress;
CREATE USER 'elias'@'%' IDENTIFIED BY 'elias';
GRANT ALL PRIVILEGES ON *.* TO 'elias'@'%';
FLUSH PRIVILEGES;
update mysql.user set plugin = 'mysql_native_password' where user='root';