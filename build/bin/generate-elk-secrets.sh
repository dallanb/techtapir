#!/bin/bash

ELASTIC_PW=$(awk -F= '/^.*elastic/{gsub(/ /,"",$2);print $2}' secrets/elk/passwords.txt)
CLEAN_PW=`echo $ELASTIC_PW | sed 's/ *$//g'`
echo "Extracted this password for Elasticsearch: $CLEAN_PW"

# Handle Kibana
cp services/kibana/config/kibana.yml services/kibana/config/kibana.secret.yml
sed -i "s/changeme/$CLEAN_PW/" services/kibana/config/kibana.secret.yml


# Handle Logstash
cp services/logstash/config/logstash.yml services/logstash/config/logstash.secret.yml
sed -i "s/changeme/$CLEAN_PW/" services/logstash/config/logstash.secret.yml

cp services/logstash/pipeline/logstash.conf services/logstash/pipeline/logstash.secret.conf
sed -i "s/changeme/$CLEAN_PW/" services/logstash/pipeline/logstash.secret.conf
