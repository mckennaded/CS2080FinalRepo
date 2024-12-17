#!/bin/bash
#
#Copyright (c) Mckenna Dedrick 12/17/24
#

sed -i 's/Welcome to nginx/Welcome to Mckenna\'\''s page/g' /var/www/html/*.html

sed -i 's/nginx/nginx (pronounced as EngineX)/g' /var/www/html/*.html

nginx -g 'daemon off;'

tail -f /var/log/nginx/access.log
