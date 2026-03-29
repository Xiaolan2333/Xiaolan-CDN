#!/bin/bash
echo "Xiaolan-CDN主控安装脚本"
echo "安装所需运行库"
apt install unzip -y
echo "安装完成"
echo "创建目录"
mkdir /opt/xiaolan-cdn-system
echo "创建目录完成"
echo "下载压缩包"
wget -P /opt/xiaolan-cdn-system https://github.com/Xiaolan2333/Xiaolan-CDN/releases/latest/download/Xiaolan-CDN-System.zip
echo "压缩包下载完成"
echo "解压压缩包"
unzip /opt/xiaolan-cdn/Xiaolan-CDN-System.zip -d /opt/xiaolan-cdn-system
chmod -R 777 /opt/xiaolan-cdn-system
echo "解压完成"
echo "设置Systemd配置文件"
cp /opt/xiaolan-cdn-system/systemd/xiaolan-cdn-log.service /etc/systemd/system && cp /opt/xiaolan-cdn-system/systemd/xiaolan-cdn-log.timer /etc/systemd/system
echo "设置Systemd配置文件成功"
echo "启动日志同步系统"
systemctl daemon-reload && systemctl enable xiaolan-cdn-log.timer --now
echo "日志同步系统启动成功"
cd /opt/xiaolan-cdn-system
echo "节点安装完成"