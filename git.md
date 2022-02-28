## 基础

+ git init：初始化仓库。

+ **一个文件放到Git仓库只需要两步：**
  - 第一步，用命令`git add`告诉 git，把文件添加到仓库：`$ git add readme.txt`或 `git add file2.txt  file3.txt`
  - 第二步，用命令`git commit`告诉Git，把文件提交到仓库：`$ git commit -m "wrote a readme file"`

+ git log：显示从最近到最远的提交日志。`git log --pretty=oneline` 简化信息。**键入q退出**

  常用搜索方式：

  - 通过作者搜索

    ```git
    git log --author yourname
    ```

  - 关键字搜索

    ```git
    git log --grep keywords
    ```

  - 文件名搜索

    ```git
    git log -p -- RELEASE-NOTE.md  #完整的文件名
    ```

+ git reset --hard HEAD~n(上n版本): 回退到指定版本，往上100个版本写100个`^`比较容易数不过来，所以写成`HEAD~100`。HEAD表示当前版本。

+ **git reset --hard HEAD^**：回退到上一个版本，上上一个版本就是`HEAD^^`。

+ git reset --hard 1094a(版本号，前几位)：回到未来的某个版本。

+ git reflog: 记录每一条使用过的命令。

+ git status：查看状态。

+ git checkout -- readme.txt：把readme.txt文件在工作区的修改全部撤销。

## 添加远程库

+ 远程仓库默认名称是 origin
+ git remote add origin git@github.com:yourusername/project.git：把一个已有的本地仓库与之关联。
+ git push -u origin master：把master分支(主分支)的所有内容推送到远程库上。
+ git remote -v：查看远程库信息。
+ git remote rm origin：删除远程库(其实是解除了本地和远程的绑定关系)。git remote rm <远程库名>。
+ **删除git版本控制**：删除.git文件。
+ **注意**：添加推送到远程仓库时，必须先执行 `git init`、`git add .` 、`git commit` 步骤

创建与合并分支
-----------------
+ git checkout -b dev或git switch -c dev：创建dev分支并切换到dev分支。
+ git branch：查看当前分支。
+ git checkout master或git switch master：**切换回master分支。
+ git merge dev：把dev分支的工作成果合并到master分支上(前提是当前分支为master)，git merge 命令用于合并指定分支到当前分支。
+ git branch -d dev：删除dev分支。-D是强制删除。
+ git merge --no-ff -m "merge with no-ff" dev：合并dev分支，创建一个新的commit，把commit描述写进去。(强制禁用Fast forward模式)。

解决冲突
------------
git log --graph：命令可以看到分支合并图。

分支策略
-------------
master分支非常稳定，仅用来发布新版本，不能在上面干活：

```
干活都在dev分支上，也就是说，dev分支是不稳定的，到某个时候，比如1.0版本发布时，再把dev分
支合并到master上，在master分支发布1.0版本；

你和你的小伙伴们每个人都在dev分支上干活，每个人都有自己的分支，时不时地往dev分支上合并就可以了。
```



Bug分支
------------------
+ git stash：把当前工作现场“储藏”起来，等以后恢复现场后继续工作。
+ git stash list：查看工作现场存放。
+ git stash pop：恢复工作现场，删除stash内容。
+ git stash apply stash@{0}：恢复指定的stash。

SSH 密钥
-------------------------
+ ls -al ~/.ssh：查看存在现有 SSH 密钥。
+ ssh -T git@github.com：测试 SSH 连接。
+ clone Github项目：$git clone https://github.com/Lanservery/Lanservery.github.io

## 删除文件

一般情况下，在文件管理器中把文件删了，或者用`rm`命令删了

```git
$ rm test.txt
```

然后用命令`git rm`从版本库中删除该文件，并且`git commit`：

```git
$ git rm test.txt

$ git commit -m "remove test.txt"
```

## Git 基本配置

+ 配置代理

  ```git
  git config --global http.proxy 127.0.0.1:10809
  o
  git config --global http.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
  ```

+ 关闭代理

  ```git
  git config --global --unset http.proxy
  ```

+ 设置socks5代理

  ```git
  git config --global http.proxy socks5://127.0.0.1:10808
  or
  git config --global https.proxy socks5://127.0.0.1:1080
  ```

## 清除所有历史版本
+ 切换到latest_branch分支下
  ```git
   git checkout --orphan latest_branch
  ```
+ git add -A
  ```git
  git add -A
  ```
+ 提交更改
  ```git
  git commit -am "清除所有历史版本以减少仓库大小，请重新从远程拷贝此仓库"
  ```
+ 删除分支
  ```git
  git branch -D master
  ```
+ 将当前分支重命名
  ```git
  git branch -m master
  ```
+ 最后，强制更新存储库
  ```git
  git push -f origin master
  ```


## 常见问题

+ 远程与本地不同步，git push失败，因此需要先 pull 进行合并然后在进行 push，

  因此先使用：

  ```git
  git pull --rebase origin master
  ```

  将远程文件同步下来，然后再执行推送：

  ```git
  git push -u origin master
  ```

+ github 已经在所有新库都将用中性词「main」命名，取代原来的「master」，如果我们通过git push -u origin master 方法上传仓库，在github仓库中就会出现一个master的分支

+ 更新指定文件

  ```git
  git fetch
  git checkout origin/master -- path/to/file
  ```

+ 解决 git bash 无法显示中文：`git config --global core.quotepath false`