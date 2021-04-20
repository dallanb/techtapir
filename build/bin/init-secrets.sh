#!/bin/bash

kubectl create secret generic env-kong-secret --from-env-file secrets/kong/.env.kong -n kong
kubectl create secret generic s3-credentials --from-env-fiile secrets/s3/credentials.txt
kubectl create secret generic mailer-password --from-env-fiile secrets/mailer/mailer_password.txt