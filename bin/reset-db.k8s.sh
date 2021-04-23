#!/bin/bash

# Account
kubectl exec deploy/account -- python manage.py delete \
  && kubectl exec deploy/account -- python manage.py load

# Auth
kubectl exec deploy/auth -- python manage.py delete \
 && kubectl exec deploy/auth -- python manage.py load

# Contest
kubectl exec deploy/contest -- python manage.py delete \
  && kubectl exec deploy/contest -- python manage.py load

# Course
kubectl exec deploy/course -- python manage.py delete \
  && kubectl exec deploy/course -- python manage.py load

# League
kubectl exec deploy/league -- python manage.py delete \
  && kubectl exec deploy/league -- python manage.py load

# Member
kubectl exec deploy/member -- python manage.py delete \
  && kubectl exec deploy/member -- python manage.py load

# Notification
kubectl exec deploy/notification -- npm run resetDB \
  && kubectl exec deploy/notification_mongodb -- bash /bin/reset-mongo.sh \
  && kubectl exec deploy/notification_cache -- bash /bin/reset-redis.sh

# Score
kubectl exec deploy/score_mongodb -- bash /bin/reset-mongo.sh

#  # Sport
#  kubectl exec sport python manage.py delete \
#   && kubectl exec sport python manage.py load
#
# Wager
kubectl exec deploy/wager -- python manage.py delete \
 && kubectl exec deploy/wager -- python manage.py load
