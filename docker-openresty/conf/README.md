

### 1. nginx.vh.defalut.conf 说明
可灵活对路径添加认证处理,只需要在对应路径下添加以下代码:
```
   include /etc/nginx/conf/auth.conf;
```
默认以下路径已添加认证(若不需要,可自行删除): 
```
location ~ ^/upload-jenkins(/.*)?$
location ~ ^/upload-summary(/.*)?$ 
location ~ ^/delete-jenkins/(.*)$ 
location ~ ^/delete-summary/(.*)$

```

### 2. user.db说明
user.db为ngxin basic auth 用户凭据文件。

- 格式为:  

```
   username1:[openssl passwd userpassword1]:comment1
   username2:[openssl passwd userpassword2]:comment2
   ...
   
   #如
   file:zemoUvxlVAAKE:user1
   file2:S70mkiqcpZLSM:user2
```

- 生成方法:
> http://nginx.org/en/docs/http/ngx_http_auth_basic_module.html

```shell
printf "<username>:$(openssl passwd <password>)" > user.db
```


### 3. curl 上传测试
```
   curl -u user:passwd -F "filename=@file1.txt" http://localhost:81/upload-summary
   curl -u user:passwd -F "filename=@file1.txt" http://localhost:81/upload-summary/CHILD_DIR_CREATE_IF_NOT_EXIST

```
注意，子目录会自动创建
