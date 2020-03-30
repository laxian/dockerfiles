#!/bin/sh

image_name=android-ci
version=0.0.1
container_name=jenkins
host_port=8082

docker pull jenkins/jenkins && 
docker build -f dockerfile-jenkins-android -t $image_name:$version .


docker run --name $container_name -di -p $host_port:8080 -v ~/docker/jenkins/:/var/jenkins_home -v $image_name:$version