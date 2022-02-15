## 基础语法

+ Rust 是强类型语言

+ 声明变量 `let a = 123;`

+ `let a: u64 = 123;`  声明了 a 为无符号 64 位整型变量，如果没有声明类型，a 将自动被判断为有符号 32 位整型变量

+ 重影（Shadowing）重影就是指变量的名称可以被重新使用的机制：

  ```rust
  fn main() {
      let x = 5;
      let x = x + 1;
      let x = x * 2;
      println!("The value of x is: {}", x);
  }
  
  >The value of x is: 12
  ```

  但可变变量赋值仅能发生值的变化

  ```rust
  //这段程序会出错：不能给字符串变量赋整型值
  let mut s = "123";
  s = s.len();
  >error
  ```

## 数据类型

  + 整数型

  + 浮点数型

  + 布尔型(用bool 表示，值只能为 true 或 false)

  + 字符型(用 char 表示，大小为 4 个字节)

  + 复合类型

    + 元组：用一对 ( ) 包括的一组数据，可以包含不同种类的数据：

      ```rust
      let tup: (i32, f64, u8) = (500, 6.4, 1);
      // tup.0 等于 500
      // tup.1 等于 6.4
      // tup.2 等于 1
      let (x, y, z) = tup;
      // y 等于 6.4
      ```

    + 数组：用一对 [ ] 包括的同类型数据

      ```rust
      let a = [1, 2, 3, 4, 5];  // a 是一个长度为 5 的整型数组
      let b = ["January", "February", "March"];  // b 是一个长度为 3 的字符串数组
      
      let first = a[0];  // 数组访问
      let second = a[1];
      
      a[0] = 123; // 错误：数组 a 不可变
      let mut a = [1, 2, 3];
      a[0] = 4; // 正确
      ```

## 条件语句 

+ 格式

  ```rust
  fn main() {
      let number = 3;
      if number < 5 {
          println!("条件为 true");
      } else {
          println!("条件为 false");
      }
  }
  ```

+ 条件表达式必须是 `bool` 类型

  ```rust
  //下面的程序是错误的：
  fn main() {
      let number = 3;
      if number {   // 报错，expected `bool`, found integerrustc(E0308)
          println!("Yes");
      }
  }
  ```

## 循环

+ 格式
  ```rust
  let mut i = 0;
  while i < 10 {
    // 循环体
    i += 1;
  }

+ 中断 `loop`

  ```rust
  fn main() {
      let s = ['R', 'U', 'N', 'O', 'O', 'B'];
      let mut i = 0;
      loop {
          let ch = s[i];
          if ch == 'O' {
              break;
          }
          println!("\'{}\'", ch);
          i += 1;
      }
  }
  结果：
  >'R' 
  >'U' 
  >'N' 

## 所有权

+ 规则

  - Rust 中的每个值都有一个变量，称为其所有者
  - 一次只能有一个所有者
  - 当所有者不在程序运行范围时，该值将被 **删除**

+ 范围

  ```rust
  {
      // 在声明以前，变量 s 无效
      let s = "runoob";
      // 这里是变量 s 的可用范围
  }
  // 变量范围已经结束，变量 s 无效
  ```

+ 交互方式

+ 移动(Move)

  ```rust
  let x = 5;
  let y = x;
  ```

  现在栈中将有两个值 5。此情况中的数据是"基本数据"类型的数据，不需要存储到堆中，仅在栈中的数据的"移动"方式是直接复制，"基本数据"类型有这些：

  + 所有整数类型，例如 i32 、 u32 、 i64 等

  + 布尔类型 bool，值为 true 或 false 

  + 所有浮点类型，f32 和 f64

  + 字符类型 char

  + 仅包含以上类型数据的元组（Tuples）

  特殊情况—堆

  ```rust
  let s1 = String::from("hello");
  let s2 = s1; 
  println!("{}, world!", s1); // 错误！s1 已经失效
  //在给 s2 赋值时 s1 已经无效，即在把 s1 的值赋给 s2 以后 s1 将不可以再被使用
  ```

+ 克隆

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

