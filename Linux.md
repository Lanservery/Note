## 常用命令

**poweroff**：关闭系统。**reboot**：重启系统。

**clear**：清理屏幕。

**exit**：退出当前用户。

**su - <user>**：切换到用户 user。加`-`使用新用户的环境变量。

**wget [参数] 下载地址**：下载网络文件，参数：-P：下载到指定目录。

**top**：动态地监视进程活动与系统负载等信息。

**pidof [参数] [服务名称]**：查询某个指定服务进程的PID值。如， 

```sh
pidof sshd
>2156
```

**kill [参数] [进程PID]**：终止某个指定PID的服务进程。

**killall [参数] [服务名称]**：终止某个指定名称的服务所对应的**全部**进程。

```sh
killall httpd
```

**uname -a**：查看系统内核与系统版本。

**free -h**：显示当前系统中内存的使用量。

**who**：查看当前登入主机的用户。

```bash
# 历史命令会被保存到用户家目录中的.bash_history文件中
cat ~/.bash_history
```

**sosreport**：收集系统配置及架构信息并输出诊断文档。

echo [字符串 | $变量]：在终端输出字符串或变量提取后的值。

**cd ~username**：切换到其他用户的家目录。

## 查看开机启动项

```shell
systemctl list-unit-files | grep enabled
```

## 查看服务状态

```shell
systemctl list-units --type=service | grep -E "nginx|php-fpm|mysql|memcached|syncthing"
```

## 查看服务进程

```shell
ps -ef | grep -E "nginx|php-fpm|mysql|memcached|syncthing"
```

## 查看监听端口

```shell
netstat -tunpl
```

## 查看磁盘使用情况

```shell
df -h
```

## 查看目录大小

```shell
du -sh xxx
```

## 卸载与清理

清理所有 apt 缓存：`sudo apt clean`

清理不完整的软件包：`sudo apt autoclean` 

清理未使用的依赖项：`sudo apt autoremove` 

卸载软件并清除配置项：`sudo apt purge [package_name]` 

查看所有已安装软件：`sudo apt list --installed`

彻底卸载软件

- 查看最近安装的软件包并卸载
  
  ```sh
  rpm -qa --last > ~/last.txt
  yum list installed > ~/installed.txt
  yum -y remove xxx
  yum clean all
  ```

- 查看是否有残留并删除
  
  ```sh
  find / -name xxx
  rm -rf xxx
  ```

## 查看是否有新增用户并删除

```sh
cat /etc/passwd
userdel -r xxx
```

## 工作目录切换

`pwd`：显示用户当前所处的工作目录。

**cd**

> cd -：命令返回到上一次所处的目录。
> cd..：命令进入上级目录。
> cd ~：命令切换到当前用户的家目录。

## 文件查看

**ls**：显示目录的文件信息。-a 查看全部文件（包括隐藏文件），-l 查看文件的属性、大小详细信息。-d参数查看目录的权限与属性

查看目录属性：

```sh
ls -ld /etc
```

**cat**：查看纯文本文件（内容较少的）。加 -n 显示行号。

**more**：查看长篇纯文本文件（内容较多的），使用空格键或回车键向下翻页。

**stat**：查看文件的具体存储信息和时间等信息。

**lsattr**：用于显示文件的隐藏权限(编辑)，格式为“lsattr [参数] 文件” 。

**wc**：命令用于统计指定文本的行数、字数、字节数，格式为“wc[参数] 文本” 。

**tr [原始字符] [目标字符]**：替换文本文件中的字符。

**cut [参数] 文本**：按“列”提取文本字符。

```sh
head -n 2 /etc/passwd
```

**diff**
**diff --brief**：判断文件是否相同。相同内容用 “！”标出。

```sh
diff --brief diff_A.txt diff_B.txt
>Files diff_A.txt and diff_B.txt differ
```

**-c** 参数描述文件内容具体的不同，如

```sh
diff -c diff_A.txt diff_B.txt
```

## 文件操作

**file 文件名**：查看文件类型。

**touch [选项] [文件]**：**创建空白文件**或修改文件的时间。

**mkdir [选项] 目录**：创建空白的目录。加-p可递归创建出嵌套叠层关系的文件目录。

```sh
mkdir -p a/b/c/d/e
```

rm [选项] 文件：

删除文件或目录。-f：强制删除。-r：删除目录。

**rmdir 文件夹名**：

移除文件夹。

**rename 目标文件名 重命名的名称 目标文件名(不奇怪)**：

重命名。

**cp [选项] 源文件 目标文件**：

复制文件或目录。-p：保留原始文件属性。-i：若目标文件存在则询问是否覆盖。

**mv [选项] 源文件 [目标路径|目标文件名]**：

剪切文件或将文件重命名。

同目录对一个文件进行剪切，也就是对其重命名。

```sh
[root@linuxprobe ~]# mv x.log linux.log
```

**dd [参数]**：按指定大小和个数的数据块来复制文件或转换文件。

> if：输入的文件名称。
> of：输出的文件名称。
> bs：设置每个“块”的大小。
> count：设置要复制“块”的个数。
> 从/dev/zero设备文件取出大小为560MB的数据块，然后保存为560_file的文件。如，
> `[root@linuxprobe ~]# dd if=/dev/zero of=560_file count=1 bs=560M`
> 
> 制作光盘镜像文件。如，
> 
> `[root@linuxprobe ~]# dd if=/dev/cdrom of=RHEL-server-7.0-x86_64-LinuxProbe.Com.iso`

