FROM        ubuntu
RUN         apt-get update && apt-get install -y telnet redis-server curl php5
RUN         sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis/redis.conf
RUN         sed -i "s/daemonize yes/daemonize no/g" /etc/redis/redis.conf
EXPOSE      6379
ENTRYPOINT  ["/usr/bin/redis-server"]
