# 数据类型

## 列表

==列表的常用操作==

+ `len(a)` 返回列表长度。
+ `a.append(x)` 在列表末尾添加一个新元素。
+ `a.pop()` 删除列表的最后一个元素。
+ `a.reverse()` 将整个列表翻转。
+ `a.sort()` 将整个列表从小到大排序。

### 列表推导式

以下是一个简单的例子，演示如何使用列表推导式创建一个包含 3 行 4 列的二维列表：

```python
# 生成一个 3x4 的二维列表
matrix = [[j for j in range(4)] for i in range(3)]

print(matrix)
```

这将输出：

```python
[[0, 1, 2, 3],
 [0, 1, 2, 3],
 [0, 1, 2, 3]]
```

### 列表复制

+ 直接用 `=` 复制列表,相当于地址引用,例如:

```python
a = [0, 1, 2, 3, 4]
b = a

b[0] = 5
print(a, b) # 发现 a[0] 和 b[0] 都被修改为 5 了
```

+ 使用切片语法复制,可以实现一次浅拷贝

```python
a = [0, 1, 2, 3, 4]
b = a[:]

b[0] = 5
print(a, b)  # 会发现a[0]没有被修改
```

+ 利用切片逆转列表

```python
a = [0, 1, 2, 3, 4]
b = a[::-1]

print(b) # 输出 [4, 3, 2, 1, 0]
```



## 字符串

### 多行字符串读取

```python
import sys
for line in sys.stdin:
  print(line.strip())
```



+ 假设s是一个字符串，则：

+ `len(s)`返回字符串长度。
+ `s.split(sep)`返回一个字符串列表。如果给出了sep就按sep分隔；如果没给出，则会按空格分隔，但连续的空格会被视为单个分隔符，而且会忽略首尾的空白字符。
+ `s.strip()`将首尾的空白字符删除。
+ `s.replace(old, new)`将s中所有的old子串都改成new。
+ `s.find("abc")`查询某个子串在s中第一次出现的下标；如果不存在，则返回-1
+ `s.startswith(prefix)`判断prefix是否为s的前缀。
+ `s.endswith(suffix)`判断suffix是否为s的后缀。
+ `s.lower()`将所有大写字母变成小写
+ `s.upper()`将所有小写字母变成大写。
+ `s.join(a)`，a是一个字符串列表，这个函数返回将a中的字符用s作为分隔符拼接起来的结果。

```python
s = ", "
a = ["aa", "bb", "cc"]
print(s.join(a))  # 输出aa, bb, cc
```



+ `ord()` 用于求一个字符的 ASCII 码
+ `chr()` 用于将 ASCII 码转为字符

+ 字符串包含多行时初始化

```python
a = """Usage: thingy [OPTIONS]
     -h                        Display this usage message
     -H hostname               Hostname to connect to"""
print(a)
```

> ==跟列表不同，字符串的每次复制操作，都会得到一个全新的字符串。==
>
> ==注意：字符串中的每个字符不能修改。==

## 元组

> 元组跟列表类似，只是不支持动态添加、删除元素，以及不能修改元素。

### 初始化

==注意，如果初始化只包含一个元素的元组，需要在该元素后添加逗号。==

```python
a = ()  # 初始化一个空元组
b = (1, 2)  # 含有2个整数的元组
c = 6, "Python", 3.14  # 小括号可以省略，等价于(6, "Python", 3.14)
d = (5,)  # 注意不能写成(5)，(5)表示整数5
e = 5,  # 等价于(5,)

print(a, b, c, d, e)
```

### 解包

==函数中返回多个值,本质上就是一个元组==

```python
t = 12345, 54321, "Hello!"  # 初始化一个元组
x, y, z = t  # 将元组解包，将元组内的三个值按顺序赋值给x、y、z
print(x, y, z)
```



## 集合

==集合中的元素是无序的==

### 初始化

+ 创建集合使用`set()`函数,==创建空集合==只能使用`set()`方法,不能使用`{}`,因为`{}`创建的是空字典

> 自动清除重复元素,可以实现列表的去重

