---
title: 基本css布局
date: 2017-03-16
categories:
    - 前段
    - css
tag:
    - css
---
ul li 横向布局
<!--more-->

## ul li 横向布局

为了流式的布局会让代码看的简单，做的简单

```css
    li{list-style: none;display: inline-block;*display: inline;zoom: 1;}
    li *{
        display: inline-block
    }
    [name="imgbox"] ul li * {
        display: inline-block;
    }
```
