## HTTP 模块
>  对接第三方接口，目前提供 GET，POST-Form，POST-Body

---
### HTTP-GET

http get 请求

>语法 httpGet(url,params)

参数:
- url 为 请求的url 地址 例如:http://www.baidu.com;
- params url 中提交的参数  table类型 【!可为空】

```lua 
    --获取百度网页的所有数据 
    local url = "http://www.baidu.com";
    res = httpGet(url);
    if res then 
        print(res);
    else 
        print('获取失败')    
    end

```
--- 
### HTTP-POST FROM

http form 表单请求

>语法 capture("path",left,top,right,bottom) 

参数:
- url 为 请求的url 地址 例如:http://www.baidu.com;
- params url 中提交的参数  table类型 【!可为空】

```lua 
    local url = "http://47.104.139.55/api/game";
    local p = {
        name = "抖音",
        offset = "0",
        limit = "10"
    }
    res = httpPostForm(url,p);
    if res then 
        print(res);
    else 
        print('获取失败')    
    end

```
--- 
### HTTP-POST BODY

http body 提交

>语法 capture("path",left,top,right,bottom) 

参数:
- url 为 请求的url 地址 例如:http://www.baidu.com;
- params url 中提交的参数  table类型 【!可为空】

> demo 提交 json 数据至服务器
```lua 
    llocal url = "http://47.104.139.55/api/game";
     local p = {
         name = "抖音",
         offset = "0",
         limit = "10"
     }
     -- 如果 p的类型为table 会自动转换为json 传入body 
     -- 如果 p的类型为string 会直接传入body中
     res = httpPostBody(url,p);
     if res then 
         print(res);
     else 
         print('获取失败')    
     end

```
--- 




