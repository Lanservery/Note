1、只有 `<body>` 区域 才会在浏览器中显示

2、通用声明

​    HTML5：`<!DOCTYPE html>`

3、HTML 基础

+ HTML 标题：`<h1>` 定义最大的标题。 `<h6>` 定义最小的标题。如，

  ```html
  <h1>这是一个标题</h1>
  <h2>这是一个标题</h2>
  <h3>这是一个标题</h3>
  ```

+ HTML 段落：过标签 <p> 来定义，如，

  ```html
  <p>这是一个段落。</p>
  <p>这是另外一个段落。</p>
  ```

+ HTML 链接：通过标签 \<a> 定义，如，

  ```html
  <a href="https://www.runoob.com">这是一个链接</a>
  ```

+ HTML 图像：通过标签 \<img> 定义，如，

  ```html
  <img loading="lazy" src="/images/logo.png" width="258" height="39" />
  ```

4、换行：`<br>`。没有结束标签，有时加`<br/>`结束。

5、HTML 标签对大小写不敏感：`<P>` 等同于 `<p>`

6、注释：\<!-- 这是一个注释 -->

7、HTML 代码中的所有连续的空行（换行）被显示为一个空格。

8、HTML head 元素

```html
<head>：定义了文档的信息
<title>：定义了文档的标题
<base>：定义了页面链接标签的默认链接地址
<link>：定义了一个文档和外部资源之间的关系
<meta>：定义了HTML文档中的元数据
<script>：定义了客户端的脚本文件
<stype>：定义了HTML文档的样式文件
```

9、alt="Big Boat" ：浏览器无法载入图像时，将显示文本而不是图像

10、`<div>` ：块级元素，可用于组合其他 HTML 元素的容器，常与 CSS 一起使用。如，

```html
<div style="color:#0000FF">
    <h3>这是一个在 div 元素中的标题。</h3>
    <p>这是一个在 div 元素中的文本。</p>
</div>
```

11、`<span>` ：内联元素，可用作文本的容器。如，

```html
<p>我的母亲有 
    <span style="color:blue;font-weight:bold">蓝色</span> 的眼睛，我的父亲有 
    <span style="color:darkolivegreen;font-weight:bold">碧绿色</span> 的眼睛。
</p>
```
12、文本格式化
    \<b>：定义粗体文本

13、颜色值：十六进制来表示红、绿、蓝（RGB）。写法为 # 号后跟三个（#000）或六个（#000000）十六进制字符

14、字符实体

+ 空格：\&nbsp;
+ 小于号：&lt;
+ \"：\&quot;

15、URL 编码使用 + 替换空格，使用 "%" 后跟两位十六进制数替换非 ASCII 字符

16、按钮：`<button type="button">点击这里</button>`      