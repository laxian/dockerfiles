
name := ros
version := h2
full_name := ${name}:${version}
container_name := ${name}
Dockerfile := Dockerfile-all


prepare: rosdistro ros2-humble-20220523-linux-jammy-arm64.tar.bz2

rosdistro:
	echo ===> clone rosdistro
	git clone https://github.com/ros/rosdistro.git

ros2-humble-20220523-linux-jammy-arm64.tar.bz2:
	echo ===> download ros2
	curl -o a.tar.bz2 https://objects.githubusercontent.com/github-production-release-asset-2e65be/31285942/dc8d3689-348a-4918-88d1-75651d5aad33\?X-Amz-Algorithm\=AWS4-HMAC-SHA256\&X-Amz-Credential\=AKIAIWNJYAX4CSVEH53A%2F20220605%2Fus-east-1%2Fs3%2Faws4_request\&X-Amz-Date\=20220605T074621Z\&X-Amz-Expires\=300\&X-Amz-Signature\=d43c09456d6ac51dc2da36abd8398982433db0f9bed8d85a3bf91188cdb4a465\&X-Amz-SignedHeaders\=host\&actor_id\=13779717\&key_id\=0\&repo_id\=31285942\&response-content-disposition\=attachment%3B%20filename%3Dros2-humble-20220523-linux-jammy-arm64.tar.bz2\&response-content-type\=application%2Foctet-stream
	mv a.tar.bz2 ros2-humble-20220523-linux-jammy-arm64.tar.bz2

ros.key:
	echo ===> download ros.key
	curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key

build: prepare
	docker build . -t ${full_name} -f ${Dockerfile}

run: 
	docker run -tid --name ${name} ${full_name}

exec:
	docker exec -it ${name}

rm: 
	docker rm -f ${name}

rmi: 
	docker rmi -f ${full_name}
