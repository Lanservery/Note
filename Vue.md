## 1. 介绍
Vue.js（读音 /vjuː/, 类似于 view） 是一套构建用户界面的渐进式框架。

Vue 只关注视图层， 采用自底向上增量开发的设计。

Vue 的目标是通过尽可能简单的 API 实现响应的数据绑定和组合的视图组件。

## 2. 目录结构

 目录/文件 | 说明
 :---:|:--:
 build  | 项目构建(webpack)相关代码
config|配置目录，包括端口号等。我们初学可以使用默认的
node_modules |npm 加载的项目依赖模块
src |这里是我们要开发的目录，基本上要做的事情都在这个目录里。里面包含了几个目录及文件：a. assets: 放置一些图片，如logo等。b. components: 目录里面放了一个组件文件，可以不用。c. App.vue: 项目入口文件，我们也可以直接将组件写这里，而不使用 components 目录。d. main.js: 项目的核心文件。
static |静态资源目录，如图片、字体等
test | 初始测试目录，可删除
.xxxx文件 | 这些是一些配置文件，包括语法配置，git配置等。
index.html | 首页入口文件，你可以添加一些 meta 信息或统计代码
package.json | 项目配置文件。
README.md | 项目的说明文档，markdown 格式

## 3. 起步
每个 Vue 应用都需要通过实例化 Vue 来实现。
语法格式如下：

```html
var vm = new Vue({
  // 选项
})
```
实例

```html
<div id="vue_det">
    <h1>site : {{site}}</h1>
    <h1>url : {{url}}</h1>
    <h1>{{details()}}</h1>
</div>
<script type="text/javascript">
    var vm = new Vue({
        el: '#vue_det',
        data: {
            site: "菜鸟教程",
            url: "www.runoob.com",
            alexa: "10000"
        },
        methods: {
            details: function() {
                return  this.site + " - 学的不仅是技术，更是梦想！";
            }
        }
    })
</script>
```
+ el：它是 DOM 元素中的 id
+ data：用于定义属性
+ methods：用于定义的函数，可以通过 return 来返回函数值。
+ {{ }} 用于输出对象属性和函数返回值。

除了数据属性，Vue 实例还提供了一些有用的实例属性与方法。它们都有前缀 $，以便与用户定义的属性区分开来，如：

```html
document.write(vm.$el === document.getElementById('vue_det')) // true
```
## 4. 模板语法
Vue.js 使用了基于 HTML 的模板语法，允许开发者声明式地将 DOM 绑定至底层 Vue 实例的数据。

### 4.1插值

文本

数据绑定最常见的形式就是使用 {{...}}（双大括号）的文本插值：

```html
<div id="app">
  <p>{{ message }}</p>
</div>
```
Html

使用 v-html 指令用于输出 html 代码：

```html
<div id="app">
    <div v-html="message"></div>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: '<h1>菜鸟教程</h1>'
  }
})
</script>
```
### 4.2 属性

HTML 属性中的值应使用 v-bind 指令。
```html
<div v-bind:class="{'class1': use}">
```
### 4.3 表达式

Vue.js 都提供了完全的 JavaScript 表达式支持。
```html
<div id="app">
    {{5+5}}<br>
    {{ ok ? 'YES' : 'NO' }}<br>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    ok: true,
  }
})
</script>
```
### 4.4 指令

指令是带有 v- 前缀的特殊属性。

指令用于在表达式的值改变时，将某些行为应用到 DOM 上。如下例子：
```html
<div id="app">
    <p v-if="seen">现在你看到我了</p>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    seen: true
  }
})
</script>
```
### 4.5 参数

参数在指令后以冒号指明。例如， v-bind 指令被用来响应地更新 HTML 属性：
```html
<div id="app">
    <pre><a v-bind:href="url">菜鸟教程</a></pre>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    url: 'http://www.runoob.com'
  }
})
</script>
//href 是参数，告知 v-bind 指令将该元素的 href 属性与表达式 url 的值绑定。
```
v-on 指令，它用于监听 DOM 事件：
```html
<a v-on:click="doSomething">
```
### 4.6 修饰符

