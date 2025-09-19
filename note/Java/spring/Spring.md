# 元数据配置文件

## 定义 `bean`

> id 可以省略

```xml
<bean id="userDao" name="customeBean,firstBean" class="com.qwqcoder.UserDao"/>
```

## 取别名

```xml
<alias name="userDao" alias="MyBean" class="com.qwqcoder.UserDao"/>
```

## 实例化 `bean`

### 使用构造函数实例化

> 自动调用 bean 类的构造方法，实例化

```xml
<bean id="exampleBean" class="com.qwqcoder.Test"/>
```

### 使用静态工厂函数，实例化

```xml
<bean id="exampleBean" class="com.qwqcoder.Test" 
      factory-method="getInstance"/>
```

### 使用实例工厂函数实例化

> 使用已经存在于容器中的某个 bean 实例对象，调用其实例方法创建另一个 bean 对象
>
> `factory-bean` 指定

+ UserService 类

```java
class UserService {
    private static UserService INSTANCE = new UserService();
    
    public UserService() {
        return this.INSTANCE;
    }
    
    public createUserDao() {
        return new UserDao();
    }
}
```

+ UserDao 类

```java
class UserDao() {
    
}
```

+ xml 配置文件

```xml
<bean id="userService" class="com.qwqcoder.UserService" factory-method="getInstance"/>
<bean id="userDao" name="customeBean,firstBean" factory-bean="userService" factory-method="createUserDao"/>
```



# 依赖注入

## 概念解释

> ==场景==
>
> 假设 A --> B --> C
>
> A 中依赖 B,  B 中依赖 C

+ 传统依赖构建方式

先创建 C 类，再创建 B 类，最后创建 A 类，然后一次导入各自的依赖

+ `spring` 容器的方式

直接创建 A 类，发现需要引入 B，尝试创建 B 类，发现又需要 C，最后创建 C 类

和传统方式恰恰相反，且无需手动导入依赖，因为容器会自动创建 Bean 对象

## Setter 方式

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
           http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!-- 定义数据源 bean -->
    <bean id="dataSource" class="com.example.DataSource">
        <!-- 通过 setter 方法注入属性 -->
        <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
        <property name="url" value="jdbc:mysql://localhost:3306/mydb"/>
        <property name="username" value="root"/>
        <property name="password" value="password"/>
    </bean>

    <!-- 定义用户 DAO bean -->
    <bean id="userDao" class="com.example.UserDao">
        <!-- 通过 setter 方法注入数据源依赖 -->
        <property name="dataSource" ref="dataSource"/>
    </bean>

    <!-- 定义用户服务 bean -->
    <bean id="userService" class="com.example.UserService">
        <!-- 通过 setter 方法注入 DAO 依赖 -->
        <property name="userDao" ref="userDao"/>
        <!-- 注入简单字符串属性 -->
        <property name="serviceName" value="User Management Service"/>
    </bean>

    <!-- 定义多个名称的 bean -->
    <bean name="orderService,orderManager" class="com.example.OrderService">
        <!-- 注入整数类型属性 -->
        <property name="maxOrderCount" value="100"/>
    </bean>

</beans>
```

> 对应的 Java 类需要包含相应的 setter 方法

```java
public class UserService {
    private UserDao userDao;
    private String serviceName;
    
    // setter 方法，Spring 会调用这些方法注入依赖
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
    
    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
}
```

## 构造器注入

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
           http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!--其他代码 -->
    
    <!-- 定义用户 DAO bean -->
    <bean id="userDao" class="com.example.UserDao">
        <!-- 通过构造器方法注入数据源依赖 -->
        <constructor-arg name="datasource" index="0" ref="datasource" />
    </bean>

    <!--其他代码 -->
</beans>
```

### 如何选择注入方式

+ 若依赖是可选项

  可以使用 Setter 方式注入依赖

+ 若依赖是必选项

  推荐使用构造器方式注入依赖，这样可以保证实例化的 bean 对象是完全体，保证不会缺少依赖



# `*`自动装配

## 概念介绍

Spring 自动装配是容器通过约定自动为 Bean 注入依赖的机制，无需在 XML 或注解中显式配置 `<property>` 或构造器参数，核心目标是**减少手动依赖配置，简化开发**。

+ 自动装配的核心逻辑：

> Spring 容器根据预设规则（如 Bean 名称、类型），在初始化目标 Bean 时，自动查找并注入匹配的依赖 Bean。

## 4种核心装配模式

Spring 提供 4 种常用自动装配模式，通过 `<bean>` 标签的 `autowire` 属性指定（XML 配置），或通过注解（如 `@Autowired`）隐含对应模式。

| 装配模式（autowire 属性值）     | 核心逻辑                                                     | 适用场景                                            | 注意事项                                                     |
| ------------------------------- | ------------------------------------------------------------ | --------------------------------------------------- | ------------------------------------------------------------ |
| **byName（按名称装配）**        | 容器查找与目标 Bean 依赖属性名**完全一致**的 Bean ID，找到则注入。 | 依赖 Bean 的 ID 与目标属性名明确对应时              | 必须保证依赖 Bean 的 ID 和目标属性名完全匹配（大小写敏感），否则注入失败。 |
| **byType（按类型装配）**        | 容器查找与目标 Bean 依赖属性**类型完全匹配**的 Bean，找到则注入。 | 某一类型的 Bean 在容器中**唯一存在**时              | 若同一类型有多个 Bean，会抛出 `NoUniqueBeanDefinitionException`。 |
| **constructor（按构造器装配）** | 容器查找与目标 Bean 构造器参数**类型匹配**的 Bean，注入构造器完成初始化。 | 依赖必须通过构造器注入（如不可变对象）              | 优先匹配参数数量最匹配的构造器；若同一类型有多个 Bean，同样会抛出类型冲突异常。 |
| **autodetect（自动探测）**      | 容器先尝试 `constructor` 模式，若未找到匹配构造器，则切换为 `byType` 模式。 | 不确定依赖注入方式（较少用，Spring 3.0 后逐步弃用） | 兼容性较差，建议显式指定 `constructor` 或 `byType`，避免歧义。 |

## 常用配置示例

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!-- 依赖 Bean：数据源 -->
    <bean id="dataSource" class="com.example.DataSource"/>

    <!-- 目标 Bean：按名称装配（依赖属性名 = "dataSource"） -->
    <bean id="userDao" class="com.example.UserDao" autowire="byName"/>

    <!-- 目标 Bean：按构造器装配（构造器参数类型 = DataSource） -->
    <bean id="userService" class="com.example.UserService" autowire="constructor"/>
</beans>
```

