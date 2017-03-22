---
title: cmd 常用命令
date: 2017-03-22
categories:
    - windows
    - cmd
tag:
    - cmd
---
<!--more-->

> 管理进程

```bash
	#列出windows进程
	tasklist
	#结束windows进程
	taskkill /f /t /im <name>.exe
	#列出window服务
	sc query
	#删除服务
	sc delete <SERVICE_NAME>
```
