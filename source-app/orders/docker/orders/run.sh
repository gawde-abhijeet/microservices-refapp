#!/bin/bash

docker run -it -d \
--name microsvcs-orders \
-e "JAVA_OPTS=-javaagent:/usr/local/pinpoint-agent/pinpoint-bootstrap-1.6.0.jar -Dpinpoint.agentId=orders -Dpinpoint.applicationName=microsvcs-orders" \
-e "COLLECTOR_IP=collector" \
--link="pinpoint-collector:collector" \
-p 8082:8080 \
-v $(pwd)/ROOT.war:/usr/local/tomcat/webapps/ROOT.war \
microsvcs/orders:1.6.0
