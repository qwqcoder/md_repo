# 组件

## 组件注册

+ 局部注册

```js
var Child = {
  template: '<div>A custom component!</div>'
}
new Vue({
  // ...
  components: {
    // <my-component> 将只在父模板可用
    'my-component': Child
  }
})
```

+ 全局注册

```html
<div id="example">
  <my-component></my-component>
</div>
```

```js
// 注册
Vue.component('my-component', {
  template: '<div>A custom component!</div>'
})
// 创建根实例
new Vue({
  el: '#example'
})
```

> 渲染结果

```html
<div id="example">
  <div>A custom component!</div>
</div>
```

# render

在 Vue 的 `render` 函数中，核心是通过 `createElement` 方法（通常简写为 `h`）来创建虚拟 DOM 节点，这个方法确实接收三个主要参数，

完整语法如下： 

```javascript
createElement(
  tag,      // 标签名/组件 (必填)
  data,     // 节点属性数据 (可选)
  children  // 子节点 (可选)
)
```



### 1. 第一个参数：`tag`（标签/组件类型）

 定义要创建的节点类型，必填项，支持多种形式：

- **HTML 标签名**：字符串类型，如 `'div'`、`'span'`、`'button'` 等
- **组件选项对象**：如局部注册的组件 `MyComponent`
- **异步组件**：通过 `() => import('./MyComponent.vue')` 引入的组件
- **函数式组件**：返回虚拟节点的函数

```js
// HTML标签
render(h) {
  return h('div') // 创建<div></div>
}

// 组件
import MyComponent from './MyComponent.vue'
render(h) {
  return h(MyComponent) // 创建组件节点
}
```

### 2. 第二个参数：`data`（节点属性数据）

用于设置节点的各种属性，可选参数（可省略），是一个对象，包含以下常用配置：

| 分类           | 常用属性             | 说明                                    |
| -------------- | -------------------- | --------------------------------------- |
| **基础属性**   | `class`、`style`     | 类名和样式（支持对象 / 数组形式）       |
| **HTML 属性**  | `attrs`              | 原生 HTML 属性（如 `id`、`title`）      |
| **DOM 属性**   | `domProps`           | DOM 元素属性（如 `innerHTML`、`value`） |
| **事件**       | `on`                 | 事件监听（如 `click`、`input`）         |
| **自定义事件** | `nativeOn`           | 原生 DOM 事件（用于组件）               |
| **props**      | `props`              | 传递给子组件的 props 数据               |
| **插槽**       | `scopedSlots`        | 作用域插槽配置                          |
| **其他**       | `key`、`ref`、`slot` | 节点标识、引用、插槽名称                |

+ 示例:

```js
render(h) {
  return h('button', {
    class: { active: this.isActive }, // 动态类名
    style: { fontSize: '16px' },      // 内联样式
    attrs: { id: 'my-btn' },          // HTML属性
    on: { click: this.handleClick },  // 事件监听
    domProps: { innerHTML: '<strong>点击我</strong>' } // DOM属性
  })
}
```

### 3. 第三个参数：`children`（子节点）

- **字符串**：文本节点
- **虚拟节点**：通过 `h()` 创建的节点
- **数组**：多个子节点的集合（可嵌套）

```js
// 文本子节点
render(h) {
  return h('div', null, '这是文本内容')
}

// 多个子节点（数组形式）
render(h) {
  return h('div', null, [
    h('span', '第一个子元素'),
    h('button', '第二个子元素')
  ])
}

// 嵌套子节点
render(h) {
  return h('div', [
    h('p', [
      h('span', '嵌套内容')
    ])
  ])
}
```

