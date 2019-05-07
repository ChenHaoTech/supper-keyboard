;=======|	function	|============================================
funcwWinActive(id){
	global keyWinBind
	if getkeyState("alt","p")
	{
		WinGet, wid, ID, A
		winID := "win" . id
		IniWrite, %wid%, config.ini, winBind_id,  %winID%	
		keyWinBind[id] := wid
	}else
	{	
		wid := keyWinBind[id]
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


;=======|	winActiveHide	|============================================
func_winActiveHide(ways,progrmClass,programPath)
{
	global activePid
	IfWinExist, %ways% %progrmClass%
		IfWinActive, %ways% %progrmClass%
			{
				Send !{ESC}
				WinHide
			}
		else 
		{
			WinShow %ways% %progrmClass%
			WinActivate
		}
	else{
		WinShow %ways% %progrmClass%
		; WinActivate %ways% %progrmClass%
		IfWinNotActive, %ways% %progrmClass%
		{
			WinKill %ways% %progrmClass%
			func_tooltip("wait a moment")
			run %programPath%
			; WinGet activePid ,pid
			; temp := StrSplit(programPath, ".")
			; temp := StrSplit(temp,"\")
			; count := temp._maxIndex()
			; MsgBox, % count
			; _iniWrite("WINACTIVETE",temp[count],activePid)
		}
	}
}


*$enter::normal_key("enter")

;=======|	oneNote	|============================================
Enter & n::func_winActiveHide("ahk_class","Framework::CFrame","C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE")


;=======|	yinxiang	|============================================
Enter & a::
IfWinActive ahk_class YXMainFrame
{
	func_winActiveHide("ahk_class","YXMainFrame",%yinxiang%)
	Sleep 600
	Click 893,246
}else{
	KeyWait a
	if (A_TimeSinceThisHotkey > 200)
		func_winActiveHide("ahk_class","YXMainFrame",%yinxiang%)
	else{
		Send !#^+{n}
		Sleep 600
		Send {enter 2}
	}
}
return


;=======|	xortime	|============================================
Enter & x::
func_winActiveHide("ahk_class","XorTime","C:\Program Files (x86)\XorTime\XorTime.exe")
WinHide ahk_class #32770
return
;=======|	vnote	|============================================
enter & v::func_winActiveHide("ahk_exe", "vnote.exe","D:\Program Portable\VNote\VNote.exe")



;~ eagle download
Enter & e::func_winActiveHide("ahk_class","EagleGet","C:\Program Files (x86)\EagleGet\EagleGet.exe")
;~ fdm
Enter & F::func_winActiveHide("ahk_exe","fdm.exe","C:\Program Files\FreeDownloadManager.ORG\Free Download Manager\fdm.exe")
; F1::func_winActiveHide("ahk_pid","5240","C:\Users\chen\AppData\Local\Programs\Microsoft VS Code\Code.exe")