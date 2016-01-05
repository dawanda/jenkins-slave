FROM ubuntu:trusty
MAINTAINER Tomas Markauskas <tomas@dawanda.com>

RUN apt-get update \
    && apt-get -y install openjdk-7-jre-headless git wget

RUN wget -O /usr/local/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.8.0 \
    && chmod +x /usr/local/bin/docker

RUN wget -O /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.5.2/docker-compose-Linux-x86_64 \
    && chmod +x /usr/local/bin/docker-compose

RUN mkdir -p /opt/jenkins
ADD run.sh /opt/jenkins/
WORKDIR /opt/jenkins/
RUN wget http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

ENV JENKINS_MASTER http://rack1-compute1:8081/

CMD ["/opt/jenkins/run.sh"]
