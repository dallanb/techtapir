#!/bin/bash

kubectl create secret generic env-kong-secret --from-env-file secrets/kong/prod/.env.kong -n kong
kubectl create secret generic secret-firebase --from-file secrets/golftapir/tech-tapir-firebase-adminsdk-3zrlh-3720b4d899.json -n prod
kubectl create secret generic s3-credentials --from-env-file secrets/s3/credentials.txt -n prod
kubectl create secret generic mailer-password --from-env-file secrets/mailer/mailer_password.txt -n prod
