#### 1、函数

+ **函数定义**，参数格式为：参数 : 类型
  
  ```kotlin
  fun sum(a: Int, b: Int): Int {   // Int 参数，返回值 Int
      return a + b
  }
  public fun sum(a: Int, b: Int): Int = a + b   // public 方法则必须明确写出返回类型
  ```

+ **无返回值的函数(类似Java中的void)**：
  
  ```kotlin
  fun printSum(a: Int, b: Int): Unit { 
      print(a + b)
  }
  // 如果是返回 Unit类型，则可以省略(对于public方法也是这样)：
  public fun printSum(a: Int, b: Int) { 
      print(a + b)
  }
  ```

+ **函数的变长参数可以用 `vararg` 关键字进行标识**：
  
  ```kotlin
  fun vars(vararg v:Int){
      for(vt in v){
          print(vt)
      }
  }
  // 测试
  fun main(args: Array<String>) {
      vars(1,2,3,4,5)  // 输出12345
  }
  ```

+ **lambda(匿名函数)：**
  
  ```kotlin
  // 测试
  fun main(args: Array<String>) {
      val sumLambda: (Int, Int) -> Int = {x,y -> x+y}
      println(sumLambda(1,2))  // 输出 3
  }
  ```

+ **定义常量与变量：**
  
  可变变量定义：var 关键字
  
  ```kotlin
  var <标识符> : <类型> = <初始化值>
  val c: Int      // 如果不在声明时初始化则必须提供变量类型
  ```

​      不可变变量定义：val 关键字，只能赋值一次的变量(类似Java中final修饰的变量)

```kotlin
val <标识符> : <类型> = <初始化值>
```

+ **字符串模板**
  
  `$` 表示一个变量名或者变量值。
  
  `$varName` 表示变量值。
  
  `${varName.fun()}` 表示变量的方法返回值。
  
  ```kotlin
  var a = 1
  // 模板中的简单名称：
  val s1 = "a is $a" 
  a = 2
  // 模板中的任意表达式：
  val s2 = "${s1.replace("is", "was")}, but now is $a"
  ```

+ **空判断处理**
  
  字段后加`!!`像Java一样抛出空异常。
  
  字段后加`?`可不做处理返回值为 null或配合`?:`做空判断处理。
  
  ```kotlin
  //类型后面加?表示可为空
  var age: String? = "23" 
  //抛出空指针异常
  val ages = age!!.toInt()
  //不做处理返回 null
  val ages1 = age?.toInt()
  //age为空返回-1
  val ages2 = age?.toInt() ?: -1
  ```

+ **&&**：与运算符。

+ **区间表达式**
  
  由具有操作符形式 `..` 的 `rangeTo` 函数辅以 in 和 !in 形成
  
  ```kotlin
  for (i in 1..4) print(i) // 输出“1234”
  for (i in 4..1) print(i) // 什么都不输出
  if (i in 1..10) { // 等同于 1 <= i && i <= 10
      println(i)
  }
  // 使用 step 指定步长
  for (i in 1..4 step 2) print(i) // 输出“13”
  for (i in 4 downTo 1 step 2) print(i) // 输出“42”
  // 使用 until 函数排除结束元素
  for (i in 1 until 10) {   // i in [1, 10) 排除了 10
       println(i)
  }
  ```

#### 2、数据类型

+ **字面常量**：

> 十进制：123
> 长整型以大写的 L 结尾：`123L`
> 16 进制以 `0x` 开头：`0x0F`
> 2 进制以 `0b` 开头：`0b00001011`
> 注意：8进制不支持

+ **比较**
  
  `Kotlin` 没有基础数据类型，只有封装的数字类型，每定义一个变量，`Kotlin` 会封装一个对象。
  
  在 `Kotlin` 中，三个等号 `===` 表示比较**对象**地址，两个 `==` 表示比较两个值大小。

