; #Include, ./winA.ahk
#Include, ./Lib/utility.ahk
; 使用 space + d 进入debug模式 并且有 hToolTip提示, CapsLock 退出, 其余任意按钮也是退出


; 快捷键:
; 若 == 1 进入
; rc :: 跑当前选中文件 使用 ahk
; r :: reload
; o :: 使用vscode打开
`; & d::
    ; hIniWrite(Debugsignal,Signal, 1)
    Debugsignal := 1
    hToolTip("进入debug模式")
return

#If (Debugsignal == 1) ;or (Debugsignal == "")
capslock::setDebugSignal()

r & c:: 
var := Explorer_GetSelected()
hToolTip("run current ahk")
Run, %A_AhkPath%\AutoHotkey.exe %var%
Sleep 1000
setDebugSignal()
return

r::
hToolTip("reloading")
; Debugsignal := 0
Sleep 500
; setDebugSignal()
; Sleep 300
Reload
return

o:: 
hToolTip("open ahk codeing")
Run C:\Program Files\Microsoft VS Code\Code.exe D:\code\AHK\autohotkey_study\autohotkey_ahk
Sleep 1000
setDebugSignal()
return

w::
run D:\code\AHK\WindowSpy.exe
setDebugSignal()
return
#if
setDebugSignal(){
    global Debugsignal
    hToolTip("退出debug模式")
    Debugsignal := 0
}


