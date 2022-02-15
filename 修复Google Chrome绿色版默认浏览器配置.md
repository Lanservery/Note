## 修复Google Chrome绿色版默认浏览器配置

+ 将绿色版谷歌浏览器复制到Windows10指定路径(按自己的需求先择路径)

  ```
  #例子使用路径如下:
  C:\Program Files\Google Chrome\chrome.exe
  ```

+ 修复注册表

  ```reg
  Windows Registry Editor Version 5.00
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\RegisteredApplications]
  "Google Chrome"="Software\\Clients\\StartMenuInternet\\Google Chrome\\Capabilities"
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome]
  @="Google Chrome"
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\Capabilities]
  "ApplicationDescription"="Google Chrome 浏览器是一款可高速运行网页和应用的网络浏览器。它快捷、稳定且易于使用。Google Chrome 浏览器内置的恶意软件和网上诱骗防护功能可让您更安全地浏览网页。"
  "ApplicationIcon"="C:\\Program Files\\Google Chrome\\chrome.exe,0"
  "ApplicationName"="Google Chrome"
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations]
  ".htm"="ChromeHTML"
  ".html"="ChromeHTML"
  ".pdf"="ChromeHTML"
  ".shtml"="ChromeHTML"
  ".svg"="ChromeHTML"
  ".xht"="ChromeHTML"
  ".xhtml"="ChromeHTML"
  ".webp"="ChromeHTML"
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\Capabilities\Startmenu]
  "StartMenuInternet"="Google Chrome"
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\Capabilities\URLAssociations]
  "ftp"="ChromeHTML"
  "http"="ChromeHTML"
  "https"="ChromeHTML"
  "irc"="ChromeHTML"
  "mailto"="ChromeHTML"
  "mms"="ChromeHTML"
  "news"="ChromeHTML"
  "nntp"="ChromeHTML"
  "sms"="ChromeHTML"
  "smsto"="ChromeHTML"
  "snews"="ChromeHTML"
  "tel"="ChromeHTML"
  "urn"="ChromeHTML"
  "webcal"="ChromeHTML"
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\DefaultIcon]
  @="C:\\Program Files\\Google Chrome\\chrome.exe,0"
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\InstallInfo]
  "ReinstallCommand"="\"C:\\Program Files\\Google Chrome\\chrome.exe\" --make-default-browser"
  "HideIconsCommand"="\"C:\\Program Files\\Google Chrome\\chrome.exe\" --hide-icons"
  "ShowIconsCommand"="\"C:\\Program Files\\Google Chrome\\chrome.exe\" --show-icons"
  "IconsVisible"=dword:00000001
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\shell]
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\shell\open]
  
  [HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\shell\open\command]
  @="\"C:\\Program Files\\Google Chrome\\chrome.exe\""
  ```

+ 修复注册表后即可通过Google Chrome将其设置为默认浏览器