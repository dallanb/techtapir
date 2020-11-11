#!/bin/bash

ssh -i /home/dallanbhatti/.ssh/github super_dallan@mega 'docker exec contest python manage.py check_active'
exit