```python
basket = {'apple', 'orange', 'apple', 'pear', 'orange', 'banana'}  # 会自动去除重复元素
print(basket)  # 重复的元素已经去除了

s = set()  # 初始化一个空集合
print(s)

a = [1, 2, 1, 3, 1]
b = set(a)  # 将列表转化成集合，一般是为了去重。
c = list(b)  # 将集合转化回列表
print(b, c)

x = "abracadabra"
a = set(x)  # 将字符串中的每个字符存到集合中
b = str(a)  # 注意，这里并不能将集合转化回原字符串，而是用格式化表示集合中的内容
print(a, b)
```

### 常用操作

+ 假设`a`是一个集合
+ `len(a)` 返回集合中包含的元素数量。
+ `a.add(x)` 在集合中添加一个元素。
+ `a.remove(x)` 删除集合中的x，如果x不存在，则报异常。
+ `a.discard(x)` 删除集合中的x，如果x不存在，则不进行任何操作。
+ `x in a` 判断x是否在a中。
+ `x not in a`判断x是否不在a中。



## 字典

> 字典以`key`作为索引,所以`key`是不能改变的,常用**数字**或**字符串**作为`key`

### 初始化

+ 常用`{}`或者`dict()`方法

```python
tel = {'jack': 4098, 'sape': 4139}  # 创建一个字典
print(tel)  # 输出 {'jack': 4098, 'sape': 4139}

a = dict()  # 创建一个空字典
a[123] = "abc"  # 在字典中插入一个key-value对
a[456] = "def"  # 在字典中插入一个key-value对
print(a)  # 输出 {123: 'abc', 456: 'def'}

b = list(a)  # 将字典的关键字转化成列表
print(b)  # 输出[123, 456]
```

### 常用操作

+ 假设a表示一个字典。

+ `len(a)`：返回字典中的元素对数。
+ `a[x]`：获取关键字x对应的值，如果x不存在，会报异常。
+ `a.get(x)`：获取关键字x对应的值，如果x不存在，会返回None，不会报异常。
+ `a.get(x, y)`：获取关键字x对应的值，如果x不存在，会返回默认值y，不会报异常。
+ `a[x] = y`：在字典中插入一对元素，如果关键字x已存在，则将它之前映射的值覆盖掉。
+ `del a[x]`：删除关键字x对应的元素对，如果x不存在，会报异常。
+ `x in a`：检查字典中是否存在关键字x。
+ `x not in a`：检查字典中是否不存在关键字x。
+ `a.keys()`：返回字典的所有key。
+ `a.values()`：返回字典的所有value。
+ `a.items()`：返回字典的所有由key和value组成的元组。



# 函数

## 参数传递

1. 值传递

`int`, `float`, `bool`采用值传递,形参的变化不会影响到实参

```python
def f(y):
  y = 5
  print(y)
  
x = 10
f(x)
print(x) # x = 10
```



2. 引用传递

+ ==列表==采用的是引用传递

```python
def f(b):
  for i in range(len(b)):
    b[i] += 1

a = [0, 1, 2, 3, 4]
f(a)
print(a) # a 发生了改变
```

## lambda 表达式

`lambda`关键字可以创建匿名函数,从而简化代码

+ `sorted()`方法

```python
students = [('Alice', 22), ('Bob', 19), ('Charlie', 20)]
sorted_students = sorted(students, key=lambda student: student[1])
print(sorted_students)  # 输出: [('Bob', 19), ('Charlie', 20), ('Alice', 22)]
```



+ 搭配列表的`sort()`函数使用

```python
pairs = [[1, "one"], [2, "two"], [3, "three"], [4, "four"]]
pairs.sort(key=lambda pair: pair[1])
print(pairs) # 输出: [[4, 'four'], [1, 'one'], [3, 'three'], [2, 'two']]

# 上述代码等价于以下代码
pairs = [[1, "one"], [2, "two"], [3, "three"], [4, "four"]]


def compare(pair):
    return pair[1]


pairs.sort(key=compare)  # 每个元素使用第二个变量比较大小
print(pairs)  # 输出：[[4, 'four'], [1, 'one'], [3, 'three'], [2, 'two']]
```

+ `filter()`中使用

```python
numbers = [1, 2, 3, 4, 5, 6]
even_numbers = list(filter(lambda x: x % 2 == 0, numbers))
print(even_numbers)  # 输出: [2, 4, 6]
```



# 继承