+ 函数

  ```rust
  fn main() {
      let s = String::from("hello");
      // s 被声明有效
  
      takes_ownership(s);
      // s 的值被当作参数传入函数
      // 所以可以当作 s 已经被移动，从这里开始已经无效
  
      let x = 5;
      // x 被声明有效
  
      makes_copy(x);
      // x 的值被当作参数传入函数
      // 但 x 是基本类型，依然有效
      // 在这里依然可以使用 x 却不能使用 s
  
  } // 函数结束, x 无效, 然后是 s. 但 s 已被移动, 所以不用被释放
  
  
  fn takes_ownership(some_string: String) {
      // 一个 String 参数 some_string 传入，有效
      println!("{}", some_string);
  } // 函数结束, 参数 some_string 在这里释放
  
  fn makes_copy(some_integer: i32) {
      // 一个 i32 参数 some_integer 传入，有效
      println!("{}", some_integer);
  } // 函数结束, 参数 some_integer 是基本类型, 无需释放
  ```

+ 函数返回值的所有权机制

  ```rust
  fn main() {
      let s1 = gives_ownership();
      // gives_ownership 移动它的返回值到 s1
  
      let s2 = String::from("hello");
      // s2 被声明有效
  
      let s3 = takes_and_gives_back(s2);
      // s2 被当作参数移动, s3 获得返回值所有权
  } // s3 无效被释放, s2 被移动, s1 无效被释放.
  
  fn gives_ownership() -> String {
      let some_string = String::from("hello");
      // some_string 被声明有效
  
      return some_string;
      // some_string 被当作返回值移动出函数
  }
  
  fn takes_and_gives_back(a_string: String) -> String { 
      // a_string 被声明有效
  
      a_string  // a_string 被当作返回值移出函数
  }
  ```

  > 被当作函数返回值的变量所有权将会被移动出函数并返回到调用函数的地方，而不会直接被无效释放。

+ 引用与租借

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

  >1、引用不会获得值的所有权
  >
  >2、引用只能租借（Borrow）值的所有权

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

## 切片

+ 字符串切片

  ```rust
  fn main() {
      let s = String::from("broadcast");
  
      let part1 = &s[0..5];
      let part2 = &s[5..9];
  
      println!("{}={}+{}", s, part1, part2);
  }
  结果：
  >broadcast=broad+cast
  ```
  注意：被切片引用的字符串禁止更改其值
  
  ```rust
  fn main() {
      let mut s = String::from("runoob");
      let slice = &s[0..3];
      s.push_str("yes!"); // 错误
      println!("slice = {}", slice);
  }
  ```
  
+ 范围
  + `..y` 等价于 `0..y`
  + `x..` 等价于位置 `x` 到数据结束
  + `..` 等价于位置 `0` 到结束
  
+ `str` 和 `String`

  `str` 是 Rust 核心语言类型，即字符串切片（String Slice），常常以引用的形式出现（&str）。

  `String` 类型是 Rust 标准公共库提供的一种数据类型。

  `String` 和 `str` 都支持切片，切片的结果是 `&str` 类型的数据。

  注意：切片结果必须是引用类型

  ```rust
  let slice = &s[0..3];
  ```

  String 转换成 &str：

  ```rust
  let s1 = String::from("hello");
  let s2 = &s1[..];
  ```

+ 非字符串切片

  除了字符串以外，其他一些线性数据结构也支持切片操作，例如数组：

  ```rust
  fn main() {
      let arr = [1, 3, 5, 7, 9];
      let part = &arr[0..3];
      for i in part.iter() {
          println!("{}", i);
      }
  }
  结果：
  >1
  >3
  >5
  ```

## 结构体

结构体（Struct）与元组（Tuple）都可以将若干个类型不一定相同的数据捆绑在一起形成整体

+ 定义

  ```rust
  (struct) Site {
      domain: String,
      name: String,
      nation: String,
      found: u32
  }
  ```

+ 元组结构体

  与元组的区别是它有名字和固定的类型格式

  格式：

  ```rust
  struct Color(u8, u8, u8);
  struct Point(f64, f64);
  
  let black = Color(0, 0, 0);
  let origin = Point(0.0, 0.0);
  ```

