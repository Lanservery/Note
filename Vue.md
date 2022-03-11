# 起步

Vue 应用需要通过实例化 Vue 来实现
语法格式：

```html
var vm = new Vue({
  // 选项
})
```

# 插值

## 文本

使用 {{...}} 文本插值：

```html
<div id="app">
  <p>{{ message }}</p>
</div>
```

## Html

`v-html` 指令用于输出 html 代码：

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

## 属性

使用 v-bind 指令：

```html
<div v-bind:class="{'class1': use}">
```

# 参数

参数在指令后以冒号指明：

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

# 修饰符

修饰符是以半角句号 . 指明的特殊后缀，用于指出一个指令应该以特殊方式绑定。例如，.prevent 修饰符告诉 v-on 指令对于触发的事件调用 event.preventDefault()：

```html
<form v-on:submit.prevent="onSubmit"></form>
```

# 用户输入

在 input 输入框使用 `v-model` 指令来实现双向数据绑定：

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

# 过滤器

Vue.js 允许自定义过滤器，被用作一些常见的文本格式化。由"管道符"指示, 格式如下：

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

# 条件语句

## v-if

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

## v-else

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

## v-else-if

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

## v-show

 v-show 指令来根据条件展示元素：

```html
<h1 v-show="ok">Hello!</h1>
```

# 循环语句

`v-for` 绑定数据到数组来渲染一个列表：

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

`v-for` 迭代对象

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

`v-for` 迭代整数：

```html
<div id="app">
  <ul>
    <li v-for="n in 10">
     {{ n }}
    </li>
  </ul>
</div>
```

# 计算属性

关键词: `computed`。

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

## setter

`computed `属性默认只有 `getter` ，不过在需要时可提供一个` setter` ：

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

# 监听属性

通过 watch 来监听响应数据的变化

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

# 样式绑定

class 属性绑定

可以为 v-bind:class 设置一个对象，从而动态的切换 class:

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

# 事件处理器

事件监听使用 v-on 指令：

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

# 表单

  可以用 v-model 指令在表单控件元素上创建双向数据绑定。

## 输入框

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

# 组件

注册一个全局组件语法格式如下：

```html
Vue.component(tagName, options)
```

tagName 为组件名，options 为配置选项。注册后，我们可以使用以下方式来调用组件：

```html
<tagName></tagName>
```

## 全局组件

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

## 局部组件

可以在实例选项中注册局部组件，这样组件只能在这个实例中使用：

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

# 路由

Vue.js 路由允许我们通过不同的 URL 访问不同的内容。
