
FROM centos:centos7

MAINTAINER Pau Kiat Wee

RUN yum install tar wget -y

ADD setup.sh /opt/setup.sh
WORKDIR /opt
RUN chmod +x setup.sh
RUN /bin/bash setup.sh
ENV JAVA_HOME /opt/java
ENV PATH $PATH:$JAVA_HOME/bin