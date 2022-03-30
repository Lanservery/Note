# 字符串连接

```lua
a..b 
其中 a 为 "Hello " ， b 为 "World", 输出结果为 "Hello World"。
```

# 数值for循环

语法格式：

```lua
for var=exp1,exp2,exp3 do  
    <执行体>  
end  
```

exp1 为初始值，exp2 为值的范围，每次变化以 exp3 为步长递增 var，exp3 是可选的，默认为1。

# 泛型for循环

语法格式：

```lua
--打印数组a的所有值  a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i, v)
end

输出：
1       one
2       two
3       three 
```

i是数组索引值，v是对应索引的数组元素值。ipairs是Lua提供的一个迭代器函数，用来迭代数组。

# 数组

相同数据类型的元素按一定顺序排列的集合

```lua
array = {"Lua", "Tutorial"}
for i= 0, 2 do
   print(array[i])
end
```

数组的索引可以是数字或者是字符串

```lua
-- table_test.lua 脚本文件  
a = {}  
a["key"] = "value"  
key = 10  
a[key] = 22  
a[key] = a[key] + 11  
for k, v in pairs(a) do  
    print(k .. " : " .. v)  
end
```

执行结果为：

```lua
key : value
10 : 33
```

# table(表)

table 是 一种数据结构，用来创建不同的数据类型，如：数组、字典等

```lua
fruits = {"banana","orange","apple"}

-- 初始化表
mytable = {}

-- 指定值
mytable[1]= "Lua"

-- 移除引用
mytable = nil
-- lua 垃圾回收会释放内存
```

# 对象

对象由属性和方法组成。LUA中需要用table来描述对象的属性。


