#!/bin/bash

# Start up web server

cd /usr/local/web && ./run.py > /var/log/web.log 2>&1 &

nginx -c /etc/nginx/nginx.conf