修饰符是以半角句号 . 指明的特殊后缀，用于指出一个指令应该以特殊方式绑定。例如，.prevent 修饰符告诉 v-on 指令对于触发的事件调用 event.preventDefault()：
```html
<form v-on:submit.prevent="onSubmit"></form>
```
### 4.7 用户输入

在 input 输入框中我们可以使用 v-model 指令来实现双向数据绑定：
```html
<div id="app">
    <p>{{ message }}</p>
    <input v-model="message">
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: 'Runoob!'
  }
})
</script>
```
v-model 指令用来在 input、select、textarea、checkbox、radio 等表单控件元素上创建双向数据绑定，根据表单上的值，自动更新绑定的元素的值。

按钮的事件我们可以使用 v-on 监听事件，并对用户的输入进行响应。
```html
<div id="app">
    <p>{{ message }}</p>
    <button v-on:click="reverseMessage">反转字符串</button>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: 'Runoob!'
  },
  methods: {
    reverseMessage: function () {
      this.message = this.message.split('').reverse().join('')
    }
  }
})
</script>
```
### 4.8 过滤器

Vue.js 允许你自定义过滤器，被用作一些常见的文本格式化。由"管道符"指示, 格式如下：
```html
<!-- 在两个大括号中 -->
{{ message | capitalize }}

<!-- 在 v-bind 指令中 -->
<div v-bind:id="rawId | formatId"></div>
//过滤器函数接受表达式的值作为第一个参数。
```
过滤器可以串联：
```html
{{ message | filterA | filterB }}
```
过滤器是 JavaScript 函数，因此可以接受参数：
```html
{{ message | filterA('arg1', arg2) }}
```
这里，message 是第一个参数，字符串 'arg1' 将传给过滤器作为第二个参数， arg2 表达式的值将被求值然后传给过滤器作为第三个参数。

### 4.9 缩写

v-bind 缩写
```html
<!-- 完整语法 -->
<a v-bind:href="url"></a>
<!-- 缩写 -->
<a :href="url"></a>
```
v-on 缩写
```html
<!-- 完整语法 -->
<a v-on:click="doSomething"></a>
<!-- 缩写 -->
<a @click="doSomething"></a>
```
## 5. 条件语句
v-if

在元素 和 template 中使用 v-if 指令：
```html
<div id="app">
    <p v-if="seen">现在你看到我了</p>
    <template v-if="ok">
      <h1>菜鸟教程</h1>
      <p>学的不仅是技术，更是梦想！</p>
      <p>哈哈哈，打字辛苦啊！！！</p>
    </template>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    seen: true,
    ok: true
  }
})
</script>
```
v-else

可以用 v-else 指令给 v-if 添加一个 "else" 块：
```html
<div id="app">
    <div v-if="Math.random() > 0.5">
      Sorry
    </div>
    <div v-else>
      Not sorry
    </div>
</div>
    
<script>
new Vue({
  el: '#app'
})
</script>
//随机生成一个数字，判断是否大于0.5，然后输出对应信息
```
v-else-if
用作 v-if 的 else-if 块。可以链式的多次使用：
```html
//判断 type 变量的值
<div id="app">
    <div v-if="type === 'A'">
      A
    </div>
    <div v-else-if="type === 'B'">
      B
    </div>
    <div v-else-if="type === 'C'">
      C
    </div>
    <div v-else>
      Not A/B/C
    </div>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    type: 'C'
  }
})
</script>
//v-else 、v-else-if 必须跟在 v-if 或者 v-else-if之后。
```
v-show

 v-show 指令来根据条件展示元素：
 ```html
 <h1 v-show="ok">Hello!</h1>
 ```
