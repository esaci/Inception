sed -i "s/ssl_certificate SSL_CERTIF;/ssl_certificate ${SSL_CERTIF};/g" /etc/nginx/conf.d/default.conf
sed -i "s/ssl_certificate_key SSL_KEY/ssl_certificate ${SSL_KEY}/g" /etc/nginx/conf.d/default.conf
sed -i "s/ssl_protocols TLSV/ssl_certificate ${TLSV}/g" /etc/nginx/conf.d/default.conf
sed -i "s/WP_PORT/${WP_PORT}/g" /etc/nginx/conf.d/default.conf