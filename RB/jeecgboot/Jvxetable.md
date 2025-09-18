# JVxeTable 使用文档

## 1. 基本介绍

JVxeTable 是一个基于 VXE-Table 的增强型表格组件，提供了丰富的单元格类型和功能，适用于复杂的表单数据录入场景。

## 2. 支持的单元格类型

### 2.1 基础类型
- `input`: 文本输入框
- `inputNumber`: 数字输入框
- `textarea`: 多行文本框
- `select`: 下拉选择框
- `selectSearch`: 下拉搜索框
- `selectMultiple`: 下拉多选框
- `date`: 日期选择
- `datetime`: 日期时间选择
- `time`: 时间选择
- `checkbox`: 复选框
- `upload`: 文件上传

### 2.2 特殊类型
- `progress`: 进度条
- `tags`: 标签输入
- `departSelect`: 部门选择
- `userSelect`: 用户选择
- `slot`: 自定义插槽
- `hidden`: 隐藏列
- `normal`: 普通显示

### 2.3 功能列类型
- `rowNumber`: 行号列
- `rowCheckbox`: 选择列
- `rowRadio`: 单选列
- `rowExpand`: 展开列
- `rowDragSort`: 拖动排序列

## 3. 基本使用

```vue
<template>
  <j-vxe-table
    ref="vxeTable"
    :loading="loading"
    :columns="columns"
    :dataSource="dataSource"
    :height="400"
    @valueChange="handleValueChange"
  />
</template>

<script>
export default {
  data() {
    return {
      loading: false,
      columns: [
        {
          title: '姓名',
          key: 'name',
          type: JVXETypes.input,
          width: 120,
          defaultValue: '',
          validateRules: [{ required: true, message: '请输入姓名' }]
        },
        {
          title: '年龄',
          key: 'age',
          type: JVXETypes.inputNumber,
          width: 100,
          defaultValue: 0
        }
      ],
      dataSource: []
    }
  },
  methods: {
    handleValueChange({ row, column, value }) {
      console.log('数据变化:', row, column, value)
    }
  }
}
</script>
```

## 4. 数据校验

### 4.1 列校验规则配置
```javascript
{
  title: '手机号',
  key: 'phone',
  type: JVXETypes.input,
  validateRules: [
    { required: true, message: '请输入手机号' },
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号' }
  ]
}
```

### 4.2 表单校验方法
```javascript
methods: {
  async submitForm() {
    const valid = await this.$refs.vxeTable.validate()
    if (valid) {
      // 校验通过，进行提交
    }
  }
}
```

## 5. 插槽使用

### 5.1 自定义列内容
```vue
<j-vxe-table>
  <template #action="{ row }">
    <a-button @click="handleEdit(row)">编辑</a-button>
    <a-button @click="handleDelete(row)">删除</a-button>
  </template>
</j-vxe-table>

// columns配置
{
  title: '操作',
  key: 'action',
  type: JVXETypes.slot,
  width: 150,
  fixed: 'right'
}
```

## 6. 事件处理

### 6.1 常用事件
```javascript
methods: {
  // 数据变化事件
  handleValueChange({ row, column, value }) {
    console.log('数据变化:', row, column, value)
  },
  
  // 选择事件
  handleSelectionChange({ records }) {
    console.log('选中数据:', records)
  },
  
  // 排序事件
  handleSortChange({ column, property, order }) {
    console.log('排序变化:', property, order)
  }
}
```

## 7. 行数据处理

### 7.1 新增行
```javascript
methods: {
  addNewRow() {
    this.$refs.vxeTable.addRows({
      name: '',
      age: 0
    })
  }
}
```

### 7.2 删除行
```javascript
methods: {
  removeRows(rows) {
    this.$refs.vxeTable.removeRows(rows)
  }
}
```

### 7.3 获取表格数据
```javascript
methods: {
  getData() {
    // 获取所有数据
    const allData = this.$refs.vxeTable.getAll()
    
    // 获取选中数据
    const selectedData = this.$refs.vxeTable.getSelectedRows()
  }
}
```

## 8. 高级特性

### 8.1 列配置示例
```javascript
{
  // 基础配置
  title: '列标题',
  key: 'fieldName',
  type: JVXETypes.input,
  width: 120,
  
  // 默认值
  defaultValue: '',
  
  // 是否必填
  required: true,
  
  // 是否可编辑
  disabled: false,
  
  // 校验规则
  validateRules: [],
  
  // 字典配置（下拉框等）
  dictCode: 'sys_user_sex',
  
  // 自定义属性
  props: {
    placeholder: '请输入',
    maxLength: 50
  }
}
```

