#!/bin/bash

if [ ! -f /etc/nginx/ssl/default.crt ]; then
    openssl genrsa -out "/etc/nginx/ssl/default.key" 2048
    openssl req -new -key "/etc/nginx/ssl/default.key" -out "/etc/nginx/ssl/default.csr" -subj "/CN=default/O=default/C=UK"
    openssl x509 -req -days 365 -in "/etc/nginx/ssl/default.csr" -signkey "/etc/nginx/ssl/default.key" -out "/etc/nginx/ssl/default.crt"
fi

if [ ! -f /etc/nginx/ssl/mcop.test.crt ]; then
    openssl req -new -x509 -newkey rsa:2048 -sha256 -nodes -subj "/C=TH/ST=Muang/L=KhonKaen/O=I2F/CN=mcop.test" -keyout "/etc/nginx/ssl/mcop.test.key" -days 365 -out "/etc/nginx/ssl/mcop.test.crt"
fi

if [ ! -f /etc/nginx/ssl/mcop_member.test.crt ]; then
    openssl req -new -x509 -newkey rsa:2048 -sha256 -nodes -subj "/C=TH/ST=Muang/L=KhonKaen/O=I2F/CN=mcop_member.test" -keyout "/etc/nginx/ssl/mcop_member.test.key" -days 365 -out "/etc/nginx/ssl/mcop_member.test.crt"
fi

if [ ! -f /etc/nginx/ssl/mcop_web.test.crt ]; then
    openssl req -new -x509 -newkey rsa:2048 -sha256 -nodes -subj "/C=TH/ST=Muang/L=KhonKaen/O=I2F/CN=mcop_web.test" -keyout "/etc/nginx/ssl/mcop_web.test.key" -days 365 -out "/etc/nginx/ssl/mcop_web.test.crt"
fi

# Start crond in background
crond -l 2 -b

# Start nginx in foreground
nginx
