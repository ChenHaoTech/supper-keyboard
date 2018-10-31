; reference link : https://www.zhihu.com/question/19645501/answer/39906404
; make caplock convert capslock to fit vi editor
SendMode Input
#SingleInstance force ;强制单进程
;#NoTrayIcon ; 不显示托盘图标
#Persistent
SetCapsLockState, AlwaysOff
;================================== | space |========================================
$Space::
Send,{space}
return

$^Space::
Send,^{space}
return

$!Space::
Send,!{space}
return

$+Space::
Send, +{space}
return
;==================================|wheel Move |========================================
space & y::
	MouseMove ,0,-60,0,R
	return
space & b::
	MouseMove ,0,60,0,R
	return
;================================== | mouse move |========================================
space & h::
MoveCurses("h")
return

space & j::
MoveCurses("j")
return

space & l::
MoveCurses("l")
return

space & k::
MoveCurses("k")
return
 
MoveCurses(key,speed := 40)
{
if GetKeyState("shift","p")
{
	speed := 10
	send,{shift up}
}
if (key == "h")
	MouseMove ,speed * -1,0,0,R
if (key == "j")
	MouseMove ,0,speed,0,R
if (key == "k")
	MouseMove ,0,speed * -1,0,R
if (key == "l")
	MouseMove ,speed,0,0,R
return
}
shift & space::
	return

;==================================|window move |========================================

space & u::
	MouseMove,20,54,0
	return
Space & o::
	MouseMove,1874,48,0
	return
Space & n::
	MouseMove,20,1070,0
	return
Space & ,::
	MouseMove,1865,1062,0
	return
Space & p::
	MouseMove , 73, 469,0
	return
Space & `;::
	MouseMove,1780,504,0
	return
space & i::
MouseMove,892,66,0
return
space & m::
MouseMove,957,1067,0
return
;==================================|space window |========================================
space & x::
send, ^{w}
return

space & q::
send,!{f4} 
return

space & s::
send,^{s}
return

;==================================| caplock mode|========================================
CapsLock_MODE := 0
#capslock::
if CAPSLOCK_MODE = 0
{
	SetCapsLockState,on 
		CapsLock_MODE := 1
		return 
}
else
{
	SetCapsLockState,Off
		CapsLock_MODE := 0
		return
}
return 


;====================================================| run-mark  |====================================================
capslock & 0::
Run https://mp.csdn.net/mdeditor
return
capslock & `::
Run C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk\capslock.ahk
return

;==================================| win tab|========================================
capslock & -::
Send ,^+{Tab}
return

capslock & =::
Send, ^{Tab}
return

