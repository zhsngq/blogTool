---
title: window 下配制nginx服务器
date: 2017-02-18
categories:
    - 服务器
    - nginx
tag:
    - 服务器
    - nginx
    - windows
---
<!--more-->

>nginx 配置文件

```bash
#user  nobody;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;

events {
    worker_connections  1024;
}

http {
    # 编码
    charset utf-8;
    # 上传文件大小
    client_max_body_size 10M;
    #设定mime类型,类型由mime.type文件定义
    include    mime.types;
    default_type  application/octet-stream;
    sendfile     on;
    keepalive_timeout  65;
    #设定请求缓冲
    client_header_buffer_size    128k;
    large_client_header_buffers  4 128k;

    server {
        listen 80;
        server_name localhost;

        root D:/workspace;
        index index.html index.htm index.php;

        location / {
            try_files $uri $uri/ /index.php$is_args$args;
        }

        location ~ \.php$ {
            try_files $uri =404;
            include fastcgi.conf;
            fastcgi_pass 127.0.0.1:9000;
        }
    }

}
```
> 启动nginx

```bash
start nginx
nginx -s reload
nginx -s stop
set PHP_FCGI_CHILDREN=5
set PHP_FCGI_MAX_REQUESTS=100000
start D:/TOOL/php/php-cgi.exe -b 127.0.0.1:9000 -c D:/TOOL/php/php.ini
```
使用 RunHiddenConsole 可以隐藏运行 但是需要[下载](http://download.csdn.net/download/johnnycode/8045177) RunHiddenConsole.exe
