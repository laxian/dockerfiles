
setup:
	docker pull sonatype/nexus3
	docker run -d -p 8081:8081 --name nexus -v ~/docker/share:/nexus-data -e TZ=Asia/Shanghai sonatype/nexus3
	docker exec -it nexus bash


push:
	./upload.sh pom.xml

test:
	echo 1
	echo 2