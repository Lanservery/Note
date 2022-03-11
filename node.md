# 安装制定版本模块

```
npm install ws@1.1.1
```

# 创建模块(初始化项目)

```
npm init
```

# 安装模块到本地

```
npm install <package> --save-dev
# 添加到 devDependencies
```

# 更新模块

```
npm update <package>
# 把当前目录下`node_modules`的对应模块更新至最新版本
```

# 运行指定脚本

```
npm run scricts-name 
or 
yarn scripts-name
```

# 回调函数

函数作为参数使用。例如，一边读取文件，一边执行其他命令，在文件读取完成后，将文件内容作为回调函数的参数返回。

```javascript
// 可以看作先处理 fs.readFile('input.txt')，再把结果传入function函数执行
var fs = require("fs");
// fs.readFile()把结果转到 data 这里继续执行
fs.readFile('input.txt', function (err, data) {
    if (err) return console.error(err);
    console.log(data.toString());
});

console.log("程序执行结束!"); 

等价于：

var fs = require("fs");

fs.readFile('input.txt', function (err, data) {
    if (err) return console.error(err);
    console.log(data.toString());
});

console.log("程序执行结束!"); 
```

# 同步与异步

同步：同步就是你要做的事你列了一个清单，按照清单上的顺序 一个一个执行

异步：就是可以同时干好几件事

# on 函数

 `on`方法用来绑定一个事件，需要传入事件名称(前提是有这个事件)和对应的处理函数

# send('信息')

传送响应信息

# 模块

模块没有类的概念，使用时除了`require`引用外，需要`new `一下，如：

```javascript
 var Hello = require('./hello'); 
 hello = new Hello();
```