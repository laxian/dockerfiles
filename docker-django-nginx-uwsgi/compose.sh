#!/bin/bash


image_name=django
version=${1-:0.0.2}
echo $version
container_name=$image_name
host_port=8082

./download.sh
docker pull alpine
docker build -t $image_name:$version -f Dockerfile-centos2015 .

# docker run --name $image_name -di -p 80:80 -v ~/docker/share/:/share/ --env NGINX_HOME=/usr/local/nginx/sbin/ $image_name /bin/sh
# docker exec -it $image_name /bin/sh -c $NGINX_HOME/nginx -c /etc/nginx/upload.conf