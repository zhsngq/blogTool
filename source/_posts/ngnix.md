---
title: window 下配制nginx服务器
date: 2017-04-06
categories:
    - 服务器
    - nginx
tag:
    - 服务器
    - nginx
    - windows
---
启动nginx config
<!--more-->

> php + nginx 环境

```
    搜索“extension_dir”，找到： e;xtension_dir = "ext" 先去前面的分号再改为 extension_dir = "./ext"
    搜索“date.timezone”，找到：;date.timezone = 先去前面的分号再改为 date.timezone = Asia/Shanghai
    搜索“enable_dl”，找到：enable_dl = Off 改为 enable_dl = On
    搜索“cgi.force_redirect” ;cgi.force_redirect = 1 先去前面的分号再改为 cgi.force_redirect = 0
    搜索“fastcgi.impersonate”，找到： ;fastcgi.impersonate = 1 去掉前面的分号
    搜索“cgi.rfc2616_headers”，找到：;cgi.rfc2616_headers = 0 先去前面的分号再改为 cgi.rfc2616_headers = 1
    搜索“php_mysql”，找到：”extension=php_mysql.dll和extension=php_mysqli.dll  去掉前面的“;”extension=php_mysql.dll和extension=php_mysqli.dll   （支持MYSQL数据库）
```

>nginx 配置文件 php 读取配置文件

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

    # yii
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

    # think-php php7中mysqli 不支持 , 尽量使用php5.6
    server {
        listen 80;
        server_name web.testbase.cn;

        root D:/workspace/bak;
        index index.html index.htm index.php;

        location / {
            index  index.html index.htm index.php; #//默认页
        }

        location ~ .*\.php.* {
            fastcgi_pass    127.0.0.1:9000;
            fastcgi_index   index.php;
            include fastcgi.conf;
            set $real_script_name   $fastcgi_script_name;
            fastcgi_param   SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param   SCRIPT_NAME     $real_script_name;
            fastcgi_param   PATH_INFO       $path_info;
            if ($fastcgi_script_name ~ "^(.+?\.php)(/.+)$") {
                set $real_script_name   $1;
                set $path_info  $2;
            }
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

> php 读取配置文件

```php
<?php
    $subject = file_get_contents('D:/TOOL/nginx/conf/nginx.conf');
    preg_match_all('/(listen|server_name|root)\s+\S+(?=;)/', $subject, $result, PREG_PATTERN_ORDER);
    $result = $result[0];
    foreach ($result as $key => &$value) {
        $value = preg_replace('/(listen|server_name|root)\s+/', '', $value);
        if (($key+1)%3==0) {
            if (preg_match('/[a-z]|[A-Z]/', $result[$key-1])) {
                echo $result[$key-1].' - - - - - - - - > '.$result[$key]."\n";
            } else {
                echo $result[$key-1].":".$result[$key-2].' - - - - - - - - > '.$result[$key]."\n";
            }
        }
    }
```

```bash
    #!/bin/usr/shell
    echo load_nginx_config
    php D:/TOOL/nginx/load_nginx_config.php
    sleep 60000
```
