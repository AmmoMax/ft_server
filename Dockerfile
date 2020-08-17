FROM debian:buster

MAINTAINER Astro Mayor

RUN apt update -y && apt install -y nginx php7.3 curl php-dom php-fpm php-json php-mbstring php-mysqli php-imagick php-xml php-zip wget mariadb-server mariadb-client

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Moscow/L=Moscow/O=Amayor Inc/OU=amayor/CN=amayor.com" -keyout /etc/ssl/private/amayor_nginx-selfsigned.key -out /etc/ssl/certs/amayor_nginx-selfsigned.crt

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/wordpress.conf /etc/nginx/
COPY srcs/setup.sh .
COPY srcs/wp-config.php .

RUN bash setup.sh

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
