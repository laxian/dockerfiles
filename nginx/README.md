## nginx 作为静态服务器

1. docker pull nginx

2. docker run -di --name nginx -p 80:80 -v ~/docker/share:/share nginx

3. docker ps 查看<containerId>

4. docker cp <containerId>:/etc/nginx/conf.d/ .

5. 修改nginx配置后，复制回去，docker cp default.conf 2791e94fd3b2:/etc/nginx/conf.d/

6. docker exec -it nginx bash

7. nginx -s reload

### 配置
[default.conf](https://github.com/laxian/dockerfiles/blob/master/nginx/default.conf)

### 操作
[cmd.sh](https://github.com/laxian/dockerfiles/blob/master/nginx/cmd.sh)