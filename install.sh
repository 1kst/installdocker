#!/bin/bash

# 安装docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# 安装docker-compose
curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# 给权限
chmod +x /usr/local/bin/docker-compose
usermod -aG docker $USER
# 启动docker服务
systemctl start docker

# 设置docker服务开机自启动
systemctl enable docker
