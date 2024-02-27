#!/bin/bash

# 检查docker是否已经安装
if command -v docker &> /dev/null
then
    echo "Docker已经安装，跳过安装步骤"
else
    # 安装docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh

    # 检查docker是否安装成功
    if ! command -v docker &> /dev/null
    then
        echo "Docker安装失败"
        exit 1
    fi
fi

# 检查docker-compose是否已经安装
if command -v docker-compose &> /dev/null
then
    echo "Docker-compose已经安装，跳过安装步骤"
else
    # 安装docker-compose
    curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

    # 检查docker-compose是否安装成功
    if ! command -v docker-compose &> /dev/null
    then
        echo "Docker-compose安装失败"
        exit 1
    fi
fi

# 给权限
chmod +x /usr/local/bin/docker-compose
usermod -aG docker $USER

# 启动docker服务
systemctl start docker

# 设置docker服务开机自启动
systemctl enable docker

# 输出安装成功信息
echo "Docker和Docker-compose安装成功"
