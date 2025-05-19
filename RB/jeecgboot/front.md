# 性别字典映射

+ 将报表中`sex`的`int`值映射为字典

  1. 设置数据字典

     ![image-20250506140554313](https://book-borrow-project.oss-cn-beijing.aliyuncs.com/md_repo/20250506140554344.png)

     > 记住这里的字典编号 `sex`

  2. 修改前端代码

     ![image-20250506140735934](https://book-borrow-project.oss-cn-beijing.aliyuncs.com/md_repo/20250506140735970.png)

     > 给`dataIndex`添加固定后缀`_dictText`

  3. 插入`j-dict-select-tag`标签

     ```vue
     <j-dict-select-tag :triggerChange="true" v-model="queryParam.gender" placeholder="请选择类型" dictCode="sex"/>
     ```

  



# 时间控件默认当前时间

+ 获取当前时间

  ```js
  getDefaultDate() {
        return [new Date().toISOString().slice(0, 10)].toString()//yyyy-mm-dd
      },
  ```

  


+ 表单校验函数

  ```js
  validatorRules: {
          readerName: [{required: true, message: '请输入读者姓名!'},],
          borrowDate: [{required: true, message: '请输入借出日期!'},],
          returnDate: [{validator: this.validateForReturnDate, required: true, trigger: 'change'},],
        },
  
  validateForReturnDate(rule, value, callback) {
        const borrowDate = this.model.borrowDate;
        if (!borrowDate) {
          callback(new Error('请先选择借出日期!'));
        } else {
          const borrowDateObj = new Date(borrowDate);
          const returnDateObj = new Date(value);
          if (returnDateObj <= borrowDateObj) {
            callback(new Error('归还日期必须大于借出日期!'));
          } else {
            callback();
          }
        }
      }
  ```

  

# 获取token

```js
console.log(this.$store.getters.token)
```