;==================================| run specially |========================================
capslock & 1::
if WinExist("ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe	
IfWinNotExist ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
run ,C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
return

capslock & 2::
if WinExist("ahk_exe C:\Program Files\mindmaster\MindMaster.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Program Files\mindmaster\MindMaster.exe
return

capslock & 3::
if WinExist("ahk_exe C:\Users\26306\AppData\Local\atom\atom.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Users\26306\AppData\Local\atom\atom.exe
return

capslock & 4::
if WinExist("ahk_exe C:\Program Files\Typora\Typora.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Program Files\Typora\Typora.exe
return

capslock & 5::
if WinExist("ahk_exe C:\Windows\explorer.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Windows\explorer.exe
return




;==================================| shift mode |========================================
shift_mode := 1 ; initinate true
Shift_down_mode := 0
$shift::
if (A_PriorHotkey <> "$shift" or A_TimeSincePriorHotkey > 400)  
{
KeyWait, shift  
return
}
if Shift_mode = 1
{   
	Shift_mode := 0
	Send, {shift Down}
	return
}
else
{
	Send,{shift up}
	Shift_mode := 1
	Shift_down_mode := 0
	return
}


$^+t::
send,^+{t}
return

capslock & v::
if Shift_mode = 1
{
	Send, {end}
	Send, +{home}
Shift_mode := 0
				Send, {shift Down}
			return
}
else
{
	Send,{shift up}
Shift_mode := 1
				Shift_down_mode := 0
				return
}
capslock::
send , {Esc}
return

capslock & c::
if shift_mode = 1
{
	Send, {End}
	Send, +{home}
	Send, ^{c}
	Sleep , 200
		Send, {left}
	return
}
else
{
	Send, {shift up}
	Send , ^{c}
Shift_down_mode := 0
					 Shift_mode := 1
					 return
}
capslock & x::
if shift_mode = 1
{
	Send, {End}
	Send, +{home}
	Sleep , 200
	Send, ^{x}
	Send, +{home}
	Send, {BackSpace}
	return
}
else 
{
	Send ,{shift  up}
	Send, ^{x}
Shift_down_mode := 0
	 Send, +{home}
	 Send, {BackSpace}
Shift_mode := 1
		return
}



;==================================| home end |========================================

capslock & `;::
Send, {End}
return

capslock & p::
Send, {home}
return

;==================================|sdfe |========================================
capslock & d::
Send , {down}
return

capslock & e::
Send, {up}
return

capslock & s::
Send, {left}
return

capslock & f::
Send , {right}
return

capslock & i::
Send , ^{home}
return
capslock & m::
Send , ^{end}
return
;================================== | uo  |========================================	
capslock & o::
Send , ^{Right}
return 

capslock & u::
Send , ^{Left}
return


;==================================| yb  |========================================
capslock & y::
if (getkeystate("space","p"))
{
	Send, {Wheelup 3}
	return
}
Send,{up 10}
return

capslock & b::
if (getkeystate("space","p"))
{
	Send, {WheelDown 3}
	return
}
Send, {down 10}
return
;================================== | hjkl |========================================
window_mode := 0
capslock & space::
window_mode :=1
return
capslock & h::
if (getkeystate("alt","p"))
{
	Send ,!{left}
	return
}
if getkeystate("space","p")
{
	Send, {WheelLeft}
	return
}
else
{
	Send,{Left}
	return
}	

capslock & l::
if getkeystate("space","p")
{
	Send, {WheelRight}
	return
}
if (getkeystate("alt","p"))
{
	Send,!{right}
	return
}
else
{
	Send,{right}
	return
}


capslock & j::
if getkeystate("space","p")
{
	Send, {Wheeldown}
	return
}
if (getkeystate("alt","p"))
{
	Send,!{down}
	return
}
else
{
	
	Send,{Down}
	return
}

capslock & k::
if getkeystate("space","p")
{
	Send, {WheelUp}
	return
}
if (getkeystate("alt","p"))
{
	Send, !{up}
	return
}
else
{
	Send,{up}
	return
}


capslock & Enter::
Send,{end}{enter}
return



capslock & t::
Send,^{c}!{0}
Sleep,1	
send, {Esc}
Send ,{enter}
return

capslock & q::
Send,^{c}
Sleep, 1
Send,!g^{v}
return

capslock & BackSpace::
Send,{End}+{Home}{BackSpace}
return


;====================================================| charactor complete |====================================================

capslock & {::
	Send,^{c}{{}{}}{left}^{v}
	return

capslock & }::
Send,^{c}{[}{]}{left}^{v}
return


capslock & '::
Send,^{c}{`"}{`"}{Left}^{v}	
return




;====================================================| special configulation |====================================================
; add perfix $ make tab key can not reverse
$Tab::
if WinExist("ahk_exe C:\Program Files\mindmaster\MindMaster.exe")
IfWinActive
Send,^{Enter}
IfWinNotActive
Send,{Tab}
return
IfWinNotExist ahk_exe C:\Program Files\mindmaster\MindMaster.exe
Send,{Tab}
return



; in xmind
$F2::
if winExist( "ahk_exe C:\Program Files (x86)\XMind\XMind.exe")
ifwinActive
Send , {F2}{Right}
IfWinNotActive 
Send , {F2}
IfWinNotExist ahk_exe C:\Program Files (x86)\XMind\XMind.exe
Send, {F2}
return


;==================================| dida |========================================
capslock & 9::
Send,+^!{i}
return

capslock & \::
Send , +^!{p}
return



capslock & w::
Send ,{BackSpace}
return

capslock & r::
Send,{delete}
return


Space & capslock::
Send, {LButton}
return

space & enter::
Send, {RButton}
return
;============================================================hot string convert===========================================MMM================
:*:()::(){left}
:*:[]::[]{left}
:*:""::""{left}
:*:''::''{left}
:*:<>::<>{left}
:*:{}::{{}{}}{left}
:*:3#::{#}{#}{#}{space}	
:*:4#::{#}{#}{#}{#}{space}
:*:5#::{#}{#}{#}{#}{#}{space}
:*:=com::==================================| |========================================{Left 42}
:*:=2com::================================== ========================================{Left 42}{Enter}
:*:chS::47.93.246.76
:*:``````::````````````{left 3}{enter}{up}{end}
:*:7em::&emsp;&emsp;
Esc & f1::
Suspend
return
