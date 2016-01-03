FROM tray/java:8-jre

# general tools
RUN  apt-get update
RUN  apt-get install -y telnet wget netcat dnsutils vim

# dynamodb tools
RUN  apt-get install -y groff python2.7 python-pip python-dev build-essential
RUN  pip install awscli
COPY fs/root/.aws /root/.aws
RUN  chmod 600 /root/.aws/*

# s3

# redis
RUN  apt-get install -y redis-tools
