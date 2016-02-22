FROM centos:7

LABEL \
    Java\ Ver="JRE 8u74" \
    OS=CentOS \
    OS\ Ver="7" \
    Tomcat\ Ver="8.0.32"

RUN \
    yum install -y wget tar && \
    yum clean all 

# Install Java 
WORKDIR /tmp
RUN \
    wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u72-b15/jre-8u72-linux-x64.rpm" && \
    rpm -ivh jre-8u72-linux-x64.rpm  && \
    rm jre-8u72-linux-x64.rpm

# Install tomcat
WORKDIR /usr/local
RUN \
    wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.tar.gz && \
    tar zxf apache-tomcat-8.0.32.tar.gz && \
    ln -s apache-tomcat-8.0.32 tomcat && \
    rm apache-tomcat-8.0.32.tar.gz

