---
title: cmd 常用命令
date: 2017-04-6
categories:
    - windows
    - cmd
tag:
    - cmd
---
列出windows进程 结束windows进程 列出window服务
ren d:\name\rename.txt name.txt
<!--more-->

## 管理进程

```bash
	#列出windows进程
	tasklist
	#结束windows进程
	taskkill /f /t /im <name>.exe
	#列出window服务
	sc query
	#删除服务
	sc delete <SERVICE_NAME>
    #禁止服务
    sc config <name> start = disabled
```

## cmder

## 设置
[cmder Dwonload](https://github.com/cmderdev/cmder/releases)

```bash
    # 添加右击菜单
    Cmder.exe /REGISTER ALL
```
