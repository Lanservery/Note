+ 脚本可放置在 HTML 页面的 `<body>` 和 `<head>` 中。

+ &&（与）、||（或）、!（非）。

+ **字符串**可以使用单引号或双引号括起来。

+ **可以在字符串使用引号**，但引号不要与字符串的引号相同。

+ 可用转义字符“\”消除符号作用。

+ **数字与字符串相加**，结果将成为字符串！

+ `===` 为绝对相等，即数据类型与值都必须相等。

+ 老旧的实例会在 `<script>` 标签使用 `type="text/javascript"`。现在不必这样做。

+ JavaScript 对大小写是敏感的。变量 a 与 A 不同。

+ 对代码行进行折行：

  ```javascript
  document.write("你好 \ 
  世界!");
  ```

+ 换行：`document.write(x + "<br>";`

+ **一条语句，多个变量**：

  ```javascript
  ar lastname="Doe", age=30, job="carpenter";
  //声明也可横跨多行
  var lastname="Doe",
  age=30,
  job="carpenter";
  ```

+ **声明变量类型**

  声明新变量时，可使用关键词 "new" 来声明其类型。

  ```javascript
  var carname=new String;
  var x=   new Number;
  var y=   new Boolean;
  var cars=  new Array;
  var person= new Object;
  ```

+ 如果 a 大于 b，则代码将退出函数，不会计算 a 和 b 的和。

  ```javascript
  function myFunction(a,b) 
  {    
  	if (a>b)    
  	{        
  		return;    
  	}    
  	x=a+b； 
  }
  ```

+ **变量的生存期**

  - 局部变量会在函数运行以后被删除。
  
  - 全局变量会在页面关闭后被删除。

+ 把值赋给尚未声明的变量，该变量将被自动作为 window 的一个属性。

  非严格模式下给未声明变量赋值的全局变量，是全局对象的可配置属性，可以删除。

  ```javascript
  carname="Volvo";
  ```

+ 如果变量在函数内没有声明（没有使用 var 关键字），该变量为全局变量。

  ```javascript
  // 此处可调用 carName 变量  
  function myFunction() 
  {    
      carName = "Volvo";    
      // 此处可调用 carName 变量 
  }
  ```

+ **全局变量是 window 的属性**: 所有数据变量都属于 window 对象（ **var** 关键字声明）。

+ **for/in 语句**循环遍历**对象**的属性

  ```javascript
  var person={fname:"Bill",lname:"Gates",age:56};   
  for (x in person)  // x 为属性名 
  {    txt=txt + person[x]; }
  ```

+ **while** - 当条件为 **true** 时执行代码块。

+ **use strict** 指令只允许出现在脚本或函数的开头。

+ **方法**：多指对象里面的函数方法。

+ **let 声明**的变量只在 let 命令所在的代码块 **{}** 内有效，在 **{}** 之外不能访问。**不用初始化**。

+ **const 声明**一个或多个常量，声明时必须**进行初始化**，初始化后值不可再修改。对象或者数组，是可变的。