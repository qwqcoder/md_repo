# 概述

## 缺点

+ **配置繁琐**

  `Spring` 使用 `XML` 进行配置, 而且是重量级的

+ **依赖繁琐**

## 功能

+ **自动配置**

  `SpringBoot` 的自动配置在应用程序启动时完成, 是 `SpringBoot` 自动完成的

  > `pom` 配置文件中, `<parent>` 标签是指的父工程, 其中锁定了某些依赖的版本信息, 实现了自动配置

  ```xml
  
  <dependencies>     
       <dependency>
           <groupId>org.springframework.boot</groupId>
           <!-- starter-web 继承了一系列的父工程, 其中组合了一套最优依赖搭配 -->
           <artifactId>spring-boot-starter-web</artifactId>
       </dependency>
  
       <dependency>
           <groupId>org.springframework.boot</groupId>
           <artifactId>spring-boot-starter-test</artifactId>
           <scope>test</scope>
       </dependency>
  </dependencies>
  ```

  

+ **起步依赖**

  起步依赖本质是一个 `Maven` 项目对象模型(Project Object Model, POM), 定义了对其他库的传递依赖

+ **辅助功能**

# 配置信息的写入和获取

+ **配置文件分类**

  `SpringBoot` 基于默认配置, 有很多默认值, 如果想要自定义, 可以使用 `application.properties` 或者 `application.yml` 或者 `application.yaml` 进行自定义配置

   ```properties
# 自定义端口
  server.port=8080
  # 虚拟目录, web文件都在虚拟路径下
  server.servlet.context-path=/start
   ```
  
  ```yml
  server:
  	port: 8080
  	context-path: /start2
  ```
  
  `yml` 格式相较于 `properties` 格式更常用, `yml` 更关注参数的值, 层级关系也更清晰, 注意 `yml` 需要在 `:` 之后添加一个空格

+ **配置信息的获取**

  

  `@Value("${键名}")` 

  ```yml
  email:
  	user: 1958448979@qq.com
  	code: skldfjskldfskljflsk
  	host: smtp.qq.com
  	auth: true
  ```

  **方法一**

  手动指定每一个变量

  ```java
  public static void main(){
      @Value("${email.user}")
      Public String user;
      @Value("${email.code}")
      Public String code;
      @Value("${email.host}")
      Public String host;
      @Value("${email.auth}")
      Public String auth;
  }
  ```

  **方法二**

  批量指定类中的每一个变量在配置文件中对应的值

  `@ConfigurationProperties(prefix = "email")`

  **注意:** `profix` 参数指定的是一个层级共同的前缀, 该注解会将此层级的所有配置一起导入类中**同名**变量

  ```java
  @ConfigurationProperties(prefix = "email")
  public static void main(){
      Public String user;
      Public String code;
      Public String host;
      Public String auth;
  }
  ```

# 整合mybatis