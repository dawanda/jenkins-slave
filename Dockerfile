FROM ubuntu:trusty
MAINTAINER Tomas Markauskas <tomas@dawanda.com>

RUN apt-get update \
    && apt-get install -y apt-transport-https \
    && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list \
    && apt-get update
RUN apt-get -y install docker-engine
RUN apt-get -y install openjdk-7-jre-headless
RUN apt-get -y install git wget

RUN mkdir -p /opt/jenkins
ADD run.sh /opt/jenkins/
WORKDIR /opt/jenkins/
RUN wget http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

ENV JENKINS_MASTER http://rack1-compute1:8081/

CMD ["/opt/jenkins/run.sh"]
