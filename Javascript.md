## 基本

- &&（与）、||（或）、!（非）。

- `===` 为绝对相等，即数据类型与值都必须相等。

- 老旧的实例会在 `<script>` 标签使用 `type="text/javascript"`。现在不必这样做。

- JavaScript 对大小写是敏感的。变量 a 与 A 不同。

## 字符串

+ 使用**单引号**或**双引号**括起来字符
- **可以在字符串使用引号**，但引号不要与字符串的引号相同。

- 可用转义字符“\”消除符号作用。

- **数字与字符串相加**，结果将成为字符串！

## 对代码行进行折行

```html
document.write("你好 \ 
世界!");
```

## 换行

```html
document.write(x + "<br>");
```

## let 和 const

let 声明的变量只在 let 命令所在的代码块内有效。

const 声明一个只读的常量，必须进行初始化，一旦声明，常量的值就不能改变。

## GET 和 POST

Get 是用来从服务器上获得数据，而 Post 是用来向服务器上传递数据。

**GET** - 从指定的资源**请求**数据。

请求的字符串（名称/值对）在 GET 请求的 URL 中发送

```
/test/demo_form.php?name1=value1&name2=value2
```

**POST** - 向指定的资源**提交**要被处理的数据。

请求的字符串（名称/值对）在 POST 请求的 HTTP 消息主体中发送

```
POST /test/demo_form.php HTTP/1.1
Host: runoob.com
name1=value1&name2=value2
```

## 全局变量

如果变量在函数内没有声明（没有使用 var 关键字），该变量为全局变量。

```javascript
// 此处可调用 carName 变量  
function myFunction() 
{    
    carName = "Volvo";    
    // 此处可调用 carName 变量 
}
```

## typeof

检测变量的数据类型，如：

```javascript
typeof "John"  // 返回 string 
```

## let 声明

let 声明的变量只在 其所在的代码块 `{}` 内有效，在 `{}` 之外不能访问。不用初始化

## const 声明

const 声明一个常量，声明时必须进行初始化，初始化后值不可再修改。对象或者数组，是可变的。

## 数组

常规方式:

```javascript
var myCars=new Array();
myCars[0]="Saab";      
myCars[1]="Volvo";
myCars[2]="BMW";
```

简洁方式:

```javascript
var myCars=new Array("Saab","Volvo","BMW");
```

字面:

```javascript
var cars = ["Saab", "Volvo", "BMW"]; 
```

## 类

JavaScript 是面向对象的语言，但 JavaScript 不使用类。

## 对象

> 对象不是指类的对象。JavaScript 是面向对象的语言，但 JavaScript 不使用类。

创建：

```javascript
var person = {
    firstName:"John",
    lastName:"Doe",
    age:50,
    eyeColor:"blue",
    //对象方法
    fullName : function() 
    {
       return this.firstName + " " + this.lastName;
    }
}; 
```

访问：

```javascript
person.lastName;
person.fullName(); 
```

有点特殊：

JavaScript 中的所有事物都是对象：字符串、数值、数组、函数...只要某个值被归属与某类，那它就可以使用类的相关方法，如：

```javascript
# 转换为大写
var message="Hello world!";
var x=message.toUpperCase();
```

使用函数来构造对象：

```javascript
function person(firstname,lastname,age,eyecolor){
    this.firstname=firstname;
    this.lastname=lastname;
    this.age=age;
    this.eyecolor=eyecolor;
    function changeName(name){
        this.lastname=name;
    }
}
myFather=new person("John","Doe",50,"blue");
myMother.changeName("Doe");

document.write(myFather.firstname + " is " + myFather.age + " years old.");
```

## 箭头函数

实例

```javascript
// ES6
const x = (x, y) => x * y;
等价于
// ES5
var x = function(x, y) {
     return x * y;
}
```

应用

```html
<script>
const x = (x, y) => x * y;
document.getElementById("demo").innerHTML = x(5, 5);
</script>
```

## 函数表达式(里面有匿名函数的解释)

函数表达式可以存储在变量中：

```javascript
var x = function (a, b) {return a * b}; 
# x 的值为 `function (a, b) {return a * b}`
```

函数表达式存储在变量后，变量可作为函数使用：

```javascript
var x = function (a, b) {return a * b};
var z = x(4, 3);
# 以上函数实际上是一个 匿名函数 (函数没有名称)。
```

## 自调用函数

```javascript
(function () {
    var x = "Hello!!";      // 我将调用自己
})(); 
```

## 异步 AJAX

```javascript
var xhr = new XMLHttpRequest();
// 当 onload 事件发生——页面加载时，函数被调用
xhr.onload = function () { 
    // 输出接收到的文字数据
    document.getElementById("demo").innerHTML=xhr.responseText;
}
```

## 特殊表达结构

```javascript
http.createServer(app.callback()).listen(3000);
# 相当于：
const  server = http.createServer(app.callback())
server.listen(3000)
```

```javascript
app.use(someMiddleware)
app.use(someOtherMiddleware)
app.listen(3000)
# 相当于
app.use(someMiddleware)
  .use(someOtherMiddleware)
  .listen(3000)
```

# console.log()

注意的写法：

```javascript
# 使用 $() 传递参数时使用 `` 括起来
例一：
console.log(`Process ${ctx.request.method} ${ctx.request.url}...`);
例二：
ctx.response.body = `<h1>Hello, ${name}!</h1>`;
```

# ||

获取`ctx.request.body.name`值，如果该值不存在，默认值设置为`''`。

```javascript
var name = ctx.request.body.name || ''
```

# prototype

prototype 属性允许您向对象添加属性和方法，语法如下：

```javascript
object.prototype.name=value
```