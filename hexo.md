+ 博客网址：https://Lanservery.github.io

+ 写文章

  ```console
  hexo new [layout] "postName" 
  #新建文章。layout是可选参数，默认值为post。
  postName是md文件的名字，会出现在文章的URL地址中
  ```

+ 模板

  ```markdown
  title: postName #文章页面上的显示名称，可以任意修改，不会出现在URL中
  date: 2013-12-02 15:30:16 #文章生成时间，一般不改，当然也可以任意修改
  categories: #文章分类目录，可以为空，注意:后面有个空格
  tags: #文章标签，可空，多标签请用格式[tag1,tag2,tag3]，注意:后面有个空格
  description: 你对本页的描述
  ---
  这里开始使用markdown格式输入你的正文。
  ```

+ **删除文章**：直接在本地目录删除。