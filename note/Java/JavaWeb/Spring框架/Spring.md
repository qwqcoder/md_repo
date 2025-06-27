+ bean 默认创建单例

  ```xml
  <bean>
      
  </bean>
  ```

+ 适合让 `Spring` 容器管理的 bean

  + 表现层对象：Controller
  + 业务层对象：Service
  + 数据层对象：Dao （Data Access Object）
  + 工具对象：Utils

+ 不适合让容器管理的 bean
  + 封装实体的域对象：Entity



---

`spring`容器使用 bean 的无参构造方法，创建对象，底层使用反射机制，获取到类的元信息。

---



+ ⭐⭐⭐ 使用 `FactoryBean` 进行实例化

  ```java
  public class UserDaoFactoryBean implements FactoryBean<UserDao> {
  	// 创建实例对象
      public UserDao getObject() throws Exception {
          return new UserDaoImpl();
      }
      // 获取实例类型
      public Class<?> getObjectType() {
          return UserDao.class;
      }
      // 配置是否使用单例模型实例化，false 非单例模式，true 单例模式
      public boolean isSingleton() {
          return false;
      }
  }
  ```



