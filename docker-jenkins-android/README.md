
# Jenkins + Android SDK 镜像

Dockerfile:
dockerfile-jenkins-android

## 使用方法

下载`commandlinetools-linux-6200805_latest.zip`和
`dockerfile-jenkins-android`到当前目录，然后执行如下命令

```zsh
docker pull jenkins/jenkins
docker build -f dockerfile-jenkins-android -t android-package:0.0.1 .
```
