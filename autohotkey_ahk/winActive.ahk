#Include, LIb\utility.ahk
#Include, Lib\activeHide.ahk
#include Lib\transparent.ahk
;=======|	function	|============================================
funcwWinActive(id)
{
	global keyWinBind
	global keyWinBindPath
	winID := "win" . id
	if getkeyState("alt","p"	)
	{
		WinGet, wid, ID, A
		WinGet,wpath,ProcessPath,A
		IniWrite,%wpath%,config.ini,winBind_path,%winID%
		IniWrite, %wid%, config.ini, winBind_id,  %winID%	
		keyWinBind[id] := wid
		keyWinBindPath[id] := wpath
	}else
	{	
		wid := keyWinBind[id]
		wpath := keyWinBindPath[id]
		; id的窗口不存在
		IfWinNotExist,  ahk_id %wid%
		{
			if (wpath == "ERROR"){
				hToolTip("no exe run")
				return
			}
			; exe的窗口不存在
			IfWinNotExist ahk_exe %wpath%
			{
				MsgBox, 4,, confirm runing?  %wpath%
				IfMsgBox Yes
				{
					RunWait,  % keyWinBindPath[id]
				}	
			; 窗口存在
			}else{
				WinActivate ahk_exe %wpath%
			}
			WinWait, ahk_exe %wpath%
			WinGet, wid, ID, A
			WinGet,wpath,ProcessPath,A
			IniWrite,%wpath%,config.ini,winBind_path,%winID%
			IniWrite, %wid%, config.ini, winBind_id,  %winID%	
			keyWinBind[id] := wid
			keyWinBindPath[id] := wpath
		}
		else
			WinActivate, ahk_id  %wid%
	}
}
;=======|	key	|============================================
capslock & 1::funcwWinActive(1)
capslock & 2::funcwWinActive(2)
capslock & 3::funcwWinActive(3)
capslock & 4::funcwWinActive(4)
capslock & 5::funcwWinActive(5)
capslock & 6::funcwWinActive(6)
capslock & 7::funcwWinActive(7)
capslock & 8::funcwWinActive(8)
capslock & 9::funcwWinActive(9)
capslock & 0::funcwWinActive(10)



*$enter::hNormalKey("enter")
;=======|	oneNote	|============================================
Enter & n::hWinActiveHide("oneNote", "OneNote ahk_exe ONENOTE.EXE ahk_class Framework::CFrame","C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE")

; ;=======|	yinxiang	|============================================
; Enter & a::hWinActiveHide("ahk_class YXMainFrame",%yinxiang%)


;=======|	xortime	|============================================
Enter & x::
hWinActiveHide("xortime", "XorTime ahk_class XorTime ahk_exe XorTime.exe","C:\Program Files (x86)\XorTime\XorTime.exe")
WinHide ahk_class #32770
return
;=======|	vnote	|============================================
enter & v::hWinActiveHide("vnote","VNote ahk_class Qt5QWindowIcon ahk_exe vnote.exe","D:\Program Portable\VNote\VNote.exe")




;~ fdm
Enter & F::hWinActiveHide("fdm", "Free Download Manager ahk_class Qt5QWindowIcon ahk_exe fdm.exe","C:\Program Files\FreeDownloadManager.ORG\Free Download Manager\fdm.exe")


; TOFIX 激活的时候激活不存在的界面
; enter & p::
; ; DetectHiddenWindows, On
; ; var := WinExist("ahk_class CabinetWClass")
; ; DetectHiddenWindows, Off
; ; MsgBox %var%
; hWinActiveHide("ahk_class CabinetWClass ahk_exe Explorer.EXE", "C:\Windows\explorer.exe")
; return
; IfWinActive ahk_class CabinetWClass
; {
; 	MouseGetPos, x, y
; 	; click 1749,13
; 	click 1760,27
; 	MouseMove, X, Y 
; }
; else
; {
; 	run D:\文档
; 	WinWait ahk_class CabinetWClass
; 	Send ^{w}
; 	WinMaximize ahk_class CabinetWClass
; }

enter & c::hWinActiveHide("code", "Visual Studio Code ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe", "C:\Program Files\Microsoft VS Code\Code.exe")
; enter & q::hWinActiveHide("ahk_exe TIM.exe ahk_class TXGuiFoundation","C:\Program Files (x86)\Tencent\TIM\Bin\TIM.exe")

