# 基础语法

+ Rust 是强类型语言

+ `let a: u64 = 123;`  声明了 a 为无符号 64 位整型变量，如果没有声明类型，a 将自动被判断为有符号 32 位整型变量

+ 重影（Shadowing）就是指变量的名称可以被重新使用的机制：

  ```rust
  fn main() {
      let x = 5;
      let x = x + 1;
      let x = x * 2;
      println!("The value of x is: {}", x);
  }
 
  >The value of x is: 12
  ```

# 元组

用一对 ( ) 包括的一组数据，可以包含不同种类的数据：

```rust
let tup: (i32, f64, u8) = (500, 6.4, 1);
// tup.0 等于 500
// tup.1 等于 6.4
// tup.2 等于 1
let (x, y, z) = tup;
// y 等于 6.4
```

# 数组

用一对 [ ] 包括的同类型数据

```rust
let a = [1, 2, 3, 4, 5];  // a 是一个长度为 5 的整型数组
let b = ["January", "February", "March"];  // b 是一个长度为 3 的字符串数组

let first = a[0];  // 数组访问
let second = a[1];

a[0] = 123; // 错误：数组 a 不可变
let mut a = [1, 2, 3];
a[0] = 4; // 正确
```

## 所有权

规则

- Rust 中的每个值都有一个变量，称为其所有者
- 一次只能有一个所有者
- 当所有者不在程序运行范围时，该值将被 **删除**

范围

```rust
{
    // 在声明以前，变量 s 无效
    let s = "runoob";
    // 这里是变量 s 的可用范围
}
// 变量范围已经结束，变量 s 无效
```

移动(Move)

```rust
let x = 5;
let y = x;
```

现在栈中将有两个值 5。此情况中的数据是"基本数据"类型的数据，不需要存储到堆中，仅在栈中的数据的"移动"方式是直接复制

克隆

```rust
//复制一份以供他用
fn main() {
    let s1 = String::from("hello");
    let s2 = s1.clone();
    println!("s1 = {}, s2 = {}", s1, s2);
}
结果：
>s1 = hello, s2 = hello
```

引用与租借

引用是一种指针，实质上"引用"是变量的间接访问方式

```rust
fn main() {
    let s1 = String::from("hello");

    let len = calculate_length(&s1);

    println!("The length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}
结果：
>The length of 'hello' is 5.
```

> 1、引用不会获得值的所有权
> 
> 2、引用只能租借（Borrow）值的所有权

 引用的修改

```rust
fn main() {
    let mut s1 = String::from("run");
    // s1 是可变的

    let s2 = &mut s1;
    // s2 是可变的引用

    s2.push_str("oob");
    println!("{}", s2);
}
//我们用 &mut 修饰可变的引用类型
```

> 可变引用不允许多重引用，但不可变引用可以

垂悬引用

例子

```rust
fn main() {
    let reference_to_nothing = dangle();
}

fn dangle() -> &String {
    let s = String::from("hello");

    &s
}
//伴随着 dangle 函数的结束，其局部变量的值本身没有被当作返回值，被释放了。但它的引用却被返回，这个引用所指向的值已经不能确定的存在，故不允许其出现
```

引用与租借

引用是一种指针，实质上"引用"是变量的间接访问方式

```rust
fn main() {
    let s1 = String::from("hello");

    let len = calculate_length(&s1);

    println!("The length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}
结果：
>The length of 'hello' is 5.
```

> 1、引用不会获得值的所有权
> 
> 2、引用只能租借（Borrow）值的所有权

 引用的修改

```rust
fn main() {
    let mut s1 = String::from("run");
    // s1 是可变的

    let s2 = &mut s1;
    // s2 是可变的引用

    s2.push_str("oob");
    println!("{}", s2);
}
//我们用 &mut 修饰可变的引用类型
```

+ 垂悬引用
  
  例子
  
  ```rust
  fn main() {
      let reference_to_nothing = dangle();
  }
  
  fn dangle() -> &String {
      let s = String::from("hello");
  
      &s
  }
  //伴随着 dangle 函数的结束，其局部变量的值本身没有被当作返回值，被释放了。但它的引用却被返回，这个引用所指向的值已经不能确定的存在，故不允许其出现
  ```

## 结构体

结构体（Struct）与元组（Tuple）都可以将若干个类型不一定相同的数据捆绑在一起形成整体

定义

```rust
(struct) Site {
    domain: String,
    name: String,
    nation: String,
    found: u32
}
```

元组结构体

与元组的区别是它有名字和固定的类型格式

格式：

```rust
struct Color(u8, u8, u8);
struct Point(f64, f64);

let black = Color(0, 0, 0);
let origin = Point(0.0, 0.0);
```

输出结构体

```rust
#[derive(Debug)]

struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    let rect1 = Rectangle { width: 30, height: 50 };

    println!("rect1 is {:?}", rect1);
}
结果：
>rect1 is Rectangle { width: 30, height: 50 }
```

结构体方法

结构体方法的第一个参数必须是 `&self`，不需声明类型，因为 `self` 不是一种风格而是关键字。

```rust
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }
}

fn main() {
    let rect1 = Rectangle { width: 30, height: 50 };
    println!("rect1's area is {}", rect1.area());
}
结果：
>rect1's area is 1500
```

结构体关联函数

`String::from` 函数就是一个关联函数。

```rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn create(width: u32, height: u32) -> Rectangle {
        Rectangle { width, height }
    }
}

fn main() {
    let rect = Rectangle::create(30, 50);
    println!("{:?}", rect);
}
结果：
>Rectangle { width: 30, height: 50 }
```

单元结构体

结构体可以只作为一种象征而无需任何成员：

```rust
struct UnitStruct;
```

# 枚举类

