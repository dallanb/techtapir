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
  "url": "http://auth_proxy"
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
  "url": "http://auth:5000"
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
  "hosts": ["auth.techtapir.com"]
}'
# Account
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-account",
  "url": "http://account:5000"
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
  "hosts": ["account.techtapir.com"]
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
  "url": "http://contest:5000"
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
  "hosts": ["contest.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-contest/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'
# Kibana
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-kibana",
  "url": "http://kibana:5601"
}'

curl --location --request POST '0.0.0.0:8001/services/api-v1-kibana/routes/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "techtapir-kibana",
  "methods": [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "PATCH"
  ],
  "hosts": ["kibana.techtapir.com"]
}'
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
  "hosts": ["konga.techtapir.com"]
}'
# Mailer
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-mailer",
  "url": "http://mailer_web"
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
  "hosts": ["mailer.techtapir.com"]
}'

curl --location --request POST 'localhost:8001/services/api-v1-mailer/plugins' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "jwt"
}'
# RabbitMQ
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-rabbitmq",
  "url": "http://192.168.0.198:15672"
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
  "hosts": ["rabbitmq.techtapir.com"]
}'
# Score
curl --location --request POST '0.0.0.0:8001/services/' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "api-v1-score",
  "url": "http://score:5000"
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
  "hosts": ["score.techtapir.com"]
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
  "url": "http://sport:5000"
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
  "hosts": ["sport.techtapir.com"]
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
  "url": "http://wager:5000"
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
  "hosts": ["wager.techtapir.com"]
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