## 压缩与解压

### tar [选项] [文件]

-c：创建压缩文件。

-x：解开压缩文件。

-t：查看压缩包内有哪些文件。

-z：用Gzip压缩或解压。

-j：用bzip2压缩或解压。

-v：显示压缩或解压的过程。

-f：目标文件名。

-p（小）：保留原始的权限与属性。

-P（大）：使用绝对路径来压缩。

-C：指定解压到的目录

### 用  tar -czvf  压缩，用  tar -xzvf  解压

把`/etc`目录通过`gzip`格式进行打包压缩，并把文件命名为`etc.tar.gz`，-f必须放到参数的最后一位：

```sh
[root@linuxprobe ~]# tar -czvf etc.tar.gz /etc
```

将压缩包文件指定解压到/root/etc目录中，

```sh
[root@linuxprobe ~]# tar xzvf etc.tar.gz -C /root/etc
```

## 常用按键

**空格键**：向下翻一页。

**PaGe down**：向下翻一页。PaGe up：向上翻一页。

**home**：直接前往首页。end：直接前往尾页。

**/**：从上至下搜索某个关键词，如“/linux”。?：从下至上搜索某个关键词，如“?linux”。

**n**：定位到下一个搜索到的关键词。shift+n：定位到上一个搜索到的关键词。

**Ctrl+C**：命令停止。

## 搜索

**grep [选项] [文件]**：在文本执行关键词搜索。

查找系统中不允许登录的所有用户信息

```sh
[root@linuxprobe ~]# grep /sbin/nologin /etc/passwd
```

**find [查找路径] 寻找条件 操作**：按照指定条件来查找**文件**。

-name：匹配名称。

-perm：匹配权限。

获取该目录中所有以host开头的文件列表，

```console
[root@linuxprobe ~]# find /etc -name "host" -print
```

搜索权限中包括SUID权限的所有文件

```console
[root@linuxprobe ~]# find / -perm -4000 -print
```

## 文件属性

```sh
[root@www /]# ls -l
total 64
dr-xr-xr-x   2 root root 4096 Dec 14  2012 bin
dr-xr-xr-x   4 root root 4096 Apr 19  2012 boot
//实例中，bin 文件的第一个属性用 d 表示。d 在 Linux 中代表该文件是一个目录文件。
```

 Linux 中第一个字符代表这个文件是目录、文件或链接文件等等。

- 当为 **d** 则是目录

- 当为 **-** 则是文件；

- 若是 **l** 则表示为链接文档(link file)；

- 若是 **b** 则表示为装置文件里面的可供储存的接口设备(可随机存取装置)；

- 若是 **c** 则表示为装置文件里面的串行端口设备，例如键盘、鼠标(一次性读取装置)。

- p 管道文件。

## 证书管理

方法1
运行命令`dpkg-reconfigure ca-certificates `会出现一个图形界面，把 不要的证书【不勾选】，并确认。
方法2
编辑 `/etc/ca-certificates.conf `文件，把 不要的证书对应的行删除或注释掉。然后用命令 `update-ca-certificates `使之生效。

## 提示

**/etc/passwd**文件保存着所有的用户信息。**/sbin/nologin**保存不允许登录的用户信息。

Linux系统的配置文件在`/etc`目录中。

ubuntu 安装 `vim-plug`要给予执行权限，即 `chmod +w plug.vim`

debian 可命令行输入 `gnome-tweak-tool` 设置显示桌面图标，最大化、最小化按钮

## 常见目录名称及相应内容

| 目录名称        | 应放置文件的内容                          |
|:-----------:|:---------------------------------:|
| /boot       | 开机所需文件—内核、开机菜单以及所需配置文件等           |
| /dev        | 以文件形式存放任何设备与接口                    |
| /etc        | 配置文件                              |
| /home       | 用户家目录                             |
| /bin        | 存放单用户模式下还可以操作的命令                  |
| /lib        | 开机时用到的函数库，以及/bin与/sbin下面的命令要调用的函数 |
| /sbin       | 开机过程中需要的命令                        |
| /media      | 用于挂载设备文件的目录                       |
| /opt        | 用于挂载设备文件的目录                       |
| /root       | 系统管理员的家目录                         |
| /srv        | 一些网络服务的数据文件目录                     |
| /tmp        | 任何人均可使用的“共享”临时目录                  |
| /proc       | 虚拟文件系统，例如系统内核、进程、外部设备及网络状态等       |
| /usr/local  | 用户自行安装的软件                         |
| /usr/sbin   | Linux系统开机时不会使用到的软件/命令/脚本          |
| /usr/share  | 帮助与说明文件，也可放置共享文件                  |
| /var        | 主要存放经常变化的文件，如日志                   |
| /lost+found | 当文件系统发生错误时，将一些丢失的文件片段存放在这里        |

`/opt`目录用来安装附加软件包，是用户级的程序目录，可以理解为`D:/Software`。 
安装到`/opt`目录下的程序，它所有的数据、库文件等等都是放在同个目录下面。 
opt有可选的意思，这里可以用于放置第三方大型软件（或游戏），当你不需要时，直接`rm -rf`掉即可。
