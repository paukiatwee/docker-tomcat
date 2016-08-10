
FROM jeanblanchard/busybox-java:8

MAINTAINER Pau Kiat Wee


# Expose web port
EXPOSE 8080

# Tomcat Version
ENV TOMCAT_VERSION_MAJOR 8
ENV TOMCAT_VERSION_FULL  8.0.36

# Download and install
RUN curl -kLO https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_VERSION_MAJOR}/v${TOMCAT_VERSION_FULL}/bin/apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz &&\
    gunzip apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz &&\
    tar -xf apache-tomcat-${TOMCAT_VERSION_FULL}.tar -C /opt &&\
    rm apache-tomcat-${TOMCAT_VERSION_FULL}.tar &&\
    ln -s /opt/apache-tomcat-${TOMCAT_VERSION_FULL} /opt/tomcat &&\
    rm -rf /opt/tomcat/webapps/*


# Set environment
ENV CATALINA_HOME /opt/tomcat

# Launch Tomcat on startup
CMD ${CATALINA_HOME}/bin/catalina.sh run
