#!/bin/bash

pod=$(kubectl get pod -l app=contest -o jsonpath="{.items[0].metadata.name}")
kubectl exec $pod -it -- python manage.py check_active

