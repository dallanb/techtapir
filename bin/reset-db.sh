#!/bin/bash

ssh -i /home/dallanbhatti/.ssh/github super_dallan@mega <<EOF
  # Contest
  docker exec contest python manage.py reset_db \
    && docker exec contest python manage.py init

  # Notification
  docker exec notification

  # Score
  docker exec score python manage.py reset_db \
    && docker exec score python manage.py init \
    && docker exec score python manage.py reset_mongodb

  # Wager
  docker exec wager python manage.py reset_db \
    && docker exec wager python manage.py init

  # Web Pusher
  docker exec web-pusher
EOF
exit