在 Python 中，继承是面向对象编程中的一个重要概念，它允许一个类（称为子类）继承另一个类（称为父类或基类）的属性和方法。子类可以继承父类的特性，也可以根据需要添加新的特性或修改现有的特性。这有助于代码的重用和扩展。

以下是一个简单的 Python 继承的例子：

```python
# 定义一个基类（父类）
class Animal:
    def __init__(self, name):
        self.name = name

    def make_sound(self):
        pass

# 定义一个子类，继承自 Animal
class Dog(Animal):
    def make_sound(self):
        return "Woof!"

# 定义另一个子类，也继承自 Animal
class Cat(Animal):
    def make_sound(self):
        return "Meow!"

# 创建一个 Dog 对象
dog = Dog("Buddy")
print(f"{dog.name} says: {dog.make_sound()}")

# 创建一个 Cat 对象
cat = Cat("Whiskers")
print(f"{cat.name} says: {cat.make_sound()}")
```

# 多态

Python 支持多态。多态是一种面向对象编程的特性，它允许不同的对象对同一消息做出不同的响应。在 Python 中，多态体现在对象的方法调用上。

多态的一个常见场景是通过继承和方法重写实现的。当子类继承自父类并重写父类的方法时，可以根据实际的对象类型来调用相应的方法。

下面是一个简单的例子：

```python
class Animal:
    def speak(self):
        print("Animal speaks")

class Dog(Animal):
    def speak(self):
        print("Dog barks")

class Cat(Animal):
    def speak(self):
        print("Cat meows")

# 多态性的体现
def animal_speak(animal):
    animal.speak()

# 创建对象
animal1 = Dog()
animal2 = Cat()

# 调用方法，不同的对象调用相同的方法，产生不同的输出
animal_speak(animal1)  # 输出 "Dog barks"
animal_speak(animal2)  # 输出 "Cat meows"
```

多态性提高了代码的灵活性和可扩展性，允许在不改变方法调用的前提下，通过引入新的子类来扩展程序的功能。

# 异常

在 Python 中，可以使用 `raise` 语句来抛出异常。通常，你可以使用内置的异常类，也可以创建自定义的异常类。以下是一些简单的例子：

## 一般用法

1. **使用内置异常类：**
   
   使用内置的异常类，例如 `ValueError`、`TypeError`、`RuntimeError` 等。

   ```python
   x = -5
   
   if x < 0:
       raise ValueError("x 不能是负数")
   ```

2. **创建自定义异常类：**

   你还可以创建自定义的异常类，继承自内置的 `Exception` 类或其子类。

   ```python
   class MyCustomError(Exception):
       def __init__(self, message="发生了自定义错误"):
           self.message = message
           super().__init__(self.message)

   x = -5

   if x < 0:
       raise MyCustomError("x 不能是负数")
   ```

3. **捕获和处理异常：**

   当异常被抛出时，通常使用 `try` 和 `except` 语句来捕获和处理异常。

   ```python
   try:
       x = -5
       if x < 0:
           raise ValueError("x 不能是负数")
   except ValueError as e:
       print(f"捕获到异常：{e}")
   ```
   
   在这个例子中，当 `x` 小于 0 时，`ValueError` 异常被抛出，然后被 `except` 块捕获，并打印出异常消息。

## 捕获异常

在 Python 中，可以使用 `try`, `except`, `else`, 和 `finally` 来捕获和处理异常。

异常处理的基本结构如下：

```python
try:
    # 可能引发异常的代码
    result = 10 / 0  # 例如，尝试除以零
except ZeroDivisionError as e:
    # 处理特定类型的异常
    print(f"Error: {e}")
except Exception as e:
    # 处理其他异常
    print(f"An unexpected error occurred: {e}")
else:
    # 如果没有发生异常，则执行此块
    print("No exception occurred.")
finally:
    # 无论是否发生异常，都会执行此块
    print("This block will always be executed.")
```

在这个例子中，`try` 块包含可能引发异常的代码。如果在 `try` 块中发生异常，程序将跳转到相应的 `except` 块进行处理。你可以使用多个 `except` 块来处理不同类型的异常，也可以使用一个通用的 `except Exception` 块来处理所有异常。

`else` 块中的代码将在没有异常发生时执行，而 `finally` 块中的代码将无论是否发生异常都会执行。`finally` 块通常用于执行清理工作，例如关闭文件或释放资源。

