## 常识

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

## id 选择器

以下样式规则应用于元素属性 id="para1"：

```css
#para1 
{ 
  text-align:center; 
  color:red; 
}
```

## class 选择器

拥有 center 类的 HTML 元素均为居中：

```css
.center {text-align:center;}
```

所有使用 class="center" 的 p 元素会文本居中，其他元素使用不受影响:

```css
p.center {text-align:center;}
```

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

## 内部样式

```html
<p style="color:red;margin-left:20px">这是一个段落。</p>
```

## 特殊结构

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

## 盒模型

属性四个值逆时针分布，两个值上下左右分布
