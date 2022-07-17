# 常识

class 可以选择多个样式共同作用，如：

```html
.red {
  color: #f33;
}
.yellow-bg {
  background: #ffa;
}

<p class="red yellow-bg">This paragraph has red text and a yellow background.</p>
```
padding：内边距。

# id 选择器

以下样式规则应用于元素属性 id="para1"：

```css
#para1
{
  text-align:center;
  color:red;
}
```

# class 选择器

拥有 center 类的 HTML 元素均为居中：

```css
.center {text-align:center;}
```

所有使用 class="center" 的 p 元素会文本居中，其他元素使用不受影响:

```css
p.center {text-align:center;}
```

# element

## element>element

```css
<style>
  div>span{color:red;}
</style>

<div>
  <p>
     <span> Hello World! </span>  /*不显示红色*/
  </p>
  <span> Study Css </span>  /*显示红色*/
</div>
```
## element element

```html
<style>
  nav ul li {color:red}
</style>
<nav>
<ul>
  <li>显示红色</li>
  <span>不显示红色</span>
</ul>
</nav>
```

## element+element

选择器用于选取**第一个指定的元素**之后（不是内部）紧跟的元素。

```html
<style>
div+p
{
background-color:yellow;
}
</style>
</head>
<body>
<div>
<p>我是唐老鸭。</p>
<p>我住在 Duckburg。</p>
</div>
<p>显示黄色</p>
<p>我的样式不会改变。</p>
</body>
```
```html
<style>
p+p
{
background-color:yellow;
}
</style>
</head>
<body>
<div>
<p>我是唐老鸭。</p>
</div>
<p>我的样式不会改变</p>
<p>显示黄色</p>
<p>显示黄色</p>
<p>显示黄色</p>
</body>
```

## class element

```html
<style>
  .demo li {color:red}
</style>
<ul class="demo">
  <li>显示红色</li>
  <span>不显示红色</span>
</ul>
```

# 内部样式

```html
<p style="color:red;margin-left:20px">这是一个段落。</p>
```

# 特殊结构

相同样式合并：

```css
h1 {
  color: blue;
}

.special {
  color: blue;
}
等价于：
h1,
.special {
  color: blue;
}

```
# 定位

## absolute 定位

绝对定位的元素的位置相对于最近的**已定位**父元素，如果元素没有**已定位**的父元素，那么它的位置相对于`<html>`。
同时，`absolute`定位时：未指定left/top/right/bottom的`absolute`元素，其在所处层级中的定位点就是正常文档流中该元素的定位点。

下面 h2 的父元素是 `body`，没有定位，所以位置是相对于 `html`。

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>菜鸟教程(runoob.com)</title>
<style>
h2
{
	position:absolute;
	left:100px;
	top:150px;
}
</style>
</head>
<body>
  <h2>这是一个绝对定位了的标题</h2>
  <p>用绝对定位,一个元素可以放在页面上的任何位置。标题下面放置距离左边的页面100 px和距离页面的顶部150 px的元素。.</p>
</body>
</html>
```
## relative 定位

定位是相对于自身位置定位，即设置偏移量的时候，会相对于自身所在的位置偏移。

## static 默认的静态定位
即没有定位，遵循正常的文档流对象，静态定位的元素不受top、left、right、bottom影响。

# 盒模型

属性四个值逆时针分布，两个值上下左右分布。

`padding`：内边距
