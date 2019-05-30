;~ 激活托盘区程序的ahk脚本
;2017年1月6日21:27:48 Quant已经修改为之处64位系统
;~ http://leetschau.github.io/blog/2011/02/21/162416/
;~ FEB 21ST, 2011 4:24 PM
;~ 下面的脚本实现了激活系统托盘区（system tray）Outlook程序的效果（Windows XP）,第一行是不在托盘区出现一个autohotkey的图标,这样做的好处是显得比较酷,缺点是如果想中断这个脚本,就只能在任务管理器里关进程（Autohotkey.exe）了。第二行是运行脚本的快捷键（这里是Win键+"]"键）,后面是脚本的具体内容,大体意思是首先用TrayIcons函数找到进程"OUTLOOK.EXE"的各种参数,然后用PostMessage方法向这个进程发指令,令其窗口显示出来,TrayIcons函数中涉及了很多Windows API,俺就不懂了,好用就行。

;~ 使用方法：首先要安装Autohotkey_L v1.0.92.02,将下面的代码保存为一个 UTF-8格式 编码的文本文件,扩展名为ahk,双击运行之。

;~ NoTrayIcon

#SingleInstance, force

DetectHiddenWindows, On
;~ Info := TrayIcons("OUTLOOK.EXE") ; 激活Outlook,这个名字是任务管理器的"进程"里程序对应的进程名称
Info := TrayIcons("Tim.exe") ; 
; Info := TrayIcons("ShadowsocksR.exe") ; 
ListVars
MsgBox hh
; MsgBox %Info%
; StringSplit, TrayInfo, Info,|
; WM_LBUTTONDBLCLK= 0x0203
; PostMessage, TrayInfo1,TrayInfo2, 0x0203,, ahk_id %TrayInfo3% 
; 这句话实现了激活托盘区程序
ExitApp

; Found and abused from

; http://www.autohotkey.com/forum/topic17314.html

; thx, Sean … GREAT WORK!

TrayIcons(sExeName ="")
{
WinGet, pidTaskbar, PID, ahk_class Shell_TrayWnd
hProc := DllCall("OpenProcess", "Uint", 0x38, "int", 0, "Uint", pidTaskbar)
pRB := DllCall("VirtualAllocEx", "Uint", hProc, "Uint", 0, "Uint", 20, "Uint", 0x1000, "Uint", 0x4)
;~ VarSetCapacity(btn, 20)
;~ VarSetCapacity(nfo, 24)
		VarSetCapacity(btn,32,0), VarSetCapacity(nfo,32,0)
VarSetCapacity(sTooltip, 128)
VarSetCapacity(wTooltip, 128 * 2)
SendMessage, 0x418, 0, 0, ToolbarWindow321, ahk_class Shell_TrayWnd
Loop, %ErrorLevel%
{
SendMessage, 0x417, A_Index - 1, pRB, ToolbarWindow321, ahk_class Shell_TrayWnd
DllCall("ReadProcessMemory", "Uint", hProc, "Uint", pRB, "Uint", &btn, "Uint", 20, "Uint", 0)
iBitmap := NumGet(btn, 0), idn := NumGet(btn, 4), Statyle := NumGet(btn, 8)
;~ dwData := NumGet(btn,12), iString := NumGet(btn,16)
		If	dwData	:= NumGet(btn,12)
			iString	:= NumGet(btn,16)
		Else	dwData	:= NumGet(btn,16,"int64"), iString:=NumGet(btn,24,"int64")
DllCall("ReadProcessMemory", "Uint", hProc, "Uint", dwData, "Uint", &nfo, "Uint", 24, "Uint", 0)

		If	NumGet(btn,12)
			hWnd	:= NumGet(nfo, 0)
		,	uID	:= NumGet(nfo, 4)
		,	nMsg	:= NumGet(nfo, 8)
		,	hIcon	:= NumGet(nfo,20)
		Else	hWnd	:= NumGet(nfo, 0,"int64"), uID:=NumGet(nfo, 8), nMsg:=NumGet(nfo,12)
			
;~ hWnd := NumGet(nfo, 0), uID := NumGet(nfo, 4)
;~ nMsg := NumGet(nfo, 8)
WinGet, pid, PID, ahk_id %hWnd%
WinGet, sProcess, ProcessName, ahk_id %hWnd%
WinGetClass, sClass, ahk_id %hWnd%
If !sExeName || (sExeName = sProcess) || (sExeName = pid)
{
DllCall("ReadProcessMemory", "Uint", hProc, "Uint", iString, "Uint", &wTooltip, "Uint", 128 * 2, "Uint", 0)
DllCall("WideCharToMultiByte", "Uint", 0, "Uint", 0, "str", wTooltip, "int", -1, "str", sTooltip, "int", 128, "Uint", 0, "Uint", 0)
sTrayIcons .= nMsg "|" uID "|" hWnd

}

}
DllCall("VirtualFreeEx", "Uint", hProc, "Uint", pRB, "Uint", 0, "Uint", 0x8000)
DllCall("CloseHandle", "Uint", hProc)
Return sTrayIcons
}