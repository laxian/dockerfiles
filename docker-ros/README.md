# ROS2 Humble Dockerfile


构建过程需要下载一些资源：

1. ros2
2. rosdistro

因为网络问题，这些资源没在Dockerfile直接下载，在build前准备好会更快。

## Usage

下载资源并构建：

```Bash
make build
```
