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

## for/in

```javascript
var person={fname:"Bill",lname:"Gates",age:56};   
for (x in person)  // x 为属性名 
{    txt=txt + person[x]; }
```

## while

当条件为 `true` 时执行代码块。

## typeof

检测变量的数据类型，如：

```javascript
typeof "John"  // 返回 string 
```

## 方法

多指对象里面的函数方法。

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
    // 这里面也可以添加方法
}
myFather=new person("John","Doe",50,"blue");
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

## 函数表达式

函数表达式可以存储在变量中：

```javascript
var x = function (a, b) {return a * b}; 
# x 的值为 `function (a, b) {return a * b}`
```

函数表达式存储在变量后，变量可作为函数使用：

```javascript
var x = function (a, b) {return a * b};
var z = x(4, 3);
```

## 自调用函数

```javascript
(function () {
    var x = "Hello!!";      // 我将调用自己
})(); 
```