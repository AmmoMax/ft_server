#! /bin/bash
service mysql start

mysql -u root <<MY_QUERY
CREATE DATABASE amayor_db;
CREATE USER amayor@localhost IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON amayor_db.* TO amayor@localhost IDENTIFIED BY '123';
MY_QUERY

wget https://ru.wordpress.org/latest-ru_RU.tar.gz -O wordpress.tar.gz
tar -xvf wordpress.tar.gz && mv wordpress /var/www/
rm -f wordpress.tar.gz
chown -R www-data:www-data /var/www/wordpress/
chmod 775 /var/www/wordpress/

echo "***** Copy wp-config.php to /var/www/wordpress/ ****"
cp wp-config.php /var/www/wordpress/

service php7.3-fpm start