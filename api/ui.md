## UI窗口
>  创建一个窗口并显示在 移动设备上

```lua
    ui={
        title="游自在欢迎你的光临";
        views={
            {type="text",value="请输入痘印的账号密码"},
            {title ="账号",type="edit",hint="请输入账号",id="name"},
            {title ="密码",type="edit",value="eee"},
            {title ="多选",type="check",value="18级 |19级 |20级 ",ore=1,id="pp"},
            {title ="单选",type="radio",value="18级 |19级 |20级 ",ore=0,id="cc"},
        }
    }
    local ret = show( ui )
    if ret then
        print('用户选择了确认')
    else
        print('用户选择了取消')
    end
```
---
### 创建一个窗口
> 创建一个UI 窗口，

- ui = {};
```lua
   ui = {
       
   };
```
---
### 设置 窗口 标题
> 给窗口设置一个标题，该标题显示最顶端

- title ="这是一个标题"
```lua
   ui = {
      title = "这是一个标题";
   };
```
---
### 设置 窗口 的控件组
> 给窗口 设置一组控件【仅可设置一组】

- views = {};
```lua
   ui = {
      title = "这是一个标题";
      views = {
        --把所有控件 都写在这个集合里
      };
   };
```
---
### 显示 窗口
> 给窗口设置一个标题，该标题显示最顶端

- show(ui) 该函数会返回一个boolean 值 true=用户选择了确定；false= 用户选择了取消
```lua
   ui = {
      title = "";
   };
   local ret = show( ui )
       if ret then
           print('用户选择了确认')
       else
           print('用户选择了取消')
    end
```
---
## View控件
> 可创建 "文本控件" "输入框架" "单选控件" "多选控件"
### 文本控件
文本控件:在设备上显示一段文字

> 语法:

{type="text",value="请输入痘印的账号密码"}

> 属性:
- type ="text" (标记类型为文本型)
- value ="这是一个文本" （设置文本控件 的内容）

> 案例:

```lua
    ui={
        title="游自在欢迎你的光临";
        views={
            {type="text",value="请输入痘印的账号密码"}
        }
    }
    local ret = show( ui )
    if ret then
        print('用户选择了确认')
    else
        print('用户选择了取消')
    end
```
---
### 输入框控件
输入框控件:用户可通过此控件输入值

> 语法:

{title ="账号",type="edit",hint="请输入账号",id="name"},

> 属性:
- id ="变量名" （可通过 此名称取到 用户输入的值，详情见案例）
- title ="text" (控件的提示信息)
- type ="text" (标记为输入框类型)
- value ="user" （输入框内的文本值）
- hint ="请输入密码" （提示用户需要输入的值）

> 案例:

```lua
    ui={
        title="游自在欢迎你的光临";
        views={
            {title ="账号",type="edit",hint="请输入账号",id="name"}
        }
    }
    local ret = show( ui )
    if ret then
        print('用户输入的值'..name);
    else
        print('用户选择了取消')
    end
```
---
### 多选框 控件
输入框控件:用户可通过此控件输入值

> 语法:

{title ="多选",type="check",value="18级 |19级 |20级 ",ore=1,id="p1|p2|p3"}

> 属性:
- id ="变量名" ！！！【多个id请用'|' 隔开，不可用数字开头！ 】
- title ="text" (控件的提示信息)
- type ="text" (标记为多选类型)
- value ="18级 |19级 |20级 " （创建多个多选框请用'|' 隔开，id的位置和value 值的位置对应！）
- ore =0 （设置布局朝向 默认 为0 ，0= 纵向布局，1= 横向布局）

> 案例:

```lua
    ui={
        title="游自在欢迎你的光临";
        views={
            {title ="多选",type="check",value="18级 |19级 |20级 ",ore=1,id="p1|p2|p3"}
        }
    }
    local ret = show( ui )
    if ret then
        if p1 then  print('18级勾选了') end;
        if p2 then  print('19级勾选了') end;
        if p3 then  print('20级勾选了') end;
    else
        print('用户选择了取消')
    end
```
---
### 单选框 控件
输入框控件:用户可通过此控件输入值

> 语法:

{title ="单选",type="radio",value="18级 |19级 |20级 ",ore=0,id="cc"},

> 属性:
- id ="变量名" （单选框 只填写一个id 即可。用户点击确定后会返回 选中单选框的值）
- title ="text" (控件的提示信息)
- type ="radio" (标记为单选类型)
- value ="18级 |19级 |20级 " （创建多个多选框请用'|' 隔开）
- ore =0 （设置布局朝向 默认 为0 ，0= 纵向布局，1= 横向布局）

> 案例:

```lua
    ui={
        title="游自在欢迎你的光临";
        views={
            {title ="单选",type="radio",value="18级 |19级 |20级 ",ore=0,id="cc"}
        }
    }
    local ret = show( ui )
    if ret then
        print("单选框的值为:"..cc);
    else
        print('用户选择了取消')
    end
```
---
