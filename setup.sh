#!/bin/bash

# variables
JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz
TOMCAT_URL=https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.14/bin/apache-tomcat-8.0.14.tar.gz


# install Java
function install_java() {
  echo 'Download Java...'
  wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "$JAVA_URL"

  echo 'Untar Java...'
  tar -zxf jdk-*.tar.gz

  echo 'Remove Java tar...'
  rm jdk-*.tar.gz

  echo 'Rename Java folder...'
  mv jdk* java

  echo 'Set Java environment variables...'
  export JAVA_HOME=/opt/java

  echo 'Setup profile...'
  echo 'export JAVA_HOME=/opt/java' >> /etc/profile.d/java.sh
  echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile.d/java.sh

  chmod u+x /etc/profile.d/java.sh

  echo 'Finish install Java...'
}

# intall tomcat
function install_tomcat() {
  echo 'Download Tomcat...'
  wget "$TOMCAT_URL"

  echo 'Untar Tomcat...'
  tar -zxf apache-tomcat-*.tar.gz

  echo 'Remove Tomcat tar...'
  rm apache-tomcat-*.tar.gz

  echo 'Rename Tomcat folder...'
  mv apache-tomcat-* tomcat

  echo 'Clear Tomcat default webapps...'
  rm -rf tomcat/webapps/*

  echo 'Finish install Tomcat...'
}

# step 1
install_java
# step 2
install_tomcat
