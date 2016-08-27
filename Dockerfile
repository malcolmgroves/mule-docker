FROM dordoka/rpi-java8

MAINTAINER malcolm.r.groves@gmail.com

CMD cd ~ 
CMD wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.8.0/mule-standalone-3.8.0.tar.gz
CMD echo "d9279b3f0373587715613341a16483f3 mule-standalone-3.8.0.tar.gz" | md5sum -c
CMD cd /opt 
CMD tar xvzf ~/mule-standalone-3.8.0.tar.gz 
CMD rm ~/mule-standalone-3.8.0.tar.gz 
CMD ln -s /opt/mule-standalone-3.8.0 /opt/mule

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

# Define working directory.
WORKDIR /opt/mule

CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8081
