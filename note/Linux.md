# 根目录

+ home 用户工作目录
+ bin 可执行文件
+ var/log 日志
+ lib 头文件/库文件
+ proc 计算机参数配置信息

+ etc 配置信息
+ root 根用户目录



# 基础命令

+ ctrl + c 终止当前命令进程，并且换行
+ ctrl + u 清空当前一行
+ ls 展示当前所在目录的所以文件列表
+ clear 清空终端文本
+ cd 默认返回home目录
+ cd - 返回上一个cd进入的目录
+ **ls -l 展示文件列表并显示详细信息**

+ **ls -h 人性化显示文件信息**

+ **ls -a 显示隐藏文件 a是all的缩写**
+ ls -A 显示所有文件，包括隐藏文件，但当前文件和父级文件除外

+ mkdir 创建文件目录
+ touch 创建文件
+ cp ./code.cpp  /path 复制copy命令
+ cp 目录1 目录2 -r    将目录1整个复制到目录2下
+ rm ./code.cpp 移除文件remove命令
+ rm 目录 -r   移除目录命令，如果文件名包含空格可以使用转义字符'\ ',  反斜杠加空格

## vim命令

+ 按下Esc 推出文本编辑, 进入一般命令模式
+ i 进入编辑模式
+ h 光标左移
+ l  光标右移
+ k 光标上移
+ j 光标下移
+ `n<space>` 光标向右移动n个字符
+ `n<enter>` 光标向下移动n行
+ 0  光标移动到本行行首
+ $ 光标移动到本行行尾
+ ^ 光标移动到本行第一个非空白符位置
+ G 移动到最后一行
+ gg 移动到第一行
+ :n 移动到第 n 行
+ /word 从光标位置之后,查找与word匹配的字符串
+ ?word 从光标位置之前,查找与word匹配的字符串
+ n: 重复之前的一个查找操作
+ N: 反向重复之前的一个查找操作
+ :n1,n2**s**/word1/word2/**g**    n1和n2是数字,表示从第n1行到n2行查找word1,并将word1替换成word2
+ :1,$**s**/word1/word2/**g** 从第1行到最后一行
+ :n1/n2**s**/word1/word2/**gc**  每次询问是否替换
+ v 选中文本
+ d 删除选中的文本
+ dd 删除当前行
+ y 复制选中的文本
+ yy 复制当前行
+ p 将复制的内容黏贴在当前光标的下一个位置
+ u 撤销上一个操作
+ ctrl + r "撤销"撤销操作
+ 大于号 >  将选中的文本整体向右缩进一次
+ 小于号 <  将选中的文本整体向左缩进一次
+ 功能键 Insert 切换输入模式
+ :w 保存
+ :wq 保存并退出
+ :w! 强制保存
+ :q 退出vim 前提是对文本没有改动
+ :q! 强制退出vim 且不保存当前更改
+ :set paste 取消自动缩进
+ :set nopaste 开启自动缩进
+ :set nu 显示行号
+ :set nonu 隐藏行号
+ gg=G 全文格式化
+ :noh 关闭查找关键字高亮
+ ctrl + q 当vim卡死时, 可以取消当前正在运行的命令
+ g++ code.cpp 

​		./code.out

​		编译运行code.cpp 并将输出结果存入code.out



## tmux命令

+ tmux 新建一个session
+ tmux a  重新打开之前挂起的session

+ ctrl + a + d  挂起当前tmux的session
+ ctrl + a + c  在当前session创建一个新的window
+ ctrl + a + w  选择其他window
+ ctrl + d  关闭当前的pane
+ ctrl + a + z  全展当前pane
+ ctrl + a + % 在当前windo创建新的pane **左右**
+ ctrl + a + "  在当前windo创建新的pane **上下**



# shell语法

## 打印

**脚本示例**

编写一个打印 `Hello World!` 的脚本

保存为 `code.sh`

```bash
#! /bin/bash 
echo "Hello world!"
```

**运行方式**

1. 作为可执行文件

```bash
chmod +x code.sh # 添加可执行权限
./code.sh # 从当前路径下执行
```

2. 解释器执行

```shell
bash code.sh # 需要在code.sh的路径下
```



## 变量

**定义变量**w

```shell
name="abc" # 双引号定义字符串
name1='abc' # 单引号定义字符串
name3=abc	# 无引号定义字符串
```

**使用变量**

```shell
name="wx"
echo $name #输出wx
echo ${name} #输出wx
echo "${name} is nb"
```

**环境变量-自定义变量**

```shell
name=wx # 自定义变量
export name # 自定义变量转环境变量
declare -x name # 自定义变量转环境变量

export name1=123 # 直接定义环境变量
declare +x name1 # 环w境变量转自定义变量
```

>1.自定义变量,只是局部变量,子进程不能访问
>2.环境变量,是全局变量,子进程可以访问


```bash
# 局部 -> 全局
name=qwqcoder
export name
declare -x name
# 全局 -> 局部
export name=qwqcoder
declare +x name
```

>declare 还有其他常用选项
>
>+ -r: 设置只读,不可修改
>+ -i: 设置变量为整数类型
>+ -a: 设置变量为数组类型
>+ -f: 设置变量为函数类型

**删除变量**

```shell
unset name
```

**只读变量**

```shell
readonly name=wx
```

**字符串**

```shell
name=yxc  # 不用引号
echo 'hello, $name \"hh\"'  # 单引号字符串，输出 hello, $name \"hh\"
echo "hello, $name \"hh\""  # 双引号字符串，输出 hello, yxc "hh"

name="yxc"
echo ${#name}  # 输出3, '#'运算符用于获取变量长度,返回字符串中字符数目

name="hello, yxc"
echo ${name:0:5}  # 提取从0开始的5个字符
```



**默认变量**

```shell
#! /bin/bash

echo "文件名："$0
echo "第一个参数："$1
echo "第二个参数："$2
echo "第三个参数："$3
echo "第四个参数："$4
```

+ `$#` 代表文件传入的参数个数，如上例中值为4
+ `$0` 代表文件路径

+ `$*` 由所有参数构成的用空格隔开的字符串，如上例中值为 "1 2 3 4"

+ `$@` 每个参数分别用双引号括起来的字符串，如上例中值为"1 2 3 4"

+ `$$` 脚本当前运行的进程ID

+ `$?` 上一条命令的退出状态（注意不是stdout，而是exit code）。0表示正常退出，其他值表示错误
+ `$(command) 返回`(command)` 命令的stdout

![默认变量](https://dlink.host/wx2.sinaimg.cn/large/006JEQfJly8hxfxo9mstvj30jf0irmz2.jpg)

![特殊变量](https://dlink.host/wx4.sinaimg.cn/large/006JEQfJly8hxfy2t7yqzj30lc0ak75a.jpg
)

## 管道符号'|'

+ 作用: 允许组合和连接多个命令, 以执行复杂操作.  **通过管道，你可以将一个命令的输出作为另一个命令的输入，从而实现数据流的处理和转换。**这种机制使得在命令行环境中能够轻松地执行各种任务，例如数据过滤、文本处理、数据转换等。
+ 格式: `command1 | command2`

```shell
# 基本搜索: 搜索文件中包含指定字符串的行,注意是行,输出也是一行一行的
grep "指定字符串" filename
	#例如 grep "wx" file.txt
# 递归搜索: 在目录及其子目录中递归搜索文件
grep -r "pattern" directory
# 忽略大小写：忽略搜索时的大小写
grep -i "pattern" filename
# 显示行号：显示匹配行的行号
grep -n "pattern" filename
# 显示匹配行的上下文：显示匹配行的前后几行文本
grep -C 2 "pattern" filename
# 反向匹配：查找不包含指定字符串的行
grep -v "pattern" filename
# 正则表达式搜索：使用正则表达式进行高级匹配
grep -E "regex_pattern" filename
# 仅显示匹配的文本：只显示匹配的文本，而不是整行
grep -o "pattern" filename
```



## 数组

**定义**

数组用小括号表示，元素之间用空格隔开

> 分隔符是空格`<space>`

```shell
array=(1 abc "def" yxc)
```

也可以直接定义数组中某个元素的值：

```shell
array[0]=1
array[1]=abc
array[2]="def"
array[3]=yxc
```

**读取**

```shell
${array[index]}
```

```shell
array=(1 abc "def" yxc)
echo ${array[0]}
echo ${array[1]}
echo ${array[2]}
echo ${array[3]}
```

**读取整个数组**

```shell
array=(1 abc "def" yxc)

echo ${array[@]}  # 第一种写法
echo ${array[*]}  # 第二种写法
```

**获取数组长度**

```shell
array=(1 abc "def" yxc)

echo ${#array[@]}  # 第一种写法
echo ${#array[*]}  # 第二种写法
```

## expr

**作用: ** 打印 `stdout`

示例

```shell
str="Hello World!"

echo `expr length "$str"`  # ``不是单引号，表示执行该命令，输出12
echo `expr index "$str"d`  # 输出7，下标从1开始
echo `expr substr "$str" 2 3`  # 输出 ell
```

`expr`支持简单的算术操作,但是运算符需要转义

```shell
a=3
b=4

echo `expr $a + $b`  # 输出7
echo `expr $a - $b`  # 输出-1
echo `expr $a \* $b`  # 输出12，*需要转义
echo `expr $a / $b`  # 输出0，整除
echo `expr $a % $b` # 输出3
echo `expr \( $a + 1 \) \* \( $b + 1 \)`  # 输出20，值为(a + 1) * (b + 1)

echo `expr $a \> $b`  # 输出0，>需要转义
echo `expr $a '<' $b`  # 输出1，也可以将特殊字符用引号引起来
echo `expr $a '>=' $b`  # 输出0
echo `expr $a \<\= $b`  # 输出1

c=0
d=5

echo `expr $c \& $d`  # 输出0
echo `expr $a \& $b`  # 输出3
echo `expr $c \| $d`  # 输出5
echo `expr $a \| $b`  # 输出3
```

## read

`read`命令用于从标准输入中读取单行数据。当读到文件结束符时，`exit code`为`1`，否则为`0`。

**参数说明**

+ `-p`: 后面可以接提示信息
+ `-t`：后面跟秒数，定义输入字符的等待时间，超过等待时间后会自动忽略此命令

实例：

```shell
read -p "Please input your name: " -t 30 name  # 读入name的值，等待时间30秒
```

## echo

**显示普通字符,即字符串不包含转义字符**

```shell
echo "Hello AC Terminal"
echo Hello AC Terminal  # 引号可以省略
```

**显示转义字符**

```shell
echo "\"Hello AC Terminal\""  # 注意只能使用双引号，如果使用单引号，则不转义
echo \"Hello AC Terminal\"  # 也可以省略双引号
```

**显示变量**

```shell
name=yxc
echo "My name is $name"  # 输出 My name is yxc
echo 'My name is $name'  # 输出 My name is $name, 注意这里是单引号
```

**显示换行**

```shell
echo -e "Hi\n" # -e 开启转义
echo "acwing"
```

输出结果：

```shell
Hi

acwing
```

**取消`ehco`输出末尾自带的换行**

```shell
echo "Hi \c"
echo "wx is nb"
```

输出结果:

```c++
Hi wx is nb

```



**显示结果定向至文件**

```shell
echo "Hello World" > output.txt  # 将内容以覆盖的方式输出到output.txt中
```

**原样输出字符串**

```shell
name=acwing
echo '$name\"' # 输出结果 $name\"
```

显示命令执行结果`stdout`

```shell
echo `date`
echo $(date)
```

## printf

与`c++`语法基本一致

```shell
printf "%10d.\n" 123  # 占10位，右对齐
printf "%-10.2f.\n" 123.123321  # 占10位，保留2位小数，左对齐
printf "My name is %s\n" "yxc"  # 格式化输出字符串
printf "%d * %d = %d\n"  2 3 `expr 2 \* 3` # 表达式的值作为参数
```

**输出结果：**

```markdown
       123.
123.12    .
My name is yxc
2 * 3 = 6
```

## test

**逻辑运算符`&&`和`||`**

+ && 表示与，|| 表示或

+ 二者具有短路原则：

  `expr1 && expr2`：当`expr1`为假时，直接忽略`expr2`

  `expr1 || expr2`：当`expr1`为真时，直接忽略`expr2`

+ 表达式的`exit code`为0，表示真；为非零，表示假。（与`C/C++`中的定义相反）

==**在命令行中输入`man test`，可以查看test命令的用法。**==

**文件类型判断**

+ `-e` 	文件是否存在
+ -f         是否为文件
+ -d        是否为目录

**示例**

```shell
test -e filename # 判断文件是否存在
```



**文件权限判断**

+ `-r`      文件是否可读
+ `-w`      文件是否可写
+ `-x`      文件是否可执行
+ `-s`      是否为非空文件

**示例**

```shell
test -r filename # 判断文件是否可读
```

**整数间的比较**

+ `-eq`	a是否等于b
+ `-ne`	a是否不等于b
+ `-gt`	a是否大于b
+ `-lt`	a是否小于b
+ `-ge`	a是否大于等于b
+ `-le`	a是否小于等于b

**示例**

```shell
test $a -eq $b  # a是否等于b
```

**字符串比较**

+ `test -z STRING`	判断STRING是否为空，如果为空，则返回true
+ `test -n STRING`	判断STRING是否非空，如果非空，则返回true（-n可以省略）
+ `test str1 == str2`	判断str1是否等于str2
+ `test str1 != str2`	判断str1是否不等于str2

**多重条件判定**
命令格式：

```shell
test -r filename -a -x filename
```



+ `-a`	两条件是否同时成立
+ `-o`	两条件是否至少一个成立
+ `!`	取反。如 test ! -x file，当file不可执行时，返回true

==**判断符号[]**==
`[ ]`与`test`用法几乎一模一样，更常用于`if`语句中。另外`[[]]`是`[ ]`的加强版，支持的特性更多。

**示例**

```shell
[ 2 -lt 3 ]  # 为真，返回值为0
echo $?  # 输出上个命令的返回值，输出0
```

==**注意：**==

+ `[]`内的每一项都要用空格隔开
+ 中括号内的变量，最好用双引号括起来
+ 中括号内的常数，最好用单或双引号括起来

**示例**

```shell
name="acwing yxc"
[ $name == "acwing yxc" ]  # 错误，等价于 [ acwing yxc == "acwing yxc" ]，参数太多
[ "$name" == "acwing yxc" ]  # 正确
```





# SSH

+ 基本使用格式

`ssh user@hostname`: user 表示用户名, hostname 表示服务器地址,可以是 ip 或者域名

+ 配置文件

> 通过配置`~/.ssh/config`文件,可以给服务器取别名,省略记忆服务器 ip 或域名

```bash
Host myserver
		HostName IP地址或者域名
		User 用户名
# 使用 ssh myserver 即可等效为 ssh user@hostname
```

+ 创建秘钥 `ssh-keygen`

+ 免密登录

> 如果想免密码登录远程服务器,将生成的公钥复制到该服务器的`.ssh/authorized_keys`文件中

快捷指令 -> `ssh-copy-id myserver`

# SCP

+ 基本用法 

  命令格式：`scp source destination`

  > 将source路径下的文件复制到destination中 

+ 一次复制多个文件：

`scp source1 source2 destination`

+ 复制文件夹：

`scp -r ~/tmp myserver:/home/acs/`

```bash

#将本地家目录中的tmp文件夹复制到myserver服务器中的/home/acs/目录下。
scp -r ~/tmp myserver:homework/

#将本地家目录中的tmp文件夹复制到myserver服务器中的~/homework/目录下。
scp -r myserver:homework .

#将myserver服务器中的~/homework/文件夹复制到本地的当前路径下。
#指定服务器的端口号：
scp -P 22 source1 source2 destination

#注意： scp的-r -P等参数尽量加在source和destination之前。
#使用scp配置其他服务器的vim和tmux
scp ~/.vimrc ~/.tmux.conf myserver:
```

