;=======|	function	|============================================
funcwWinActive(id){
	global keyWinBind
	global keyWinBindPath
	winID := "win" . id
	if getkeyState("alt","p")
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
		IfWinNotExist,  ahk_id %wid%
		{
			path := keyWinBindPathp[id]
			MsgBox, 4,, confirm runing?  %path%
			IfMsgBox Yes
			{
				WinGet, wid, ID, A
				WinGet,wpath,ProcessPath,A
				IniWrite,%wpath%,config.ini,winBind_path,%winID%
				IniWrite, %wid%, config.ini, winBind_id,  %winID%	
				keyWinBind[id] := wid
				keyWinBindPath[id] := wpath
				run % keyWinBindPath[id]

			}
			else
				return
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


;=======|	winActiveHide	|============================================
func_winActiveHide(ways,progrmClass,programPath,hideMode:=True)
{
	global activePid
	IfWinExist, %ways% %progrmClass%
		IfWinActive, %ways% %progrmClass%
			{
				Send !{ESC}
				if (hideMode == 0)
					WinMinimize
				else
					WinHide
			}
		else 
		{
			if(hideMode == False)
				WinMaximize
			else
				WinShow %ways% %progrmClass%
			WinActivate
		}
	else{
		WinShow %ways% %progrmClass%
		WinActivate
		IfWinNotActive, %ways% %progrmClass%
		{
			func_tooltip("wait a moment",2000)
			run %programPath%
			WinActivate %ways% %progrmClass%
		}
	}
}


*$enter::normal_key("enter")

;=======|	oneNote	|============================================
Enter & n::func_winActiveHide("ahk_class","Framework::CFrame","C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE")

;=======|	yinxiang	|============================================
Enter & a::func_winActiveHide("ahk_class","YXMainFrame",%yinxiang%)


;=======|	xortime	|============================================
Enter & x::
func_winActiveHide("ahk_class","XorTime","C:\Program Files (x86)\XorTime\XorTime.exe")
WinHide ahk_class #32770
return
;=======|	vnote	|============================================
enter & v::func_winActiveHide("ahk_exe", "vnote.exe","D:\Program Portable\VNote\VNote.exe",False)



;~ eagle download
Enter & e::func_winActiveHide("ahk_class","EagleGet","C:\Program Files (x86)\EagleGet\EagleGet.exe")
;~ fdma
Enter & F::func_winActiveHide("ahk_exe","fdm.exe","C:\Program Files\FreeDownloadManager.ORG\Free Download Manager\fdm.exe")
; F1::func_winActiveHide("ahk_pid","5240","C:\Users\chen\AppData\Local\Programs\Microsoft VS Code\Code.exe")