### 8.2 表格配置
```vue
<j-vxe-table
  ref="vxeTable"
  :loading="loading"
  :columns="columns"
  :dataSource="dataSource"
  :height="400"
  :rowNumber="true"
  :rowSelection="true"
  :dragSort="true"
  :clickSelect="true"
  :pagination="true"
  :disabled="false"
/>
```

## 9. 注意事项

1. 使用前需要确保已正确引入组件及其依赖
2. 列的key值必须唯一
3. 对于大数据量的表格，建议启用虚拟滚动
4. 自定义组件需要通过slot方式实现
5. 表格数据变更后需要手动触发校验

这份文档涵盖了JVxeTable的主要使用方法，包括基本配置、数据校验、事件处理、插槽使用等内容。如果您有特定的使用场景需求，可以进一步查看相关示例或源码。





让我查看一下相关的源码来详细了解回调方法中props参数的属性和方法。
Read file: src/components/jeecg/JVxeTable/utils/vxeUtils.js
让我再看一下实际使用的示例：
Read file: src/views/srm/registry/SupplierEditForm.vue
基于源码分析，我来详细说明JVxeTable回调方法中props参数的属性和方法：



# JVxeTable回调方法props参数说明

## 1. 基础属性

### 1.1 row相关
- `row`: 当前行数据对象
- `rowIndex`: 行索引（从0开始）
- `$rowIndex`: 可视区域的行索引

### 1.2 column相关
- `column`: 列配置对象
  - `key`: 列字段名
  - `title`: 列标题
  - `type`: 列类型
  - `width`: 列宽度
  - `fixed`: 固定列位置
  - `align`: 对齐方式

### 1.3 value相关
- `value`: 当前单元格的值
- `oldValue`: 修改前的值（仅在值变更事件中存在）

## 2. 目标对象属性

### 2.1 target对象
- `target`: 表格实例对象，包含以下常用方法：
  ```javascript
  {
    // 切换行的选中状态
    toggle(row),
    
    // 选中指定行
    setCheckboxRow(row, checked),
    
    // 获取选中的行
    getCheckboxRecords(),
    
    // 清除选中状态
    clearCheckboxRow(),
    
    // 刷新表格数据
    refreshData(),
    
    // 重新加载数据
    reloadData(data),
    
    // 删除行
    removeRow(row),
    
    // 插入行
    insertRow(row, index),
    
    // 更新行
    updateRow(row, newData)
  }
  ```

## 3. 常用方法示例

### 3.1 行选择操作
```javascript
methods: {
  // 切换选中状态
  handleToggle(props) {
    props.target.toggle(props.row)
  },
  
  // 选中指定行
  handleCheck(props) {
    props.target.setCheckboxRow(props.row, true)
  },
  
  // 取消选中
  handleUncheck(props) {
    props.target.setCheckboxRow(props.row, false)
  }
}
```

### 3.2 数据操作
```javascript
methods: {
  // 更新行数据
  handleUpdate(props) {
    props.target.updateRow(props.row, {
      ...props.row,
      status: 'updated'
    })
  },
  
  // 删除行
  handleDelete(props) {
    props.target.removeRow(props.row)
  },
  
  // 插入新行
  handleInsert(props) {
    props.target.insertRow({
      name: '',
      age: 0
    }, props.rowIndex + 1)
  }
}
```

### 3.3 数据获取
```javascript
methods: {
  // 获取选中数据
  handleGetSelected(props) {
    const selectedRows = props.target.getCheckboxRecords()
    console.log('选中的行:', selectedRows)
  },
  
  // 获取当前行数据
  handleGetRowData(props) {
    console.log('当前行:', props.row)
    console.log('行索引:', props.rowIndex)
    console.log('当前值:', props.value)
  }
}
```

## 4. 注意事项

1. props中的属性和方法可能会根据事件类型不同而不同，建议在使用时先打印props查看具体内容
2. target对象中的方法操作会直接影响表格数据，使用时需要注意数据同步
3. 在使用行操作方法时，需要确保row对象是有效的
4. 某些方法可能会触发表格的重新渲染，频繁调用可能会影响性能
5. 建议在进行数据操作前先进行数据校验

这些是JVxeTable组件回调方法中props参数的主要属性和方法。在实际使用中，可以根据具体需求选择合适的属性和方法来实现功能。如果需要了解更多细节，可以参考VXE-Table的官方文档，因为JVxeTable是基于VXE-Table的封装。