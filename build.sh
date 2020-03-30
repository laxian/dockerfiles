#!/bin/sh

if [ ! -f commandlinetools-linux-6200805_latest.zip ]; then
     echo 'commandlinetools-linux-6200805_latest.zip 不存在，请下载到当前目录后重试！'
     exit -1
fi

image_name=android-ci
version=0.0.1
container_name=jenkins
host_port=8082

docker pull jenkins/jenkins && 
docker build -f dockerfile-jenkins-android -t $image_name:$version .


docker run --name $container_name -di -p $host_port:8080 -v ~/docker/jenkins/:/var/jenkins_home -v $image_name:$version