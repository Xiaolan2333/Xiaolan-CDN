# Xiaolan-CDN

## 功能

1.同步Nginx配置文件

2.将Nginx访问日志收集到一台服务器上

## 食用方法

### 主控安装

1.新建一个文件夹并进入：
```Bash
mkdir 文件夹名 && cd 文件夹名
```

2.下载主控文件：
```Bash
wget https://github.com/Xiaolan2333/Xiaolan-CDN/releases/latest/download/Xiaolan-CDN-System.zip
```

3.解压：
```Bash
unzip Xiaolan-System-Node.zip
```

4.复制Systemd进程守护文件：
```Bash
cp ./systemd/xiaolan-cdn-log.service /etc/systemd/system && cp ./systemd/xiaolan-cdn-log.timer /etc/systemd/system
```

5.设置`node.conf`节点列表：
```Bash
vim node.conf
```
`node.conf`格式：
```node.conf
服务器名（例如Aliyun-JP）
IP（例如127.0.0.1）
端口（例如22）
用户名（例如root）
密码（服务器的密码）

服务器名（例如Aliyun-JP）
IP（例如127.0.0.1）
端口（例如22）
用户名（例如root）
密码（服务器的密码）
```

6.将你的`nginx.conf`文件放入`主控文件夹/node-config`中

7.执行配置文件同步
```Bash
./main
```

8.运行Log同步系统，Log文件保存在`node-accrss-logs`文件夹内，自动按服务器名-日期.log存储
```Bash
systemctl daemon-reload && systemctl enable xiaolan-cdn-log.timer --now
```

9.安装结束，建议奖励自己喝一杯奶茶

注：软件同步的是整个`node-config`文件夹内的所有文件，所以证书文件也可以放里面

### 被控安装
```Bash
wget https://raw.githubusercontent.com/Xiaolan2333/Xiaolan-CDN/refs/heads/main/install-node.sh && chmod 777 install-node.sh && ./install-node.sh
```

### 更新节点`nginx.conf`配置文件
将你新的`nginx.conf`文件放入`主控文件夹/node-config`中，然后在主控文件夹中执行
```Bash
./main
```
即可同步新的配置文件

## 联系我
请发送邮件至`Xiaolan@Xiaolan.xin`

我会在看到的第一时间回复

## 许可证

本软件是基于`MIT`许可证的开源软件