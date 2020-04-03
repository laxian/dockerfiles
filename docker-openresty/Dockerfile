FROM openresty/openresty:alpine

COPY conf/nginx.vh.default.conf /etc/nginx/conf.d/default.conf
COPY conf/auth.conf /etc/nginx/auth.conf
COPY conf/user.db /etc/nginx/conf.d/user.db
COPY conf/upload.lua /usr/local/openresty/nginx/conf/lua/upload.lua
COPY conf/delete.lua /usr/local/openresty/nginx/conf/lua/delete.lua

COPY conf/form.html /usr/local/openresty/nginx/html/form.html

RUN mkdir -p /var/www/html/files/simulation
RUN mkdir -p /var/www/html/files/summary
RUN chmod 777 -R /var/www/html/files

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]