## 创建检索规则
> 建一个检索命令，检索命令支持链式编程增加规则内容

- R 为 Rule的简写，代表了 规则

```lua
    R();
```
---
## 文本-检索
> 检索界面上所有 文本为 ‘退出’的节点。
- 支持正则
```lua
    R():text("退出");
```
---
## ID-检索
> 检索界面上 id 为‘com.touchscrip/id123’的节点。
- 节点id 可以用用浏览器查看 “设备ip:port/dump”
- 支持正则
```lua
R():id("com.touchscrip/id123");
```
---
## 节点类型-检索
> 检索 界面上 类型 为 ‘TextView’的节点
- 节点id 可以用用浏览器查看 “设备ip:port/dump”
- 常用的节点类型：
  - TextView  文本类型
  - EditText  输入框
  - Button 按钮
  - ImageView 图片类型
  - LinerLayout 线性布局
  - Relevlayout 相对布局
  - FrameLayout 帧布局
  支持正则
```lua
R():type("TextView");
```
---
## 节点描述-检索
> 检索 界面上 节点描述 为 ‘你好’的节点
- 节点desc 可以用用浏览器查看 “设备ip:port/dump” 查看
```lua
R():desc("你好")
```
---
## 子节点个数-检索
> 查找出界面上子节点数量为 "3" 的节点
- 子节点个数 可以用用浏览器查看 “设备ip:port/dump” 查看
```lua
R():childCount(3)
```
---
## 子节点条件-检索
> 查找出 子节点必须满足 text =123 的节点
```lua 
  R():hasChild( R():text("123") );
```
---
## 屏幕范围-检索

> 创建一个规则，并增加屏幕范围检查规则
- 参数:
  - 0 = 不限制是否在屏幕范围内。
  - 1 = 节点在屏幕中有显示
  - 2 = 节点不在屏幕中时生效

```lua
R():screen(0|1|2) -- 0，1，2 只能选填一个
```

## 执行目标-定位

> 创建一个规则，找到一批控件时，精准点击某一个

通常 配合 click,slid 函数使用

```lua
R():id("ttv"):target(1); -- 检索出所有id为'ttv' 的控件，当执行动作时候，只执行到第一个控件。
```

---
## 多个检索条件的 - 组合写法
> 查找 text为'你好'并且 类型为 'TextView' 并且 子节点个数为'3' 的所有节点
```lua 
R():text("你好"):type("TextView"):childCount(3);
```