> **配置路径**: `src/components/layouts`

+ `TabLayout.vue` 提供了多标签页功能
+ `UserLayout.vue` 提供了右上角的系统设置功能

+ 组件化
  + `SidewMenu`
  + `GlobalHeader`
  + `GlobalFooter`

# 对象封装

## 标签页对象

```js
const indexKey = '/dashboard/analysis'
{
    name: "dashboard-analysis", // 主页
    path: indexKey,				// 路径
    fullPath: indexKey,			// 用组件路径
    meta: {
      icon: "dashboard",
      title: "首页",
    },
}
```

