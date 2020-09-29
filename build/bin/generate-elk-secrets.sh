#!/bin/bash

ELASTIC_PW=$(awk -F= '/^.*elastic/{gsub(/ /,"",$2);print $2}' secrets/elk/passwords.txt)
CLEAN_PW=`echo $ELASTIC_PW | sed 's/ *$//g'`
echo "Extracted this password for Elasticsearch: $CLEAN_PW"

# Handle Kibana
cp secrets/kibana/config/kibana.yml secrets/kibana/config/kibana.secret.yml
sed -i "s/changeme/$CLEAN_PW/" secrets/kibana/config/kibana.secret.yml


# Handle Logstash
cp secrets/logstash/config/logstash.yml secrets/logstash/config/logstash.secret.yml
sed -i "s/changeme/$CLEAN_PW/" secrets/logstash/config/logstash.secret.yml

cp secrets/logstash/pipeline/logstash.conf secrets/logstash/pipeline/logstash.secret.conf
sed -i "s/changeme/$CLEAN_PW/" secrets/logstash/pipeline/logstash.secret.conf
