## 1. 图方向

- TB，从上到下
- TD，从上到下
- BT，从下到上
- RL，从右到左
- LR，从左到右

T = TOP，B = BOTTOM，L = LEFT，R = RIGHT，D = DOWN

## 2. 节点形状

- 默认节点 A
- 文本节点 B[bname]
- 圆角节点 C(cname)
- 圆形节点 D((dname))
- 非对称节点 E>ename]
- 菱形节点 F{fname}

```mermaid
graph TB
  A
  B[bname]
  C(cname)
  D((dname))
  E>ename]
  F{fname}
```

## 3. 连线

节点间的连接线有多种形状，可以在连接线中加入标签：

+ 箭头连接 `A1–->B1`
+ 开放连接 `A2—B2`
+ 标签连接 `A3–text—B3`
+ 箭头标签连接 `A4–text–>B4`
+ 虚线开放连接 `A5.-B5`
+ 虚线箭头连接 `A6-.->B6`
+ 标签虚线连接 `A7-.text.-B7`
+ 标签虚线箭头连接 `A8-.text.->B8`
+ 粗线开放连接 `A===B9`
+ 粗线箭头连接 `A10==>B10`
+ 标签粗线开放连接 `A11==text===B11`
+ 标签粗线箭头连接 `A12==text==>B12`

```mermaid
graph TB
  A1-->B1
  A2---B2
  A3--text---B3
  A4--text-->B4
  A5-.-B5
  A6-.->B6
  A7-.text.-B7
  A8-.text.->B8
  A9===B9
  A10==>B10
  A11==text===B11
  A12==text==>B12
```
##  4. 流程图

### 4.1 横向流程图

```mermaid
graph LR
A[方形] --> B(圆角)
    B --> C{条件a}
    C --> |a=1| D[结果1]
    C --> |a=2| E[结果2]
    F[横向流程图]
```

### 4.2 竖向流程图

```mermaid
graph TD
A[方形] --> B(圆角)
    B --> C{条件a}
    C --> |a=1| D[结果1]
    C --> |a=2| E[结果2]
    F[竖向流程图]
```

### 4.3 标准流程图

```flow
st=>start: 开始框
op=>operation: 处理框
cond=>condition: 判断框
sub1=>subroutine: 子流程
io=>inputoutput: 输入输出框
e=>end: 结束框
st->op->cond
cond(yes)->io->e
cond(no)->sub1(right)->op
```

### 4.4 标准流程图(横向)

```flow
st=>start: 开始框
op=>operation: 处理框
cond=>condition: 判断框(是或否?)
sub1=>subroutine: 子流程
io=>inputoutput: 输入输出框
e=>end: 结束框
st(right)->op(right)->cond
cond(yes)->io(bottom)->e
cond(no)->sub1(right)->op
```

## 5. UML时序图

### 5.1 UML时序图

```sequence
对象A->对象B: 对象B你好吗? (请求)
Note right of 对象B: 对象B的描述
Note left of 对象A: 对象A的描述(提示)
对象B --> 对象A: 我很好(响应)
对象A --> 对象B: 你真的好吗?
```

### 5.2 UML时序图复杂样例

```sequence
Title: 标题: 复杂使用
对象A -> 对象B: 对象B你好吗? (请求)
Note right of 对象B: 对象B的描述
Note right of 对象A: 对象A的描述(提示)
对象B --> 对象A: 我很好(响应)
对象B --> 小三: 你好吗?
小三 -> 对象A: 对象B找我了
对象A --> 对象B: 你真的好吗?
Note over 小三, 对象B: 我们是朋友
participant C
Note right of C: 没人陪我玩
```

### 5.3 UML标准时序图样例

```mermaid
%%时序图例子, -> 实线, --> 虚线, ->> 实线箭头
    sequenceDiagram
        participant 张三
        participant 李四
        张三 -> 王五: 王五你好吗?
        loop 健康检查
            王五 -> 王五: 与疾病战斗
        end
        Note right of 王五: 合理饮食 <br/>看医生...
        李四 ->> 张三: 很好!
        王五 -> 李四: 你怎么样?
        李四 --> 王五: 很好!
            
```

## 6. 甘特图样例

```mermaid
%%语法示例
    gantt
    dateFormat YYYY-MM-DD
    title 软件开发甘特图
    
    section 设计
    需求  :done, des1, 2014-01-06, 2014-01-08
    原型  :active, des2, 2014-01-09, 3d
    UI设计    :des3, after des2, 5d
    未来任务:   :des4, after des3, 5d
    
    section 开发
    学习准备理解需求    :crit, done, 2014-01-06, 24h
    设计框架    :crit, done, after des2, 2d
    开发  :crit, active, 3d
    未来任务    :crit, 5d
    耍   :2d
    
    section 测试
    功能测试    :active, a1, after des3, 3d
    压力测试    :after a1, 20h
    测试报告    :48h
```

## 7. 饼图

饼图用于数据展示与统计，可以方便看出占比

语法：

```
pie
 title 标题
 "key1" : value1
 "cats" : value2
```

示例：

养宠物占比图

```mermaid
pie
 title Pie Chart
 "Dogs" : 386
 "cats" : 567
 "rabbit" : 700
 "pig":365
 "tiger" : 15
```

## 8. 类图

```mermaid
classDiagram
class Base{
<<interface>>
}
class Shape{
    <<interface>>
    noOfVertices
    draw()
}
class Color{
    <<enumeration>>
    RED
    BLUE
    GREEN
    WHITE
    BLACK
}
Base <|.. Shape
Shape o--Color

class Rect{
draw()
double width
double length
}
Shape <|-- Rect

class Circle{
draw()
r
}
Shape <|-- Circle

```

## 9. 用户旅程图

```mermaid
journey
    title 我的一天
    section 早上
      吃饭: 5: Me
      跑步: 3: Me
      冲凉: 1: Me, Cat
    section 工作时间
       坐地铁到公司: 5 :Me
       上班: 5:Me
    section 晚上
      看书: 5: Me
      睡觉: 5: Me

```

## 10. 状态图

```mermaid
stateDiagram-v2
    [*] --> First
    First --> Second
    First --> Third

    state First {
        [*] --> fir
        fir --> [*]
    }
    state Second {
        [*] --> sec
        sec --> [*]
    }
    state Third {
        [*] --> thi
        thi --> [*]
    }

```



