#### 1、继承

+ 如果有多个相同的方法（继承或者实现自其他类，如A、B类），则要重写该方法，使用super范型去选择性地调用父类的实现。

+ `Kotlin`所有类都继承Any 类，它是所有类的超类，对于没有超类型声明的类是默认超类：

  ```kotlin
  class Example // 从 Any 隐式继承
  ```

+ 一个类要被继承，可以使用 open 关键字进行修饰。

  ```kotlin
  open class Base(p: Int)           // 定义基类
  class Derived(p: Int) : Base(p)
  ```

#### 2、重写

+ 如果允许子类重写该**函数**，就要添加 `open` 修饰它, 子类重写方法使用 `override`，接口成员变量默认是 open 的 ：

  ```kotlin
  /**用户基类**/
  open class Person{
      open fun study(){       // 允许子类重写
          println("我毕业了")
      }
  }
  /子类继承 Person类/
  class Student : Person() {
  
      override fun study(){    // 重写方法
          println("我在读大学")
      }
  }
  ```

#### 3、接口（关键字：interface ，允许方法有默认实现）

+ 例如

  ```kotlin
  interface MyInterface {    
  	fun bar()    // 未实现    
  	fun foo() {  //已实现      
  	  // 可选的方法体      
  	  println("foo")    
  	  } 
  }
  ```

+ **实现接口**

  ```kotlin
  class Child : MyInterface {    
  	override fun bar() {        
  		  // 方法体   
        } 
  }
  ```

  接口的属性只能是抽象的，不允许初始化值，接口不会保存属性值，实现接口时，必须重写属性：

  ```kotlin
  interface MyInterface{    
      var name:String //name 属性, 抽象的 
  }  
  class MyImpl:MyInterface{    
      override var name: String = "runoob" //重写属性 }
  ```

#### 4、扩展

+ **若扩展函数和成员函数一致，则使用该函数时，会优先使用成员函数。**

+ **扩展函数（在已有类中添加新的方法，不会对原类做修改）**

  ```kotlin
  fun receiverType.functionName(params){
      body
  }
  ```

  `receiverType`：表示函数的接收者，也就是函数扩展的对象

  `functionName`：扩展函数的名称

  `params`：扩展函数的参数，可以为NULL

  ```kotlin
  class User(var name:String)
  
  /**扩展函数**/
  fun User.Print(){
      print("用户名 $name")
  }
  fun main(arg:Array<String>){
      var user = User("Runoob")
      user.Print()
  }
  ```

+ **支持属性对属性进行扩展**

  ```kotlin
  val List.lastIndex: Int
      get() = size - 1
  ```

  扩展属性允许定义在类或者`kotlin`文件中，不允许定义在函数中。不允许被初始化，只能由显式提供的 getter/setter 定义。

  ```kotlin
  val Foo.bar = 1 // 错误：扩展属性不能有初始化器，扩展属性只能被声明为 val
  ```

+ **在一个类内部你可以为另一个类声明扩展。**

#### 5、泛型

+ **声明一个泛型类:**

  ```kotlin
  class Box<T>(t: T) {
      var value = t
  }
  ```

+ 下实例向泛型类 Box 传入整型数据和字符串：

  ```kotlin
  class Box<T>(t : T) {
      var value = t
  }
  fun main(args: Array<String>) {
      var boxInt = Box<Int>(10)
      var boxString = Box<String>("Runoob")
  
      println(boxInt.value)
      println(boxString.value)
  }
  ```

**6、枚举类（关键字：enum）**

+ 枚举常量用逗号分隔,每个枚举常量都是一个对象。

  ```kotlin
  enum class Color{
      RED,BLACK,BLUE,GREEN,WHITE
  }
  ```

+ **枚举初始化**

  ```kotlin
  enum class Color(val rgb: Int) {
      RED(0xFF0000),
      GREEN(0x00FF00),
      BLUE(0x0000FF)
  }
  ```

#### 7、对象表达式和对象声明

+ **对象表达式**

  ```kotlin
  window.addMouseListener(object : MouseAdapter() {
      override fun mouseClicked(e: MouseEvent) {
          // ...
      }
      override fun mouseEntered(e: MouseEvent) {
          // ...
      }
  })
  ```

+ **`Kotlin` 使用 object 关键字来声明一个对象**

  ```kotlin
  object DataProviderManager {
      fun registerDataProvider(provider: DataProvider) {
          // ……
      }
      val allDataProviders: Collection<DataProvider>
          get() = // ……
  }
  ```

+ **引用该对象，直接使用其名称：**

  ```kotlin
  DataProviderManager.registerDataProvider(……)
  ```

+ **伴生对象（关键字：companion）**

  **注意：**一个类里面只能声明一个内部关联对象，即关键字 companion 只能使用一次。

#### 8、数据类与密封类

+ **数据类（关键字：data）**

  ```kotlin
  data class User(val name: String, val age: Int)
  ```

+ **密封类（关键字：sealed）**

  不能修饰 interface ,abstract class。