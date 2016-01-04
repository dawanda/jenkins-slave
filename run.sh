#!/bin/sh

pwd
env

java -jar swarm-client-2.0-jar-with-dependencies.jar -master $JENKINS_MASTER