枚举的目的是对某一类事物的分类，分类的目的是为了对不同的情况进行描述

match 语法：实现分支结构功能

对非枚举类进行分支选择时必须注意处理例外情况，即使在例外情况下没有任何要做的事 . 例外情况用下划线 _ 表示

```rust
fn main() {
    let t = "abc";
    match t {
        "abc" => println!("Yes"),
        _ => {},
    }
}
```

Option 枚举类

用于填补 Rust 不支持 null 引用的空白。

```rust
enum Option<T> {
    Some(T),
    None,
}
```

定义一个可以为空值的类：

```rust
let opt = Option::Some("Hello");
```

Option 是一种特殊的枚举类，它可以含值分支选择：

```rust
fn main() {
        let t = Some(64);
        match t {
                Some(64) => println!("Yes"),
                _ => println!("No"),
        }
}
```

# 组织管理

箱（Crate）："箱"是二进制程序文件或者库文件，存在于"包"中。

包（Package）：工程的实质是一个包，包必须由一个 Cargo.toml 文件来管理，该文件描述了包的基本信息以及依赖项。一个包最多包含一个库"箱"，可以包含任意数量的二进制"箱"，但是至少包含一个"箱"

模块（Module）：Rust 中的组织单位

```rust
mod nation {
    mod government {
        fn govern() {}
    }
    mod congress {
        fn legislate() {}
    }
    mod court {
        fn judicial() {}
    }
}
```

Rust 中的路径分隔符是 `::` ，路径分为绝对路径和相对路径。绝对路径从 crate 关键字开始描述。相对路径从 self 或 super 关键字或一个标识符开始描述。例如：

```rust
//绝对路径
crate::nation::government::govern();
//相对路径
nation::government::govern();
```

访问权限

+ Rust 中有两种简单的访问权：公共（public）和私有（private）。默认情况下，如果不加修饰符，模块中的成员访问权将是私有的。公共权限，需要使用 pub 关键字；

+ 对于私有的模块，只有在与其平级的位置或下级的位置才能访问，不能从其外部访问；

+ 如果模块中定义了结构体，结构体除了其本身是私有的以外，其字段也默认是私有的。所以如果想使用模块中的结构体以及其字段，需要 pub 声明；

use 关键字

use 关键字能够将模块标识符引入当前作用域。

对于两个相同的名称，且同样需要导入，我们可以使用 as 关键字为标识符添加别名：

```rust
mod nation {
    pub mod government {
        pub fn govern() {}
    }
    pub fn govern() {}
}

use crate::nation::government::govern;
use crate::nation::govern as nation_govern;

fn main() {
    nation_govern();
    govern();
}
```

# 泛型与特性

特性（trait）概念接近于 Java 中的接口（Interface）

特性在 Rust 中用 trait 表示：

```rust
trait Descriptive {
    fn describe(&self) -> String;
}
```

实现：

```rust
impl <特性名> for <所实现的类型名>
//Rust 同一个类可以实现多个特性，每个 impl 块只能实现一个。
```

特性做参数：

```rust
fn output(object: impl Descriptive) {
    println!("{}", object.describe());
}
```

还可以用这种等效语法：

```rust
fn output<T: Descriptive>(object: T) {
    println!("{}", object.describe());
}
```

特性作类型表示时如果涉及多个特性，可以用 + 符号表示，例如：

```rust
fn notify(item: impl Summary + Display)
fn notify<T: Summary + Display>(item: T)
```

还可以使用 where 关键字简化，例如：

```rust
fn some_function<T: Display + Clone, U: Clone + Debug>(t: T, u: U)
```

可以简化成：

```rust
fn some_function<T, U>(t: T, u: U) -> i32
    where T: Display + Clone,
          U: Clone + Debug
```

特性做返回值

格式如下：

```rust
fn person() -> impl Descriptive {
    Person {
        name: String::from("Cali"),
        age: 24
    }
}
```

> 特性做返回值只接受实现了该特性的对象做返回值且在同一个函数中所有可能的返回值类型必须完全一样必须在 T 已经实现 B 和 C 特性的前提下才能有效实现此 impl 块。

# 生命周期

+ 生命周期机制是与所有权机制同等重要的资源管理机制。

+ 生命周期注释是描述引用生命周期的办法。生命周期注释用单引号开头，跟着一个小写字母单词：
  
  ```rust
  &i32        // 常规引用
  &'a i32     // 含有生命周期注释的引用
  &'a mut i32 // 可变型含有生命周期注释的引用
  ```
  
  > 可以在合适的地方声明两个引用的生命周期一致。

# 静态生命周期

  生命周期注释有一个特别的：`'static` 。所有用双引号包括的字符串常量所代表的精确数据类型都是 `&'static str` ，`'static` 所表示的生命周期从程序运行开始到程序运行结束。

# 向量（Vector）

是一个存放多值的单数据结构，该结构将相同类型的值线性的存放在内存中。向量是线性表，在 Rust 中的表示是 Vec<T>。

例子：

```rust
let vector: Vec<i32> = Vec::new(); // 创建类型为 i32 的空向量
let vector = vec![1, 2, 4, 8];     // 通过数组创建向量
```

# 面向对象

封装 就是对外显示的策略，在 Rust 中可以通过模块的机制来实现最外层的封装，并且每一个 Rust 文件都可以看作一个模块，模块内的元素可以通过 pub 关键字对外明示。

在 Rust 中，我们可以使用结构体或枚举类来实现类的功能：

```rust
pub struct ClassName {
    pub field: Type,
}

pub impl ClassName {
    fn some_method(&self) {
        // 方法函数体
    }
}

pub enum EnumName {
    A,
    B,
}

pub impl EnumName {
    fn some_method(&self) {

    }
}
```
