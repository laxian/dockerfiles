# 获取主机真实外部IP地址
HOST_IP ?= $(shell ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}')

.PHONY: build
build:
	docker build -t ohpm-repo .

.PHONY: run
run:
	docker run -d \
		--name ohpm-repo \
		-p 8088:8088 \
		-p 2222:2222 \
		-e HOST_IP=$(HOST_IP) \
		ohpm-repo

remove:
	docker stop ohpm-repo ;docker rm ohpm-repo; docker rmi ohpm-repo

.PHONY: test-ip
test-ip:
	@echo "获取到的主机IP是: $(HOST_IP)"
