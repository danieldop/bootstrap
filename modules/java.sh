#!/usr/bin/env bash

readonly JDK_VERSION='jdk-10.0.2'
readonly JDK_URL_VERSION='10.0.2+13'

wget --no-cookies --no-check-certificate --directory-prefix=/tmp --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  http://download.oracle.com/otn-pub/java/jdk/${JDK_URL_VERSION}/19aef61b38124481863b1413dce1855f/${JDK_VERSION}_linux-x64_bin.tar.gz

sudo tar zxf /tmp/${JDK_VERSION}_linux-x64_bin.tar.gz* -C /opt

sudo alternatives --install /usr/bin/java java /opt/${JDK_VERSION}/bin/java 2
sudo alternatives --install /usr/bin/jar jar /opt/${JDK_VERSION}/bin/jar 2
sudo alternatives --install /usr/bin/javac javac /opt/${JDK_VERSION}/bin/javac 2
sudo alternatives --set java /opt/${JDK_VERSION}/bin/java
sudo alternatives --set jar /opt/${JDK_VERSION}/bin/jar
sudo alternatives --set javac /opt/${JDK_VERSION}/bin/javac

export JAVA_HOME=/opt/${JDK_VERSION}
export JRE_HOME=/opt/${JDK_VERSION}/jre
export PATH=$PATH:/opt/${JDK_VERSION}/bin:/opt/${JDK_VERSION}/jre/bin

tee -a ~/.bash_profile << END

# java
export JAVA_HOME=/opt/${JDK_VERSION}
export JRE_HOME=/opt/${JDK_VERSION}/jre
export PATH=\$PATH:/opt/${JDK_VERSION}/bin:/opt/${JDK_VERSION}/jre/bin
END
