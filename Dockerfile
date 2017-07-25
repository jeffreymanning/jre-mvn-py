# ref: https://github.com/dockerfile/java/tree/master/oracle-java8

# use the latest from jeffreymanning/jre-base: jre
FROM jeffreymanning/jre-base

MAINTAINER jeffreymanning

##### update ubuntu
## install python and development tools
RUN apt-get update \
    && apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev \
    && apt-get install -y python python-setuptools python-dev python-numpy \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#### Install Maven 3
ENV MAVEN_VERSION 3.5.0
ENV MAVEN_HOME /usr/apache-maven-$MAVEN_VERSION
ENV PATH $PATH:$MAVEN_HOME/bin
RUN curl -sL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
  | gunzip \
  | tar x -C /usr/ \
  && ln -s $MAVEN_HOME /usr/maven

#### Clean up 
RUN apt-get clean

#### define working directory.
RUN mkdir -p /data
COPY . /data

VOLUME "/data"

WORKDIR /data

#### Define default command.
#CMD ["bash"]

