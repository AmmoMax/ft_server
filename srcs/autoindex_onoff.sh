#! /bin/bash
if [[ $# -eq 0 ]]; then
    echo "No parameters found. Usage: '$0 on\off'"
    exit 1
fi
if [[ $1 == "on" || $1 == "off" ]]; then
    echo "Switch to autoindex $1 in nginx config"
	sed -i -e "s/autoindex [a-z]*/autoindex $1/" /etc/nginx/wordpress.conf
    echo "Restart nginx"
    service nginx restart
else
    echo "Undefined options. Usage: '$0 on\off'"
fi