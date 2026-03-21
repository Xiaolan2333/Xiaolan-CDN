#!/bin/bash
echo "Xiaolan-CDN被控安装脚本"
echo "安装所需运行库"
apt install libgd-dev unzip -y
echo "安装完成"
echo "创建目录"
mkdir /opt/xiaolan-cdn
echo "创建目录完成"
echo "下载压缩包"
wget -P /opt/xiaolan-cdn https://github.com/Xiaolan2333/Xiaolan-CDN/releases/latest/download/Xiaolan-CDN-Node.zip
echo "压缩包下载完成"
echo "解压压缩包"
unzip /opt/xiaolan-cdn/Xiaolan-CDN-Node.zip -d /opt/xiaolan-cdn
chmod -R 777 /opt/xiaolan-cdn
echo "解压完成"
echo "设置Systemd配置文件"
cat > /etc/systemd/system/xiaolan-cdn.service << 'EOF'
[Unit]
Description=Xiaolan-CDN
Documentation=https://www.xiaolan.xin
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/opt/xiaolan-cdn/logs/nginx.pid
ExecStart=/opt/xiaolan-cdn/sbin/nginx
ExecReload=/opt/xiaolan-cdn/sbin/nginx -s reload
ExecStop=/opt/xiaolan-cdn/sbin/nginx -s stop
Restart=always
RestartSec=3s
[Install]
WantedBy=multi-user.target
EOF
echo "设置Systemd配置文件成功"
echo "启动Nginx"
systemctl daemon-reload
systemctl enable xiaolan-cdn --now
echo "节点安装完成"