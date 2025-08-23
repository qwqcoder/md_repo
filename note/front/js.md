# 引入

+ `<script>`

  + `type` 属性用于指定脚本的类型

  1. type = "text/javascript"

  > 这是传统的 JavaScript 脚本类型声明，也是早期 HTML 中最常用的方式。在 HTML5 中，这个值可以省略，因为浏览器会默认将 `<script>` 标签视为 JavaScript 脚本。

  ```html
  <script type="text/javascript">
    console.log("这是普通脚本");
  </script>
  ```

  2. type="module"

  > 表示当前脚本是一个 ES6 模块（Module），可以使用 `import` 和 `export` 语法进行模块导入导出，且模块内的变量默认具有块级作用域（不会污染全局）。

  ```html
  <script type="module">
    import { func } from './module.js';
    func();
  </script>
  ```

  

# 原型

![image-20250823110058258](https://book-borrow-project.oss-cn-beijing.aliyuncs.com/hexo/image-20250823110058258.png)

+ `prototype` 原型
+ `__prototype__` 隐式原型，在对象属性中用 `[[prototype]]` 表示，所有对象都有一个隐式原型指向==方法对象==的原型
+ `constructor` 构造器，原型包含一个 `constructor` 指向方法函数