enter & s::ExistOrRunWithMsgBox("ShadowsocksR.exe","D:\Program Portable\ssr-win\ShadowsocksR.exe")


ExistOrRun(exe, path){
	Process, Exist, %exe%
	; 存在匹配进程, ErrorLevel 为指定的pid
	if (ErrorLevel != 0){
		Process, Close, %exe%
		if (ErrorLevel != 0) ; 杀进程成功
		{
			hToolTip("杀进程成功" . exe)
			return
		}else{
			MsgBox 杀进程失败: %exe%
			return
		}
	}else{ ; 不存在匹配进程
		run %path%
		hToolTip("启动ShadowsocksR.exe中....")
	}
}


ExistOrRunWithMsgBox(exe, path){
	; TODO 显示日志检查器
	; if(hLongPress("s")){
	; 	WinShow	, 日志查看器 ahk_exe ShadowsocksR.exe ahk_class WindowsForms10.Window.8.app.0.2bf8098_r11_ad1
	; }
	; 使用msg判断是否要处理对应exe文件(进程)
	MsgBox, 4,, 确认关闭/开启: %exe%`n`nrun进程(YES)	 kill进程(NO)
	; TODO 没有办法, 总是关不干净
	;  -> 按 yes: 运行进程
	IfMsgBox Yes
	{
		Process, Exist, %exe%
		; 存在匹配进程, ErrorLevel 为指定的pid
		;========| 使用直接run, 不判断是否有进程|===========
		run , %path%	
		;========| 有判断, 看是否有进程|===========
		; if (ErrorLevel != 0)
		; { ; -> 若进程已存在, Return
		; 	return
		; }else{
		; ;  ->进程不存在, run
		; 	run , %path%	
		; 	Process, wait, %exe%, 2
		; 	if (ErrorLevel == 0) ; 找不到进程
		; 	{
		; 		run , %path%	
		; 	}
		; }
	;  -> 按 no: kill对应进程
	}else{ 
		Process, Exist, %exe%
		; 存在匹配进程, ErrorLevel 为指定的pid
		if (ErrorLevel != 0)
		{
			; -> 进程存在,kill对应进程
			Process, Close, %exe%			
			; 重复多次kill, 保证一定kill
			Process, Close, %exe%			
			Process, Close, %exe%	
			DetectHiddenWindows, On ;必须的
			WM_CLOSE=0x10
			WM_QUIT=0x12	
			PostMessage, WM_CLOSE
   			PostMessage, WM_QUIT
			; WinHide, ahk_class Shell_TrayWnd
			; WinShow, ahk_class Shell_TrayWnd

		}else{
			; -> 进程不存在, Return
			return
		}
	} 
}

enter & F1::hWinActiveHide("ExtraChm", "ExtraChm ahk_exe ExtraChm.exe", "D:\Program Portable\extrachm_jb51\ExtraChm.exe")
;=======|	QQ tim	|============================================
CapsLock & Tab::
Process, Exist, tim.exe
if (ErrorLevel ==0) ; 找不到进程
{
	run C:\Program Files (x86)\Tencent\TIM\Bin\TIM.exe
	return
}
Send !^+{z}
Sleep 100
IfWinActive, ahk_exe tim.exe
{
	convertTypeWriter("C")
}
return

;=======|	winActiveHide	|============================================
; TODO 设置获得所有的:
;  title exe class id(?)
hWinActiveHide(key, ways,programPath,hideMode:=True)
{
	; 窗口存在
	IfWinExist, %ways% 
	{
		; 窗口已激活
		IfWinActive, %ways% 
			{
				Send !{ESC}
				if (hideMode == 0)
					WinMinimize
				else
					WinHide,  %ways%
			}
		; 窗口未激活
		else 
		{
			if(hideMode == False)
				WinMaximize
			else
				WinShow, %ways% 
			WinActivate, %ways%
		}
	}
	; 窗口不存在
	else{
		WinShow, %ways%
		WinActivate,  %ways%
		IfWinNotActive,  %ways% 
		{
			hToolTip("wait a moment",2000)
			run %programPath%
			WinActivate  %ways%
		}
	}
}