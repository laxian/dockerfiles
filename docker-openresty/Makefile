

build:
	docker build -t openresty-uploader:0.1 .

run:
	docker run -d -p 81:80 --name openresty-uploade -v ~/docker/share:/share openresty-uploader:0.1

open:
	open "http://192.168.1.68:81"

start-server: build run open