## 6. 循环语句
v-for 指令需要以 site in sites 形式的特殊语法， sites 是源数据数组并且 site 是数组元素迭代的别名。

v-for 可以绑定数据到数组来渲染一个列表：
```html
<div id="app">
  <ol>
    <li v-for="site in sites">
      {{ site.name }}
    </li>
  </ol>
</div>
 
<script>
new Vue({
  el: '#app',
  data: {
    sites: [
      { name: 'Runoob' },
      { name: 'Google' },
      { name: 'Taobao' }
    ]
  }
})
</script>
```
v-for 迭代对象
```html
<div id="app">
  <ul>
    <li v-for="value in object">
    {{ value }}
    </li>
  </ul>
</div>
 
<script>
new Vue({
  el: '#app',
  data: {
    object: {
      name: '菜鸟教程',
      url: 'http://www.runoob.com',
      slogan: '学的不仅是技术，更是梦想！'
    }
  }
})
</script>
```
可以提供第二个的参数为键名：
```html
<div id="app">
  <ul>
    <li v-for="(value, key) in object">
    {{ key }} : {{ value }}
    </li>
  </ul>
</div>
```
第三个参数为索引：
```html
<div id="app">
  <ul>
    <li v-for="(value, key, index) in object">
     {{ index }}. {{ key }} : {{ value }}
    </li>
  </ul>
</div>
```
v-for 迭代整数：
```html
<div id="app">
  <ul>
    <li v-for="n in 10">
     {{ n }}
    </li>
  </ul>
</div>
```
## 7. 计算属性
计算属性关键词: computed。
```html
<div id="app">
  <p>原始字符串: {{ message }}</p>
  <p>计算后反转字符串: {{ reversedMessage }}</p>
</div>
 
<script>
var vm = new Vue({
  el: '#app',
  data: {
    message: 'Runoob!'
  },
  computed: {
    // 计算属性的 getter
    reversedMessage: function () {
      // `this` 指向 vm 实例
      return this.message.split('').reverse().join('')
    }
  }
})
</script>
```
实例 2 中声明了一个计算属性 reversedMessage 。

提供的函数将用作属性 vm.reversedMessage 的 getter 。

vm.reversedMessage 依赖于 vm.message，在 vm.message 发生改变时，vm.reversedMessage 也会更新。

computed setter

computed 属性默认只有 getter ，不过在需要时你也可以提供一个 setter ：
```html
var vm = new Vue({
  el: '#app',
  data: {
    name: 'Google',
    url: 'http://www.google.com'
  },
  computed: {
    site: {
      // getter
      get: function () {
        return this.name + ' ' + this.url
      },
      // setter
      set: function (newValue) {
        var names = newValue.split(' ')
        this.name = names[0]
        this.url = names[names.length - 1]
      }
    }
  }
})
// 调用 setter， vm.name 和 vm.url 也会被对应更新
vm.site = '菜鸟教程 http://www.runoob.com';
document.write('name: ' + vm.name);
document.write('<br>');
document.write('url: ' + vm.url);
```
##  8. 监听属性
我们可以通过 watch 来监听响应数据的变化
```html
<div id = "app">
    <p style = "font-size:25px;">计数器: {{ counter }}</p>
    <button @click = "counter++" style = "font-size:25px;">点我</button>
</div>
<script type = "text/javascript">
var vm = new Vue({
    el: '#app',
    data: {
        counter: 1
    }
});
vm.$watch('counter', function(nval, oval) {
    alert('计数器值的变化 :' + oval + ' 变为 ' + nval + '!');
});
</script>
```
## 9. 样式绑定
class 属性绑定

