#Include, %A_ScriptDir%/Lib/utility.ahk
;=======|	chrome	|============================================
#IfWinActive, ahk_exe chrome.exe
capslock & g::
; capslock &g 的界面信息
; path "D:\code\AHK\AutoHotkey.exe
; ahk_exe AutoHotkey.exe
; ahk_class #32770
; ahk_id 0x4e1074
; pid 3136
; 文件速览
send, ^{c}
; 有一个inputbox确定后缀
; TODO暂时设置为 js后缀
; InputBox, suffix, 文件速览, 请输入要查看的文件名后缀
; if (suffix == ""){
; 	return
; }
suffix := "js"
;复制到notepad++ 打开, 指定文件夹 iniread
iniread, chromeTmp, %A_ScriptDir%/config.ini, filePath, chromeTmp
; TODO 时间格式失败
; FormatTime, currentTime ,,YYYYMMddhhmmtt
; FormatTime, currentTime, 20050423220133
currentTime := "tmp"
filePath := chromeTmp . "\" . currentTime . "." . suffix
; MsgBox %filePath%
; filePath := "D:\download\chrome\tmp\tmp.js"
file := FileOpen(filePath,"w") ; 文件不存在创建, 覆盖写
; TODO 文件读判断错误
; if !IsObject(file)
; {
; 	MsgBox Can't open "%filePath%" for writing.
; 	return
; }
file.Write(Clipboard)
file.Close()
run C:\Program Files (x86)\Notepad++\notepad++.exe  %filePath%
WinWait, ahk_exe notepad++.exe
send {Enter}
; WinRestore, A
return

; 激活setting
^+p::
IfWinActive, DevTools
{
    send, ^+{p}
    return
}
; 若在 扩展程序 - Google Chrome 上, 激活扩展快捷键
IfWinActive,扩展程序 - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1 
{
    send, ^{t}
    send, chrome://extensions/shortcuts
    Sleep, 300
    send, {Enter}
; 若不在 扩展程序 - Google Chrome 上, 激活设置
}else{
    send, ^{t}
    send, chrome://settings/
    Sleep, 300
    send, {Enter}
}
return

; 激活扩展
^+a:: 
; run https://chrome.google.com/webstore/category/extensions?utm_source=chrome-ntp-icon
IfWinActive 扩展程序 - Google Chrome ahk_exe chrome.exe ahk_class Chrome_WidgetWin_1
{
    ; 若在 扩展程序 - Google Chrome 上
    run, https://chrome.google.com/webstore/category/extensions?hl=zh-CN
    return
}else{
    ; 若不是在 扩展程序 - Google Chrome 
    send, ^{t}
    send, chrome://extensions/
    Sleep, 300
    send, {Enter}
}
return

^j:: run D:\download\chrome
^d:: 
send, ^{d}
click 946,363
return


; 关闭下载状态栏
esc::
MouseGetPos x, y
click 1889,996
MouseMove %x%, %y%
return
; 左右栏
<!-::MouseMove 172,506
<!=::MouseMove 1178,477
; 点击hightlight
!capslock::
click 1492,94
MouseMove 1396,156
return
; bookmark
<!d::
send ^+{b}
; KeyWait d
; KeyWait Lalt
; send ^+{b}
return
; if (bookmarkSignal == False or bookmarkSignal == ""){
; 	; 不动
; 	return
; 	bookmarkSignal := True
; }else{
; 	bookmarkSignal := False
; 	MouseMove 673,116
; 	return
; }
; oneNote
!a::
send !{a}
Sleep 500
click 1696,315
MouseMove 300,513
return
; #MaxHotkeysPerInterval 3
; $*RButton::
; click, Right, down
; click , Right, up 
; return
; $h::hNormalKey("h")
; $h::return
; $*RButton::send,{blind}{RButton}
; ; TODO 后台打开
; RButton & LButton:: send ^{LButton}
#if


