FROM weaveworksdemos/msd-java:8u131

WORKDIR /usr/src/app
COPY *.jar ./app.jar

RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

USER ${SERVICE_USER}

## Setup Pinpoint
RUN mkdir -p /usr/local/pinpoint-agent
ADD pinpoint-agent-1.6.0.tar.gz /usr/local/pinpoint-agent
ADD configure-agent.sh /usr/local/bin/
ADD pinpoint.config /usr/local/pinpoint-agent/pinpoint.config
RUN chmod a+x /usr/local/bin/configure-agent.sh

ENV JAVA_OPTS "-Djava.security.egd=file:/dev/urandom"

ENTRYPOINT ["/usr/local/bin/configure-agent.sh"]