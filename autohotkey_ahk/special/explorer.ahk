#Include, ./Lib/Explorer_GetPath.ahk
#Include, ./Lib/utility.ahk
;=======|	explore.exe	|============================================
#IfWinActive, 另存为 ahk_class #32770
<!a::click 181,110
<!-::MouseMove 137,331
<!=::MouseMove 717,322
<!w::fileSwitcher("D:\文档")
<!D::fileSwitcher("D:\下载")
<!c::fileSwitcher("D:\code")
fileSwitcher(fileName:="D:\"){
	send ^{l}
	Sleep 300
	send {bs}
	send ^{space}
	send %fileName%
	Sleep 300
	send {enter}
	send ^{space}
	return
}
#If
; 在主界面
#IfWinActive ahk_class CabinetWClass
<!=::
click 738,638
Sleep 300
send {esc}
return
<!-::MouseMove 328,597

^t::send ^{t}^{l}
; TODO 在新标签页打开
!a::
Sleep 500
Send ,{RButton}
Send {p 2}
Send {enter}
return

; path "D:\Program Portable\cmder\vendor\conemu-maximus5\ConEmu64.exe
; ahk_exe ConEmu64.exe
; ahk_class VirtualConsoleClass
; ahk_id 0x91988
; pid 9256
; [1/1] Cmder
+^o::
var := Explorer_GetPath()
; Run,"D:\Program Portable\cmder\vendor\conemu-maximus5\ConEmu64.exe" , %var%
Run powershell.exe ,%var%
return

<!q::

; send, ^{c}
; send, !+^{z}
; WinWait, ahk_exe TIM.exe ahk_class TXGuiFoundation
; click,  116,53
; send, 手机
; Sleep, 300
; send, {enter}
; WinWait, ahk_exe TIM.exe ahk_class TXGuiFoundation 我的Android手机
; send, ^{v}
; send, {enter}

send, {AppsKey 3}
Sleep 500
send, {up 9}{Right}
Sleep 100
send, {enter}
return
#if


enter & p::
; 如果界面已激活
if (WinActive("ahk_class CabinetWClass ahk_exe Explorer.EXE")){
	; 等待 explorer界面
	WinWait, ahk_class CabinetWClass ahk_exe Explorer.EXE
	; 获得当前界面的title
	WinGetTitle, titileExplorer, A
	; ; 获得当前文件路径
	; titileExplorer := Explorer_GetPath()
	IniWrite, %titileExplorer%,%A_ScriptDir%/config.ini, title, explorer
	WinHide , %titileExplorer% ahk_class CabinetWClass ahk_exe Explorer.EXE
}else{ ; 如果界面未激活;
	; titileExplorer := hIniRead(explorerPath, filePath)
    IniRead titileExplorer,%A_ScriptDir%/config.ini,title, explorer
	; MsgBox, %titileExplorer%
	; run, %titileExplorer%
	winshow,  %titileExplorer% ahk_class CabinetWClass ahk_exe Explorer.EXE
	WinActivate, %titileExplorer% ahk_class CabinetWClass ahk_exe Explorer.EXE
}
return