我们可以为 v-bind:class 设置一个对象，从而动态的切换 class:
```html
<div v-bind:class="{ 'active': isActive }"></div>
```
可以在对象中传入更多属性用来动态切换多个 class 。
```html
<div class="static"
     v-bind:class="{ 'active' : isActive, 'text-danger' : hasError }">
</div>
```
可以直接绑定数据里的一个对象：
```html
<div id="app">
  <div v-bind:class="classObject"></div>
</div>
```
数组语法
```html
<div v-bind:class="[activeClass, errorClass]"></div>
```
可以使用三元表达式来切换列表中的 class ：
```html
<div v-bind:class="[errorClass ,isActive ? activeClass : '']"></div>
```
Vue.js style(内联样式)
```html
<div id="app">
    <div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }">菜鸟教程</div>
</div>
```
也可以直接绑定到一个样式对象，让模板更清晰：
```html
<div id="app">
  <div v-bind:style="styleObject">菜鸟教程</div>
</div>
```
v-bind:style 可以使用数组将多个样式对象应用到一个元素上：
```html
<div id="app">
  <div v-bind:style="[baseStyles, overridingStyles]">菜鸟教程</div>
</div>
```
## 10. 事件处理器
事件监听可以使用 v-on 指令：
```html
<div id="app">
  <button v-on:click="counter += 1">增加 1</button>
  <p>这个按钮被点击了 {{ counter }} 次。</p>
</div>
 
<script>
new Vue({
  el: '#app',
  data: {
    counter: 0
  }
})
</script>
```
事件修饰符

Vue.js 通过由点 . 表示的指令后缀来调用修饰符。
+ .stop - 阻止冒泡
+ .prevent - 阻止默认事件
+ .capture - 阻止捕获
+ .self - 只监听触发该元素的事件
+ .once - 只触发一次
+ .left - 左键事件
+ .right - 右键事件
+ .middle - 中间滚轮事件
```html
<!-- 阻止单击事件冒泡 -->
<a v-on:click.stop="doThis"></a>
<!-- 提交事件不再重载页面 -->
<form v-on:submit.prevent="onSubmit"></form>
<!-- 修饰符可以串联  -->
<a v-on:click.stop.prevent="doThat"></a>
<!-- 只有修饰符 -->
<form v-on:submit.prevent></form>
<!-- 添加事件侦听器时使用事件捕获模式 -->
<div v-on:click.capture="doThis">...</div>
<!-- 只当事件在该元素本身（而不是子元素）触发时触发回调 -->
<div v-on:click.self="doThat">...</div>

<!-- click 事件只能点击一次，2.1.4版本新增 -->
<a v-on:click.once="doThis"></a>
```
按键修饰符

Vue 允许为 v-on 在监听键盘事件时添加按键修饰符：
```html
<!-- 只有在 keyCode 是 13 时调用 vm.submit() -->
<input v-on:keyup.13="submit">
```
Vue 最常用的按键别名：
```html
<!-- 同上 -->
<input v-on:keyup.enter="submit">
<!-- 缩写语法 -->
<input @keyup.enter="submit">
```
全部的按键别名：

+ .enter
+ .tab
+ .delete (捕获 "删除" 和 "退格" 键)
+ .esc
+ .space
+ .up
+ .down
+ .left
+ .right
+ .ctrl
+ .alt
+ .shift
+ .meta
实例
```html
<p><!-- Alt + C -->
<input @keyup.alt.67="clear">
<!-- Ctrl + Click -->
<div @click.ctrl="doSomething">Do something</div>
```
## 11. 表单
可以用 v-model 指令在表单控件元素上创建双向数据绑定。
输入框

实例中演示了 input 和 textarea 元素中使用 v-model 实现双向数据绑定：
```html
<div id="app">
  <p>input 元素：</p>
  <input v-model="message" placeholder="编辑我……">
  <p>消息是: {{ message }}</p>
    
  <p>textarea 元素：</p>
  <p style="white-space: pre">{{ message2 }}</p>
  <textarea v-model="message2" placeholder="多行文本输入……"></textarea>
</div>
 
<script>
new Vue({
  el: '#app',
  data: {
    message: 'Runoob',
    message2: '菜鸟教程\r\nhttp://www.runoob.com'
  }
})
</script>
```
复选框

