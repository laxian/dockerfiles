
FROM alpine
# USER root


COPY nginx-1.16.1 /usr/local/nginx-1.16.1
COPY nginx-upload-module /usr/local/nginx-upload-module
COPY masterzen-nginx-upload-progress-module-a788dea /usr/local/masterzen-nginx-upload-progress-module-a788dea
COPY storeserver /var/www/storeserver
COPY storeserver/storeserver/storeserver.conf /etc/nginx/conf.d/storeserver.conf
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/storeserver
ENV TZ=Asia/Shanghai
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
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
    && apk add python3 \
    && apk add vim \
    && apk add uwsgi \
    && apk add unzip \
    && apk add sqlite \
    && apk add openrc \
    && apk add bash \
    && apk add python3-dev \
    # install pip & py package
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && pip install virtualenv \
    && virtualenv /var/www/storeserver/venv --python=python3 \
    && source /var/www/storeserver/venv/bin/activate \
    && pip install -r /var/www/storeserver/requirements.txt \
    && mkdir -p /run/uwsgi \
    && apk add uwsgi-http  \
    && apk add uwsgi-router_http \
    && apk add python3-dev \
    # 更新源、安装openssh 并修改配置文件和生成key 并且同步时间
    && apk update && \
    apk add --no-cache openssh && \ 
    sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
       ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
    echo "root:0000" | chpasswd
 
    # 开放22端口
EXPOSE 22 80 3001
ENV PATH /usr/local/nginx/sbin:$PATH
# CMD ["/var/www/storeserver/start.sh"]