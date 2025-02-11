  
run:
	docker build -t ohpm-repo:latest .
	docker run -tid -p 8088:8088 --name ohpm-repo ohpm-repo
	docker exec -it ohpm-repo /bin/bash

remove:
	docker stop ohpm-repo ;docker rm ohpm-repo; docker rmi ohpm-repo
