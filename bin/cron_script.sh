#!/bin/bash

ssh super_dallan@mega 'docker exec contest python manage.py check_timeout'
exit