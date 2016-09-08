FROM tray/java:8-jre

# general tools
RUN  apt-get clean
RUN  apt-get update
RUN  apt-get install -y telnet wget netcat dnsutils jq vim

# awscli
COPY fs/root/.aws /root/.aws
RUN  chmod 600 /root/.aws/*
RUN  apt-get install -y --force-yes groff python2.7 python-pip python-dev build-essential
RUN  pip install awscli

# redis
RUN  apt-get install -y redis-tools

ENV PATH=$PATH:/opt/fake-aws/bin
ENV dynamodb_host=dynamodb
ENV s3_host=s3
ENV redis_host=redis
VOLUME [ "/opt/fake-aws/bin", "/opt/fake-aws/data" ]
