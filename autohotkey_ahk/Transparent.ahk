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
send !{esc}
KeyWait, CapsLock
send !+{esc}
; winGet, Transparent, Transparent,A
; WinSet,Transparent,10,A
; ; WinSet, TransColor, white, A
; ;TODO 鼠标当前位置穿透
; KeyWait CapsLock
; WinSet,Transparent,255,A
return
; #q:: 
; ; WinSet , Style, ^0x10000, A
; MouseGetPos, MouseX, MouseY, MouseWin
; PixelGetColor, MouseRGB, %MouseX%, %MouseY%, RGB
; return
; WinSet, Transparent, 200, Untitled - Notepad ; 让窗口稍有点透明.
; WinSet, TransColor, White, Untitled - Notepad ; 让白色部分透明.
; WinSet, AlwaysOnTop, toggle, Calculator ; 切换计算器的置顶状态.

; 较长的例子:
; 这里是一些演示 "Transparent" 和
; "TransColor" 效果的一些热键.  注意: 如果您在鼠标悬停在设置了 TransColor 的窗口透明部分时
; 按下了其中一个热键, 
; 那么热键会对在那个位置后面的窗口起作用!还有, Win+G 只有在
; Windows XP 上才有效果, 因为
; Windows 2000 中不支持获取透明度:

; #t::  ; 使用 Win+T 来让鼠标光标下的颜色透明.
; MouseGetPos, MouseX, MouseY, MouseWin
; PixelGetColor, MouseRGB, %MouseX%, %MouseY%, RGB
; ; 似乎有必要首先关闭任何现有的透明度:
; WinSet, TransColor, Off, ahk_id %MouseWin%
; WinSet, TransColor, %MouseRGB%, ahk_id %MouseWin%
; return

; #o::  ; 使用 Win+O 来关闭鼠标下窗口的透明度.
; MouseGetPos,,, MouseWin
; WinSet, TransColor, Off, ahk_id %MouseWin%
; return

; #g::  ; 使用 Win+G 来显示鼠标下窗口的当前透明设置.
; MouseGetPos,,, MouseWin
; WinGet, Transparent, Transparent, ahk_id %MouseWin%
; WinGet, TransColor, TransColor, ahk_id %MouseWin%
; ToolTip Translucency:`t%Transparent%`nTransColor:`t%TransColor%
; return
