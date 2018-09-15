;;使用快捷键打开指定窗口
#SingleInstance force ;强制单进程
;#NoTrayIcon ; 不显示托盘图标
SetCapsLockState, AlwaysOff ; set caplock key always off


CapsLock & 1::
	if WinExist("ahk_exe C:\Program Files\Mozilla Firefox\firefox.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Program Files\Mozilla Firefox\firefox.exe
	else
		Run, C:\Program Files\Mozilla Firefox\firefox.exe
	return

CapsLock & 2::
	if WinExist("ahk_exe C:\Program Files (x86)\XMind\XMind.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Program Files (x86)\XMind\XMind.exe
	else
		Run, C:\Program Files (x86)\XMind\XMind.exe
	return

	
;~ !& CapsLock & 2::
	;~ if WinExist("ahk_exe C:\Program Files\mindmaster\MindMaster.exe")
		;~ IfWinActive
			;~ WinMinimize
		;~ else
			;~ WinActivate , ahk_exe C:\Program Files\mindmaster\MindMaster.exe
	;~ else
		;~ Run, C:\Program Files\mindmaster\MindMaster.exe
	
