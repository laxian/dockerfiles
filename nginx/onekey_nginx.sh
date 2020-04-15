#!/bin/bash

# docker pull nginx，setup timezone "-e TZ=Asia/Shanghai"
docker run --name nginx -d -p 80:80 -v ~/docker/share:/share -e TZ=Asia/Shanghai nginx

# 查询新安装的container的id
containerId=$(docker ps -l | tail -n 1 | cut -d' ' -f1)
echo $containerId

# 复制出nginx默认配置
# docker cp $containerId:/etc/nginx/conf.d/default.conf .

# 复制回去到docker nginx
docker cp default.conf $containerId:/etc/nginx/conf.d/

# 修改时区
# TZ=Asia/Shanghai
# docker exec -it nginx /bin/sh -cx "ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
#     && apt-get install tzdata \
#     && cat /etc/timezone"
# docker exec -it nginx /bin/sh -cx "dpkg-reconfigure --frontend noninteractive tzdata"

# in docker 执行nginx -s reload
docker exec -it nginx /bin/sh -c "nginx -s reload"

if [ ! -d "~/docker/share/" ]; then
    mkdir -p ~/docker/share
fi

if [ ! -f ~/docker/share/a.txt ]; then
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo hello world! $timestamp >~/docker/share/a.txt
fi

# 打开
open "http://localhost/share/a.txt"
