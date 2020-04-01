#!/bin/bash


containerId=`docker ps -l | cut -d' ' -f1 | tail -1`

docker run -di --name openresty -p 8001:80 openresty/openresty /bin/sh
docker exec -it openresty bash -c "mkdir -p /root/work/logs"
docker exec -it openresty bash -c "mkdir -p /root/work/conf/lua"
docker cp upload.conf openresty:/root/work/conf
docker cp upload.lua openresty:/root/work/conf/lua/

docker exec -it openresty bash -c /usr/local/openresty/nginx/sbin/nginx -p /root/work/ -c /root/work/conf/upload.conf