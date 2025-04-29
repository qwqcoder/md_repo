+ 将报表中`sex`的`int`值映射为字典

  1. 设置数据字典

     ![image-20250429134145384](https://book-borrow-project.oss-cn-beijing.aliyuncs.com/md_repo/image-20250429134145384.png)

     > 记住这里的字典编号 `sex`

  2. 修改前端代码

     ![image-20250429134301456](https://book-borrow-project.oss-cn-beijing.aliyuncs.com/md_repo/image-20250429134301456.png)

     > 给`dataIndex`添加固定后缀`_dictText`

  3. 插入`j-dict-select-tag`标签

     ```vue
     <j-dict-select-tag :triggerChange="true" v-model="queryParam.gender" placeholder="请选择类型" dictCode="sex"/>
     ```

     