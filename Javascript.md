## 基本

- &&（与）、||（或）、!（非）。

- `===` ：绝对相等，即数据类型与值都相等。

- 老旧的实例会在 `<script>` 标签使用 `type="text/javascript"`。现在不必这样做。

- JavaScript 对大小写敏感。变量 a 与 A 不同。

- 变量生命周期：即变量的作用域。

- 一个空对象是一个truthy值。

## 注意：

+ 变量声明时如果不使用 var 关键字，那么它就是一个全局变量，即便它在函数内定义。

## ++i 和 i++
`++ i` 是先加后赋值；`i ++` 是先赋值后加；

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

Get 从服务器上获得数据，而 Post 向服务器传递数据。

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

注意：如果变量在函数内没有声明（没有使用 var 关键字），该变量为全局变量。

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

## 提升

可以在使用变量之后再对其进行声明：
>注：如果变量不初始化，变量值会是 默认值 undefined。
```js
x = 5; // 把 5 赋值给 x
elem = document.getElementById("demo"); // 查找元素
elem.innerHTML = x;                     // 在元素中显示 5
var x; // 声明 x
```
只提升声明，而非初始化：
```js
var x = 5; // 初始化 x
elem = document.getElementById("demo"); // 查找元素
elem.innerHTML = x + " " + y;           // 显示 x 和 undefined
var y = 7; // 初始化 y
```
> 注：由于 hoisting，y 在其被使用前已经被声明，但是由于未对初始化进行提升，y 的值仍是未定义。

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

## 函数
>函数内部的语句在执行时，一旦执行到return，就执行完毕，并将结果返回。
>如果没有return语句，执行完毕后也会返回结果，只是结果为undefined。

另一种定义函数的方式如下：

```
var abs = function (x) {
    if (x >= 0) {
        return x;
    } else {
        return -x;
    }
};
```
`function (x) { ... }`是一个匿名函数，它没有函数名。但是，它赋值给了变量 `abs`，所以，通过变量 `abs`  就可以调用该函数。注意：需要在函数体末尾加一个 `;`，表示赋值语句结束。

**以上的另一种解释：**

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

## 自调用函数

```javascript
(function () {
    var x = "Hello!!";      // 我将调用自己
})();
```
## 立即执行函数

```js
(function (x) {
    return x * x;
})(3); // 9
```

## 类

JavaScript 是面向对象的语言，但 JavaScript 不使用类。

## 对象

> 对象不是指类的对象。JavaScript 是面向对象的语言，但 JavaScript 不使用类。
>除了基本类型之外其他都是对象

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
//属性：
person.lastName;
or
person["lastName"];
//方法：
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

##  AJAX
通过在后台与服务器进行少量数据交换，AJAX 可以使网页实现异步更新。这意味着可以在不重新加载整个网页的情况下，对网页的某部分进行更新。

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
## 模板字面量标签函数

标签函数的第一个参数总是接收这个插值左右两边的字符,并存入数组,左边一个,右边一个,也就是说模板字面量的标签函数的第一个参数是这样的:

```js
function foo2(string){
  console.log(string); //['','']
}
foo2`${a}`
```
如果改成:

```js
`QQ:${a}`
```
就会是这样:

```js
function foo2(string){
  console.log(string); //['QQ:','']
}
foo2`QQ:${a}`
```

参考：[模板字面量标签函数](https://zhuanlan.zhihu.com/p/337211208)

## console.log()

注意的写法：

```javascript
# 使用 ${} 传递参数时使用 `` 括起来
例一：
console.log(`Process ${ctx.request.method} ${ctx.request.url}...`);
例二：
ctx.response.body = `<h1>Hello, ${name}!</h1>`;
```

## ||

获取`ctx.request.body.name`值，如果该值不存在，默认值设置为`''`。

```javascript
var name = ctx.request.body.name || ''
```

## prototype

prototype 属性允许您向对象添加属性和方法，语法如下：

```javascript
object.prototype.name=value
```
## break 语句
break 语句跳出循环后，会继续执行该循环之后的代码（指 for 循环）。

## this
this 关键字指向的是它当前对象。

## ES6

### 模块

>要使用**大括号**指定所要导入或导出的变量。

导入：
```
/*-----import [xxx.js]-----*/
import { myName, myAge, myfn, myClass } from "./test.js";
console.log(myfn());// My name is Tom! I'm 20 years old.
console.log(myAge);// 20
console.log(myName);// Tom
console.log(myClass.a );// yeah!
```

只读属性：只可以改写 import 对象的属性值，不可以更改它的基本类型。

导出：
```
/*-----export [test.js]-----*/
let myName = "Tom";
let myAge = 20;
let myfn = function(){
    return "My name is" + myName + "! I'm '" + myAge + "years old."
}
let myClass =  class myClass {
    static a = "yeah!";
}
export { myName, myAge, myfn, myClass }
```

`as` 重新定义变量名:
```
let myName = "Tom";
export { myName as exportName }
```

或者：
```
import { myName as name1 } from "./test1.js";
import { myName as name2 } from "./test2.js";
```