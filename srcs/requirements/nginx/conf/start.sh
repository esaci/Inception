#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/certs/esaci.key -out /etc/ssl/certs/esaci.crt -subj '/C=FR/ST=75/L=Paris/O=42/OU=esaci/CN=loc'
ssh-keygen -A
/usr/sbin/sshd
nginx -g 'daemon off;'
