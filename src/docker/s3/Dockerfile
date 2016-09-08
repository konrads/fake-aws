FROM tray/java:8-jre
RUN        apt-get clean && apt-get update
COPY       fs/opt/s3proxy /opt/s3proxy
RUN        mkdir -p /opt/s3proxy/data
RUN        mkdir -p /opt/s3proxy/src
RUN        apt-get install -y --force-yes git maven
RUN        cd /opt/s3proxy/src && git clone https://github.com/andrewgaul/s3proxy.git
RUN        cd /opt/s3proxy/src/s3proxy && mvn clean compile assembly:single
RUN        cp /opt/s3proxy/src/s3proxy/target/s3proxy-*-with-dependencies.jar /opt/s3proxy/s3proxy.jar

# entrypoint for server
EXPOSE     3629
ENTRYPOINT ["java", "-jar", "/opt/s3proxy/s3proxy.jar", "--properties", "/opt/s3proxy/s3proxy.conf"]

# NOTE - above could be reduced to following, once 1.5.0 version is released...

# RUN        curl -o /opt/s3proxy/s3proxy -L https://github.com/andrewgaul/s3proxy/releases/download/s3proxy-1.5.0/s3proxy
# RUN        chmod +x /opt/s3proxy/s3proxy

# entrypoing for server
# EXPOSE     3629
# ENTRYPOINT ["/opt/s3proxy/s3proxy", "--properties", "/opt/s3proxy/s3proxy.conf"]
