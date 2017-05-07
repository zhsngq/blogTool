---
title: php 代码片段
date: 2017-05-7
categories:
    - php
tag:
    - php
---
<!--more-->

# php 代码片段


## debug
  [php-console](https://github.com/barbushin/php-console)

## 递归array return tree
```php
  $result = self::fmtTree($result,'id','parent','0');
  /**
   * 把array 格式化为数结构 ，排序通过sql 或先排序再调
   * @date   2017-05-04T16:00:06+0800
   * @param $data      array
   * @param $id        id
   * @param $parent    parent
   * @param $parentVal 0
   * @return array
   */
  static function fmtTree($data,$id,$parent,$parentVal){
    $tree = [];
    foreach ($data as $key => $value) {
      if ( empty($tree[$value[$parent]]) )
        $tree[$value[$parent]] = [];
      array_push($tree[$value[$parent]], $value);
    }
    self::addFmtTree($tree[$parentVal],$tree,$id);
    return $tree[$parentVal];
  }

  static function addFmtTree(&$top,$data,$id) {
    foreach ($top as $key => $value) {
      if (isset($data[$value[$id]]))
        self::addFmtTree($data[$value[$id]],$data,$id);
      if (isset($data[$value[$id]]))
        $top[$key]['childs']=$data[$value[$id]];
    }
    return $top;
  }
```
## curl https 解决
```php
/**
 * [cUrl cURL(支持HTTP/HTTPS，GET/POST)]
 * @author qiuguanyou
 * @copyright 烟火里的尘埃
 * @version   V1.0
 * @date      2017-04-12
 * @param     [string]     $url    [请求地址]
 * @param     [Array]      $header [HTTP Request headers array('Content-Type'=>'application/x-www-form-urlencoded')]
 * @param     [Array]      $data   [参数数据 array('name'=>'value')]
 * @return    [type]               [如果服务器返回xml则返回xml，不然则返回json]
 */
function cUrl($url,$header=null, $data = null){
    //初始化curl
    $curl = curl_init();
    //设置cURL传输选项
    if(is_array($header)){
        curl_setopt($curl, CURLOPT_HTTPHEADER  , $header);
    }
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    if (!empty($data)){//post方式
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    }
    //获取采集结果
    $output = curl_exec($curl);
    //关闭cURL链接
    curl_close($curl);
    return $output;
}
```


