# JVxeTable 组件使用指南



`JVxeTable` 是一个基于 `vxe-table` 和 `ant-design-vue` 封装的增强型表格组件，主要用于 Jeecg 框架中，提供强大的数据编辑、校验、联动和交互功能，适用于需要动态、可编辑数据展示的场景。



## 1. 基本用法



`JVxeTable` 组件的使用方式与普通的 Vue 组件类似，您需要在模板中引入并使用它，并通过 `columns` 和 `dataSource` 属性传入表格的列定义和数据。

Code snippet

```
<template>
  <JVxeTable
    ref="myTable"
    :columns="tableColumns"
    :dataSource="tableData"
    :toolbar="true"
    :rowNumber="true"
    :rowSelection="true"
    @valueChange="handleCellValueChange"
    @add="handleAdd"
    @save="handleSave"
  />
</template>

<script>
import JVxeTable from '@/components/jeecg/JVxeTable'; // 假设这是您的组件路径

export default {
  components: {
    JVxeTable,
  },
  data() {
    return {
      tableColumns: [],
      tableData: [],
    };
  },
  created() {
    this.loadData();
  },
  methods: {
    loadData() {
      // 模拟加载数据
      this.tableColumns = [
        { key: 'name', title: '姓名', type: 'input', width: 150 },
        { key: 'age', title: '年龄', type: 'inputNumber', width: 100 },
        { key: 'gender', title: '性别', type: 'select', dictCode: 'sex', width: 100 },
        { key: 'birthDate', title: '出生日期', type: 'date', width: 150 },
      ];
      this.tableData = [
        { id: '1', name: '张三', age: 25, gender: '1', birthDate: '1999-05-20' },
        { id: '2', name: '李四', age: 30, gender: '2', birthDate: '1994-11-12' },
      ];
    },
    handleCellValueChange(event) {
      console.log('单元格值改变:', event);
      // event 包含: { row, column, oldValue, value, cellKey }
    },
    handleAdd() {
      console.log('新增行');
      // 可以通过 this.$refs.myTable.addRows({}) 添加新行
    },
    handleSave() {
      console.log('保存数据');
      // 可以通过 this.$refs.myTable.getAll() 获取所有数据进行保存
    },
  },
};
</script>
```



## 2. Props (属性)



`JVxeTable` 提供了丰富的属性来控制表格的行为和外观:

| 属性名                 | 类型               | 默认值                                                       | 说明                                                         |
| ---------------------- | ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `rowKey`               | `String`           | `'id'`                                                       | 行数据的唯一键                                               |
| `columns`              | `Array`            | `[]`                                                         | **必填**，列的配置信息                                       |
| `dataSource`           | `Array`            | `[]`                                                         | **必填**，表格的数据源                                       |
| `toolbar`              | `Boolean`          | `false`                                                      | 是否显示工具栏                                               |
| `toolbarConfig`        | `Object`           | `{ slots: ['prefix', 'suffix'], btns: ['add', 'remove', 'clearSelection'] }` | 工具栏配置，包括自定义插槽和内置按钮                         |
| `rowNumber`            | `Boolean`          | `false`                                                      | 是否显示行号列                                               |
| `rowSelection`         | `Boolean`          | `false`                                                      | 是否可选择行（显示复选框或单选框）                           |
| `rowSelectionType`     | `String`           | `'checkbox'`                                                 | 行选择类型，可选值：`'checkbox'` (多选) 或 `'radio'` (单选)  |
| `rowExpand`            | `Boolean`          | `false`                                                      | 是否可展开行                                                 |
| `loading`              | `Boolean`          | `false`                                                      | 表格是否处于加载状态                                         |
| `height`               | `Number`, `String` | `'auto'`                                                     | 表格高度                                                     |
| `maxHeight`            | `Number`           | `null`                                                       | 表格最大高度                                                 |
| `disabled`             | `Boolean`          | `false`                                                      | 是否禁用表格内所有组件                                       |
| `dragSort`             | `Boolean`          | `false`                                                      | 是否可拖拽排序（仅实现上下排序）                             |
| `dragSortKey`          | `String`           | `'orderNum'`                                                 | 拖拽排序时保存排序值的字段名                                 |
| `size`                 | `String`           | `'medium'`                                                   | 表格大小，可选值：`'medium'`, `'small'`, `'mini'`, `'tiny'`  |
| `bordered`             | `Boolean`          | `false`                                                      | 是否显示边框线                                               |
| `pagination`           | `Object`           | `{}`                                                         | 分页器配置参数，设置后显示分页器                             |
| `editRules`            | `Object`           | `{}`                                                         | 表格的校验规则                                               |
| `asyncRemove`          | `Boolean`          | `false`                                                      | 是否异步删除行。开启后，删除操作需手动调用 `confirmRemove` 方法 |
| `alwaysEdit`           | `Boolean`          | `false`                                                      | 是否一直显示编辑组件，如果为 `false` 则只有点击时才出现。注意：该参数不能动态修改，且可能导致性能问题 |
| `linkageConfig`        | `Array`            | `[]`                                                         | 联动配置，用于实现下拉选项的联动功能                         |
| `authPre`              | `String`           | `''`                                                         | 权限前缀                                                     |
| `clickRowShowSubForm`  | `Boolean`          | `false`                                                      | 点击行时是否显示子表单                                       |
| `clickRowShowMainForm` | `Boolean`          | `false`                                                      | 点击行时是否显示主表单                                       |
| `clickSelectRow`       | `Boolean`          | `false`                                                      | 是否点击选中行，优先级最低                                   |
| `reloadEffect`         | `Boolean`          | `false`                                                      | 是否开启 reload 数据效果                                     |
| `expandConfig`         | `Object`           | `{}`                                                         | 展开行配置                                                   |
| `disabledRows`         | `Object`           | `{}`                                                         | 要禁用的行（TODO 未完全实现）                                |



