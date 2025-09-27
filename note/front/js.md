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




# 闭包

闭包指子函数可以访问外部作用域变量的函数特性，即使在子函数作用域外也可以访问。如果没有闭包那么在处理事件绑定，异步请求时都会变得困难。

- ==JS中的所有函数都是闭包==
- 闭包一般在子函数本身作用域以外执行，即延伸作用域



# 异步编程



# 原型

![image-20250827221207251](https://s2.loli.net/2025/08/27/awTVyLqu5QMj2C9.png)

+ `prototype` 原型
+ `__prototype__` 隐式原型，在对象属性中用 `[[prototype]]` 表示，所有对象都有一个隐式原型指向==方法对象==的原型
+ `constructor` 构造器，原型包含一个 `constructor` 指向方法函数





# WebApi

+ documnet.body: 获取 body 元素
+ document.documentElement: 获取整个 html 元素
+ document.getElementById(id): 通过 id 获取元素
+ document.getElementByName(name): 通过 name 获取元素
+ document.**getElementsByTagName(tag)**: 通过标签名获取元素
+ document.**getElementsByClassName(class)**: 通过类样式获取元素
+ document.**querySelector(selector)**: 通过 CSS 样式选择器获取元素
+ document.**querySelectorAll(selector)**: 通过 CSS 选择器获取元素

> ==注意==
>
> `querySelectorAll` 方法获取的是一个静态的伪数组,其他方法获取的则是一个实时动态的伪数组
>
> 有`id`的元素会自动成为`window`对象的属性,可以直接引用,但是不建议使用

![image-20250920235247917](https://s2.loli.net/2025/09/20/BmOQ4f61Suew3vr.png)

























