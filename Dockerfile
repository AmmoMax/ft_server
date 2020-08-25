# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/25 22:08:45 by amayor            #+#    #+#              #
#    Updated: 2020/08/25 22:08:47 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt install -y \
    nginx \
    php7.3 \
    curl \
    php-dom \
    php-fpm \
    php-json \
    php-mbstring \
    php-mysqli \
    php-imagick \
    php-xml \
    php-zip \
    wget \
    mariadb-server \
    mariadb-client && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Moscow/L=Moscow/O=Amayor Inc/OU=amayor/CN=amayor.com" -keyout /etc/ssl/private/amayor_nginx-selfsigned.key -out /etc/ssl/certs/amayor_nginx-selfsigned.crt

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/wordpress.conf /etc/nginx/
COPY srcs/wp-config.php .
COPY srcs/setup_sql.sh .
COPY srcs/setup_wp.sh .
COPY srcs/setup_php_my_admin.sh .
COPY srcs/start_services.sh .
COPY /srcs/config.inc.php .
COPY /srcs/autoindex_onoff.sh .


RUN ["/bin/bash", "setup_sql.sh"]
RUN ["/bin/bash", "setup_wp.sh"]
RUN ["/bin/bash", "setup_php_my_admin.sh"]

EXPOSE 80
EXPOSE 443

CMD ["/bin/bash", "start_services.sh"]