复选框如果是一个为逻辑值，如果是多个则绑定到同一个数组

修饰符

.lazy

在默认情况下， v-model 在 input 事件中同步输入框的值与数据，但你可以添加一个修饰符 lazy ，从而转变为在 change 事件中同步：
```html
<!-- 在 "change" 而不是 "input" 事件中更新 -->
<input v-model.lazy="msg" >
```
.number
如果想自动将用户的输入值转为 Number 类型（如果原值的转换结果为 NaN 则返回原值），可以添加一个修饰符 number 给 v-model 来处理输入值：
```html
<input v-model.number="age" type="number">
```
.trim
如果要自动过滤用户输入的首尾空格，可以添加 trim 修饰符到 v-model 上过滤输入：
```html
<input v-model.trim="msg">
```
## 12. 组件
注册一个全局组件语法格式如下：
```html
Vue.component(tagName, options)
```
tagName 为组件名，options 为配置选项。注册后，我们可以使用以下方式来调用组件：
```html
<tagName></tagName>
```
全局组件

所有实例都能用全局组件。
```html
<div id="app">
    <runoob></runoob>
</div>
 
<script>
// 注册
Vue.component('runoob', {
  template: '<h1>自定义组件!</h1>'
})
// 创建根实例
new Vue({
  el: '#app'
})
</script>
```
局部组件

我们也可以在实例选项中注册局部组件，这样组件只能在这个实例中使用：
```html
<div id="app">
    <runoob></runoob>
</div>
 
<script>
var Child = {
  template: '<h1>自定义组件!</h1>'
}
 
// 创建根实例
new Vue({
  el: '#app',
  components: {
    // <runoob> 将只在父模板可用
    'runoob': Child
  }
})
</script>
```
Prop

prop 是子组件用来接受父组件传递过来的数据的一个自定义属性。

父组件的数据需要通过 props 把数据传给子组件，子组件需要显式地用 props 选项声明 "prop"：
```html
<div id="app">
    <child message="hello!"></child>
</div>
 
<script>
// 注册
Vue.component('child', {
  // 声明 props
  props: ['message'],
  // 同样也可以在 vm 实例中像 "this.message" 这样使用
  template: '<span>{{ message }}</span>'
})
// 创建根实例
new Vue({
  el: '#app'
})
</script>
```
动态 Prop

类似于用 v-bind 绑定 HTML 特性到一个表达式，也可以用 v-bind 动态绑定 props 的值到父组件的数据中。每当父组件的数据变化时，该变化也会传导给子组件：
```html
<div id="app">
    <div>
      <input v-model="parentMsg">
      <br>
      <child v-bind:message="parentMsg"></child>
    </div>
</div>
 
<script>
// 注册
Vue.component('child', {
  // 声明 props
  props: ['message'],
  // 同样也可以在 vm 实例中像 "this.message" 这样使用
  template: '<span>{{ message }}</span>'
})
// 创建根实例
new Vue({
  el: '#app',
  data: {
    parentMsg: '父组件内容'
  }
})
</script>
```
Prop 验证
type 可以是下面原生构造器：

+ String
+ Number
+ Boolean
+ Array
+ Object
+ Date
+ Function
+ Symbol
type 也可以是一个自定义构造器，使用 instanceof 检测。

## 13. 组件 - 自定义事件
父组件是使用 props 传递数据给子组件，但如果子组件要把数据传递回去，就需要使用自定义事件！

我们可以使用 v-on 绑定自定义事件, 每个 Vue 实例都实现了事件接口(Events interface)，即：
+ 使用 $on(eventName) 监听事件
+ 使用 $emit(eventName) 触发事件
另外，父组件可以在使用子组件的地方直接用 v-on 来监听子组件触发的事件。

## 14. 自定义指令
除了默认设置的核心指令( v-model 和 v-show ), Vue 也允许注册自定义指令。

钩子函数

指令定义函数提供了几个钩子函数（可选）：