## 3. 列定义 (`columns` Prop)



`columns` 属性是一个数组，每个元素都是一个列的配置对象。除了 `vxe-table` 原生的列属性外，`JVxeTable` 扩展了 `type` 属性来指定不同的组件类型。



### 3.1. JVXETypes (内置列类型)



`JVXETypes` 定义了 `JVxeTable` 支持的各种内置组件类型。通过设置列的 `type` 属性为以下值，可以渲染出不同功能的单元格:

- **功能性列:**
  - `rowNumber`: 行号列
  - `rowCheckbox`: 复选框选择列
  - `rowRadio`: 单选框选择列
  - `rowExpand`: 展开列
  - `rowDragSort`: 上下拖拽排序列
- **输入型组件:**
  - `input`: 文本输入框
  - `inputNumber`: 数字输入框
  - `textarea`: 多行文本输入框
- **选择型组件:**
  - `select`: 下拉选择器
  - `selectSearch`: 下拉搜索选择器
  - `selectMultiple`: 下拉多选选择器
  - `checkbox`: 复选框
  - `departSelect`: 部门选择器
  - `userSelect`: 用户选择器
- **日期/时间选择器:**
  - `date`: 日期选择器
  - `datetime`: 日期时间选择器
  - `time`: 时间选择器
- **其他组件:**
  - `upload`: 文件上传
  - `progress`: 进度条
  - `tags`: 拖轮Tags（暂无用）
  - `slot`: 自定义插槽，可以在单元格内渲染任意 Vue 组件或内容
  - `normal`: 普通文本显示（默认类型）
  - `hidden`: 隐藏列



### 3.2. 示例列定义



JavaScript

```
[
  {
    key: 'name',
    title: '姓名',
    type: JVXETypes.input, // 使用输入框类型
    width: 150,
    validateRules: [{ required: true, message: '姓名不能为空' }] // 校验规则
  },
  {
    key: 'age',
    title: '年龄',
    type: JVXETypes.inputNumber, // 使用数字输入框类型
    width: 100
  },
  {
    key: 'gender',
    title: '性别',
    type: JVXETypes.select, // 使用下拉选择器类型
    dictCode: 'sex', // 字典编码，用于自动加载选项
    width: 100
  },
  {
    key: 'birthDate',
    title: '出生日期',
    type: JVXETypes.date, // 使用日期选择器类型
    width: 150
  },
  {
    key: 'description',
    title: '描述',
    type: JVXETypes.textarea, // 多行文本
    width: 200
  },
  {
    key: 'status',
    title: '状态',
    type: JVXETypes.checkbox, // 复选框
    customValue: ['active', 'inactive'], // 自定义选中/未选中值
    defaultChecked: false, // 默认是否选中
    width: 80
  },
  {
    key: 'action',
    title: '操作',
    type: JVXETypes.slot, // 自定义插槽列
    slotName: 'actionSlot', // 插槽名称
    width: 120
  }
]
```



### 3.3. 字典 (`dictCode`)



对于 `select` 等选择型组件，可以通过 `dictCode` 属性指定字典编码，`JVxeTable` 会自动加载对应的字典选项。



### 3.4. 校验规则 (`validateRules`)



`columns` 中的每一列都可以定义 `validateRules` 来进行数据校验。它是一个数组，每个元素是一个校验规则对象:

