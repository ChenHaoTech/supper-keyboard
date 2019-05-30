#Include, winActive.ahk
;=======|	eagle	|============================================
#IfWinActive, ahk_class EagleGet
$*enter::click 1228,780
; 打开下载位置
^j:: Run, D:\download
#if	
;~ eagle download
Enter & e::hWinActiveHide("eagle", "ahk_class EagleGet","C:\Program Files (x86)\EagleGet\EagleGet.exe")
