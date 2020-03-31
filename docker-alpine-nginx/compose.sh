#!/bin/bash


image_name=mynginx
version=0.0.1
container_name=mynginx
host_port=8082

./download.sh
docker pull alpine
docker build -t $image_name:$version -f Dockerfile .

docker run --name mynginx -di -p 80:80 -v ~/docker/share/:/share/ --env NGINX_HOME=/usr/local/nginx/sbin/ uploadnginx/nginx /bin/sh
docker exec -it mynginx /bin/sh -c $NGINX_HOME/nginx -c /etc/nginx/upload.conf