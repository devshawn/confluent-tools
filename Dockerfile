FROM openjdk:8

ENV CONFLUENT_URL=http://packages.confluent.io/archive/5.1/confluent-community-5.1.0-2.11.tar.gz
ENV CONFLUENT_TMP_DEST=/opt/confluent.tgz
ENV CONFLUENT_WORKDIR=/opt/confluent

RUN wget $CONFLUENT_URL -O ${CONFLUENT_TMP_DEST} && \
    mkdir -p ${CONFLUENT_WORKDIR} && \
    tar -xvzpf ${CONFLUENT_TMP_DEST} --strip-components=1 -C ${CONFLUENT_WORKDIR}

FROM openjdk:8-jre-alpine
RUN apk add --no-cache bash

COPY --from=0 /opt/confluent /opt/confluent
COPY run /opt/confluent/bin/run
RUN rm -rf /opt/confluent/share/doc
RUN rm -rf /opt/confluent/src
RUN rm -rf /opt/confluent/lib

ENV PATH /opt/confluent/bin:$PATH

WORKDIR [ "/opt/confluent/bin" ]
ENTRYPOINT [ "tail", "-f", "/dev/null" ]