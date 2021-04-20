#!/bin/bash

pod=$(kubectl --user=super_dallan get pod -l app=contest -o jsonpath="{.items[0].metadata.name}")
kubectl --user=super_dallan exec $pod -it -- python manage.py check_active

