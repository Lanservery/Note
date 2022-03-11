## 基本

+ python 有严格的代码缩进要求，不然会出现 “unindent does not match any outer indentation level”,即点数必须相同。

+ Python 出现任何问题可以用安装包修复。

+ python 中**单引号和双引号**使用完全相同。

+ Python 中的变量不需要声明。每个变量在使用前都必须赋值，变量赋值以后该变量才会被创建。

+ `a**b` 为 a 的 b 次方。

+ end 可以用于将结果不换行，或者在输出的末尾添加不同的字符。如`print(b, end=',')`。

+ 在Python中没有 `switch – case` 语句。

+ Python 中没有` do..while` 循环。

+ Python 没有`n++`。

+ **在终端使用 CTRL+C 来退出当前的无限循环**。

+ 修改全局变量可用 `global` 关键字。

+ 修改嵌套作用域需要 `nonlocal` 关键字。

+ 实例变量就是一个用 `self` 修饰的变量。`self`代表类的实例。

## 三引号

  允许字符串跨多行，字符串中可以包含换行符、制表符以及其他特殊字符。

```python
para_str = """这是一个多行字符串的实例 
多行字符串可以使用制表符 
TAB ( \t )。 
也可以使用换行符 [ \n ]。 
""" 
print (para_str)
```

## 列表

相当于数组，使用中括号`[]`,可以修改。

```python
list = ['red', 'green', 'blue', 'yellow', 'white', 'black']
```

## 元组（tuple）

使用小括号 `()` ，元素之间用逗号隔开。元组元素**不能修改**，但可以对元组进行连接组合。

**元组中只包含一个元素时**，需要在元素后面添加逗号。

## 集合（set）

使用大括号 `{ }` 或者 `set()` 函数创建集合。

```python
parame = {value01,value02,...}
或者
set(value)
```

## 字典

用 `{ }` 标识：

```python
d = {key1 : value1, key2 : value2, key3 : value3 }
```

## 构造方法

`__init__()`，该方法在类实例化时会自动调用。

## lambda 函数

```python
sum = lambda arg1, arg2: arg1 + arg2  
# 调用sum函数 
print ("相加后的值为 : ", sum( 10, 20 ))
```

## 模块可以导入其他模块

目录有一个叫做 `__init__.py` 的文件才会被认作是一个包。

## with as 语句

可保证文件之类的对象在使用完之后关闭。

```python
with open("myfile.txt") as f:
 for line in f:
     print(line, end="")
```

## self

在类中代表类的实例，而非类—当作类自身就行了

## 继承

子类（派生类 DerivedClassName）会继承父类（基类 BaseClassName）的属性和方法。

```python
class DerivedClassName(BaseClassName):
```

使用模块实现继承

```python
class DerivedClassName(modname.BaseClassName):
```

## 多继承

方法名同，默认调用在括号中排前的父类方法

```python
class DerivedClassName(Base1, Base2, Base3):
```

Python可以重写父类方法。

## 用子类对象调用父类已被覆盖的方法

```python
c = Child()          # 子类实例 
c.myMethod()         # 子类调用重写方法 
super(Child,c).myMethod() #用子类对象调用父类已被覆盖的方法
```

## 类的访问

通过创建类对象访问：

```python
class MyClass:
    """一个简单的类实例"""
    i = 12345
    def f(self):
        return 'hello world'

# 实例化类
x = MyClass()

# 访问类的属性和方法
print("MyClass 类的属性 i 为：", x.i)
print("MyClass 类的方法 f 输出为：", x.f())
```

## 类的私有属性

   `__private_attrs`

  ​        两个下划线开头，声明该属性为私有，不能在类的外部被使用或直接访问。在类内部的方法中使用时 `self.__private_attrs`。

## 类的私有方法

   `__private_method`

  ​        两个下划线开头，声明该方法为私有方法，只能在类的内部调用 ，不能在类的外部调用。`self.__private_methods`

## 类的专有方法

  `__init__` : 构造函数，在生成对象时调用

  `__del__` : 析构函数，释放对象时使用

  `__setitem__` : 按照索引赋值

  `__getitem__`: 按照索引获取值

## 变量访问

语句内定义的变量，外部可以访问，如下代码：

```python
>>> if True:
...  msg = 'I am from Runoob'
... 
>>> msg
'I am from Runoob'
>>> 
```

如果将 msg 定义在函数中，则它就是局部变量，外部不能访问：

```python
>>> def test():
...     msg_inner = 'I am from Runoob'
... 
>>> msg_inner
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'msg_inner' is not defined
>>> 
```

## 类的方法与普通的函数的区别

类的方法必须有额外的**第一个参数名称**, 名称是 `self`，也可以用 `this`。

```python
class Test:    
    def prt(self):        
        print(self)
```

## User-Agent(用户代理)池

就是把多个浏览器的 UA 信息放进列表中，然后再从中随机选择。构建用户代理池，能够避免总是使用一个 UA 来访问网站，因为短时间内总使用一个 UA 高频率访问的网站，可能会引起网站的警觉，从而封杀掉 IP。放在一个 `ua_info.py `文件中

## 输入和输出

文件的写入

先打开文件再写入，最后必须关闭

## robots.txt

  `https://www.ecosia.org/robots.txt`