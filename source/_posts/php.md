---
title: php 代码片段
date: 2017-05-7
categories:
    - php
tag:
    - php
---
代码片段 ，curl 异常处理 , 自动加载
<!--more-->

### curl
```php
<?php
function _cUrl($url, $header = null, $data = null) {
  //初始化curl
  $curl = curl_init();
  //设置cURL传输选项
  if (is_array($header)) {
    curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
  }
    curl_setopt($curl, CURLOPT_HEADER, 1); //返回response头部信息
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($curl, CURLOPT_URL, $url);
  // 设置https
  curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
  curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
  // 设置重定向
  curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
  //支持毫秒级别超时设置
  curl_setopt($curl, CURLOPT_NOSIGNAL, true);
  // 设置timeout 毫秒级
  curl_setopt($curl, CURLOPT_TIMEOUT_MS, 100000);
  if (!empty($data)) {
        //post方式
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
  }
  //获取采集结果
  $output = curl_exec($curl);
  //关闭cURL链接
  curl_close($curl);
  return $output;
}
$data = [
    'Referer: https://www.zhihu.com/',
    'authorization: Bearer Mi4xVXpKNEFBQUFBQUFBTUFBaXl4b3hDaGNBQUFCaEFsVk5GUTd0V2dEOTBXOUJrc2dldGZjX3djaW1rZ3JNZ3JBUFRB|1509933077|729eecc3a309a790594388f6de12095ba67301b5',
    'x-udid: ADAAIssaMQqPTtzo10m2O7og4kX78JTrszg=',
    'origin: https://www.zhihu.com',
    'Cookie: q_c1=0e2527b3fcfb4de999e4da434b6b1f74|1513741829000|1467874050000; d_c0="ADAAIssaMQqPTtzo10m2O7og4kX78JTrszg=|1467874049"; _za=637e06e6-0436-4fc5-83b4-d62266aba50e; __utma=51854390.19789794.1495877638.1495877638.1495877638.1; _zap=114c180d-0306-45fb-8322-f13b6e92f6fc; __utmv=51854390.100-1|2=registration_date=20140902=1^3=entry_date=20140902=1; q_c1=0e2527b3fcfb4de999e4da434b6b1f74|1501116523000|1467874050000; z_c0=Mi4xVXpKNEFBQUFBQUFBTUFBaXl4b3hDaGNBQUFCaEFsVk5GUTd0V2dEOTBXOUJrc2dldGZjX3djaW1rZ3JNZ3JBUFRB|1509933077|729eecc3a309a790594388f6de12095ba67301b5; aliyungf_tc=AQAAABLv6R7HUwQAOfugPWqrypNTlusB; _xsrf=a760b280-3833-4b2a-848f-38eadd9518c0',
    'Connection: keep-alive',
    'Pragma: no-cache',
    'Cache-Control: no-cache'
];

echo _cUrl("https://www.zhihu.com/question/264024846",$data);
```
### 中文分词
```php
preg_match_all("/./u", $name, $arr);
            $name = implode('%', $arr[0]);
```

### 富文本js攻击
```php
<?php
require dirname(__FILE__).'/htmlpurifier/library/HTMLPurifier.auto.php';
$purifier = new HTMLPurifier();
echo $purifier->purify($html);
```

### 自动加载
```php
function _vendor_autoload($class) {
  $parts = explode('\\', $class);
  $parts[] = str_replace('_', DIRECTORY_SEPARATOR, array_pop($parts));
  $path = implode(DIRECTORY_SEPARATOR, $parts);
  $file = stream_resolve_include_path($path.'.php');
  if($file !== false)
    require_once $file;
}
spl_autoload_register('_vendor_autoload');
```

### 类型异常
```bash
1. error_reporting  =  E_ALL                   ;将会向PHP报告发生的每个错误
2. display_errors = Off                            ;不显示 满足上条指令所定义规则的所有错误报告
3. log_errors = On                             ;决定日志语句记录的位置
4. log_errors_max_len = 1024                   ;设置每个日志项的最大长度
5. error_log = syslog                          ;指定产生的错误报告写入操作系的日志里
```
```php
set_exception_handler('zyfexception');
function zyfexception($exception)
{
    message( $exception->getMessage() );
}

// 系统级别异常
register_shutdown_function('zyfshutdownfunc');
function zyfshutdownfunc()
{
    if ($error = error_get_last()) {
        $errorStr = $error['type'] . ' <br/>Msg: ' . $error['message'] . ' <br/> ' . $error['file'] . ' </br> ' . $error['line'] ;
        message($errorStr);
    }
}
```

