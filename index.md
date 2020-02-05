# 环境
## 1.插件安装
  在内院中 下载安装 节点精灵 apk文件
## 2.框架集成
  在内院中 下载FreeSpace.lua 开发集成库
# 辅助开发
## 无障精灵 -插件获取
### 查看屏幕当前的所有View树
PC = （Windows 或Mac 或 Linux 或 Ios 或 Android）
#### PC查看手机View树
    1. 请保持PC 与 手机连接同一个Wifi
    2. PC 打开任意浏览器 输入. 手机ip:9090/dump
    3. 点击回车或者搜索（当手机屏幕有变动时，请重新 点击回车或搜索）
#### PC查看模拟器View树
    1. 请打开模拟器配置网络桥接模式，并输入静态ip，网段与PC 端一致
    2. PC 打开任意浏览器 输入. 模拟器ip:9090/dump
    3. 点击回车或者搜索（当手机屏幕有变动时，请重新 点击回车或搜索）
## 指令
### 检索规则
#### 创建一个检索规则
- 创建一个检索命令，检索命令支持链式编程增加规则内容
```lua
R()
```

#### 文本 检索
- 创建一个规则，并给这个规则 增加文本检索。
- 检索界面上所有 文本未 ‘退出’的控件。
- 支持正则
```lua
    R():text("退出");
```
#### Id 检索
- 创建一个规则，并给这个规则，增加id 检索
- 检索界面上 id 为‘com.touchscrip/id123’的控件。
- 控件id 可以用用浏览器查看 “设备ip:8080/dump”
- 支持正则
```lua
    R():id("com.touchscrip/id123");
```
#### 控件类型 检索
- 创建一个规则，并给这个规则，增加 控件类型检索
- 检索 界面上 类型 为 ‘TextView’的控件
- 控件id 可以用用浏览器查看 “设备ip:8080/dump”
- 常用的控件类型：
 - TextView  文本类型
 - EditText  输入框
 - Button 按钮
 - ImageView 图片类型
 - LinerLayout 线性布局
 - Relevlayout 相对布局
 - FrameLayout 帧布局
 - 支持正则
   ```lua
   R():type("TextView");
   ```
#### 屏幕范围 检索
- 创建一个规则，并增加屏幕范围检查规则
- 参数
   0 = 不限制是否在屏幕范围内。
   1 = 控件在屏幕中有显示
   2 = 控件不在屏幕中时生效
```lua  
  R():screen(0|1|2) -- 0，1，2 只能选填一个
```
#### 多个检索条件
- 多个条件都满足的情况下才 返回目标
```lua
R():id("1333"):text("退出"):screen(1);
```
#### 查找控件
##### 查找一个控件
```lua
require("FreeSpace");
local rule = By():id("android:id/list");
local view = FreeSpace:findView(rule);
if view then
    view:input("12345");
end
```
##### 查找一组控件
```lua
require("FreeSpace");
local rule = By():type("TextView"):text(".*设备.*");
local views = FreeSpace:findViews(rule);
for k,v in pairs(views) do
    nLog(v.text);
  nLog(v.id);
end
```
##### 操作查找到的控件对象
查找到的控件是个table 对象
Demo:
```lua
{id="1234",text="1245",rect={0,0,1280,720},isClickable = false}
```
id = 控件id
text = 控件文本
rect = 控件在屏幕上显示的范围
isClickable = 控件是否可以点击
等，后期补充
同样 table 继承了 view对象
因此 该table 有 click，input，lclick 等方法可以直接调用
##### 执行命令
###### 点击目标
参数1：R 为检索规则
```lua
FreeSpace:click(R);
```
###### 长按目标
参数1：R 为检索规则
```lua
FreeSpace:lclick(R);
```
###### 文本输入
参数1：R 为检索规则
参数2：要在控件内输入的内容
```lua
FreeSpace:input(R,"msg");
```
### 其他命令
#### 打开应用
```html
ip:9090/system/start?value=应用id
```
#### 打开浏览器访问 -指定网页
```html
ip:9090/system/start/web?value=‘http://www.baidu.com’
```
#### 吐司提示
```html
ip:9090/system/toast?value=要提示的文本
```