+ 输出结构体

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

  如第一行所示：一定要导入调试库 **#[derive(Debug)]** ，之后在 println 和 print 宏中就可以用 {:?} 占位符输出一整个结构体，如果属性较多的话可以使用另一个占位符 {:#?}

+ 结构体方法

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

+ 结构体关联函数

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

+ 单元结构体

  结构体可以只作为一种象征而无需任何成员：

  ```rust
  struct UnitStruct;
  ```

## 枚举类

+ 枚举的目的是对某一类事物的分类，分类的目的是为了对不同的情况进行描述

+ match 语法：实现分支结构功能

+ 对非枚举类进行分支选择时必须注意处理例外情况，即使在例外情况下没有任何要做的事 . 例外情况用下划线 _ 表示

  ```rust
  fn main() {
      let t = "abc";
      match t {
          "abc" => println!("Yes"),
          _ => {},
      }
  }
  ```

+ Option 枚举类

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

+ if let 语法

  格式：

  ```rust
  if let 匹配值 = 源变量 {
      语句块
  }
  //可以在之后添加一个 else 块来处理例外情况
  ```

## 组织管理

+ 箱（Crate）："箱"是二进制程序文件或者库文件，存在于"包"中。
+ 包（Package）：工程的实质是一个包，包必须由一个 Cargo.toml 文件来管理，该文件描述了包的基本信息以及依赖项。一个包最多包含一个库"箱"，可以包含任意数量的二进制"箱"，但是至少包含一个"箱"

+ 模块（Module）：Rust 中的组织单位

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

+ 访问权限

  + Rust 中有两种简单的访问权：公共（public）和私有（private）。默认情况下，如果不加修饰符，模块中的成员访问权将是私有的。公共权限，需要使用 pub 关键字；

  + 对于私有的模块，只有在与其平级的位置或下级的位置才能访问，不能从其外部访问；
  + 如果模块中定义了结构体，结构体除了其本身是私有的以外，其字段也默认是私有的。所以如果想使用模块中的结构体以及其字段，需要 pub 声明；

+ use 关键字

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

  use 关键字可以与 pub 关键字配合使用。

+ 引用标准库

  ```rust
  use std::f64::consts::PI;
  
  fn main() {
      println!("{}", (PI / 2.0).sin());
  }
  结果：
  >1
  ```

## 错误处理

+ 两种错误：可恢复错误和不可恢复错误。可恢复错误用 `Result<T, E>` 类来处理，对于不可恢复错误使用 `panic!` 宏来处理。

+ 程序会在 `panic!` 宏被调用时停止运行。

  可恢复的错误：使用 `Result<T, E>` 枚举类作返回值来进行异常表达：

  ```rust
  enum Result<T, E> {
      Ok(T),
      Err(E),
  }
  ```

+ 如果想使一个可恢复错误按不可恢复错误处理，Result 类提供了两个办法：`unwrap()` 和 `expect(message: &str)` ：

  ```rust
  use std::fs::File;
  
  fn main() {
      let f1 = File::open("hello.txt").unwrap();
      let f2 = File::open("hello.txt").expect("Failed to open.");
  }
  //两者的区别在于 expect 能够向 panic! 宏发送一段指定的错误信息
  ```

+ `?` 符的实际作用是将 Result 类非异常的值直接取出，如果有异常就将异常 Result 返回出去。所以，`?` 符仅用于返回值类型为 `Result<T, E>` 的函数，其中 `E` 类型必须和 `?` 所处理的 Result 的 `E` 类型一致。

+ 获取 `Err` 类型的函数是 `kind()`。

## 泛型与特性

+ 特性（trait）概念接近于 Java 中的接口（Interface）

+ 特性在 Rust 中用 trait 表示：

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

+ 特性做参数

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

+ 特性做返回值

  格式如下：

  ```rust
  fn person() -> impl Descriptive {
      Person {
          name: String::from("Cali"),
          age: 24
      }
  }
  ```

  > 特性做返回值只接受实现了该特性的对象做返回值且在同一个函数中所有可能的返回值类型必须完全一样

