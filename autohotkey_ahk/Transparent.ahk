#SingleInstance force   
SetCapsLockState, AlwaysOff


;~ space  & BackSpace::
;~ WinSet, Region, 0-0 300-0 300-300 0-300 0-0   100-100 200-100 200-200 100-200 100-100, WinTitle
;#t::  ; ʹ�� Win+T ����������µ���ɫ͸��.
;~ MouseGetPos, MouseX, MouseY, MouseWin
;~ PixelGetColor, MouseRGB, %MouseX%, %MouseY%, RGB
; �ƺ��б�Ҫ���ȹر��κ����е�͸����:
;~ WinSet, TransColor, Off, ahk_id %MouseWin%
;~ WinSet, TransColor, %MouseRGB% 220, ahk_id %MouseWin%
;~ return



mousePassThrough := 1
;~ space & tab::
if(mousePassThrough == "")
	mousePassThrough := 1
if (mousePassThrough)
{
;��괩͸
MousePenetration("A",,0)
mousePassThrough  := 0
}
else
{
MousePenetration("A",,1)
mousePassThrough  := 1
}
return

MousePenetration(title:="A", num:=150, mode:=0){
;1->��ʾ  0->����
    if(!mode){
		;��͸
		global static hwnd:= WinExist("A")
		;~ MsgBox %hwnd%
		WinSet, ExStyle, +0x20, ahk_id %hwnd%
		WinSet, AlwaysOnTop, On, ahk_id %hwnd%
    }else{
		;��ʾ
		WinSet, AlwaysOnTop, Off, ahk_id %hwnd%
		WinActivate, ahk_id %hwnd%
    }
}



global TransparentFlag := 0 ; initinate flag = fause

CapsLock & down::
CapsLock & WheelDown::TransparentSet(-10)
;~ Space & CapsLock::TransparentSet(-100)

Space & CapsLock::
winGet, Transparent, Transparent,A
WinSet,Transparent,10,A
KeyWait CapsLock
WinSet,Transparent,%Transparent%,A
return

CapsLock & up::
CapsLock & WheelUp::TransparentSet(10)
;~ Space & Tab:: TransparentSet(100)


TransparentSet(changeSpeed)
{
global  TransparentFlag 
if (changeSpeed < 0) ;to be more transparent
    TransparentFlag := 1
winGet, Transparent, Transparent,A
If (Transparent="")
    Transparent=255
Transparent_New:=Transparent + changeSpeed
if (Transparent_New < 50)
   Transparent_New := 50
if (Transparent_New > 255)
{
    Transparent_New := 255
    TransparentFlag := 0
}
WinSet,Transparent,%Transparent_New%,A
ToolTip, %Transparent_New%
SetTimer, Label_transfer, 1500
}
Label_transfer:
tooltip
SetTimer,Label_transfer
return
