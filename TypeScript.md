# 类型

数字类型：

```typescript
let a: number = 0xf00d;    // 十六进制 
```

字符串类型：

使用单引号`'`或双引号`"`来表示字符串类型。反引号(`)来定义多行文本和内嵌表达式。

```typescript
let name: string = "Runoob";
```

# 泛型

标记符：

E - Element (在集合中使用，集合中存放的是元素)
T - Type（Java 类）
K - Key（键）
V - Value（值）
N - Number（数值类型）
？ - 表示不确定的 java 类型  

泛型方法：

返回值的类型与传入参数的类型相同

```typescript
function identity<T>(arg: T): T {
    return arg;
}
```

类型变量T 捕获传入的类型（比如：number）， 之后使用 T当做返回值类型。

引用：

一、传入参数时，指定类型：

```typescript
let output = identity<string>("myString");  // type of output will be 'string'
```

二、省略类型，让编译器自动识别：

```typescript
let output = identity("myString");  // type of output will be 'string'
```

泛型类：

泛型类看上去与泛型方法差不多。 泛型类使用（ <>）括起泛型类型，跟在类名后面。

```typescript

class GenericNumber<T> {
    zeroValue: T;
    add: (x: T, y: T) => T;
}

let myGenericNumber = new GenericNumber<number>();
myGenericNumber.zeroValue = 0;
myGenericNumber.add = function(x, y) { return x + y; };
```

可以继承其他类型：

```typescript
interface Lengthwise {
    length: number;
}

function loggingIdentity<T extends Lengthwise>(arg: T): T {
    console.log(arg.length);  // Now we know it has a .length property, so no more error
    return arg;
}
```

# 函数

```typescript
function func_name( param1 [:datatype], param2 [:datatype]) {   
}
# param1、param2 为参数名。
# datatype 为参数类型。
```

# 函数是表达式

```typescript
let myIdentity: <T>(arg: T) => T = identity;  
```

# 函数返回值

```typescript
function function_name():return_type { 
    // 语句
    return value; 
}
```

# 构造函数

`constructor()`或者与函数同名，如：

```javascript
class Car { 
    // 字段 
    engine:string; 

    // 构造函数 
    constructor(engine:string) { 
        this.engine = engine 
    }  
    // 构造函数 
    //function Car(engine) {
    //    this.engine = engine;
    //}
    // 方法 
    disp():void { 
        console.log("发动机为 :   "+this.engine) 
    } 
}
```

# Lambda 函数

格式：

```typescript
( [param1, parma2,…param n] )=>statement——表达式;
```

# 特殊

```typescript
var customer = {
    firstName: "Tom",  // 属性
    lastName: "Hanks",
    sayHi: function () { return "Hi there"; }  // 方法
};
console.log("Customer 对象 ");
console.log(customer.firstName);
console.log(customer.lastName);
console.log(customer.sayHi());
```

# declare

TypeScript 要引用其他第三方的 JavaScript 的库，虽然直接引用可以调用库的类和方法，但是却无法使用TypeScript 
诸如**类型**检查等特性功能。为了解决这个问题，需要将这些库里的函数和方法体去掉后只保留导出类型声明，而产生了一个描述 JavaScript 
库和模块信息的声明文件。通过引用这个声明文件，就可以借用 TypeScript 的各种特性来使用库文件了。

声明文件，以 .d.ts 为后缀，语法格式如下：

```ts
declare module Module_Name {
}
```
