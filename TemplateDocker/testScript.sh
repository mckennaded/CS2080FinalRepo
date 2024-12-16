#!/bin/bash

service nginx start

sed -i 's/Welcome to nginx/Welcome to Mckenna\'\''s page/g' /var/www/html/*.html

sed -i 's/nginx/nginx (pronounced as EngineX)/g' /var/www/html/*.html


tail -f /var/log/nginx/access.log
