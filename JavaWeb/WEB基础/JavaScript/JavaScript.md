# JavaScript简介

+ JavaScript是一门跨平台、面向对象的脚本语言，用于控制网页行为，使得网页可交互
+ JavaScript 和 Java 是两种完全不同的语言，不论是概念还是设计。但是基础语法类似
+ JavaScript (简称：JS) 在1985 年有 **Brendan Eich** 发明,并于 1997 年成为 **ECMA** 标准
+ **ECMAScript 6 (ES6)** 是最新的 JavaScript 版本 (发布于 2015年)



# 引入方法

1. 外部脚本：将 **JS** 代码定义在外部 **JS文件** 中，然后引入到 HTML 页面中

   + 外部文件：**demo.js** 	`alert("hello JS ~");`
   + 引入外部 **JS** 文件：`<script src="../js/demo.js"></script>`

   ```html
   <script src="../js/demo.js"></script>
   ```

   

2. 内部脚本：将 **JS** 代码定义在HTML页面中

   在HTML中，JavaScript代码必须位于`<script>`与`</script>`标签之间

   + **注意**：HTML文档中任意位置可以放置任意数量`<script>`，但通常会统一放置在`<body>`元素底部，可以改善显示速度，因为脚本执行会拖慢显示

   ```html
   <script>
       alert("Hello JS ~");
   </script>
   ```

   



# 基础语法

+ **书写语法**

1. 区分大小写

2. 每行结尾的分号可有可无，最好是写

3. 注释

   ```javascript
   //单行注释
   /*
   * 多行注释
   * */
   ```

4. 大括号表示代码块

   ```javascript
   if(count == 3){
       alert(count);
   }
   ```

   

+ **输出语句**

1. 使用`window.alert()`写入警告框
2. 使用`document.write(hello js~)`写入页面
3. 使用`console.log(hello js~)`写入浏览器控制台



+ **变量**

1. JavaScript 使用 **var** 关键字(variable缩写) 来声名变量

   ```javascript
   var test = 20;
   test = "张三";
   ```

2. JavaScript 是一门弱类型语言，**变量可以存放不同类型的值**
3. 变量名命名规则
   + 组成字符可以是任意字母、数字、下划线或美元符号
   + 数字不能开头
   + 建议使用驼峰命名法

4. ECMAScript 6 新增了 **let** 关键字来定义变量，用法类似 **var** ，但是所声明的变量，只能在 **let** 关键字所在的代码块中有效，且不允许重复声明
5. ECMAScript 6 新增了 **const** 关键字，用于声明一个只读变量，一但声明就不能改变其值

```javascript
var test = 20;
{
    let tmp = 10;
}
alert(test);
alert(tmp);
```



# 数据类型



JavaScript 中数据类型分为：**原始类型** 和 **引用类型**

在JavaScript中，有一种被称为动态类型（Dynamic Typing）的类型系统。这意味着变量的类型是在运行时确定的，而不是在编写代码时静态确定的。JavaScript中的数据类型主要分为以下几类：

**5种原始类型：**

1. **number**：数字
2. **string**：字符、字符串、单双引号都可以
3. **boolean**：布尔
4. **null**：对象为空
5. **undefined**：当声明的变量未初始化时，该变量的默认值时undefined

==注意：typeof 对于 null类型的变量会返回 object值==

+ 正则表达式

```javascript
var reg = /^\w{6,12}$/
// /^ 表示开始,  /$ 表示结束
```



**引用数据类型（Reference Types）：**

- **Object：** 表示复杂数据结构，包括对象、数组和函数等。
- **Array：** 表示有序集合的数组。
- **Function：** 表示函数类型。

变量在声明时不需要指定类型，可以随时改变其存储的值的类型。例如：

```javascript
var x; // 未定义的变量
console.log(typeof x); // "undefined"

x = 5; // 数字
console.log(typeof x); // "number"

x = "Hello"; // 字符串
console.log(typeof x); // "string"

x = true; // 布尔值
console.log(typeof x); // "boolean"

x = null; // 空值
console.log(typeof x); // "object"

x = { key: "value" }; // 对象
console.log(typeof x); // "object"

x = [1, 2, 3]; // 数组
console.log(typeof x); // "object"

x = function() {}; // 函数
console.log(typeof x); // "function"
```

这种灵活的类型系统使得JavaScript适用于多种场景，但也需要开发人员在编写代码时注意类型的转换和一致性。JavaScript也提供了一些用于检查和转换类型的方法，例如 `typeof` 运算符和 `instanceof` 运算符。



+ **运算**

