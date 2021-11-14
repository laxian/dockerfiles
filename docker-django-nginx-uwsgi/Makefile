name := django
version := 0.0.5
full_name := ${name}:${version}
container_name := ${name}

run:
	docker run -tid --name ${container_name} -p 3001:3001 -p 2222:22 -p 80:80 ${full_name}

cd:
	docker exec -it ${container_name} /bin/sh

setup:
	./compose.sh ${version}

logs:
	docker logs ${container_name}

rmi: 
	docker rmi ${full_name}

rm: stop
	@docker rm ${container_name}

stop:
	@docker stop ${container_name}

start:
	@docker start ${container_name}

ps:
	docker ps -a

save:
	docker save ${full_name} -o ./${name}-${version}.tar

clean:
	rm -rf masterzen*
	rm -rf nginx-*
	rm -rf storeserver
	rm nginx-**.gz

sync:
	docker cp form2.html django:/var/www/storeserver
	docker cp storeserver/robotstore/urls.py django:/var/www/storeserver/robotstore
	docker cp storeserver/robotstore/views.py django:/var/www/storeserver/robotstore

upload_apk:
	curl -H "Content-Type: multipart/form-data" -X POST -F "apk=@/Users/leochou/Downloads/carbon.png" -F "name=test" -F "verson=1.2.3" http://localhost:3001/add_apk

upload_icon:
	curl -H "Content-Type: multipart/form-data" -X POST -F "icon=@/Users/leochou/Downloads/carbon.png" http://localhost:3001/add_icon
