#!/bin/bash

exec >>/var/log/huncho.log 2>&1
echo "Tech Tapir Redeploy Script" | ts '[%Y-%m-%d %H:%M:%S]'
PROJECT_NAME=$1
PROJECT_ENV=$2
echo "Starting Redeploy..."
echo "Project Name: $PROJECT_NAME"
echo "Project ENV: $PROJECT_ENV"

ssh -i /home/dallanbhatti/.ssh/github super_dallan@mega <<EOF
  if docker ps --format '{{.Names}}' | grep -w "$PROJECT_NAME" &> /dev/null; then
    cd $HUNCHO_DIR
    docker pull dallanbhatti/$PROJECT_NAME:$PROJECT_ENV
    docker stop $PROJECT_NAME
    docker container rm $PROJECT_NAME
    docker system prune -f
    docker-compose -f build/docker-compose.backend.yaml --env-file build/env/.env -p backend up -d $PROJECT_NAME
  fi
EOF
echo "...Done Redeploy"
