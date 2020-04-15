

EXPOSE := 8082

build:
	docker build -t openresty-uploader:0.1 .

run:
	docker run -d -p $(EXPOSE):80 --name openresty-uploade -v ~/docker/share:/share openresty-uploader:0.1

open:
	open "http://192.168.1.68:$(EXPOSE)/form.html"

start-server: build run open

# make upload path=<path_to_file>
upload:
	curl -u file:file -F "filename=@${path}" http://localhost:$(EXPOSE)/upload-summary

push:
	docker cp conf/upload.lua openresty-uploade:/usr/local/openresty/nginx/conf/lua/upload.lua

restart:
	docker exec -it openresty-uploade /bin/sh -c "nginx -s reload"

cp:
	docker cp conf/nginx.vh.default.conf openresty-uploade:/etc/nginx/conf.d/default.conf

reload:
	docker exec -it openresty-uploade /bin/sh -c "nginx -s reload"
