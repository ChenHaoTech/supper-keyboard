;=======|	function	|============================================
TransparentSet(changeSpeed)
{
	global  TransparentFlag 
	; 更透明
	if (changeSpeed < 0) ;to be more transparent
		TransparentFlag := 1
	winGet, Transparent, Transparent,A
	If (Transparent="")
		Transparent=255
	; 新的透明度
	Transparent_New:=Transparent + changeSpeed
	if (Transparent_New < 50)
	   Transparent_New := 50
	if (Transparent_New > 255)
	{
		Transparent_New := 255
		TransparentFlag := 0
	}
	; 透明度修改
	WinSet,Transparent,%Transparent_New%,A
	func_tooltip(Transparent_New)
	return
}
;=======|	key	|============================================
CapsLock & down::
CapsLock & WheelDown::TransparentSet(-10)
CapsLock & up::
CapsLock & WheelUp::TransparentSet(10)
Space & CapsLock::
winGet, Transparent, Transparent,A
WinSet,Transparent,10,A
KeyWait CapsLock
WinSet,Transparent,255,A
return