# 基于Nginx的可上传的Nginx Docker镜像

Docker+Nginx+Alpine

`./compose.sh`

Nginx文件上传，需要nginx-upload-module模块支持，进度需要nginx-upload-progress-module模块
需要编译源码方式安装

配置文件：upload.conf

上传文件放置到/share目录

上传的文件，文件名如：0004325403，需要自行代码处理，upload-module这样做是为了放置文件名冲突导致被覆盖

form.html/form2.html 为表单上传测试页面
