# 列表推导式

以下是一个简单的例子，演示如何使用列表推导式创建一个包含 3 行 4 列的二维列表：

```python
# 生成一个 3x4 的二维列表
matrix = [[j for j in range(4)] for i in range(3)]

print(matrix)
```

这将输出：

```
[[0, 1, 2, 3],
 [0, 1, 2, 3],
 [0, 1, 2, 3]]
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

## 续行 \

在Python中，反斜杠 `\` 用于续行（line continuation），它表示一行代码在物理上被分成多行，但在逻辑上是一行。这对于在代码中保持可读性很有帮助，尤其是当一行代码太长时。

在你提供的代码中，反斜杠 `\` 用于将一行代码拆分为两行，以便提高可读性。这样你就可以在两个 `open` 语句之间换行，而不需要将整个语句写在一行中。具体来说，这两行代码：

```python
with open('./comment/short.txt', 'a', encoding='utf-8') as short, \
        open('./comment/score.txt', 'a', encoding='utf-8') as score:
```

等同于将它们写在一行的效果，但由于换行符 `\` 的存在，可以更清晰地看到两个文件对象的打开操作同时发生在同一个 `with` 语句块中。

这种使用反斜杠进行行续的方式在长语句的情况下很常见，以提高代码的可读性和维护性。在多行字符串、函数调用等情况下也可以使用反斜杠进行行续。









## self参数

在 Python 中，类的方法第一个参数通常被命名为 `self`，<font color='orange'>这是一种约定俗成的命名方式，但实际上你可以使用任何名称</font>。`self` 表示对象本身，它是方法调用的<font color='orange'>隐式参数[^1]</font>，用于引用调用该方法的对象。

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

