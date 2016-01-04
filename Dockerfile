FROM ubuntu
MAINTAINER Tomas Markauskas <tomas@markauskas.lt>

RUN apt-get -y update && apt-get -y install openjdk-7-jre git wget
RUN mkdir -p /opt/jenkins
ADD run.sh /opt/jenkins/
WORKDIR /opt/jenkins/
RUN wget http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

ENV JENKINS_MASTER http://rack1-compute1:8081/

CMD ["/opt/jenkins/run.sh"]
