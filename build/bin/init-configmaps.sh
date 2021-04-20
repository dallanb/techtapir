#!/bin/bash

kubectl create configmap env-account --from-env-file env/prod/.env.account
kubectl create configmap env-auth --from-env-file env/prod/.env.auth
kubectl create configmap env-contest --from-env-file env/prod/.env.contest
kubectl create configmap env-course --from-env-file env/prod/.env.course
kubectl create configmap env-league --from-env-file env/prod/.env.league
kubectl create configmap env-mailer --from-env-file env/prod/.env.mailer
kubectl create configmap env-member --from-env-file env/prod/.env.member
kubectl create configmap env-notification --from-env-file env/prod/.env.notification
kubectl create configmap env-score --from-env-file env/prod/.env.score
kubectl create configmap env-sport --from-env-file env/prod/.env.sport
kubectl create configmap env-wager --from-env-file env/prod/.env.wager
kubectl create configmap env-web-pusher --from-env-file env/prod/.env.web-pusher
