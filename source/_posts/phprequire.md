---
title: php 源码默认导入包
date: 2017-04-26
categories:
    - php
    - require
tag:
    - 服务器
    - nginx
    - windows
---
php 配置高效debug log
```json
{
    "require": {
        "raveren/kint": "^1.0",
        "filp/whoops": "^2.1",
        "maximebf/debugbar": "^1.13",
        "tracy/tracy": "^2.4"
    }
}
```
<!--more-->

>composer.json

```json
{
    "require": {
        "raveren/kint": "^1.0",
        "filp/whoops": "^2.1",
        "maximebf/debugbar": "^1.13",
        "tracy/tracy": "^2.4"
    }
}
```

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
