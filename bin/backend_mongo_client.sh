#!/bin/bash

if [ "$2" = "up" ]; then
  ssh -i /home/dallanbhatti/.ssh/github super_dallan@mega <<EOF
  docker run -d --name mongo-express-"$1" --network backend_app-net --env-file ${HUNCHO_DIR}/env/qaw/.env."$1"-mongo-express -p 8081:8081 mongo-express
EOF
else
  ssh -i /home/dallanbhatti/.ssh/github super_dallan@mega <<EOF
  docker stop mongo-express-"$1"
  docker rm mongo-express-"$1"
EOF
fi

exit
