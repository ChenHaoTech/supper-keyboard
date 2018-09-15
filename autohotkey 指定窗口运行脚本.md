# autohotkey 指定窗口运行脚本[链接都是chm的链接 可能无效 需要下载]

### wintile参数

- 匹配行为

  - 控制标题或完整标题与每个窗口的比较方式
  -  可以为准确的标题或包含前面部分或标题任意位置的子字符串或[正则模式](mk:@MSITStore:C:\Program%20Files\AutoHotkey\auto_help\ahk.chm::/docs/misc/RegEx-QuickRef.htm)。

- 活动窗口

  ```
  ; 获取活动窗口的 ID/HWND
  id := WinExist("A")
  MsgBox % id
  
  ; 按下 Win+↑ 来最大化活动窗口
  #Up::WinMaximize, A
  ```

- ahk_class 窗口类

  - 窗口类表示窗口的类型
  - 使用前要指定 ahk_class_ExactClassName
  - 可以用 [WinGetClass](mk:@MSITStore:C:\Program%20Files\AutoHotkey\auto_help\ahk.chm::/docs/commands/WinGetClass.htm) 获取 *ExactClassName*。

  ```ahk
  ; 激活控制台窗口（即 cmd.exe）
  WinActivate, ahk_class ConsoleWindowClass
  ```

- ahk_id 唯一 ID / HWND 

  - 每个窗口都有唯一id, 或者叫句柄
  - 窗口id 使用winExist()或winGet()获取
  - 控件的 ID 通常使用 [ControlGet Hwnd](mk:@MSITStore:C:\Program%20Files\AutoHotkey\auto_help\ahk.chm::/docs/commands/ControlGet.htm#Hwnd)、[MouseGetPos](mk:@MSITStore:C:\Program%20Files\AutoHotkey\auto_help\ahk.chm::/docs/commands/MouseGetPos.htm) 或 [DllCall](mk:@MSITStore:C:\Program%20Files\AutoHotkey\auto_help\ahk.chm::/docs/commands/DllCall.htm) 获取

- ahk_exe 进程名称、路径

  - ahk_pid 限制为某个指定进程

  - ahk_exe 可以包含在进程名称或路径中的所有进程

  - 如果启用了正则的[标题匹配模式](mk:@MSITStore:C:\Program%20Files\AutoHotkey\auto_help\ahk.chm::/docs/commands/SetTitleMatchMode.htm)，则 ahk_exe 可以接受[正则表达式](mk:@MSITStore:C:\Program%20Files\AutoHotkey\auto_help\ahk.chm::/docs/misc/RegEx-QuickRef.htm)。

    ​	

    ```ahk
    ; 激活现有的 notepad.exe 窗口或打开新窗口
    if WinExist("ahk_exe notepad.exe")
        WinActivate, ahk_exe notepad.exe
    else
        Run, notepad.exe
    ```

- ahk_group 窗口组

  ​	

  ​	

  - 使用 ahk_group 可以标识匹配之前由[窗口组](mk:@MSITStore:C:\Program%20Files\AutoHotkey\auto_help\ahk.chm::/docs/commands/GroupAdd.htm)定义的规则的窗口。

  ```
  ; 定义组：Windows 资源管理器窗口
  GroupAdd, Explorer, ahk_class ExploreWClass ; 在 Vista 及更高版本中不使用
  GroupAdd, Explorer, ahk_class CabinetWClass
  
  ; 激活匹配上面条件的任意窗口
  WinActivate, ahk_group Explorer
  ```

- 多重条件

  - 与 [ahk_group](mk:@MSITStore:C:\Program%20Files\AutoHotkey\auto_help\ahk.chm::/docs/misc/WinTitle.htm#ahk_group) （它活动了搜索范围）比起来，在 WinTitle 参数中指定多个条件可以缩小搜索范围。