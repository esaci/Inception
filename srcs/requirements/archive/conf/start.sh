#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/esaci.key -out /etc/ssl/certs/esaci.crt -subj '/C=FR/ST=75/L=Paris/O=42/OU=School/CN=esaci'
chown -R www-data:www-data *
chmod 755 -R *
nginx -g 'daemon off;'
