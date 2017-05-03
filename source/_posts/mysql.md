---
title: mysql 5.6 安装
date: 2017-5-03
categories:
    - mysql
    - 安装
tag:
    - mysql
---
```bash
初始化密码
　　mysql -u root
　　mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('newpass');
```
<!--more-->

> mysql5.6 安装

下载 mysql.zip 包
将bin目录加入环境变量
修改 my-default.ini
```bash
basedir = E:\basedir
datadir = E:\datadir
port = 3306

join_buffer_size = 128M
sort_buffer_size = 2M
read_rnd_buffer_size = 2M

#mysqld -install
#mysqld -remove
#net mysql start
```

> mysql 设置root密码

用SET PASSWORD命令
　　mysql -u root
　　mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('newpass');