+ 有条件实现方法

  ```rust
  struct A<T> {}
  
  impl<T: B + C> A<T> {
      fn d(&self) {}
  }
  //这段代码声明了 A<T> 类型必须在 T 已经实现 B 和 C 特性的前提下才能有效实现此 impl 块。
  ```

## 生命周期

+ 生命周期机制是与所有权机制同等重要的资源管理机制。

+ 生命周期注释是描述引用生命周期的办法。生命周期注释用单引号开头，跟着一个小写字母单词：

  ```rust
  &i32        // 常规引用
  &'a i32     // 含有生命周期注释的引用
  &'a mut i32 // 可变型含有生命周期注释的引用
  ```
  >可以在合适的地方声明两个引用的生命周期一致。
  
+ 静态生命周期

  生命周期注释有一个特别的：`'static` 。所有用双引号包括的字符串常量所代表的精确数据类型都是 `&'static str` ，`'static` 所表示的生命周期从程序运行开始到程序运行结束。

## 文件与 IO

+ 接收命令行参数

  取出环境参数，使用通过 std::env 模块：

  ```rust
  fn main() {
      let args = std::env::args();
      println!("{:?}", args);
  }
  结果：
  >Args { inner: ["D:\\rust\\greeting\\target\\debug\\greeting.exe"] }
  ```

+ 命令行输入

  在 Rust 中，std::io 模块提供了标准输入（可认为是命令行输入）的相关功能：

  ```rust
  use std::io::stdin;
  
  fn main() {
  let mut str_buf = String::new();
  
      stdin().read_line(&mut str_buf)
          .expect("Failed to read line.");
  
      println!("Your input line is \n{}", str_buf);
  }
  ```

  > std::io::Stdio 包含 read_line 读取方法，可以读取一行字符串到缓冲区，返回值都是 Result 枚举类，用于传递读取中出现的错误，所以常用 expect 或 unwrap 函数来处理错误。

+ 文件读取

  std::fs 模块中的 read_to_string 方法可以轻松完成文本文件的读取。但如果要读取的文件是二进制文件，我们可以用 std::fs::read 函数读取 u8 类型集合

+ 文件写入

  分为一次性写入和流式写入。流式写入需要打开文件，打开方式有"新建"（create）和"追加"（append）两种。

+ OpenOptions 可以设置打开权限，除append 权限以外还有 read 权限和 write 权限

## 集合与字符串

+ 向量

  向量（Vector）是一个存放多值的单数据结构，该结构将相同类型的值线性的存放在内存中。向量是线性表，在 Rust 中的表示是 Vec<T>。

  例子：

  ```rust
  let vector: Vec<i32> = Vec::new(); // 创建类型为 i32 的空向量
  let vector = vec![1, 2, 4, 8];     // 通过数组创建向量
  ```

+ 映射表

  应用最普遍的就是键值散列映射表（Hash Map）。insert 方法和 get 方法是映射表最常用的两个方法。

## 面向对象

+ 封装

  封装就是对外显示的策略，在 Rust 中可以通过模块的机制来实现最外层的封装，并且每一个 Rust 文件都可以看作一个模块，模块内的元素可以通过 pub 关键字对外明示。

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

## 并发编程

+ 线程

  线程（thread）是一个程序中独立运行的一个部分。Rust 中通过 `std::thread::spawn` 函数创建新线程，但随着主线程的结束，其他线程也随之结束。

+ 闭包

  闭包可以保存进变量或作为参数传递给其他函数的匿名函数。闭包相当于 Rust 中的 Lambda 表达式，格式如下：

  ```rust
  |参数1, 参数2, ...| -> 返回值类型 {
      // 函数体
  }
  ```

+ join 方法

  join 方法可以使子线程运行结束后再停止运行程序。

+ 消息传递

  Rust 中一个实现消息传递并发的主要工具是通道（channel），通道有两部分组成，一个发送者（transmitter）和一个接收者（receiver）。

