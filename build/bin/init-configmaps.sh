#!/bin/bash

kubectl create configmap env-account --from-env-file env/prod/.env.account -n prod
kubectl create configmap env-auth --from-env-file env/prod/.env.auth -n prod
kubectl create configmap env-contest --from-env-file env/prod/.env.contest -n prod
kubectl create configmap env-course --from-env-file env/prod/.env.course -n prod
kubectl create configmap env-league --from-env-file env/prod/.env.league -n prod
kubectl create configmap env-mailer --from-env-file env/prod/.env.mailer -n prod
kubectl create configmap env-member --from-env-file env/prod/.env.member -n prod
kubectl create configmap env-notification --from-env-file env/prod/.env.notification -n prod
kubectl create configmap env-score --from-env-file env/prod/.env.score -n prod
kubectl create configmap env-sport --from-env-file env/prod/.env.sport -n prod
kubectl create configmap env-wager --from-env-file env/prod/.env.wager -n prod
kubectl create configmap env-web-pusher --from-env-file env/prod/.env.web-pusher -n prod