```javascript
/*
	类型转换：
		* 其他类型转number：
			1. string：按照字符串的字面值，转成数字，若字面值不是数字，则转成NaN，一般使用parseInt				方法 	如：alert(parseInt(str1) + 100);
			2. boolean：true转1，false转0
			
		* 其他类型转boolean：
			1. number：0和NaN转为false，其他数字转为true
			2. string：空字符串转为false，否则就时true
			3. null：转为false
			4. undefined：转为
*/
var age1 = 10;
var age2 = "10";

alert(age1 == age2); 	// 返回true
alert(age1 === age2);	// 返回false
```

# 函数定义及调用

## 定义

```JavaScript
function add(int a, int b){
    var c = a + b;
    return c;
}
```

## 调用

```JavaScript
let res = add(1, 2)
```



# JavaScript常用对象

+ **Array**

```javascript
// 1. 定义
var num1 = new Array(1, 2, 3); 	// 方式一
var num2 = [1, 2, 3]; 		 	// 方式二

// 2. 访问
num1[0] = 10;
alert(num1)

/*
	JavaScript数组相当于Java种的集合, 变长变类型
*/

// 3. 变类型
num1[10] = "string"
alert(num1) 	// 数组可以容纳不同类型的元素, 未定义的元素类型是undefined

/*
	Array方法:
		* length(): 数组中元素的个数
		* push():	向数组添加元素
		* splice():	删除区间内的元素
*/
```

+ **Sthring**

```javascript
// 1. 定义
var str1 = new String("java");	// 方式一
var str2 = "Java";				// 方式二

// 2. 长度
alert(str1.length);				// 返回字符串的长度

// 3. trim()
var tmp = "   abc   ";
alert(1 + tmp.trim() + 1);		// 返回1abc1, trim()函数可以去除字符串两头									空白字符
/*
	String方法:
		* charAt():		返回指定位置的字符
		* indexOf():	检索字符串
*/
```



+ **自定义对象**

```javascript
// 1. 定义
var person = {
    name: "zhangsan",
    age: 23,
    eat: function(){
        alert("error");
    }
};
```



# BOM

>+ 全称：Browse Object Model 浏览器对象模型
>+ JavaScript 将浏览器的各个组成部分封装成对象
>+ **组成**：
>1. **Window**：浏览器窗口对
> 
> 2. **Navigator**：浏览器对象
> 
> 3. **Screen**：屏幕对象
> 
> 4. **History**：历史记录对象
> 
> 5. **Location**：地址栏对象

+ **Window**

1. 获取：直接使用 window，其中 window 可以省略

```javascript
window.alert("error!");
alert("error!");		//效果一致
```

2. 属性：获取其他 **BOM** 对象

3. 方法：

   + alert：显示一个带有提示信息的警告框
   + confirm：显示一个带有提示信息和确认以及取消按钮的对话框
   + setInterval：按照指定的周期(毫秒)，来调用函数或计算表达式
   + setTimeout：在指定的毫秒数后调用函数或计算表达式

   ```javascript
   alert("大小姐驾到，统统闪开!");
   
   var flag = confirm("确认删除？");
   if(flag){
       ...
   }else{
       ...
   }
   /*
   setTimeout(function, 毫秒数);	//指定时间后执行操作，只执行一次
       
   setInterval(function, 毫秒数);	//指定时间后执行操作，循环执行
   */
   ```

   

# DOM

> + 全称：Document Object Model 文档对象模型
> + 组成：
>   1. **Document**：整个文档对象
>   2. **Element：**元素对象
>   3. **Attribute**：属性对象
>   4. **Text**：文本对象
>   5. **Comment**：注释对象



+ **Element**

使用**Document**对象获取**Element**对象

```html
<script>
    // 1. getElemenstById()
    var img = document.getElementsById("light");
    
    // 2. getElementsByTagName()
    var divs = document.getElementsByTagName("div");
    
    // 3. getElementsByName()
    var hobbys = document.getElementsByName("hobby");
    
    // 4. getElementsByClassName()
    var clss = document.getElementsByClassName("cls");
</script>
```

**文本样式更改**

```javascript
var div_ = document.getElementsByTagName("div");
div_.style.color = "red";
div_.innerHTML = "haha";
```



# 事件监听

+ 事件：HTML事件就是发生在HTML元素上的事情
  1. 按钮被点击
  2. 鼠标移动到元素之上
  3. 按下键盘按键
+ 事件监听：JavaScript可以在事件被侦测到时执行代码

+ **事件绑定**

```javascript
// 1. 方式一：通过HTML标签事件属性绑定
<input type="button" onclick='on()'>

function on(){
    alert("button was clicked");
}

// 2. 方式二：通过DOM元素绑定
<input type="button" id="btn">
document.getElementsById("btn").onclick=function(){
    alert("button was clicked");
}
```

**案例**

```JavaScript

```

