## 1、内部类

+ 基础

  - 在类 Outer 的内部再定义一个类 Inner，此时类 Inner 就称为内部类（或称为嵌套类），而类 Outer 则称为外部类（或称为宿主类）。

  - 内部类拥有外部类的**所有元素的访问权限。**

  - 内部类不能用普通的方式访问。内部类是外部类的一个成员。

  - 内部类声明成静态的，只能访问外部类的静态成员变量。

  - 在外部类中可以直接通过内部类的类名访问内部类。

    ```java
    InnerClass ic = new InnerClass();    // InnerClass为内部类的类名
    ```

    

  - 在外部类以外的其他类中则需要通过内部类的完整类名访问内部类。

    ```java
    Test.InnerClass ti = new Test().new InnerClass(); //Test.innerClass是内部类的完整类名
    ```

    

  - 内部类仍然是一个独立的类，在编译之后内部类会被编译成独立的.class文件，但是前面冠以外部类的类名**和**$符号。

<!--more-->

+ 实例内部类

  - 实例内部类是指没有用 static 修饰的内部类。

  - 在实例内部类中不能定义 static 成员，除非同时使用 final 和 static 修饰。

  - 在外部类的静态方法和外部类以外的其他类中，必须通过外部类的实例创建内部类的实例。如

    ```java
    Outer.Inner i = new Outer().new Inner(); // 需要创建外部类实例
    ```

    

+ 静态内部类（static 修饰的内部类）

  - 在创建静态内部类的实例时，不需要创建外部类的实例。

    ```java
    Outer.Inner oi = new Outer.Inner(); //创建的oi是Inner类的对象
    ```

    

  - 静态内部类可以直接访问外部类的静态成员，如果要访问外部类的实例成员，则需要通过外部类的实例去访问。

    ```java
    public class Outer {
    int a = 0;    // 实例变量
    static int b = 0;    // 静态变量
    static class  Inner {
    Outer o = new Outer;
    int a2 = o.a;    // 访问实例变量
    int b2 = b;    // 访问静态变量
    	}
    }
    ```

    

  - 外部类**以外的其他类**需要通过完整的类名访问静态内部类中的静态成员，如果要访问静态内部类中的实例成员，则需要通过静态内部类的实例。

+ 局部内部类（在方法中定义的内部类）

  - 语法格式：

    ```java
    public class Test {
    public void method() {
    class Inner {
    // 局部内部类
    		}
    	}
    }
    ```

    

  - 在局部内部类中可以访问外部类的所有成员。

  - 局部内部类只在当前方法中有效。

  - 在局部内部类中只可以访问当前方法中 **final 类型**的参数与变量。

  - 如果方法中的成员与外部类中的**成员同名**，则可以使用 `OuterClassNam.this.MemberName` 的形式访问外部类中的成员。

## 2、匿名类

+ 指没有类名的内部类,大多定义于方法内部

+ 语法形式如下：

  ```ja
  new 类或接口() {
     // 类的主体
  };
  ```

  

+ 两种实现方式：

  - 继承一个类，重写其方法。
  - 实现一个接口（可以是多个），实现其方法。

+ 可以访问外部类的所有成员。**如果匿名类位于一个方法中**，则匿名类只能访问方法中 final 类型的局部变量和参数。

+ 例子

  ```java
  public class TestAnonymousInterClass {
  	// 在这个方法中构造一个匿名内部类
  	private void show() {
  	 Out anonyInter = new Out() {
         // 获取匿名内部类的实例
         void show() {
            System.out.println("调用匿名类中的 show() 方法");
            }
           };
    anonyInter.show();
  }
  ```

  

+ 匿名类和局部内部类一样，可以访问外部类的所有成员。如果匿名类位于一个方法中，则匿名类只能访问方法中 final 类型的局部变量和参数。

+ 匿名类中允许使用非静态代码块进行成员初始化操作。

  ```java
  Out anonyInter = new Out() {
      int i; {    // 非静态代码块
          i = 10;    //成员初始化
      }
      public void show() {
          System.out.println("调用了匿名类的 show() 方法"+i);
      }
  };
  ```

  

## 3、Java 中常见的输出函数

+ `printf` 主要继承了C语言中 `printf` 的一些特性，可以进行格式化输出,例如。

  ```java
  System.out.printf("%d - %d = %d \n", n1, n2, f2.calculateInt(n1, n2));
  ```

  

+ `print` 就是一般的标准输出，但是不换行。

+ `println` 就是最后会换行。

## 4、Lambda表达式

+ 标准语法形式如下：

  ```java
  (参数列表) -> {
    // Lambda表达式体
  }
  ```

  例如:

  ```java
  // Lambda表达式实现Calculable接口
  result = (int a, int b) -> {
    return a + b;
  };
  ```
  
  原型:
  
  ```java
  // 匿名内部类实现Calculable接口
  result=new Calculable() {
  	// 实现加法运算
  	@Override
  	public int calculatelnt(int a,int b) {
  		return a+b;
        }
  };
  ```
  
  

## 5、提示：

+ **代码格式化**：右键->Source->Format.
+ **实现就是拿去使用。**