# 基础

1、类命名首字母必须大写。java区分大小写，`a != A`。**函数里面不要再定义函数。**

2、一个文件中只能有一个`public`类。内部类除外,可以加public.

3、类的访问控制符只能是空或者 public，方法和属性的访问控制符有 4 个，分别是 public、 private、

 protected 和 friendly，其中 friendly 是一种没有定义专门的访问控制符的默认情况。

4、a+=3等价于a=a+3。

5、import static 语句：使用 import 可以省略包名，使用 `import static` 可以省略类名。放在package 

语句之后、类定义之前。

**6、使用 final 关键字声明需要注意以下几点：**

+ final 用在变量的前面表示变量的值不可以改变，此时该变量可以被称为常量。

+ final 用在方法的前面表示方法不可以被重写(**关键字：** **extends** )（**子类中如果创建了一个与父类中相同名称、相同返回值类型、相同参数列表的方法，只是方法体中的实现不同，以实现不同于父类的功能，这种方式被称为方法重写，又称为方法覆盖。这里了解即可，教程后面我们会详细讲解**），但能被重载。

+ final 用在类的前面表示该类不能有子类，即该类不可以被继承。

+ final 修饰的类不能被继承。  

7、一个程序中的变量使用 `public static final` 声明，则此变量将称为全局变量：

+ 例如
  
  ```java
  public static final String SEX= "女";
  ```

8、 private 方法：它仅在当前类中可见，其子类无法访问该方法。

9、 main() 方法是静态的。如果要在 main() 方法中调用本类中的其他方法，则该方法也必须是静态的，否则

需要先创建本类的实例对象，然后再通过对象调用成员方法。

**10、** `main()` 方法具有一个字符串数组参数，用来接收执行 Java 程序的命令行参数。命令行参数作为字符

  串，按照顺序依次对应字符串数组中的元素。

11、finalize()：析构方法。做清理垃圾碎片的工作。

**12、调用自身的方法称为递归。**

**13**、实现多态有 3 个必要条件：继承、重写和向上转型。

**14**、访问权限：`public>protected>default>private`。如果不加修饰，则有效范围在包里面

## 二、Java 构造方法有以下特点

+ 方法名必须与类名相同。
+ 可以有 0 个、1 个或多个参数。
+ 使用 new 关键字来调用构造方法，类的实例可当成构造器的返回值。
+ 构造方法不能被 `static、final、synchronized、abstract 和 native`（类似于 abstract）修饰。
+ 在一个类中定义多个具有不同参数的同名方法，这就是方法的**重载**。

## 三、包的作用

+ 管理类。

+ import**包的导入** 语句位于 package 语句之后，类定义之前。

+ 在每个源文件中只能有一个包定义语句。包导入在包名下面。

+ Java 默认为所有源文件导入 java.lang 包下的所有类，因此前面在 Java 程序中使用 String、System 类时都无须使用 import 语句来导入这些类。

+ 为了让引用更加明确，又是即使使用了 `import` 语句，也还是需要使用类的全名。
  
  ```java
  java.sql.Date d = new java.sql.Date();
  ```

## 四、实现封装的具体步骤如下

+ 修改**属性的可见性**来限制对属性的访问，一般设为 `private`。
+ 为每个属性创建一对**赋值**（setter）方法和**取值**（getter）方法，一般设为 `public`，用于属性的读写。
+ 在赋值和取值方法中，加入属性控制语句（对属性值的合法性进行判断）。

## 五、继承

+ 关键字：extends

+ 已经存在的类称为父类、基类或超类，而新产生的类称为子类或派生类。在子类中，不仅包含父类的属性和方法，还可以增加新的属性和方法。

+ 类的继承不改变类成员的**访问权限**。

+ 子类不能继承父类的**构造方法**。

+ **单继承：**Java 不支持多继承，只允许一个类直接继承另一个类。

+ 父类中的 `private` 成员在子类中是不可见的，因此在子类中不能直接使用它们。

+ 类对象创建，如：
  
  ```java
  People stuPeople = new Student("王丽丽", 23, "女", "410521198902145589");
  ```

+ 语法格式如下：
  
  ```java
  修饰符 class class_name extends extend_class {
      // 类的主体
  }
  ```

