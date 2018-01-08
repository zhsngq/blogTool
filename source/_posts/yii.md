---
title: Yii 常用
date: 2018-01-08 
categories:
    - php
tag:
    - php
---
Yii 常用命令，函数集合
<!--more-->

### 数据迁移
```php
// php yiic migrate create create_edit_active_order_count_base

// php yiic migrate up

public function safeUp()
{
    $tableName = 'goods';
    $this->addColumn($tableName, 'order_count_base', "int(10) NOT NULL DEFAULT '0' COMMENT '报名人数基数'");
    $this->refreshTableSchema($tableName);
}
```

### model自动更新时间
```php
public function behaviors() {
    return array(
        'CTimestampBehavior' => array(
            'class' => 'zii.behaviors.CTimestampBehavior',
            'createAttribute' => 'created',
            'updateAttribute' => 'updated',
            'setUpdateOnCreate' => true,
        )
    );
}
```

### 修改验证规则
```php
public function rules()
    {
        $parentRule = parent::rules();
        // $value[0] = preg_replace('/\b *(start|end)\b,? */','',$value[0]);
        foreach ($parentRule as &$value) {
            if (isset($value['integerOnly'])){
                $value[0] = preg_replace('/\b *(price|dep_price)\b,? */','',$value[0]);
            }
        }
        return array_merge($parentRule,[
            ['price,dep_price','match','pattern'=>'/^\d*\.?\d{1,2}$/','message'=>'输入不合法']
        ]);
    }
public function rules()
{
    return array(
        //必须填写
        array('email, username, password,agree,verifyPassword,verifyCode', 'required'),
        //检查用户名是否重复
        array('email','unique','message'=>'用户名已占用'),
        //用户输入最大的字符限制
        array('email, username', 'length', 'max'=>64),
        //限制用户最小长度和最大长度
        array('username', 'length', 'max'=>7, 'min'=>2, 'tooLong'=>'用户名请输入长度为4-14个字符', 'tooShort'=>'用户名请输入长度为2-7个字'),
        //限制密码最小长度和最大长度
        array('password', 'length', 'max'=>22, 'min'=>6, 'tooLong'=>'密码请输入长度为6-22位字符', 'tooShort'=>'密码请输入长度为6-22位字符'),
        //判断用户输入的是否是邮件
        array('email','email','message'=>'邮箱格式错误'),
        //检查用户输入的密码是否是一样的
        array('verifyPassword', 'compare', 'compareAttribute'=>'password', 'message'=>'请再输入确认密码'),
        //检查用户是否同意协议条款
        array('agree', 'required', 'requiredValue'=>true,'message'=>'请确认是否同意隐私权协议条款'),
        //判断是否是日期格式
        array('created', 'date', 'format'=>'yyyy/MM/dd/ HH:mm:ss'),
        //判断是否包含输入的字符
        array('superuser', 'in', 'range' => array(0, 1)),
        //正则验证器：       
        array('name','match','pattern'=>'/^[a-z0-9\-_]+$/'),
        //数字验证器：              
        array('id', 'numerical', 'min'=>1, 'max'=>10, 'integerOnly'=>true),
        //类型验证 integer,float,string,array,date,time,datetime                
        array('created', 'type', 'datetime'),
        //文件验证：       
        array('filename', 'file', 'allowEmpty'=>true, 'types'=>'zip, rar, xls, pdf, ppt','tooLarge'=>'图片不要超过800K'),
              array('url', 
                'file',    //定义为file类型 
                'allowEmpty'=>true,  
                'types'=>'jpg,png,gif,doc,docx,pdf,xls,xlsx,zip,rar,ppt,pptx',   //上传文件的类型 
                'maxSize'=>1024*1024*10,    //上传大小限制，注意不是php.ini中的上传文件大小 
                'tooLarge'=>'文件大于10M，上传失败！请上传小于10M的文件！' 
            ), 
 } );
 
$news= new news('search'); //search关联规则
```

### 行为修改
```php
public function behaviors() {
        $behaviors = parent::behaviors();
        $behaviors['PriceBehavior'] = [
            'class' => 'application.extensions.PriceBehavior',
            'priceArray' => ['price','dep_price'],
        ];
        return $behaviors;
    }

public function behaviors() {
        return array( 'CTimestampBehavior' => array(
                'class' => 'zii.behaviors.CTimestampBehavior',
                'createAttribute' => 'created',
                'updateAttribute' => 'updated',
                'setUpdateOnCreate' => true,
            )
        );
    }


<?php

class PriceBehavior extends CActiveRecordBehavior
{

    public $priceArray = [];

    public function beforeSave($event)
    {
        foreach ($this->priceArray as $value) {
            $this->getOwner()->{$value} = $this->getOwner()->{$value} * 100;
        }
    }
    
    public function afterFind($event)
    {
        foreach ($this->priceArray as $value) {
            $this->getOwner()->{$value} = $this->getOwner()->{$value} / 100;
        }
    }
   
}
```

### yii 查询
```php
public function beforeAction($action)
    {
        if (($id = Yii::app()->request->getParam('id', 0)) == 0) {
            $this->model = OrderExt::model();
        }
        if (is_null($this->model)) {
            $this->model = OrderExt::model()->findByPk($id);
        }
        return parent::beforeAction($action);
    }

    public function actionIndex()
    {
        if (!empty($params = Yii::app()->getRequest()->getParam(get_class($this->model)))) {
            $this->model->attributes = $params;
        }
        $this->model->orderstatus = OrderExt::ORDERSTATUS_JYCG;
        $query = $this->model->getDbCriteria();
        $query->select =  'sum(price) as price';
        $price = OrderExt::model()->find($query)->price;
        $this->render('index', [
            'model' => $this->model,
            'price' => $price,
        ]);
    }
/// 添加自定义不在数据库中熟悉1.0
   public function rules() {
        $parentRule = parent::rules();
        // $value[0] = preg_replace('/\b *(start|end)\b,? */','',$value[0]);
        foreach ($parentRule as &$value) {
            if (isset($value['on']) && $value['on'] == 'search') {
                $value[0] .= ',searchType,searchName';
            }
        }
        return array_merge($parentRule, [
            array('searchType,searchName', 'length', 'max' => 100),
        ]);
    }


// 关联查询1.0
        $criteria->mergeWith([
            "with" =>[ 'user'=> [
                        'alias'=>'u',
                        'select'=>'u.phone',
                    ]
                ]
        ]);

// 修改rule
   public function rules()
    {
        $parentRule = parent::rules();
        // $value[0] = preg_replace('/\b *(start|end)\b,? */','',$value[0]);
        foreach ($parentRule as &$value) {
            if (isset($value['integerOnly'])){
                $value[0] = preg_replace('/\b *(ex_price)\b,? */','',$value[0]);
            }
        }
        return array_merge($parentRule,[
            ['ex_price','match','pattern'=>'/^\d*\.?\d{1,2}$/','message'=>'输入不合法']
        ]);
    }
```


### 时间插件js
```php
<script> <?php Tools::startJs() ?>
    $('#time').datetimepicker({
      minView: "month",//设置只显示到月份
      format : "yyyy-mm-dd",//日期格式
      autoclose:true,//选中关闭
      // todayBtn: true,//今日按钮
      language: "zh-CN",
    });
<?php Tools::endJs() ?> </script>
```



