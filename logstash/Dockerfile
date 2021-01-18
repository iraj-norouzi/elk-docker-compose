FROM docker.elastic.co/logstash/logstash-oss:7.10.1
RUN bin/logstash-plugin install logstash-input-beats logstash-input-syslog logstash-output-elasticsearch logstash-filter-grok logstash-filter-geoip

