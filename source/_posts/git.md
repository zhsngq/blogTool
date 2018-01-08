---
title: git 使用篇
date: 2017-04-26
categories:
    - 工具
    - git
tag:
    - 工具
---
git 冲突 使用 stash | pop
<!--more-->

> git stash

```bash
    # 添加到缓冲区
    git add .
    git stash
    git pull
    git stash pop
```

> 生成密钥

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# 查看是否已经有了ssh密钥：
cd ~/.ssh
```

在git中如果想忽略掉某个文件，不让这个文件提交到版本库中，可以使用修改根目录中 .gitignore 文件的方法（如无，则需自己手工建立此文件）。这个文件每一行保存了一个匹配的规则例如：

```bash
# 此为注释 – 将被 Git 忽略
 
*.a       # 忽略所有 .a 结尾的文件
!lib.a    # 但 lib.a 除外
/TODO     # 仅仅忽略项目根目录下的 TODO 文件，不包括 subdir/TODO
build/    # 忽略 build/ 目录下的所有文件
doc/*.txt # 会忽略 doc/notes.txt 但不包括 doc/server/arch.txt
```

规则很简单，不做过多解释，但是有时候在项目开发过程中，突然心血来潮想把某些目录或文件加入忽略规则，按照上述方法定义后发现并未生效，原因是.gitignore只能忽略那些原来没有被track的文件，如果某些文件已经被纳入了版本管理中，则修改.gitignore是无效的。那么解决方法就是先把本地缓存删除（改变成未track状态），然后再提交：

```bash
git rm -r --cached .
git add .
git commit -m 'update .gitignore'
```

方案1：
git clean  -d  -fx ""
其中 
x  -----删除忽略文件已经对git来说不识别的文件
d  -----删除未被添加到git的路径中的文件
f  -----强制运行
