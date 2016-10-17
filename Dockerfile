FROM dordoka/rpi-java8

MAINTAINER malcolm.r.groves@gmail.com

RUN cd ~;
RUN wget --no-check-certificate https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.8.0/mule-standalone-3.8.0.tar.gz 
RUN tar xvzf ./mule-standalone-3.8.0.tar.gz -C /opt  
RUN rm ./mule-standalone-3.8.0.tar.gz 
RUN ln -s /opt/mule-standalone-3.8.0 /opt/mule
RUN wget http://wrapper.tanukisoftware.com/download/3.5.30/wrapper-linux-armhf-32-3.5.30.tar.gz
RUN tar -zxvf wrapper-linux-armhf-32-3.5.30.tar.gz wrapper-linux-armhf-32-3.5.30/conf/wrapper.conf
RUN cp wrapper-linux-armhf-32-3.5.30/conf/wrapper.conf /opt/mule/lib/boot/
RUN rm -r wrapper-linux-armhf-32-3.5.30

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

# Define working directory.
WORKDIR /opt/mule

#CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8081
