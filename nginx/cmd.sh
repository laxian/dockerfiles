#!/bin/bash


# 复制出nginx默认配置
docker cp 2791e94fd3b2:/etc/nginx/conf.d/default.conf .

# 复制回去到docker nginx
docker cp default.conf 2791e94fd3b2:/etc/nginx/conf.d/

# in docker 执行
nginx -s reload