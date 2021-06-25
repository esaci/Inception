
service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS db_name;"
mysql -e "GRANT ALL ON db.* TO user_name@localhost IDENTIFIED BY 'user_pass';"
mysql -e "FLUSH PRIVILEGES;"
sleep infinity && wait