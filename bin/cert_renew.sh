#!/bin/bash

# go to techtapir dir
cd $HOME/Documents/Personal/techtapir
# generate new certs if they are needed
make deploy-certbot-renew
# bundle the generated certs and write to a location in haproxy directory
cat /etc/letsencrypt/live/techtapir.com/fullchain.pem /etc/letsencrypt/live/techtapir.com/privkey.pem > /etc/haproxy/certs/techtapir.com.pem
# restart haproxy
systemctl restart haproxy.service
