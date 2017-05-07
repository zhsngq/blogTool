---
title: linux 安装应用
date: 2017-3-15
categories:
    - 服务器
    - linux
tag:
    - 服务器
    - linux
---
解压资源包    $ tar jxvf file.tar.bz2 $ tar zxvf file.tar.gz
查看安装配置  $ ./configure --help
设置安装路径  $ ./configure --prefix=路径
<!--more-->

## 安装

### 解压资源包

file.tar.gz
```bash
$ tar jxvf file.tar.bz2
```

file.tar.bz2
```bash
$ tar zxvf file.tar.gz
```

### 查看安装配置

```bash
$ ./configure --help
```

### 设置安装路径

```bash
$ ./configure --prefix=路径
```

`make`

make会根据Makefile中的规则调用合适的编译器编译所有与当前软件相依赖的源码，生成所有相关的目标文件，最后再使用链接器生成最终的可执行程序:

`make install`

最后要做的就是将可执行程序安装到正确的位置 make && make install

`make clean`

"make clean"用来清除编译连接过程中的一些临时文件,"make uninstall"是卸载相关应用程序
