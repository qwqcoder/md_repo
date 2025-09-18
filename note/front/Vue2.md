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

