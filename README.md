# Dockerfile

## docker command
[README-docker-cmd.md](https://github.com/laxian/dockerfiles/blob/master/README-docker-cmd.md)

## docker nginx
nginx as a static file server

[nginx/README.md](https://github.com/laxian/dockerfiles/blob/master/nginx/README.md)

## docker-jenkins-android
docker jenkins image with Android SDK

[docker-jenkins-android/README.md](https://github.com/laxian/dockerfiles/blob/master/docker-jenkins-android/README.md)

## docker-alpine-nginx
docker nginx image based on alpine

[docker-alpine-nginx/README.md](https://github.com/laxian/dockerfiles/blob/master/docker-alpine-nginx/README.md)

## docker-openresty
file upload/download based on openresty

[docker-openresty/README.md](https://github.com/laxian/dockerfiles/blob/master/docker-openresty/README.md)

Docker 时区问题

1. 启动时指定时区
`docker run -e TZ=Asia/Shanghai nginx`

2. 改变镜像或容器时区

- alpine
```shell
ENV TZ=Asia/Shanghai
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    # timezone
    && apk update && apk add ca-certificates \
    && apk add tzdata \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
```

- Ubuntu
```shell
ENV TZ=Asia/Shanghai

# timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get install tzdata \
    && dpkg-reconfigure --frontend noninteractive tzdata
```