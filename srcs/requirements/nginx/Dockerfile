FROM debian:oldstable

RUN apt update -y && \
	apt install -y nginx && \
	echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
	chown -R www-data:www-data /var/lib/nginx

WORKDIR /etc/nginx

COPY . .

CMD ["nginx"]