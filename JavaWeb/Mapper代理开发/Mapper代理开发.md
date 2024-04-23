# 入门

+ 定义与SQL映射文件同名的**Mapper**接口文件，并且将**Mapper**接口和SQL映射文件放置在同一个路径下
+ 设置SQL映射文件的namespace属性为**Mapper**接口全限定名
+ 在Mapper接口中定义方法，方法名就是SQL映射文件中sql语句的**id**，并保持参数类型和返回值类型一致
+ 编码：
  1. 通过**SqlSession**的`getMapper`方法获取Mapper接口的代理对象
  2. 调用对应的方法完成sql执行

> **细节：**
>
> 如果Mapper接口名称和SQL映射文件名称相同，并在同一目录下，则可以使用包扫描的方法简化SQL映射文件的加载

![image-20231028144045551](Mapper%E4%BB%A3%E7%90%86%E5%BC%80%E5%8F%91.assets/image-20231028144045551.png)

# 注意事项

![image-20231028144149963](Mapper%E4%BB%A3%E7%90%86%E5%BC%80%E5%8F%91.assets/image-20231028144149963.png)

+ 观察项目目录结构，**resources**目录下除了`mybatis-config.xml`配置文件外，其余的都是**Mapper代理**配置文件，可以将**Mapper代理**的路径设置成与源代码目录下**Mapper接口**一致的路径，方便**Maven**进行编译



+ 如下代码是**SQL映射文件**示例

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "https://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.itheima.mapper.UserMapper">
	<!-- id是sql语句的唯一标识， resultType是返回值类型，可以在mybatis-config.xml中设置别名 -->
    <select id="selectAll" resultType="com.itheima.pojo.User">
        select * from tb_user;
    </select>
    <select id="selectById" resultType="com.itheima.pojo.User">

    </select>

</mapper>
```



![image-20231028184405346](Mapper%E4%BB%A3%E7%90%86%E5%BC%80%E5%8F%91.assets/image-20231028184405346.png)

+ 这是`mybatis-config.xml`文件中对返回值类型取别名的示例， 其中`type`属性是**mapper代理**的源代码路径，`alias`**是别名**

