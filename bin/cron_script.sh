#!/bin/bash

ssh dallanbhatti@rpi0 <<EOF
export pod=$(kubectl --user=super_dallan get pod -l app=contest -o jsonpath="{.items[0].metadata.name}")
echo $pod
kubectl --user=super_dallan exec $pod -it -- python manage.py check_active
EOF
exit
