# 常识

HTML 标签对大小写不敏感：`<P>` 等同于 `<p>`

连续的空行（换行）会被显示为一个空格。

URL 编码使用 + 替换空格，使用 "%" 后跟两位十六进制数替换非 ASCII 字符

# 基础

标题：`<h1>` 定义最大标题。 `<h6>` 定义最小标题。如，

```html
<h1>这是一个标题</h1>
<h2>这是一个标题</h2>
<h3>这是一个标题</h3>
```

段落：过标签 `<p>` 来定义，如，

```html
<p>这是一个段落。</p>
<p>这是另外一个段落。</p>
```

链接：通过标签 `<a> `定义，如，

```html
<a href="https://www.runoob.com">这是一个链接</a>
```

图像：通过标签 `<img> `定义，如，

```html
<img loading="lazy" src="/images/logo.png" width="258" height="39" />
```

# 换行

`<br>`，没有结束标签，有时加`<br/>`结束。

# head 内元素

```html
<head>：定义文档的信息
<title>：定义文档的标题
<base>：定义页面链接标签的默认链接地址
<link>：定义一个文档和外部资源之间的关系
<meta>：定义HTML文档中的元数据
<script>：定义客户端的脚本文件
<stype>：定义HTML文档的样式文件
```

# 块级元素

`<div>` ，用于组合其他 HTML 元素的容器，常与 CSS 一起使用。如，

```html
<div style="color:#0000FF">
    <h3>这是一个在 div 元素中的标题。</h3>
    <p>这是一个在 div 元素中的文本。</p>
</div>
```

# 内联元素

`<span>` ，可用作文本的容器。如，

```html
<p>我的母亲有 
    <span style="color:blue;font-weight:bold">蓝色</span> 的眼睛，我的父亲有 
    <span style="color:darkolivegreen;font-weight:bold">碧绿色</span> 的眼睛。
</p>
```

# 颜色值

使用十六进制表示红、绿、蓝（RGB）。写法为 # 号后跟三个（#000）或六个（#000000）十六进制字符

# 特殊字符

+ 空格：`&nbsp;`
+ 小于号：`&lt;`
+ `"`：`&quot;`