+ bind: 只调用一次，指令第一次绑定到元素时调用，用这个钩子函数可以定义一个在绑定时执行一次的初始化动作。

+ inserted: 被绑定元素插入父节点时调用（父节点存在即可调用，不必存在于 document 中）。

+ update: 被绑定元素所在的模板更新时调用，而不论绑定值是否变化。通过比较更新前后的绑定值，可以忽略不必要的模板更新（详细的钩子函数参数见下）。

+ componentUpdated: 被绑定元素所在模板完成一次更新周期时调用。

+ unbind: 只调用一次， 指令与元素解绑时调用。

钩子函数参数

钩子函数的参数有：

+ el: 指令所绑定的元素，可以用来直接操作 DOM 。
+ binding: 一个对象，包含以下属性：
+ name: 指令名，不包括 v- 前缀。
+ value: 指令的绑定值， 例如： v-my-directive="1 + 1", value 的值是 2。
+ oldValue: 指令绑定的前一个值，仅在 update 和 componentUpdated 钩子中可用。无论值是否改变都可用。
+ expression: 绑定值的表达式或变量名。 例如 v-my-directive="1 + 1" ， expression 的值是 "1 + 1"。
+ arg: 传给指令的参数。例如 v-my-directive:foo， arg 的值是 "foo"。
+ modifiers: 一个包含修饰符的对象。 例如： v-my-directive.foo.bar, 修饰符对象 modifiers 的值是 { foo: true, bar: true }。
+ vnode: Vue 编译生成的虚拟节点。
+ oldVnode: 上一个虚拟节点，仅在 update 和 componentUpdated 钩子中可用。

## 15. 路由
Vue.js 路由允许我们通过不同的 URL 访问不同的内容。

`<router-link>` 是一个组件，该组件用于设置一个导航链接，切换不同 HTML 内容。 to 属性为目标地址， 即要显示的内容。

### `<router-link>` 相关属性
to

表示目标路由的链接。 当被点击后，内部会立刻把 to 的值传到 router.push()，所以这个值可以是一个字符串或者是描述目标位置的对象。
```html
<!-- 字符串 -->
<router-link to="home">Home</router-link>
<!-- 渲染结果 -->
<a href="home">Home</a>

<!-- 使用 v-bind 的 JS 表达式 -->
<router-link v-bind:to="'home'">Home</router-link>

<!-- 不写 v-bind 也可以，就像绑定别的属性一样 -->
<router-link :to="'home'">Home</router-link>

<!-- 同上 -->
<router-link :to="{ path: 'home' }">Home</router-link>

<!-- 命名的路由 -->
<router-link :to="{ name: 'user', params: { userId: 123 }}">User</router-link>

<!-- 带查询参数，下面的结果为 /register?plan=private -->
<router-link :to="{ path: 'register', query: { plan: 'private' }}">Register</router-link>
```
replace

设置 replace 属性的话，当点击时，会调用 router.replace() 而不是 router.push()，导航后不会留下 history 记录。
```html
<router-link :to="{ path: '/abc'}" replace></router-link>
```
append

设置 append 属性后，则在当前 (相对) 路径前添加其路径。例如，我们从 /a 导航到一个相对路径 b，如果没有配置 append，则路径为 /b，如果配了，则为 /a/b
```html
<router-link :to="{ path: 'relative/path'}" append></router-link>
```
tag

有时候想要 <router-link> 渲染成某种标签，例如 <li>。 于是我们使用 tag prop 类指定何种标签，同样它还是会监听点击，触发导航。
```html
<router-link to="/foo" tag="li">foo</router-link>
<!-- 渲染结果 -->
<li>foo</li>
```
active-class

设置 链接激活时使用的 CSS 类名。可以通过以下代码来替代。
```html
<style>
   ._active{
      background-color : red;
   }
</style>
<p>
   <router-link v-bind:to = "{ path: '/route1'}" active-class = "_active">Router Link 1</router-link>
   <router-link v-bind:to = "{ path: '/route2'}" tag = "span">Router Link 2</router-link>
</p>
```
exact-active-class

