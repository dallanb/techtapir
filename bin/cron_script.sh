#!/bin/bash

ssh -i /home/dallanbhatti/.ssh/github dallanbhatti@rpi0 <<EOF
export pod=$(kubectl get pod -l app=contest -o jsonpath="{.items[0].metadata.name}")
echo $pod
kubectl exec $pod -it -- python manage.py check_active
EOF
exit
