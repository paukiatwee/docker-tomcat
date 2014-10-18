
FROM centos:centos7

MAINTAINER Pau Kiat Wee

RUN yum install unzip tar wget -y

ADD setup.sh /opt/setup.sh
WORKDIR /opt
RUN chmod +x setup.sh
RUN /bin/bash setup.sh
ENV JAVA_HOME /opt/java
ENV M2_HOME /opt/maven
ENV PATH $PATH:$JAVA_HOME/bin:$M2_HOME/bin
