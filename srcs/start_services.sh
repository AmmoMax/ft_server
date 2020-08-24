#! /bin/bash

echo "***** Starting php-fpm service ****"
service php7.3-fpm start

echo "***** Starting mysql service ****"
service mysql start

echo "***** Starting nginx ****"
nginx -g "daemon off;"

ping 8.8.8.8
