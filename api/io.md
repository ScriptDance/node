## 快速存储配置
>  可对 移动 设备 本地数据进行读写

---
### 快速存储数据

>语法 save("key",value);

参数:
- key 为 String 类型，必须双引号扩起来
- value 支持 string,number,boolean 类型

```lua 
    save("user","1009883"); --将1009883 存储在本地，索引值为'user'；
```
--- 
### 快速读取数据 

>语法 get("key",defaltValue);

参数:
- key 为 string 类型，必须双引号扩起来
- defaltValue 如果本地没有对应的索引值，则返回一个默认的值
   - 默认值必填
   - 默认值 的 数据类型 应 与 save方法存储的一致
   
```lua 
    local user = get("user","没有获取到值");
    print(user);
```
---

## IO 文件操作
> 原生Lua IO 库 支持
### 路径
> 打开SD 卡路径下的文件

 "/sdcard/1.txt";
 
```lua 
   file = io.open("/sdcard/a.txt","a");
   if file then
     print('文件打开成功');
   end
```