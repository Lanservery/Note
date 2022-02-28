## Create System Service

```cmd
sc create KMSSrv binpath=%windir%\System32\vlmcsd.exe type=own start=auto displayname="KMS Emulator"
```

## Run Vlmcsd

```cmd
net start KMSSrv
```

## Open Port:1688

```cmd
netsh advfirewall firewall add rule name="KMS Emulator Server" dir=in action=allow protocol=TCP localport=1688
```

## 拷贝客户端程序到SysWow64

```cmd
copy vlmcs-Windows-x64.exe %windir%\SysWOW64\vlmcs.exe
```

## 执行测试命令

```cmd
vlmcs.exe -v -l 3 localhost

cscript ospp.vbs /sethst:127.0.0.1:1688
cscript ospp.vbs /act
```

---

## 查看已设置的激活码

```cmd
cscript ospp.vbs /dstatus
```

## 卸载原本的激活码【xxxxx为密钥后五位】

```cmd
cscript ospp.vbs /unpkey:xxxxx
```

## 设置激活码[到下面找]

```cmd
cscript ospp.vbs /inpkey:xxxxx-xxxxx-xxxxx-xxxxx
```

## 设置激活服务器：

```cmd
cscript ospp.vbs /sethst:kms.ghpym.com  //cscript ospp.vbs /sethst:127.0.0.1(本地kms配置)
```

## 开始激活：

```cmd
cscript ospp.vbs /act
```

## 密钥

```
VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB
```
