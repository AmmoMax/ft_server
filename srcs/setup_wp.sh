#! /bin/bash

echo "***** Starting wordpress download and setting ****"
wget https://ru.wordpress.org/latest-ru_RU.tar.gz -O wordpress.tar.gz
tar -xvf wordpress.tar.gz && mv wordpress /var/www/
rm -f wordpress.tar.gz
chown -R www-data:www-data /var/www/wordpress/
chmod 775 /var/www/wordpress/

echo "***** Copy wp-config.php to /var/www/wordpress/ ****"
cp wp-config.php /var/www/wordpress/