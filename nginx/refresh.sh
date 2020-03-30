#!/bin/sh


containerId=$(docker ps -l | tail -n 1 | cut -d' ' -f1)
docker cp default.conf $containerId:/etc/nginx/conf.d/
docker exec -it nginx /bin/sh -c "nginx -s reload"
