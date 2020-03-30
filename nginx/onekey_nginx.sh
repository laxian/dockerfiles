#!/bin/bash

# docker pull nginx
docker run --name nginx -d -p 80:80 -v ~/docker/share:/share nginx

# 查询新安装的container的id
containerId=$(docker ps -l | tail -n 1 | cut -d' ' -f1)
echo $containerId

# 复制出nginx默认配置
# docker cp $containerId:/etc/nginx/conf.d/default.conf .

# 复制回去到docker nginx
docker cp default.conf $containerId:/etc/nginx/conf.d/

# in docker 执行nginx -s reload
docker exec -it nginx /bin/sh -c "nginx -s reload"

if [ ! -d "~/docker/share/" ];then
    mkdir -p ~/docker/share
fi

if [ ! -f ~/docker/share/a.txt ]; then
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo hello world! $timestamp > ~/docker/share/a.txt
fi

# 打开
open "http://localhost/a.txt"