#Persistent ;脚本自动执行
#NoTrayIcon ;不显示托盘图标
#SingleInstance, force ;单例模式
;此处开始写初始化语句:
picFullName := "D:\code\AHK\autohotkey_study\autohotkey_ahk\resource\image\双拼.png"
return

*esc::
Gui, Add, Picture, w1000 h-1, %picFullName%
Gui, Show
; MsgBox
WinSet, Style, -0xC00000, A
KeyWait, esc
WinKill,A
return