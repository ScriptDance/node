## 图色模块
>  可对设备进行图色操作

---
### 快速全屏截图

>语法 capture("path") 

参数:
- path 为 截图存储的路径

```lua 
    capture("/sdcard/DCIM/1.png") --将当前屏幕截图并保存在相册 并命名为1.png
```
--- 
### 屏幕区域截图

>语法 capture("path",left,top,right,bottom) 

参数:
- path ： 截图存储的路径
- left ： 截图范围 左上角x坐标
- top ： 截图范围 左上角y坐标
- right ： 截图范围 右下脚x坐标
- bottom ： 截图范围 右下脚y坐标

```lua 
    capture("/sdcard/DCIM/1.png",0,0,300,400) --将当前屏幕[0,0,300,400]区域 截图并保存在相册 并命名为1.png
```
--- 