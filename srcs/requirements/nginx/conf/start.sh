sed -i "s/ssl_certificate SSL_CERTIF;/ssl_certificate ${SSL_CERTIF};/g" /etc/nginx/conf.d/default.conf
sed -i "s/ssl_certificate_key SSL_KEY/ssl_certificate_key ${SSL_KEY}/g" /etc/nginx/conf.d/default.conf
sed -i "s/ssl_protocols TLSV/ssl_protocols ${TLSV}/g" /etc/nginx/conf.d/default.conf
sed -i "s/WP_PORT/${WP_PORT}/g" /etc/nginx/conf.d/default.conf
sed -i "s/WP_NOM/${WP_NOM}/g" /etc/nginx/conf.d/default.conf

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=France/L=Paris/O=42/CN=esaci.42.fr" -keyout ${SSL_KEYY} -out ${SSL_CERTIFF}

nginx -g 'daemon off;'