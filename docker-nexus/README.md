# Nexus OSS 

```shell
docker pull sonatype/nexus3
docker run -d -p 8081:8081 --name nexus -v ~/docker/share:/nexus-data sonatype/nexus3
docker exec -it nexus bash
```

专业的仓库，作为一个文件仓库，绰绰有余。当然maven的仓库有一些格式限制，文件上传的时候，路径不是随意指定的，一不小心就会出现：`< HTTP/1.1 400 Invalid path for a Maven 2 repository`

Raw Repository就没有这些限制。参考`upload.sh`