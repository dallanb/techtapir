#!/bin/bash

ssh -i /home/dallanbhatti/.ssh/github super_dallan@mega <<EOF
#  # Account
#   docker exec account python manage.py reset_db \
#   && docker exec account python manage.py init
#
#  # Auth
#  docker exec auth python manage.py reset_db \
#   && docker exec auth python manage.py init

  # Contest
  docker exec contest python manage.py reset_db \
    && docker exec contest python manage.py init

#  # Course
#  docker exec course python manage.py reset_db \
#    && docker exec course python manage.py init

  # Notification
  docker exec notification npm run resetDB \
    && docker exec notification_mongodb bash /bin/reset-mongo.sh \
    && docker exec notification_cache bash /bin/reset-redis.sh

  # Score
  docker exec score_mongodb bash /bin/reset-mongo.sh

#  # Sport
#  docker exec sport python manage.py reset_db \
#   && docker exec sport python manage.py init
#
#  # Wager
#  docker exec wager python manage.py reset_db \
#   && docker exec wager python manage.py init
EOF
exit
