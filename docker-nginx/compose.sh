#!/bin/bash


image_name=mynginx
version=0.0.1
container_name=mynginx
host_port=8082

./download.sh
docker pull alpine
docker build -t $image_name:$version -f Dockerfile .