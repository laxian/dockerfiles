
FROM alpine
# USER root


COPY nginx-1.16.1 /usr/local/nginx-1.16.1
COPY nginx-upload-module /usr/local/nginx-upload-module
COPY masterzen-nginx-upload-progress-module-a788dea /usr/local/masterzen-nginx-upload-progress-module-a788dea

ENV TZ=Asia/Shanghai
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    # timezone
    && apk update && apk add ca-certificates \
    && apk add tzdata \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    # && apk add git \
    # && apk add curl \
    && addgroup -g 499 -S nginx \
    && adduser -HDu 499 -s /sbin/nologin -g 'web server' -G nginx nginx \
    && cd /usr/local \
    # && git clone https://github.com/vkholodkov/nginx-upload-module.git \
    # && curl -sO http://nginx.org/download/nginx-1.16.1.tar.gz \
    # && tar xf nginx-1.16.1.tar.gz \
    # && rm -rf nginx-1.16.1.tar.gz \
    # && curl -s0 https://codeload.github.com/masterzen/nginx-upload-progress-module/legacy.tar.gz/v0.9.0 \
    # && tar -zxvf nginx-upload-progress-module-v0.9.0.tar.gz \
    # && rm nginx-upload-progress-module-v0.9.0.tar.gz \
    && cd nginx-1.16.1 \
    && apk --update --no-cache add geoip geoip-dev pcre libxslt gd openssl-dev pcre-dev zlib-dev build-base linux-headers libxslt-dev gd-dev libstdc++ libgcc patch logrotate supervisor inotify-tools && rm -rf /var/cache/apk/* \
    && ./configure \
    --add-module=../masterzen-nginx-upload-progress-module-a788dea \
    --add-module=../nginx-upload-module \
    --prefix=/usr/local/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --user=nginx \
    --group=nginx \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/var/run/nginx/nginx.pid \
    --lock-path=/var/lock/nginx.lock \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_gzip_static_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --http-client-body-temp-path=/var/tmp/nginx/client \
    --http-proxy-temp-path=/var/tmp/nginx/proxy \
    --http-fastcgi-temp-path=/var/tmp/nginx/fastcgi \
    --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi \
    && make && make install \
    && mkdir -p /var/tmp/nginx/{client,fastcgi,proxy,uwsgi} \
    && echo "daemon off;" >> /etc/nginx/ngnix.conf \
    # && apk del wget
    ENV PATH /usr/local/nginx/sbin:$PATH
EXPOSE 80
CMD ["/usr/local/nginx/sbin/nginx"]