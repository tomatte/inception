FROM debian:oldstable

ARG WP_URL

RUN apt update -y && apt upgrade -y

RUN apt install nginx openssl -y

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

COPY ./conf/default /etc/nginx/sites-available/default

# set the server_name as the WP_URL passed in .env file
RUN sed -ri "s/server_name.+/server_name $WP_URL;/" /etc/nginx/sites-available/default

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/CN=$WP_URL"

CMD ["nginx"]