你还可以使用 `except` 语句而不指定具体的异常类型，以捕获所有异常。但在实际编程中，最好指定需要捕获的异常类型，以便更精确地处理异常情况。

```python
try:
    # 可能引发异常的代码
    result = 10 / 0  # 例如，尝试除以零
except Exception as e:
    # 处理所有异常
    print(f"An unexpected error occurred: {e}")
```

在异常处理中，你还可以使用 `raise` 语句主动引发异常，以便在某些情况下中断程序执行。



# 模块的使用

## argparse









# 细节知识

+ 清除 `print()` 方法末尾的换行符, 使用 `print("输出内容", end='')` 即可,`end`参数可修改结束符

+ 续行 

> 在Python中，反斜杠 `\` 用于续行（line continuation），它表示一行代码在物理上被分成多行，但在逻辑上是一行。这对于在代码中保持可读性很有帮助，尤其是当一行代码太长时。

反斜杠 `\` 用于将一行代码拆分为两行，以便提高可读性。这样就可以在两个 `open` 语句之间换行，而不需要将整个语句写在一行中。

具体来说，这两行代码：

```python
with open('./comment/short.txt', 'a', encoding='utf-8') as short, \
        open('./comment/score.txt', 'a', encoding='utf-8') as score:
```

+ `self` 参数

在 Python 中，类的方法第一个参数通常被命名为 `self`，这是一种约定俗成的命名方式，但实际上你可以使用任何名称。`self` 表示对象本身，它是方法调用的<font color='orange'>隐式参数[^1]</font>，用于引用调用该方法的对象。

当你调用一个类的方法时，Python 会自动传递该对象的引用作为第一个参数给方法，而这个参数通常被命名为 `self`。通过这个 `self` 参数，你可以在方法内部访问该对象的属性和其他方法。

下面是一个简单的例子，说明了 `self` 的作用：

```python
class MyClass:
    def __init__(self, x):
        self.x = x

    def print_value(self):
        print(self.x)

    def update_value(self, new_x):
        self.x = new_x
    
   	def inc_value(self):
        return self.x + 1

# 创建 MyClass 的实例
obj = MyClass(42)

# 调用对象的方法
obj.print_value()  # 输出: 42

# 调用对象的另一个方法
obj.update_value(100)

# 再次调用方法，查看更新后的值
obj.print_value()  # 输出: 100

# 用类调用方法的时候要将对象传给self
value = MyClass.inc_value(self)
```

在这个例子中，`self` 在 `print_value` 和 `update_value` 方法中都是隐式传递的，并且它指代调用这两个方法的对象。通过 `self`，你可以在方法内部访问对象的属性 `x`，并且你可以在方法中调用其他方法。

总体来说，`self` 的作用是提供对对象本身的引用，使得类的方法可以访问和操作对象的属性和行为。在类的方法中，第一个参数通常使用 `self`，但实际上你可以使用其他名称，只要遵循这种约定即可。





## \_\_init\_\_.py

在Python中，`__init__.py`文件通常用于标识一个目录为一个Python包。<font color='orange'>它可以为空文件，也可以包含一些初始化代码，但它的存在告诉Python解释器，该目录应该被视为一个包含可导入模块的包。</font>

主要功能包括：

1. **标识包：** `__init__.py` 的存在告诉Python解释器，该目录应该被视为一个包。如果一个目录中包含了该文件，Python就会将这个目录作为一个包对待，而不仅仅是一个普通的目录。

2. **初始化包：** 你可以在 `__init__.py` 文件中放置一些初始化代码，这些代码会在包被导入时执行。这可用于执行一些初始化任务，设置包级别的变量或执行其他必要的操作。

3. **控制包导入行为：** `__init__.py` 文件可以用于控制包的导入行为。你可以在其中定义`__all__`变量，指定导入包时默认导入的模块列表。这可以帮助简化包的使用。

例如，一个简单的包结构可能如下所示：

```
my_package/
|-- __init__.py
|-- module1.py
|-- module2.py
```

在这个例子中，`my_package` 目录被认为是一个包，因为它包含了一个 `__init__.py` 文件。你可以通过 `import my_package.module1` 这样的语句导入其中的模块。











[^1]:传参时自动填补

