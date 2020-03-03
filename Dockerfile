FROM openjdk:11.0.3

ARG liquibase_version=3.8.7
ARG liquibase_download_url=https://github.com/liquibase/liquibase/releases/download/v${liquibase_version}
ARG tarfile=liquibase-${liquibase_version}.tar.gz

WORKDIR /workspace

ENV LIQUIBASE_CLASSPATH=${LIQUIBASE_CLASSPATH:-/opt/jdbc-driver/postgresql-42.2.10.jar}\
    LIQUIBASE_DRIVER=${LIQUIBASE_DRIVER:-org.postgresql.Driver}

ADD ${liquibase_download_url}/${tarfile} /tmp/${tarfile}
ADD https://jdbc.postgresql.org/download/postgresql-42.2.10.jar /tmp/postgresql-42.2.10.jar

ADD run.sh /run.sh


RUN mkdir -p /opt/liquibase && \
    chmod +x /run.sh && \
    tar -xzf /tmp/${tarfile} -C /opt/liquibase/ && \
    mkdir /opt/jdbc-driver/ -p && \
    cp /tmp/postgresql-42.2.10.jar /opt/jdbc-driver/ && \
    chmod +x /opt/liquibase/liquibase && \
    rm /tmp/${tarfile} /tmp/postgresql-42.2.10.jar -Rf && \
    ln -s /opt/liquibase/liquibase /usr/local/bin/liquibase

ENTRYPOINT [ "/run.sh" ]
