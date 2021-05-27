FROM alpine:3.12.0

RUN apk update && apk add bash nginx openssh openssl && adduser -D -g 'www' www && mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www

COPY conf/esaci.html /var/www/esaci/htdocs/ 
COPY conf/sshd_config /etc/ssh/sshd_config 
COPY conf/nginx.conf /etc/nginx/nginx.conf 
COPY conf/healthcheck.sh /tmp/. 
COPY conf/start.sh /tmp/start.sh


RUN addgroup sshgroup && adduser -D user && echo "user:password" | chpasswd

RUN chmod +x /tmp/start.sh
RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD bash /tmp/start.sh