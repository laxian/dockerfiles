#!/bin/bash

nginx_upload_module_url=https://github.com/vkholodkov/nginx-upload-module.git
upload_progress_module_url=https://codeload.github.com/masterzen/nginx-upload-progress-module/legacy.tar.gz/v0.9.0
nginx_url=http://nginx.org/download/nginx-1.16.1.tar.gz

name=`echo $upload_progress_module_url | cut -d'/' -f5`
ver=`echo $upload_progress_module_url | cut -d'/' -f7`
upload_module_filename=$name-$ver.tar.gz

git clone $nginx_upload_module_url

curl -o $upload_module_filename $upload_progress_module_url

tar -zxvf $upload_module_filename

curl -O $nginx_url

tar -zxvf `echo $nginx_url | cut -d'/' -f5`


