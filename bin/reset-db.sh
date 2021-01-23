#!/bin/bash

ssh -i /home/dallanbhatti/.ssh/github super_dallan@mega <<EOF
  # Account
   docker exec account python manage.py delete \
   && docker exec account python manage.py load

  # Auth
  docker exec auth python manage.py reset_db \
   && docker exec auth python manage.py init

  # Contest
  docker exec contest python manage.py delete \
    && docker exec contest python manage.py load

#  # Course
#  docker exec course python manage.py delete \
#    && docker exec course python manage.py load

  # League
  docker exec league python manage.py delete \
    && docker exec league python manage.py load

  # Member
  docker exec member python manage.py delete \
    && docker exec member python manage.py load

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
  # Wager
  docker exec wager python manage.py delete \
   && docker exec wager python manage.py load
EOF
exit
