#SingleInstance force   
SetCapsLockState, AlwaysOff

global TransparentFlag := 0 ; initinate flag = faulse

CapsLock & WheelDown::TransparentSet(-10)
Space & CapsLock::TransparentSet(-100)

Space & esc::
winGet, Transparent, Transparent,A
WinSet,Transparent,10,A
KeyWait esc
WinSet,Transparent,255,A
return

CapsLock & WheelUp::TransparentSet(10)
Space & Tab:: TransparentSet(100)


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
