## 一、简介

在建立新的TLS连接时，客户端（如浏览器）发出的第一个握手包（称为Client Hello）中，包含了想要访问的域名信息（称为SNI，Server Name Indication）。
某些服务器会同时支持多个域名。在加密传输之前，它需要知道客户端访问的是哪个域名。于是SNI必须以明文的方式传输。并且由于浏览器并不知道服务器是否需要SNI，浏览器会对所有的TLS握手都加入SNI。
于是，根据黑名单，某些防火墙可以根据明文SNI信息，对TLS连接进行精确阻断。

## 二、判断

>1.在浏览器中新建标签页
>
>2.按下 F12 打开开发者工具，选择 **网络/network 面板**
>
>3.在地址栏中输入转到使用 HTTPS 的目标网址，等待页面加载完成，面板日志会记录失败的请求
>
>4.点击日志条目查看，如果 **消息头/Headers** 中没有 **响应头/Response Header** 这个域名可能就是被 SNI 封锁
>
>5.（如已排除 DNS 污染和 IP 封锁可跳过此步骤）Ping 上一步得到的域名，如果有回应，基本可以肯定就是 SNI 封锁，否则就是 DNS 污染或 IP 封锁
>
>6.可以先尝试不发送 SNI（配置方法见上方），服务器将发送默认证书，如果证书匹配则连接成功
>
>7.如果上一步失败，尝试限定使用 IPv6 连接（如果有且未被封锁）
>
>8.如果上一步失败，尝试修改原域名的次级域名作为 SNI，如： **.palemoon.org = img.palemoon.org** 
>
>9.或者修改成同一个服务器的其它未封锁域名，如： **www.instagram.com = graph.cdninstagram.com**
>
>10.也可以尝试任意其它你想要使用的 SNI 名称
>
>11.如果被封锁网站与其它网站共用 IP（如免费 CDN），则必须发送 SNI，且保留主域名不变

## 三、解决

>目前尚无通用的解决方案。有一个较为通用的，但部署起来略麻烦的方案称为域前置（Domain Fronting）。
>
>它的原理简单来说是这样的：部分服务器允许TLS连接说自己需要域名A，但之后的HTTP协议说自己需要域名B；或者服务器压根就不看SNI信息。
在这种情况下，对于一个处于黑名单，受到SNI阻断的域名，在建立TLS时，可以选用一个黑名单之外的域名，绕过防火墙的监测；或者干脆不发送SNI信息。
>
>当然，它的缺点是，依赖于服务器行为。也就是说，每个不同的站点，可能都需要不同的策略。
>
>举两个例子：
>
>1. Pixiv的服务器实际上是不看SNI的。在建立TLS连接的时候，即使不携带SNI，也可以正常进行访问。
>2. zh.wikipedia.org是一个黑名单域名，但同站点的www.wikipedia.org则不是。在建立TLS连接时，使用 SNI = www.wikipedia.org，之后的 HTTP 请求依然可以正常连到 zh.wikipedia.org。