- **`required: true`**: 必填项
- **`pattern`**: 正则表达式或其他预定义模式（如 `'only'` 用于唯一性校验）
- **`message`**: 校验失败时的提示信息
- **`validator`**: 自定义校验函数
- **`handler`**: 自定义函数校验器



### 3.5. 统计列 (`statistics`)



您可以在列配置中添加 `statistics` 属性，`JVxeTable` 会在表格底部显示该列的统计信息，目前支持 `'sum'` (求和) 和 `'average'` (平均值)。

JavaScript

```
{
  key: 'amount',
  title: '金额',
  type: JVXETypes.inputNumber,
  width: 120,
  statistics: ['sum', 'average'] // 显示总和与平均值
}
```



## 4. 事件



`JVxeTable` 触发的事件包括 `vxe-table` 的原生事件以及 `JVxeTable` 自身封装的事件。

- `@valueChange(event)`: 单元格值改变时触发。`event` 对象包含 `row` (当前行数据), `column` (当前列配置), `oldValue` (旧值), `value` (新值), `cellKey` (单元格的唯一键).
- `@add`: 点击工具栏“新增”按钮时触发.
- `@save`: 点击工具栏“保存”按钮时触发.
- `@remove`: 点击工具栏“删除”按钮时触发.
- `@clearSelection`: 点击工具栏“清空选择”按钮时触发.



## 5. 方法



您可以通过 `ref` 获取 `JVxeTable` 实例，并调用其内部方法。由于 `JVxeTable` 继承了 `VxeGrid` 的所有方法，因此 `vxe-table` 的大部分方法也可以直接通过 `JVxeTable` 实例调用。

- `loadData(data)`: 加载或重新加载表格数据。在 `dataSource` 属性改变时，此方法会被内部自动调用，但您也可以手动调用它来更新表格数据.
- `getAll()`: 获取表格的所有数据，包括新增、修改、删除的数据.
- `validateTable()`: 校验表格数据，返回校验结果。如果没有错误则返回 `null`.
- `insertRows(data, rowIndex)`: 在指定索引处插入新行数据.
- `removeSelectedRows()`: 删除当前选中行（通常与工具栏的“删除”按钮配合使用）.
- `clearSelection()`: 清空所有行选择（通常与工具栏的“清空选择”按钮配合使用）.
- `confirmRemove()`: 当 `asyncRemove` 为 `true` 时，在 `remove` 事件中调用此方法以确认删除操作.
- `rowResort(fromIndex, toIndex)`: 对行进行排序（上移或下移）.



## 6. 高级用法与注意事项





### 6.1. 在 `a-tabs` 中使用



当 `JVxeTable` 嵌套在 `a-tabs` 组件中时，为了确保表格在切换 Tab 后能够正确渲染，您可以在 `a-tab-pane` 上设置 `forceRender` 属性为 `true`。

Code snippet

```
<a-tabs defaultActiveKey="1">
  <a-tab-pane tab="Tab 1" key="1" :forceRender="true">
    <JVxeTable ref="table1" :columns="columns1" :dataSource="data1" />
  </a-tab-pane>
  <a-tab-pane tab="Tab 2" key="2" :forceRender="true">
    <JVxeTable ref="table2" :columns="columns2" :dataSource="data2" />
  </a-tab-pane>
</a-tabs>
```



### 6.2. 性能考量 (`alwaysEdit`)



`alwaysEdit` 属性如果设置为 `true`，单元格组件会一直显示，这在行、列字段较多的情况下可能会导致不同程度的卡顿，影响性能。请根据实际需求权衡使用。



### 6.3. 联动配置 (`linkageConfig`)



`linkageConfig` 允许您配置下拉选择器之间的联动关系，例如选择省份后自动加载对应城市的选项.



### 6.4. 异步删除 (`asyncRemove`)



如果 `asyncRemove` 设置为 `true`，表格不会立即删除行，而是在触发 `remove` 事件后，需要您手动调用 `confirmRemove()` 方法来执行实际的删除操作。这适用于需要在删除前进行额外确认或异步处理的场景.

通过以上详细说明，您应该能够更好地理解和使用 `JVxeTable` 组件来构建功能强大的可编辑表格。



## 来源



- [1] uploaded:JVxeTable.js
- [2] uploaded:JVxeToolbar.vue
- [3] uploaded:vxeUtils.js
- [4] uploaded:jvxeTypes.js
- [5] uploaded:JVxeCheckboxCell.vue
- [6] uploaded:JVxeInputCell.vue
- [7] uploaded:index.js
- [8] uploaded:install.js