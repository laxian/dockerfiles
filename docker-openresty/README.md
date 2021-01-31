# Openresty docker image to ease file uploading

## 1. build

```shell
docker build -t openresty-uploader:0.1 .
```

## 2. run

```shell
docker run -d -p 80:80 --name openresty-uploader openresty-uploader:0.1
```

## 3. test

```shell
http://127.0.0.1/form.html
//username: file
//password: file
```

## 4. Authurization

[README.md](https://github.com/laxian/dockerfiles/blob/master/docker-openresty/conf/README.md)

## Thanks

- [Forked from Here](https://github.com/andraus/docker-openresty)
- [KangSpace](https://github.com/KangSpace)
- [Refered](https://www.yanxurui.cc/posts/server/2017-03-21-NGINX-as-a-file-server/)