+ **类型转换**
  
  ```kotlin
  toByte(): Byte
  toShort(): Short
  toInt(): Int
  toLong(): Long
  toFloat(): Float
  toDouble(): Double
  toChar(): Char
  例如，
  val i: Int = b.toInt()
  ```

+ **位操作符**
  
  ```kotlin
  shl(bits) – 左移位 (Java’s <<)
  shr(bits) – 右移位 (Java’s >>)
  ushr(bits) – 无符号右移位 (Java’s >>>)
  and(bits) – 与
  or(bits) – 或
  xor(bits) – 异或
  inv() – 反向
  ```

+ **布尔**
  
  ```kotlin
  || – 短路逻辑或
  && – 短路逻辑与
  ! - 逻辑非
  ```

+ **数组**
  
  用类 Array 实现，创建方式：一种是使用函数`arrayOf()`；另外一种是使用工厂函数。
  
  ```kotlin
  fun main(args: Array<String>) {
      //[1,2,3]
      val a = arrayOf(1, 2, 3)
      //[0,2,4]
      val b = Array(3, { i -> (i * 2) })
  
      //读取数组内容
      println(a[0])    // 输出结果：1
      println(b[1])    // 输出结果：2
  }
  ```

​       除了类Array，还有`ByteArray, ShortArray, IntArray`，表示各个类型的数组，其用法同Array一样：

```kotlin
val x: IntArray = intArrayOf(1, 2, 3)
x[0] = x[1] + x[2]
```

