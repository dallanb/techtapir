#!/bin/bash

# Create Konga User
curl --location --request POST 'localhost:8001/consumers' \
--header 'Content-Type: application/json' \
--data-raw '{
  "username": "konga",
  "custom_id": "1"
}'
# Add Kong Service
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-kong",
  "url": "http://kong:8000"
}'
curl --location --request POST '0.0.0.0:8001/services/api-v1-kong/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-kong",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["kong.qaw.techtapir.com"]
}'

# Add Kong Admin Service
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-admin",
  "url": "http://kong:8001"
}'

# Add Admin Route for Kong
curl --location --request POST '0.0.0.0:8001/services/api-v1-admin/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "default-admin",
  "paths": ["/admin"]
}'

# Add Static for Kong
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-statics",
  "url": "http://static"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-statics/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "default-statics",
  "methods": [
    "GET",
    "HEAD"
  ]
}'
## Add APIs
# Auth
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-auth",
  "url": "http://10.0.0.100:50001"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-auth/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-auth",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["auth.qaw.techtapir.com"]
}'
# Account
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-account",
  "url": "http://10.0.0.100:50000"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-account/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-account",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["account.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-account/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'
# Contest
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-contest",
  "url": "http://10.0.0.100:50002"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-contest/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-contest",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["contest.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-contest/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'
# Course
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-course",
  "url": "http://10.0.0.100:50003"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-course/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-course",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["course.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-course/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'
# League
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-league",
  "url": "http://10.0.0.100:50004"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-league/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-league",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["league.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-league/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'
## Kibana
#curl --location --request POST '0.0.0.0:8001/services/' \
#--header 'Content-Type: application/json' \
#--data-raw '{
#  "name": "api-v1-kibana",
#  "url": "http://kibana:5601"
#}'
#
#curl --location --request POST '0.0.0.0:8001/services/api-v1-kibana/routes/' \
#--header 'Content-Type: application/json' \
#--data-raw '{
#  "name": "techtapir-kibana",
#  "methods": [
#    "OPTIONS",
#    "HEAD",
#    "GET",
#    "POST",
#    "PUT",
#    "DELETE",
#    "PATCH"
#  ],
#  "hosts": ["kibana.techtapir.com"]
#}'
# Konga
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-konga",
  "url": "http://konga:1337"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-konga/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-konga",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["konga.qaw.techtapir.com"]
}'
# Mailer
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-mailer",
  "url": "http://10.0.0.100:50005"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-mailer/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-mailer",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["mailer.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-mailer/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'

# Member
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-member",
  "url": "http://10.0.0.100:50006"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-member/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-member",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["member.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-member/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'

# Notification
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-notification",
  "url": "http://10.0.0.100:50007"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-notification/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-notification",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["notification.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-notification/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'

# RabbitMQ
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-rabbitmq",
  "url": "http://10.0.0.150:56720"
}'


curl --location --request POST '0.0.0.0:8001/services/api-v1-rabbitmq/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-rabbitmq",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["rabbitmq.qaw.techtapir.com"]
}'
# Score
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-score",
  "url": "http://10.0.0.100:50008"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-score/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-score",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["score.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-score/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'
# Sport
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-sport",
  "url": "http://10.0.0.100:50009"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-sport/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-sport",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["sport.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-sport/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'
# Wager
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-wager",
  "url": "http://10.0.0.100:50010"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-wager/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-wager",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["wager.qaw.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-wager/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'

# Enable TCP Plugin globally
curl -X POST http://0.0.0.0:8001/plugins/ \
    --data "name=tcp-log"  \
    --data "config.host=logstash" \
    --data "config.port=5000"
