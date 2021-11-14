#!/bin/bash -e

if [ -d storeserver ]; then
	echo "SKIP clone storeserver"
else
	echo cloning storeserver.git
	git clone http://10.10.81.54:8888/SW/storeserver.git
fi

if [ -d nginx-upload-module ]; then
	echo "SKIP clone nginx_upload_module"
else
	# clone nginx_upload_module
	echo "clone nginx_upload_module"
	nginx_upload_module_url=git@github.com:vkholodkov/nginx-upload-module.git
	git clone $nginx_upload_module_url
fi

# download uncompress upload_progress_module
upload_progress_module_url=https://codeload.github.com/masterzen/nginx-upload-progress-module/legacy.tar.gz/v0.9.0
name=$(echo $upload_progress_module_url | cut -d'/' -f5)
ver=$(echo $upload_progress_module_url | cut -d'/' -f7)
if [ -d masterzen-nginx-upload-progress-module* ]; then
	echo "SKIP download upload_progress_module"
else
	upload_module_filename=$name-$ver.tar.gz
	echo "download upload_progress_module"
	curl -o $upload_module_filename $upload_progress_module_url
	tar -zxvf $upload_module_filename
fi

# download uncompress nginx
if [ -d nginx-1.16.1 ]; then
	echo "SKIP download nginx"
else
	echo "download nginx"
	nginx_url=http://nginx.org/download/nginx-1.16.1.tar.gz
	curl -O $nginx_url
	tar -zxvf $(echo $nginx_url | cut -d'/' -f5)
fi
