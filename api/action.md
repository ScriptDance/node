## 点击 | click()
> 语法1: <code> click( [R()](/api/rule) ) </code>

  
   点击 需要传入参数 [R()](/api/rule)  
   
   满足规则的节点 都将被点击

```lua 
local rule = R():id("android:id/list");
click(rule);
```

> 语法2: <code>view:click();</code>

   
   
   [view](/api/find.md)   为 find()|finds() 检索出的结果 

```lua 
 local rule = R():id("android:id/list");
 local view = find(rule);
 if view then
    view:click();
 end
```

> 语法3: <code>click(x,y);</code>
   
   !!! Android 7.0 以上系统可使用
   click(x,y) 可一传入一个屏幕上的坐标

```lua 
 -- 点击屏幕上 坐标 为 100，700 的地方
 click(100,700);
```
----

## 滑动 | slid()
> 语法1: <code>slid([R()](/api/rule),0)</code>

   参数1: [R()](/api/rule)
   
   参数2: 0= 向前滑动， 1= 向后滑动

```lua
local rule = R():id("android:id/list");
   click(rule,0); --向前滑动 !需要控件本身支持滑动
-- click(rule,1); --向后滑动 
```

> 语法2:<code>view:slid(0|1);</code>

   
   
   参数: 0= 向前滑动， 1= 向后滑动
   
   [view](/api/find.md)   为 find()|finds() 检索出的结果 
   

```lua 
 local rule = R():id("android:id/list");
 local view = find(rule);
 if view then
    view:slid(0); --向前滑动 !需要控件本身支持滑动
  --view:slid(1); --向后滑动 !需要控件本身支持滑动   
 end
```
---

> 语法3: <code>slid(x1,y1,x2,y2,time);</code>
   
   !!! Android 7.0 以上系统可使用
   slid(x1,y1,x2,y2,speed)
   从 坐标（x1,y1）滑动到（y1,y2） 耗时为time（单位毫秒） 默认1000毫秒

```lua 
 -- 从坐标 100,100 滑动 到 坐标 700，700
 slid(100,100,700,700);
 
 -- 从坐标 100,100 滑动 到 坐标 700，700 耗费时间2000毫秒
  slid(100,100,700,700,2000);
```
----

## 文本输入 | input()
- 支持传统Android app界面 与 html界面

> 语法1:<code>input( [R()](/api/rule),"要输入的文本") </code>

   参数【1】 [R()](/api/rule)  为 find()|finds() 检索出的结果 
   
   参数【2】要输入的文本内容
   
   满足规则的节点 都将会被尝试输入内容

```lua 
local rule = R():id("android:id/list");
input(rule,"要输入的内容");
```

> 语法2: <code>view:input("要输入的内容");</code>
   
   参数【1】要输入的文本内容

```lua 
 local rule = R():id("android:id/list");
 local view = find(rule);
 if view then
    view:input("要输入的文本");
 end
```
----
## 长按 | clickl()
> 语法1: <code>clickl( [R()](/api/rule) ) </code>

   长按 需要传入参数 [R()](/api/rule)  
   
   满足规则的节点 都将被长按

```lua 
local rule = R():id("android:id/list");
clickl(rule);
```

> 语法2: <code>view:clickl();</code>

   [view](/api/find.md)   为 find()|finds() 检索出的结果 

```lua 
 local rule = R():id("android:id/list");
 local view = find(rule);
 if view then
    view:clickl();
 end
```
---
## 模拟按键
### Home 键
```lua
    home();
```
---
### 返回 键
```lua
    back();
```
---
### 弹出通知栏 
```lua
    noti();
```
---
### 打开最近任务 
```lua
    jobs();
```
---
