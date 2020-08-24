#! /bin/bash
echo "***** Download phpmyadmin distr *****"
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz -O phpMyAdmin.tar.gz

echo "***** Unpack and remove tar *****"
tar -zxvf phpMyAdmin.tar.gz && rm -rf phpMyAdmin.tar.gz

echo "***** Move distr to /var/www *****"
mv phpMyAdmin-5.0.2-all-languages /var/www/

echo "***** Copy confg to phpMyAdmin dir *****"
cp config.inc.php /var/www/phpMyAdmin-5.0.2-all-languages

echo "***** Deleted default nginx html folder *****"
rm -rf /var/www/html

