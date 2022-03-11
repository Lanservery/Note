# 基本

- `sudo scoop uninstall -p <app>` - 卸载软件（并删除配置文件）

- `scoop update <app>` - 更新指定软件

- **`scoop update` - 更新自身及bucket库**

- `scoop install python@3.7.9`：安装指定版本

- `scoop install extras/sumatrapdf`：安装指定Bucket应用

- `scoop checkup`：检测本人当前环境存在的问题

- `scoop hold <app>`：禁止某程序更新

- `scoop unhold <app>`：允许某程序更新

- `scoop info ruby`：检查安装信息

- `scoop install python38 -a 32`：安装32位

- `scoop info <app>`：显示某个app的信息

# 清理安装包缓存

+ `scoop cache show` - 显示安装包缓存
+ `scoop cache rm <app>` - 删除指定应用的安装包缓存
+ `scoop cache rm ` - 删除所有的安装包缓存

# 在同一程序的不同版本之间切换

  使用命令：

```powershell
scoop reset [app]@[version]
```

  示例：

```powershell
scoop reset idea-ultimate-eap@201.6668.13

scoop reset idea-ultimate-eap@201.6073.9

# 切换到最新版本
scoop reset idea-ultimate-eap
```

# aria2 配置

```powershell
# 关闭aria2（默认开启）
scoop config aria2-enabled false
# 配置aria2 ：重试秒数 单任务最大线程数(最大为16) 同一服务器最大连接数 最小文件分片大小
scoop config aria2-retry-wait 4
scoop config aria2-split 16
scoop config aria2-max-connection-per-server 16
scoop config aria2-min-split-size 4M
```

# 代理

```powershell
scoop config proxy [username:password@]host:port
```

  By default, Scoop will use the proxy settings from Internet Options, but with anonymous authentication.

+ To use the credentials for the current logged-in user, use `currentuser` in place of `username:password`

+ To use the system proxy settings configured in Internet Options, use `default` in place of `host:port`

+ An empty or unset value for proxy is equivalent to `default` (with no username or password)

+ To bypass the system proxy and connect directly, use `none` (with no username or password)
  
  remove proxy:
  
  ```powershell
  scoop config rm proxy
  ```
  
  proxy for "bucket add" command:
  
  > Note: You have to change the proxy string to the format git understand so `currentuser@proxy.example.org:8080` becomes :@proxy.example.org:8080
  
  ```powershell
  scoop config proxy ':@proxy.example.org:8080'
  scoop bucket add extras
  ```
  
  but then you will have to change the proxy string back to normal to install actual packages:
  
  ```powershell
  scoop config proxy 'currentuser@proxy.example.org:8080'
  scoop install vscode
  ```