+ **字符串**
  
  `Kotlin` 支持**三个**引号 """ 扩起来的字符串，支持**多行**字符串
  
  ```kotlin
  fun main(args: Array<String>) {
      val text = """
      多行字符串
      多行字符串
      """
      println(text)
  }
  ```

+ **字符串模板（以美元符 $ 开头）**
  
  ```kotlin
  fun main(args: Array<String>) {
      val i = 10
      val s = "i = $i" // 求值结果为 "i = 10"
      println(s)
  }
  ```

#### 3、条件控制

+ **IF 表达式**
  
  可以把 IF 表达式的结果赋值给一个变量
  
  ```kotlin
  val max = if (a > b) {
      print("Choose a")
      a
  } else {
      print("Choose b")
      b
  }
  或
  val c = if (condition) a else b
  ```
  
  `in`运算符来检测某个数字是否在指定区间内
  
  ```kotlin
  fun main(args: Array<String>) {
      val x = 5
      val y = 9
      if (x in 1..8) {
          println("x 在区间内")
      }
  }
  ```

+ **When 表达式**
  
  when 将它的参数和所有的分支条件**顺序比较**，直到某个分支满足条件。
  
  when 类似其他语言的 switch 操作符。
  
  ```kotlin
  when (x) {
      1 -> print("x == 1")
      2 -> print("x == 2")
      else -> { // 注意这个块
          print("x 不是 1 ，也不是 2")
      }
  }
  ```

​       也可以检测一个值在（in）或者不在（!in）一个区间或者集合中

```kotlin
when (x) {
    in 1..10 -> print("x is in the range")
    in validNumbers -> print("x is valid")
    !in 10..20 -> print("x is outside the range")
    else -> print("none of the above")
}
```

  检测一个值是（is）或者不是（!is）一个特定类型的值（既可以被当做表达式使用也可以被当做语句使用）

```kotlin
fun hasPrefix(x: Any) = when(x) {
    is String -> x.startsWith("prefix")
    else -> false
}
```

也可以用来取代 if-else if，如果不提供参数，分支条件都是布尔表达式

```kotlin
when {
    x.isOdd() -> print("x is odd")
    x.isEven() -> print("x is even")
    else -> print("x is funny")
}
```

 使用**in** 运算符来判断集合内是否包含某实例

```kotlin
fun main(args: Array<String>) {
    val items = setOf("apple", "banana", "kiwi")
    when {
        "orange" in items -> println("juicy")
        "apple" in items -> println("apple is fine too")
    }
}
```

#### 4、循环控制

+ 跳转表达式
  
  *return*。默认从最直接包围它的函数或者匿名函数返回。
  
  *break*。终止最直接包围它的循环。
  
  *continue*。继续下一次最直接包围它的循环。
  
  ```kotlin
  fun main(args: Array<String>) {
      for (i in 1..10) {
          if (i==3) continue  // i 为 3 时跳过当前循环，继续下一次循环
          println(i)
          if (i>5) break   // i 为 6 时 跳出循环
      }
  }
  ```

#### 5、类和对象

+ **a === b**：判断是否是同一个对象。

+ **创建类实例**
  
  ```kotlin
  val site = Runoob() // Kotlin 中没有 new 关键字
  ```

+ **空类**
  
  ```kotlin
  class Empty
  ```

+ **getter 和 setter（val不允许设置setter函数）**
  
  属性声明的完整语法：
  
  ```kotlin
  var propertyName: PropertyType = property_initializer
      getter
      setter
  ```
  
  如果属性类型可以从初始化语句或者类的成员函数中推断出来，那就可以省去类型。
  
  ```kotlin
  var allByDefault: Int? // 错误: 需要一个初始化语句, 默认实现了 getter 和 setter 方法
  var initialized = 1    // 类型为 Int, 默认实现了 getter 和 setter
  val simple: Int?       // 类型为 Int ，默认实现 getter ，但必须在构造函数中初始化
  val inferredType = 1   // 类型为 Int 类型,默认实现 getter
  ```

+ **`kotlin`提供可以延迟初始化的方案,使用 `lateinit` 关键字描述属性**
  
  ```kotlin
  public class MyTest {
      lateinit var subject: TestSubject
      @SetUp fun setup() {
          subject = TestSubject()
      }
      @Test fun test() {
          subject.method()  // dereference directly
      }
  }
  ```

+ **主构造器**
  
  主构造器中不能包含任何代码，初始化代码可以放在初始化代码段中，初始化代码段使用 init 关键字作为前缀。
  
  ```kotlin
  class Person constructor(firstName: String) {
      init {
          println("FirstName is $firstName")
      }
  }
  ```
  
  如果主构造器没有任何注解，也没有任何可见度修饰符，那么constructor关键字可以省略。
  
  ```kotlin
  class Person(firstName: String) {
  }
  ```
  
  `Koltin` 的类可有一个 主构造器，以及一个或多个次构造器，主构造器是类头部的一部分，位于类名称之后:
  
  ```kotlin
  class Person constructor(firstName: String) {}
  ```

+ **次构造函数**
  
  ```kotlin
  class Person { 
      constructor(parent: Person) {
          parent.children.add(this) 
      }
  }
  ```

+ **抽象类（关键字：abstract）**
  
  类本身，或类中的部分成员，都可以声明为abstract。

+ **嵌套类**
  
  ```kotlin
  class Outer {                  // 外部类
      private val bar: Int = 1
      class Nested {             // 嵌套类
          fun foo() = 2
      }
  }
  fun main(args: Array<String>) {
      val demo = Outer.Nested().foo() // 调用格式：外部类.嵌套类.嵌套类方法/属性
      println(demo)    // == 2
  }
  ```

+ **内部类（关键字： inner，在class前面）**
  
  内部类可以访问外部类**成员属性和成员函数**。
  
  为消除歧义，要访问来自外部作用域的 this，使用this@label， @label 是 代指 this 来源的标签。

+ **类的修饰符**
  
  `classModifier`: 类属性修饰符，标示类本身特性。
  
  ```kotlin
  abstract    // 抽象类  
  final       // 类不可继承，默认属性
  enum        // 枚举类
  open        // 类可继承，类默认是final的
  annotation  // 注解类
  ```
  
  `accessModifier`: 访问权限修饰符
  
  ```kotlin
  private    // 仅在同一个文件中可见
  protected  // 同一个文件中或子类可见
  public     // 所有调用的地方都可见
  internal   // 同一个模块中可见
  ```