配置当链接被精确匹配的时候应该激活的 class。可以通过以下代码来替代。
```html
<p>
   <router-link v-bind:to = "{ path: '/route1'}" exact-active-class = "_active">Router Link 1</router-link>
   <router-link v-bind:to = "{ path: '/route2'}" tag = "span">Router Link 2</router-link>
</p>
```
event

声明可以用来触发导航的事件。可以是一个字符串或是一个包含字符串的数组。
```html
<router-link v-bind:to = "{ path: '/route1'}" event = "mouseover">Router Link 1</router-link>
```
## 16. 过渡 & 动画
语法格式
```html
<transition name = "nameoftransition">
   <div></div>
</transition>
```
Vue在元素显示与隐藏的过渡中，提供了 6 个 class 来切换：

+ v-enter：定义进入过渡的开始状态。在元素被插入之前生效，在元素被插入之后的下一帧移除。

+ v-enter-active：定义进入过渡生效时的状态。在整个进入过渡的阶段中应用，在元素被插入之前生效，在过渡/动画完成之后移除。这个类可以被用来定义进入过渡的过程时间，延迟和曲线函数。

+ v-enter-to: 2.1.8版及以上 定义进入过渡的结束状态。在元素被插入之后下一帧生效 (与此同时 v-enter 被移除)，在过渡/动画完成之后移除。

+ v-leave: 定义离开过渡的开始状态。在离开过渡被触发时立刻生效，下一帧被移除。

+ v-leave-active：定义离开过渡生效时的状态。在整个离开过渡的阶段中应用，在离开过渡被触发时立刻生效，在过渡/动画完成之后移除。这个类可以被用来定义离开过渡的过程时间，延迟和曲线函数。

+ v-leave-to: 2.1.8版及以上 定义离开过渡的结束状态。在离开过渡被触发之后下一帧生效 (与此同时 v-leave 被删除)，在过渡/动画完成之后移除。

## 17. 混入
混入 (mixins)定义了一部分可复用的方法或者计算属性。混入对象可以包含任意组件选项。当组件使用混入对象时，所有混入对象的选项将被混入该组件本身的选项。

实例：
```html
var vm = new Vue({
    el: '#databinding',
    data: {
    },
    methods : {
    },
});
// 定义一个混入对象
var myMixin = {
    created: function () {
        this.startmixin()
    },
    methods: {
        startmixin: function () {
            document.write("欢迎来到混入实例");
        }
    }
};
var Component = Vue.extend({
    mixins: [myMixin]
})
var component = new Component();
```
## 18. 响应接口
例如以下实例，我们通过使用 $watch 属性来实现数据的监听，$watch 必须添加在 Vue 实例之外才能实现正确的响应。
```html
<div id = "app">
    <p style = "font-size:25px;">计数器: {{ counter }}</p>
    <button @click = "counter++" style = "font-size:25px;">点我</button>
</div>
<script type = "text/javascript">
var vm = new Vue({
    el: '#app',
    data: {
        counter: 1
    }
});
vm.$watch('counter', function(nval, oval) {
    alert('计数器值的变化 :' + oval + ' 变为 ' + nval + '!');
});
setTimeout(
    function(){
        vm.counter += 20;
    },10000
);
</script>
```
Vue.set

Vue.set 方法用于设置对象的属性，它可以解决 Vue 无法检测添加属性的限制，语法格式如下：
```html
Vue.set( target, key, value )
```
参数说明：

+ target: 可以是对象或数组
+ key : 可以是字符串或数字
+ value: 可以是任何类型

Vue.delete

Vue.delete 用于删除动态添加的属性 语法格式：
```html
Vue.delete( target, key )
```
参数说明：

+ target: 可以是对象或数组
+ key : 可以是字符串或数字
