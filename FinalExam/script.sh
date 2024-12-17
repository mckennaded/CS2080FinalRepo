#!/bin/bash
#
#Copyright (c) Mckenna Dedrick 12/17/24
#

service nginx start

sed -i 's/Welcome to nginx/Welcome to Mckenna\'\''s page/g' /var/www/html/*.html

sed -i 's/nginx/nginx (pronounced as EngineX)/g' /var/www/html/*.html

service nginx stop

service nginx start

tail -f /var/log/nginx/access.log
