## 变量

 定义变量时，变量名不加美元符号。

```sh
your_name="runoob.com"  //变量名和等号之间不能有空格。
```

使用变量：使用定义过的变量，在变量名前面加美元符号。

```sh
your_name="qinjx"
echo $your_name
echo ${your_name}//外面的花括号是可选的。
```

只读变量：使用 `readonly` 命令可以将变量定义为只读变量。

删除变量：使用 `unset` 命令可以删除变量。`unset` 命令不能删除只读变量。

```sh
unset variable_name
```

## 字符串

 可以用单引号，也可以用双引号，也可以不用引号。

获取字符串长度：

```sh
string="abcd"
echo ${#string} //#号输出 4
```

## 定义数组

 用括号表示数组，数组元素用"空格"符号分割开。可不用连续的下标，下标的范围没有限制。

```sh
sharray_name=(value0 value1 value2 value3)
或者
array_name=(
value0
value1
value2
value3
)
```

获取数组中的所有元素：使用 `@`符号。

```sh
echo ${array_name[@]}
```

获取数组长度：

```sh
my_array[0]=A
my_array[1]=B
my_array[2]=C
my_array[3]=D
//加#号
echo "数组元素个数为: ${#my_array[*]}"
echo "数组元素个数为: ${#my_array[@]}"
```

## 注释

 以`#`开头。

## 基本运算符

两个数相加(注意使用的是反引号-Esc键下面，而不是单引号。

```sh
val=`expr 2 + 2`
echo "两数之和为 : $val"
//表达式和运算符之间要有空格
//完整的表达式要被 ` ` 反引号包含
```

条件表达式在方括号之间，且有空格，如: **[$a==$b]** 是错误的，必须写成 **[  $a == $b  ]**。

乘号(*)前边必须加反斜杠(\)才能实现乘法运算

```sh
expr $a \* $b
```

须加反斜杠(\)才能实现乘法运算

```sh
expr $a \* $b
```