## 六、super 关键字

+ 用在继承

+ 在子类的构造方法中显式的调用**父类构造方法**。

+ 不可以在 static 环境中使用。

+ 语法格式：
  
  ```java
  super(parameter-list);
  ```

+ super**访问父类成员**，用法：当子类的成员变量或方法与父类**同名**时。语法格式如下：
  
  ```java
  super.member(属性或方法)
  ```

## 七、对象类型转换

+ 指存在继承关系的**对象**，不是任意类型的对象。

+ **向上转型:**
  
  ```java
  fatherClass obj = new sonClass();
  ```
  
  fatherClass 是父类名称或接口名称，obj 是创建的对象，sonClass 是子类名称。**在多态中需要将子类的引用赋给父类对象，只有这样该引用才既能可以调用父类的方法，又能调用子类的方法。**

+ **向下转型：**
  
  ```java
  sonClass obj = (sonClass) fatherClass;
  ```

## 八、方法重载

+ 多个同名方法，它们的形参列表（**类型**也可以）不同。

+ 例如`println()`方法：
  
  ```java
  System.out.println(102);  // 调用println(int i)方法
  
  System.out.println(102.25); // 调用println(double d)方法
  
  System.out.println("价格为 102.25"); // 调用println(String s)方法
  ```

## 九、方法重写

+ 标识符：`@Override`

+ 子类中与父类中**的方法**相同名称、相同返回值类型、相同参数列表，只是方法体中的实现不同。

+ 父类的成员方法只能被它的子类重写。

+ 构造方法不能被重写。

## 十、instanceof关键字

+ 判断一个**对象**是否为一个**类**（或接口、抽象类、父类）的实例。

+ 语法格式
  
  ```java
  boolean result = obj instanceof Class
  ```

+ obj 是一个对象，Class 表示一个类或接口。obj 是 class 类（或接口）的实例或者子类实例时，结果 result 返回 true，否则返回 false。

## 十一、基本类型（特殊写法）

+ 例子
  
  ```java
  Figure figure; // 声明Figure类的变量
  figure = new Rectangle(9,9);
  ```

## 十二、引用类型

+ 例子
  
  ```java
  Person p1 = new Person(); //创建对象p1
  p1.fact();
  ```

## 十三、抽象

+ 关键字：`abstract`

+ 语法格式如下：
  
  ```java
  abstract class class_name {
      abstract type method_name (parameter-iist);
  }
  ```
  
  ​        `abstract` 表示该类或该方法是抽象的；`class_name` 表示抽象类的名称；`method_name` 表示抽象方法名称，`parameter-list` 表示方法参数列表。

+ 抽象方法必须存在于抽象类中。

+ 抽象方法**没有方法体**。

+ 子类重写父类时，必须重写父类所有的抽象方法。

+ 不能使用 `private` 修饰，因为抽象方法必须被子类重写。

+ 抽象类不能实例化，就是不能使用 `new` 关键字创建对象。

+ 不能用于 `static` 方法或者构造方法中。

## 十四、接口

+ 关键字：Interface），注意没有class关键字

+ 接口定义语法格式如下：
  
  ```java
  [public] interface interface_name [extends interface1_name[, interface2_name,…]] {
      // 接口体，其中可以包含定义常量和声明方法
  [public] [static] [final] type constant_name = value;    // 定义常量
  [public] [abstract] returnType method_name(parameter_list);    // 声明方法
  }
  方括号[]标识为可省略。
  ```

+ 接口没有构造方法，不能被实例化。

+ 接口中声明常量和方法。
  
  ```java
  public interface MyInterface {    // 接口myInterface
      String name;    // 不合法，变量name必须初始化
      int age = 20;    // 合法，等同于 public static final int age = 20;
      void getInfo();    // 方法声明，等同于 public abstract void getInfo();
  }
  ```

+ **继承**使用 `implements` 关键字。

+ **类实现接口**（有时继承和实现在一起）的语法格式如下：
  
  ```java
  public class class_name [extends superclass_name] [implements interface1_name[, interface2_name…]] {
      // 主体
  }
  ```

+ 实现接口与继承父类相似，一样可以获得所实现接口里定义的常量和方法。如果一个类需要实现多个接口，则多个接口之间以逗号分隔。
