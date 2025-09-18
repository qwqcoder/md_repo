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



# jvxetable获取修改数据

```js
const xTable = this.$refs.addressTable.$refs.vxe.$refs.xTable
      const insertRecords = xTable.getInsertRecords();
      const updateRecords = xTable.getUpdateRecords();
      const deleteRecords = xTable.getRemoveRecords();
```

# moment

```js
// Moment.js 是一个用于解析、验证、操作和显示日期和时间的 JavaScript 库。以下是当前代码中使用到的及常用 API 介绍：
// 1. moment()：创建一个当前时间的 Moment 对象
// 2. moment().startOf('month')：将 Moment 对象设置为本月的第一天的 00:00:00
// 3. current < moment().startOf('month')：比较两个日期，判断 current 是否早于本月第一天
// 常用 API 还包括：
// - moment(date)：解析传入的日期字符串或时间戳为 Moment 对象
// - moment().format('YYYY-MM-DD')：将 Moment 对象格式化为指定格式的字符串
// - moment().add(1, 'days')：在当前日期上增加指定的时间量
// - moment().subtract(1, 'months')：在当前日期上减少指定的时间量
// - moment().isSame(moment(), 'day')：判断两个日期是否在同一时间单位（如天、月、年）内
```

