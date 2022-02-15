**1、属性**

+ 点击魔法棒（先选择好组件）会让组件自动对齐。
+ 组件文字大小在“common Attributes”上设定，内容在“Declared Attributes"上设定。（不建议，最好定义一下）
+ wrap_content：包裹内容，即随着文字数量改变大小，按钮大小单位：`dp`。
+ match_constriant:自动适配。
+ 引导线百分比可在`layout_constrainGuide_percer`设置。
+ **layout_gravity**：可以设置控件的位置。
+ hint：提示。需要设置变量。
+ **text：问号：**\?。
+ contentDecription：为了方便识别按钮文字。
+ **变量属性可以选同一个。**

**6、与组件建立关联（在`onCreate()`函数里：）**

+ ```java
  textView=findViewById(R.id.textView3);
  ```

**7、资源绑定（后面全是id号）**

- 变量：`R.id.id1`

- 图片：`R.drawable.image1`

- 音频或视频：`R.raw.audio1`

- 布局：`R.layout.layout1`

- 字符：`R.string.Message`

**8、控件**

+ **Switch**：开关控件。

+ **RadioGroup**：放置RadioButton组件，达到单选效果。

+ **FloatingActionButton**：悬浮按钮。

+ 三点决定一个位置。

+ **ProgressBar**：进度条。（Horizontal:水平，勾选indeterminate会水平滚动）

+ **SeekBar**：滑条。（Discrete：间断点）

+ **AdView**：广告。
+ **Plain Test**:输入框。

**9、函数**

+ **与（&&）、或（||）、非( ! )**

+ **_photoLive.value!!**：表示非空。

+ **viewPager2[0] as RecyclerView**：类型转换为 RecyclerView。

+ **监听器**（最好使用内部匿名类实现。在`onCreate()`函数里定义）

  ```java
  button1.setOnClickListener();
  ```

+ **杀掉程序**

  ```java
  finish();
  ```

+ 变量的定义可以不是`id`名。Switch变量只能是`aSwitch`。

+ 类和函数默认为私有的Private

+ `System.currentTimeMillis()`：UNIX时间  1970-1-1。

+ 含有`ViewModelProviders`的代码段先写它，主要是修正其他设置。

+ **打印日记：**

  ```java
  Log.d(字符串1，字符串2，...);
  ```

+ Bundle类型可以容纳很多数据类型，如String，int，Float等。

+ StringBuilder修饰：可变字符变量。

+ getApplication()：获取全局访问。

+ 摧毁程序：

  ```java
  onDestroy(){
      方法体
  }
  ```

+ **小提示窗口：**

  ```java
  Toast.makeText(getApplicationContext(信息),String.valueOf(v)(值),Toast.LENGTH_SHORT(短时间显示)).show()(显示);
  ```

+ **设置图片：**`imageView.setImageResource(R.drawable.windows);`

+ ```java
  private MutableLiveData<Integer>(数据类型Integer类型) aTeamScore;
  ```

  

+ **监听函数**

  RatingBar、SeekBar、RadioGroup、Switch、CheckBox的~~对象~~用`.setOnCheckedChangeListener()`，其他用 `setOnClickListener()`，

+ **续监听函数**

  ```java
  button.setOnClickListener(View.OnClickListener(){});   //Button类
  ```
  
+ **设置文本**

  ```java
  对象.setText("左")
  ```

**10、技巧**

+ **重命名**最好右键“Refactor”改名，不然其他地方没改会出错。
+ **Shift+Alt+鼠标左键**：插入多个光标。
+ **Alt+Enter**：导入类。
+ menu的id要和Navigation的控件id一致，否则导航失败。
+ **改名**：在java中修改包名（com.example.xxx），右键 Refactor ->Remane （一路选择含有package的字段），在res中修改values下的strings.xml应用名，修改build.gradle(Module:app)文件中的包名，点击右上角 sync now即可。还有在setting.gradle(Project Settings)的“rootProject.name=”也改一下。
+ 数据库文件要三个。
+ MainActivity.java主要管理生命周期以及用户界面响应。数据操作则放在ViewModel里面实现。
+ 导航栏标题在navigation里改，在strings.xml引入资源。
+ **不用汉化就在Untranslatable列打勾。**
+ **数据绑定放在界面，逻辑放在.java文件。**
+ 注释：工具栏->Code->Comment with Line comment(使用 `//` 注释，Ctrl+/)，Comment with Block comment(使用`/*....*/`注释，Ctrl+Shift+/)。
+ 删除多余的 import：Code - > Optimize Imports。
+ 格式化代码：Code -> Reformart Code。格式化activity_main.xml文件代码：Code -> Rearrange Code。
+ **组件的对齐要选中两个以上才有效。**
+ 定义变量数据类型最好是软件提示的，会自动添加数据类库。
+ 最好多使用代码自动补齐，减少错误。
+ **画辅助线布局。**
+ **ActionBar**在MainActivity定义。
+ Superclass：androidx.lifecycle.AndroidViewModel：可以访问全局资源。
+ 程序发生翻转时会摧毁程序，造成数据丢失，要保存数据。
+ **Alt+鼠标左键**可以智能选择。
+ **Alt+j**：可以把相同的选中。
+ 相关网址：[Android开发](https://developer.android.com)

**12、androidx.lifecycle:lifecycle-viewmodel-savedstate:1.0.0-alpha01**