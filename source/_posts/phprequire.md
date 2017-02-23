---
title: php 源码默认导入包
date: 2017-02-27
categories:
    - php
    - require
tag:
    - 服务器
    - nginx
    - windows
---
<!--more-->

>php配置文件修改

```bash
auto_prepend_file = "D:/vendor/run.php"
```

>添加run文件

```php
require('autoload.php');
// add debug tool
\Tracy\Debugger::enable();
```
