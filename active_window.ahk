;;ʹ�ÿ�ݼ���ָ������
#SingleInstance force ;ǿ�Ƶ�����
;#NoTrayIcon ; ����ʾ����ͼ��
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
	
