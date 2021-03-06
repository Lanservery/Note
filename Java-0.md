## 1 访问控制符

+ 访问控制符是一组限走类、属性或方法是否可以被程序里的其他部分访问和调用的修饰符。类的访问控制符只能是空或者`public`，方法和属性的访问控制待有4个，分别是public、private、protected和friendly，其中friendly是一种没有定义专门的访问控制符的默认情况。访问控制修饰符的权限如表1所示。
  
  | 访问范围     | private | friendly（默认) | protected | public |
  |:--------:|:-------:|:------------:|:---------:|:------:|
  | 同一个类     | 可访问     | 可访问          | 可访问       | 可访问    |
  | 同一包中的其他类 | 不可访问    | 可访问          | 可访问       | 可访问    |
  | 不同包中的子类  | 不可访问    | 不可访问         | 可访问       | 可访问    |
  | 不同包中的非子类 | 不可访问    | 不可访问         | 不可访问      | 可访问    |

+ 访问控制在面向对象技术中处于很重要的地位，合理地使用访问控制符，可以通过降低类和类之间的耦合性（关联性）来降低整个项目的复杂度，也便于整个项目的开发和维护。在Java语言中，访问控制修饰符有4种
  
  - private
    
    用private修饰的类成员，只能被该类自身的方法访问和修改，而不能被任何其他类（包括该类的子类）访问和引用。因此，private修饰符具有最高的保护级别。例如，设PhoneCard是电话卡类，电话卡都有密码，因此该类有一个密码域，可以把该类的密码域声明为私有成员
  
  - friendly（默认）
    
    如果一个类没有访问控制符，说明它具有默认的访问控制特性。这种默认的访问控制权规定，该类只能被同一个包中的类访问和引用，而不能被其他包中的类使用，即使其他包中有该类的子类。这种访问特性又称为包访间性（packageprivate）
    同样，类内的成员如果没有访问控制符，也说明它们具有包访问性，或称为友元（friend），定义在同一个文件夹中的所有类属于一个包，所以前面的程序要把用户自定义的类放在同一个文件夹中（Java项目默认的包），以便不加修饰符也能运行
  
  - protected
    
    用保护访问控制符`protected`修饰的类成员可以被三种类所访问：该类自身、与它在同一个包中的其他类以及在其他包中的该类的子类。使用protected修饰符的主要作用，是允许其他包中它的子类来访问父类的特定属性和方法，否则可以使用默认访问控制符
  
  - public
    
    当一个类被声明为public时，它就具有了被其他包中的类访问的可能性，只要包中的其他类在程序中使用import语句引入public类，就可以访问和引用这个类

+ 类中被设定为public的方法是这个类对外的接口部分，避免了程序的其他部分直接去操作类内的数据，实际就是数据封装思想的体现。每个Java程序的主类都必须是public类，也是基于相同的原因

## 2 继承

+ 调用对象的 clone() 方法
  
  该方法不常用，使用该方法创建对象时，要实例化的类必须继承java.lang.Cloneable接口。调用对象的
  clone() 方法创建对象的语法格式如下：
  
  ```java
  类名对象名= (类名) 已创建好的类对象名.clone()
  ```

+ 4.调用`java.io.ObjectnputStream`对象的`readObject()`方法
  
  下面创建一个示例演示常用的前三种对象创建方法。示例代码如下：
  
  ```java
  public class Student implements Cloneable{
      //实现Cloneable接口
      privateStringName；//学生名字
      privateintage//学生年龄
      public Student(Sting name,int age){
          //构造方法
      }
  
  }
  ```

## 3 静态变量和静态方法

+ 在类中，使用static修饰符修饰的属性（成员变量）称为静态变量，也可以称为类变量，常量称为静态常量方法称为静态方法或类方法，它们统称为静态成员，归整个类所有。
  静态成员不依赖于类的特定实例，被类的所有实例共享，就是说`static`修饰的方法或者变量不需要依赖于对象来进行访间，只要这个类被加载，Java 虚拟机就可以根据类名找到它们。
  
  调用静态成员的语法形式如下：
  
  ```java
  类名.静态成员
  ```

+ 注意：
  
  - static修饰的成员变量和方法，从属于类
  - 普通变量和方法从属于对象
  - 静态方法不能调用非静态成员，编译会报错