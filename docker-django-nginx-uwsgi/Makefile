name := django
version := 0.0.5
full_name := ${name}:${version}
container_name := ${name}2

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

ps:
	docker ps -a

save:
	docker save ${full_name} -o ./${name}-${version}.tar

clean:
	rm -rf masterzen*
	rm -rf nginx-*
	rm -rf storeserver
	rm nginx-**.gz