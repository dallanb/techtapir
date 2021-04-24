#!/bin/bash

kubectl create configmap env-account --from-env-file env/qaw/.env.account -n qaw
kubectl create configmap env-auth --from-env-file env/qaw/.env.auth -n qaw
kubectl create configmap env-contest --from-env-file env/qaw/.env.contest -n qaw
kubectl create configmap env-course --from-env-file env/qaw/.env.course -n qaw
kubectl create configmap env-league --from-env-file env/qaw/.env.league -n qaw
kubectl create configmap env-mailer --from-env-file env/qaw/.env.mailer -n qaw
kubectl create configmap env-member --from-env-file env/qaw/.env.member -n qaw
kubectl create configmap env-notification --from-env-file env/qaw/.env.notification -n qaw
kubectl create configmap env-score --from-env-file env/qaw/.env.score -n qaw
kubectl create configmap env-sport --from-env-file env/qaw/.env.sport -n qaw
kubectl create configmap env-wager --from-env-file env/qaw/.env.wager -n qaw
kubectl create configmap env-web-pusher --from-env-file env/qaw/.env.web-pusher -n qaw
