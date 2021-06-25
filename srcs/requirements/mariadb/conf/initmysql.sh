cat <<EOF
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
CREATE USER ${MARIADB_USER}@'%' IDENTIFIED by 'wordpress';
CREATE DATABASE $MARIADB_DATABASE;
GRANT ALL PRIVILEGES ON "wordpress.*" TO "wordpress"@'%';
FLUSH PRIVILEGES;
EOF
