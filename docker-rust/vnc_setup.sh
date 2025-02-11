#!/bin/bash

# 脚本功能：安装并配置 TigerVNC Server，启用剪贴板共享功能（GNOME 版本）

# 检查是否以 root 权限运行
if [ "$EUID" -ne 0 ]; then
  echo "请以 root 权限运行此脚本。"
  exit 1
fi

# 获取当前用户的家目录
USER_HOME=$(eval echo ~$SUDO_USER)

# 更新系统并安装 TigerVNC Server 和 GNOME 桌面环境
echo "更新系统并安装 TigerVNC Server 和 GNOME 桌面环境..."
sudo apt update
sudo apt install -y tigervnc-standalone-server tigervnc-common gnome-session gnome-panel gnome-terminal

# 检查 gnome-session 是否安装成功
if ! command -v gnome-session &> /dev/null; then
  echo "GNOME 桌面环境安装失败，请检查系统配置。"
  exit 1
fi

# 确保 xstartup 文件存放在当前用户的目录下
VNC_DIR="$USER_HOME/.vnc"
echo "创建 VNC 配置文件夹：$VNC_DIR"
mkdir -p "$VNC_DIR"

# 设置 VNC 密码
read -sp "请输入 VNC 密码（最多8位）：" VNC_PASS
echo
if [ -z "$VNC_PASS" ]; then
  echo "密码不能为空，请重新运行脚本。"
  exit 1
fi
echo -e "$VNC_PASS\n$VNC_PASS\nn" | vncpasswd

# 创建或修改 xstartup 文件，确保它位于当前用户的目录下
XSTARTUP="$VNC_DIR/xstartup"
echo "创建或修改 $XSTARTUP 文件..."
cat <<EOL > "$XSTARTUP"
#!/bin/bash
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
# 桌面样式：ubuntu:GNOME: dock左侧; GNOME: dock底部
export XDG_CURRENT_DESKTOP=GNOME
# classic 为经典模式，ubuntu 为 ubuntu 风格
export GNOME_SHELL_SESSION_MODE=ubuntu
exec gnome-session &
# 如果无法启动server, 0 pixels in / 0 pixels out 加上这一行
# exec /etc/X11/xinit/xinitrc
EOL

# 修改 xstartup 文件权限
chmod +x "$XSTARTUP"

# 启动 VNC Server
DISPLAY_NUM=2
PORT=$((5900 + DISPLAY_NUM))
echo "启动 VNC Server（显示编号：:$DISPLAY_NUM，端口：$PORT）..."
vncserver :$DISPLAY_NUM -localhost no -geometry 1280x720 -depth 24
if [ $? -ne 0 ]; then
  echo "VNC 服务器启动失败，请检查错误信息。"
  exit 1
fi

# 配置防火墙（如果使用 UFW）
if command -v ufw > /dev/null; then
  echo "允许防火墙访问 VNC 端口：$PORT..."
  sudo ufw allow $PORT
  if [ $? -ne 0 ]; then
    echo "防火墙配置失败，请检查 UFW 配置。"
    exit 1
  fi
fi

# 提示信息
echo "\n配置完成！请使用以下信息连接："
IP=$(hostname -I | awk '{print $1}')
echo "IP 地址：$IP"
echo "VNC 端口：$PORT"
echo "剪贴板同步已启用。"
echo "如果需要停止 VNC 服务，请运行： vncserver -kill :$DISPLAY_NUM"
