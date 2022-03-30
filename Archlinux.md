## 切换tty2

+ 进入：`Ctrl + Alt + F2`

+ 退出：`Ctrl + Alt + F1`或`Alt + F1`

## 卸载

卸载依赖以及配置

```bash
sudo pacman -R -nc torbrowser-launcher
或
sudo pacman -Rnc torbrowser-launcher 
```

## konsole

+ show munubar: Ctrl + Shit + M

## archlinux 基础安装笔记

+ [重要链接]([archlinux 基础安装 | archlinux 简明指南 — Arch Linux 安装使用教程](https://arch.icekylin.online/rookie/basic-install.html#_7-1-%E5%88%86%E5%8C%BA))

+ [全新安装](https://arch.icekylin.online/rookie/basic-install-detail.html#%F0%9F%86%95-%E5%85%A8%E6%96%B0%E5%AE%89%E8%A3%85)这一步在[7. 分区和格式化(使用 Btrfs 文件系统)](https://arch.icekylin.online/rookie/basic-install.html#_7-%E5%88%86%E5%8C%BA%E5%92%8C%E6%A0%BC%E5%BC%8F%E5%8C%96-%E4%BD%BF%E7%94%A8-btrfs-%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F) 步骤之前 ！

+ sda2、sda3分区在双系统配置中为C盘和D盘(不用理会)，([archlinux 基础安装 | archlinux 简明指南 — Arch Linux 安装使用教程](https://arch.icekylin.online/rookie/basic-install.html#_7-1-%E5%88%86%E5%8C%BA))

+ 要记得看图片！

+ 为了创建子卷，我们需要先将 `Btrfs` 分区挂载到 `/mnt` 下：
  
  ```shell
  mount -t btrfs -o compress=zstd /dev/sdxn /mnt 注：sdxn-->sda5
  ```

+ 通过如下命令使用 `pacstrap` 脚本安装其它必要的功能性软件：
  
  ```shell
  pacstrap /mnt dhcpcd iwd vim sudo zsh zsh-completions
  改为 pacstrap /mnt dhcpcd iwd vim sudo zsh-completions
  ```

+ 17.安装引导程序
  
  需要安装引导程序，os-prober不需要安装 —— 为了能够引导 win10

+ swap分区：5G

+ sdx: `x` 为字母 `a`、`b` 或 `c` 等等

+ sdxn: `n`为1、2、3等等

+ 不能多次执行 genfstab，应该编辑 fstab 修正错误。

+ 分区：格式化 -> 挂载 -> 配置fstab 文件

+ [linux进行硬盘分区挂载](https://cloud.tencent.com/developer/article/1183198?from=15425)

+ [磁盘空间清理](https://arch.icekylin.online/advanced/system-ctl.html#%E7%A3%81%E7%9B%98%E7%A9%BA%E9%97%B4%E6%B8%85%E7%90%86)

## 中文输入法

### fcitx安装（推荐）

+ 安装 **fcitx** 或 **fcitx5(建议)**：
  
  ```bsah
  [admin@arch ~]$ sudo pacman -S fcitx-im
  或 
  [admin@arch ~]$ sudo pacman -S fcitx5-im
  ```

+ 输入下面的指令安装 fcitx 的 GUI 配置工具(先不用安装)：
  
  ```bash
  [admin@arch ~]$ sudo pacman -S kcm-fcitx
  或
  [admin@arch ~]$ sudo pacman -S kcm-fcitx5 
  ```

+ 安装 rime 的输入法：
  
  ```bash
  [admin@arch ~]$ sudo pacman -S fcitx-rime
  或
  [admin@arch ~]$ sudo pacman -S fcitx5-rime 
  ```

+ vim 编辑 ~/.pam_environment，加上如下内容：
  
  最好参考官网，[Fcitx5 (简体中文) - ArchWiki](https://wiki.archlinux.org/title/Fcitx5_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#%E5%AE%89%E8%A3%85)
  
  ```bash
  GTK_IM_MODULE=fcitx
  QT_IM_MODULE=fcitx
  XMODIFIERS=@im=fcitx
  或
  INPUT_METHOD DEFAULT=fcitx5
  GTK_IM_MODULE=fcitx5
  QT_IM_MODULE=fcitx5
  XMODIFIERS=@im=fcitx5
  SDL_IM_MODULE DEFAULT=fcitx //为了让 SDL2 库的游戏，比如 Dota2 能正常使用
  ```

+ 重启系统
  
  ```bash
  [admin@arch ~]$ systemctl reboot
  ```

+ 添加 rime 输入法
  「 开始菜单 」 > 「 System Settings 」 > 「 Personalization 」 一栏下面的 「 Regional Settings 」 > 「 Input Method 」，取消勾选 「Only Show Current Language」 > 「 Rime 」 > 「 > 」 > 「 Apply 」 应用生效。
  
  <img title="" src="assets/4b3305e59bcc5179dc39e08787af2c56b1171137.png" alt="" data-align="center" width="635">

+ 移除默认的 Keyboard - English (US)

### ibus安装（不推荐-不好用）

+ 安装软件包：
  
  ```bash
  sudo pacman -S ibus ibus-rime
  yay -S ibus-qt
  ```

+ 添加 rime 输入法
  
  ```bash
  ibus-setup
  ```
  
  启动后选择 "Input Methods"（输入法），点击 "Add"（添加），输入 chinese ，选择 rime，移除其他输入法

+ 编辑/添加配置文件`~/.xprofile`
  
  ```
  export GTK_IM_MODULE=ibus
  export XMODIFIERS=@im=ibus
  export QT_IM_MODULE=ibus
  ibus-daemon -d -x
  ```

### 问题

#### 输入法字典下载后没有显示

需要在`default.custom.yaml`添加输入法

#### 横排和竖排的修改

在`ibus_rime.custom.yaml`修改(添加一下)  注：只针对 ibus-rime有效

### Rime 配置目录

fcitx-rime 的大部分的配置文件在 `~/.config/fcitx/rime` 下，如果是 ibus 版本，将对应的 fcitx 替换成 ibus 即是配置地址

### Rime 默认英文输出配置

```
patch:
  switches:
    - name: ascii_mode
      reset: 1 # 1为默认英文，0为默认中文 
      states: [中文, 西文]
```

## tor

```bash
sudo pacman install torbrowser-launcher
```

## 启动模式

调整启动方式已经为 `UEFI `

## ventoy

退出：F5:Tools ->Power->reboot

## yay

> 注：可以先试一下`sudo pacman -S yay`

### 下载

准备

```bash
# 注：分开执行！
sudo pacman -S base-devel
sudo pacman -S git
```

下载

```bash
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
```

更改用户

```bash
sudo chown -R yourname:users ./yay
```

编译安装

```bash
cd yay
makepkg -si
# 注：如果下载失败再试一下 
```

### 查看配置

```bash
yay -P -g
```

## 代理

> 注意：安装代理软件前不要使用国内的镜像源！！！

### Qv2ray

代理推荐 Qv2ray

如果无法下载，在`/etc/pacman.conf` 添加清华源，更新一下软件缓存  

```conf
## OpenTUNA (China CDN) (ipv4, https)
[archlinuxcn]
Server = https://opentuna.cn/archlinuxcn/$arch
```

### 终端代理

```bash
注：使用本机IP地址 
export https_proxy=http://127.0.0.1:xxxx
export http_proxy=http://127.0.0.1:xxxx
或
export all_proxy=http://127.0.0.1:xxxx
```

## Go

### 配置文件路径

`~/.config/go/env `

### 查看配置

```bash
go env
```

## 镜像源

### 添加

```bash
sudo vim /etc/pacman.d/mirrorlist   #在文件的最顶端添加

sudo vim /etc/pacman.conf   #在文件末尾添加，这是在后面才添加的
```

### 更新软件源缓存

```bash
sudo pacman -Syy
```

### 更新系统和软件包

```bash
pacman -Syu
```

## 问题

### error: failed to commit transaction (invalid or corrupted package (PGP signature))

安装 `archlinuxcn-keyring` 以包导入 GPG key。

```bash
sudo pacman -S archlinuxcn-keyring
```

### curl: (7) Failed to connect to git.io port 443 after 21028 ms: Connection refused

终端配置代理

### Discover(软件中心）无法使用

安装依赖

```bash
sudo pacman -S packagekit-qt5
```

### VM虚拟机共享目录无法显示

[见链接](https://askubuntu.com/questions/29284/how-do-i-mount-shared-folders-in-ubuntu-using-vmware-tools)

### 中文乱码

+ 将`en_US.UTF-8`和`zh_CN.UTF-8`的注释从配置文件`/etc/locale.gen`去掉
  
  ```
  # /etc/locale.gen
  en_US.UTF-8 UTF-8
  zh_CN.UTF-8 UTF-8
  ```

+ 然后执行
  
  ```bash
  sudo locale-gen
  ```

+ 安装字体
  
  ```bash
  sudo pacman -S noto-fonts-cjk
  ```

## 其他

`EDITOR=vim visudo`：使用vim作为visudo文本编辑器

固体/机械硬盘判断：[链接](https://www.linuxprobe.com/linux-ssd-hdd.html)

官方安装教程：[链接](https://wiki.archlinux.org/title/Installation_guide_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#Fstab)
