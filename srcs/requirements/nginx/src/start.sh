#!/bin/bash

 openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt -subj '/C=FR/ST=75/L=Paris/O=42/OU=esaci/CN=localhost'
openssl dhparam -outform pem -out /etc/nginx/ssl/esaci.pem 2048
ssh-keygen -A

/usr/sbin/sshd

nginx -g 'daemon off;'
