#!/bin/sh

exec >>/var/log/huncho.log 2>&1
echo "Tech Tapir Redeploy Script" | ts '[%Y-%m-%d %H:%M:%S]'
PROJECT_NAME=$1
PROJECT_ENV=$2
echo "Starting Redeploy..."
echo "Project Name: $PROJECT_NAME"
echo "Project ENV: $PROJECT_ENV"

cd /home/dallanbhatti/Documents/Personal/techtapir
kubectl rollout restart deployment/$PROJECT_NAME

echo "...Done Redeploy"
