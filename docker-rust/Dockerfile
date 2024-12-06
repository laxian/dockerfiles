FROM ubuntu:24.04

# 设置环境变量，避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update --allow-insecure-repositories \
    && apt-get -o Acquire::AllowInsecureRepositories=true \
              -o Acquire::AllowDowngradeToInsecureRepositories=true update
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt update --allow-insecure-repositories
RUN apt install -y --allow-unauthenticated gnupg
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32

# RUN sed -i 's@http://ports.ubuntu.com/ubuntu-ports@http://mirrors.aliyun.com/ubuntu@g' /etc/apt/sources.list
# RUN apt update --allow-insecure-repositories


# RUN apt-get update
# 更新系统并安装必要的软件包
RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    git \
    vim \
    gcc \
    g++ \
    cmake \
    make \
    build-essential \
    pkg-config \
    libssl-dev \
    zlib1g-dev \
    tigervnc-standalone-server \
    tightvncserver \
    xfce4 \
    xfce4-goodies \
    language-pack-en \
    lsb-release \
    libglib2.0-dev \
    libatk1.0-dev \
    libpango1.0-dev \
    libgdk-pixbuf2.0-dev \
    libsoup-3.0-dev \
    libjavascriptcoregtk-4.1-dev \
    libwebkit2gtk-4.1-dev \
    libc++-dev \
    libc++abi-dev \
    dbus-x11 \
    openssh-server


# 安装 Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && echo '. $HOME/.cargo/env' >> /root/.bashrc \
    && . $HOME/.cargo/env
#     && rustup default nightly \
#     && rustup component add rust-src --toolchain nightly-aarch64-unknown-linux-gnu
# #     && . "$HOME/.cargo/env" \
#     && rustup target add aarch64-unknown-linux-gnu

# 安装 Node.js 和 Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && . /root/.bashrc \
    && npm config set registry https://mirrors.huaweicloud.com/repository/npm/ \
    && npm install -g yarn
#     && npm cache clean --force \
#     && rm -rf /var/lib/apt/lists/*

# 配置语言环境
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# 配置 VNC 密码
RUN mkdir -p /root/.vnc \
    && echo "password" | vncpasswd -f > /root/.vnc/passwd \
    && chmod 600 /root/.vnc/passwd

# 添加 xstartup 脚本
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# 添加启动脚本
RUN echo "#!/bin/bash\nvncserver :1 -geometry 1280x1024 -depth 24 -localhost no\ntail -f /dev/null" > /usr/local/bin/vnc-start.sh \
    && chmod +x /usr/local/bin/vnc-start.sh \
    && sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
    echo "root:0000" | chpasswd
    

# 设置默认命令
# CMD ["/usr/local/bin/vnc-start.sh"]