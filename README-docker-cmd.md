
# 常用docker命令

```shell
docker pull ubuntu
docker images
docker ps
docker ps -a
docker rmi <imageId>
docker rm <containerId>
docker stop <containerId>
decker start <containerId>
docker run -di --name -p -v <iamgeId>
docker exec -it <containerId> bash
docker rename <containerId> <newName>
docker inspect <containerId>
docker info
docker build -t <name:version> -f <dockerfile> .
docker cp host_path containerID:container_path
docker cp containerID:container_path host_path
```

## Dockerfile 命令

```shell
FROM 基础镜像
USER
MAINTAINER 维护者
ENV 环境变量
COPY 复制到docker
ADD 复制到docker，tar.gz自动解压
RUN 执行shell命令
WORKDIR 指定工作目录
EXPOSE 暴露端口
VOLUME 挂载
CMD 启动容器时指定默认执行的命令
```
