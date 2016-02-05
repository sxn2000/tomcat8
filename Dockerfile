FROM sxn2000/centos7

MAINTAINER sxn2000 

LABEL \
	JRE \ Ver="JRE 8u71" \
	OS=CentOS \
	OS\ Ver="6.7" \
	Tomcat\ Ver="8.0.30"

# Install Java 
WORKDIR /tmp
RUN \
	wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u71-b15/jre-8u71-linux-x64.rpm" && \
	rpm -ivh jre-8u71-linux-x64.rpm  && \
	rm jre-8u71-linux-x64.rpm

# Install tomcat
WORKDIR /usr/local
RUN \
	wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30.tar.gz && \
	tar zxf apache-tomcat-8.0.30.tar.gz && \
	ln -s apache-tomcat-8.0.30 tomcat && \
	rm apache-tomcat-8.0.30.tar.gz

