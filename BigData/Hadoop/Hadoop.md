# Hadoop3.0-yarn产生和发展

## Hadoop演进

+ **阶段0：Ad Hoc集群**

1. **Ad Hoc**应当理解成专用的、特定的意思(数仓领域中常理解为即席)。**Ad Hoc**集群时代标志着Hadoop集群的起源，集群以**Ad Hoc**、**单用户方式**建立
2. 之后，随着私人集群的使用和Hadoop容错性的提升，持久的HDFS集群出现，并实现了HDFS集群的共享，把常用和感兴趣的数据集载入HDFS共享集群中。当共享HDFS成为现实，但这时还没实现的共享计算平台就成为了关切对象。
3. 不同于HDFS共享数据集，为多个组织用户简单设置一个共享MapReduse集群并非易事，尤其是集群下的物理资源的共享并不理想

+ **阶段1：HOD集群**

1. 为了解决集群条件下的多租户问题，**Yahoo**发展

# Hadoop安装与使用

## 创建hadoop用户

```shell
# 创建用户
sudo useradd -m hadoop -s /bin/bash
# 配置用户密码
sudo passwd hadoop
# 配置用户管理员权限
sudo adduser hadoop sudo
```

## 更新apt和安装Vim编辑器

```shell
sudo apt-get update
sudo apt-get install vim
```

## 安装SSH和配置SSH无密码登录

```shell
# 安装ssh服务器
sudo apt-get install openssh-server
# 登录本机
ssh localhost

# 退出登录
exit
```

**配置无密码登录**

```shell
cd ~/.ssh
ssh-keygen -t rsa
cat ./id_rsa.pub >> ./authorized_key
```

# Hadoop项目结构

![image-20230926100329733](D:\study\算法\笔记图片\image-20230926100329733.png)

# HDFS

## **分布式文件系统简介**

**优点**

1. 兼容廉价硬件设备
2. 实现流数据读写
3. 支持大数据集
4. 支持简单的文件模型
5. 强大的跨平台兼容性

**缺点**

1. 不适合低延迟数据访问,实时性不高
2. 无法高效存储大量小文件
3. 不支持多用户写入及任意修改文件



## HDFS存储模式

+ 单独一个块非常大, 降低分布式节点的寻址开销, 支持面向大规模数据存储

**块设计的优点**

+ 简化系统设计,
+ 支持大规模文件存储
+ 适合数据冗余备份

**两大组件**

+ 名称节点

  ![image-20230926100804982](D:\study\算法\笔记图片\image-20230926100804982.png)

+ 数据节点

![image-20230926094356643](D:\study\算法\笔记图片\image-20230926094356643.png)



> **FsImage**保存系统文件树, 记录如下信息
>
> 1. 文件的复制等级
> 2. 修改和访问时间
> 3. 访问权限
> 4. 块大小以及组成文件的块
>
> **EditLog**记录对数据进行的诸如创建,删除,重命名等操作

![image-20230926094856186](D:\study\算法\笔记图片\image-20230926094856186.png)

> 每次重新启动**HDFS集群服务**,在执行`start-dfs.sh`时后台都会合并`FsImage`以及`EditLog`文件,生成最新的元数据, 并创建新版`FsImage`名称节点和一个空的`EditLog`
>
> 由于`EditLog`在不重启的情况下,一直增大,所以借助**第二名称节点**进行冷备份.
>
> - Secondary NameNode从NameNode获取当前的FsImage和EditLog。
> - 它将EditLog应用到FsImage，生成一个新的FsImage。
> - Secondary NameNode将新的FsImage存储在本地，并将其传送回NameNode，以替换原始的FsImage和清空EditLog。
>
> 这个过程有助于减小EditLog的大小，避免EditLog无限增长，从而提高NameNode的性能。

## HDFS读数据

Hadoop中有个**FileSystem**基类包含`open`, `read`, `close`方法

![image-20230926161941582](D:\study\算法\笔记图片\image-20230926161941582.png)

+ ClientProtocal.getBlockLocations()

# HBase

+ **HBase** 是 **BigTable** 的开源实现, **BigTable** 最初是为了解决谷歌公司内部大规模网页搜索问题
