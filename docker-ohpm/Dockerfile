# 使用官方的 Ubuntu 镜像作为基础镜像
FROM ubuntu:24.04

# 设置环境变量，避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更换软件源为阿里云镜像
RUN sed -i 's@http://ports.ubuntu.com/ubuntu-ports@http://mirrors.aliyun.com/ubuntu@g' /etc/apt/sources.list
RUN apt-get update

# 更新包列表并安装必要的依赖
RUN apt-get install -y wget curl git unzip openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# 配置 SSH 服务监听端口为 2222
RUN sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config

# 下载并安装 Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# 创建非 root 用户
RUN useradd -m -s /bin/bash ohpmuser

# 复制ohpm-repo压缩包到镜像中
COPY ohpm-repo-5.0.8.0.zip /tmp/

# 解压ohpm-repo到指定目录
RUN unzip /tmp/ohpm-repo-5.0.8.0.zip -d /usr/local/ohpm

# 设置 PATH 环境变量，使 ohpm 命令可用
ENV PATH="/usr/local/ohpm/bin:${PATH}"
ENV OHPM_DIR=/usr/local/ohpm

# 验证 ohpm 安装
RUN ohpm-repo -v

# 配置ohpm-repo
RUN conf_path=$(realpath $OHPM_DIR/conf) && \
    cd $conf_path && \
    current_ip=$(hostname -I | awk '{print $1}') && \
    sed -i "s/listen: localhost:8088/listen: $current_ip:8088/" config.yaml && \
    sed -i "s|#server: http://localhost:8088|server: http://$current_ip:8088|" config.yaml;

# 定义启动脚本
RUN echo '#!/bin/bash' > /usr/local/ohpm/start_ohpm.sh && \
    echo "cd $OHPM_DIR/bin" >> /usr/local/ohpm/start_ohpm.sh && \
    echo "./ohpm-repo install" >> /usr/local/ohpm/start_ohpm.sh && \
    echo ". ~/.bashrc" >> /usr/local/ohpm/start_ohpm.sh && \
    echo "eval \$(tail -1 ~/.bashrc)" >> /usr/local/ohpm/start_ohpm.sh && \
    echo "./ohpm-repo start" >> /usr/local/ohpm/start_ohpm.sh && \
    echo "service ssh start" >> /usr/local/ohpm/start_ohpm.sh && \
    echo "echo 'ohpm-repo已启动，首次启动默认创建管理员账号admin，密码12345Qq!，请首次登录时修改密码。'" >> /usr/local/ohpm/start_ohpm.sh && \
    chmod +x /usr/local/ohpm/start_ohpm.sh


# 更新包列表并安装必要的依赖
RUN apt-get install -y sudo vim && \
    usermod -aG sudo ohpmuser

# 更改 ohpm 目录权限，使其可被非 root 用户访问
RUN chown -R ohpmuser:ohpmuser /usr/local/ohpm

# 切换到非 root 用户
USER ohpmuser

# 暴露应用的端口（如果有）
EXPOSE 8088 2222

# 定义启动命令
CMD ["/usr/local/ohpm/start_ohpm.sh"]