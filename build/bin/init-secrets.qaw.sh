#!/bin/bash

kubectl create secret generic env-kong-secret --from-env-file secrets/kong/qaw/.env.kong -n qaw
kubectl create secret generic secret-firebase --from-file secrets/golftapir/tech-tapir-firebase-adminsdk-3zrlh-3720b4d899.json -n qaw
kubectl create secret generic s3-credentials --from-env-file secrets/s3/credentials.txt -n qaw
kubectl create secret generic mailer-password --from-env-file secrets/mailer/mailer_password.txt -n qaw
