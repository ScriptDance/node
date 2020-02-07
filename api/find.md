## 检索一个节点 | find()
-  语法 

   > find( [R()](/api/rule) ) 

   检索节点 需要传入参数 [R()](/api/rule) 

```lua 
local rule = R():id("android:id/list");
local view = find(rule);
if view then
   print(view.text);     -- 节点的文本 string
   print(view.id);       -- 节点的id string
   print(view.desc);     -- 节点的描述 string
   print(view.isClick)   -- 节点是否可点击 boolean
   print(view.type)      -- 节点类型 string
   print(view.isChecked) -- 节点是否被勾选|选中 boolean
   print(view.childCount)-- 节点包含的子控件个数 number
   print(view.rect[1]..','..view.rect[2]..','..view.rect[3]..','..view.rect[4])    
   -- 节点在屏幕上显示的区域 table {0,100,1280,720} 前两位区域左上角坐标，后两位区域右下角坐标
end
```
----
## 检索一组节点 | finds()
- 语法

   > finds( [R()](/api/rule) ) 

   检索节点 需要传入参数 [R()](/api/rule) 

```lua
local rule = R():type("TextView"):text(".*设备.*");
local views = finds(rule);
for k,view in pairs(views) do
     print("第"..k.."个控件")
     print(view.text);     -- 节点的文本 string
     print(view.id);       -- 节点的id string
     print(view.desc);     -- 节点的描述 string
     print(view.isClick)   -- 节点是否可点击 boolean
     print(view.type)      -- 节点类型 string
     print(view.isChecked) -- 节点是否被勾选|选中 boolean
     print(view.childCount)-- 节点包含的子控件个数 number
     print(view.rect[1]..','..view.rect[2]..','..view.rect[3]..','..view.rect[4])   
     -- 节点在屏幕上显示的区域 table {0,100,1280,720} 前两位区域左上角坐标，后两位区域右下角坐标
end
```


