#!/bin/bash

# 安装docker
echo "开始安装docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
echo "docker安装完成"

# 安装docker-compose
echo "开始安装docker-compose..."
curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo "docker-compose安装完成"

# 给权限
echo "给权限..."
usermod -aG docker $USER
echo "权限设置完成"

# 启动docker服务
echo "启动docker服务..."
systemctl start docker
echo "docker服务启动完成"

# 设置docker服务开机自启动
echo "设置docker服务开机自启动..."
systemctl enable docker
echo "docker服务开机自启动设置完成"

echo "全部安装完成"
