; reference link : https://www.zhihu.com/question/19645501/answer/39906404
; make caplock convert capslock to fit vi editor
SendMode Input
#SingleInstance force ;强制单进程
;#NoTrayIcon ; 不显示托盘图标

;==================================|wheel Down |========================================
capslock & Space::
	Send, {WheelDown 6}
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
	if shift_mode = 0
	{
		Shift_mode := 1
		Send, {shift up}
	}
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
;~ if Shift_mode
;~ {
	;~ v::
		;~ Send, {shift up}
		;~ Send , {end}
		;~ Send , {Shift Down}
		;~ Send, {home}
		;~ return
	
;~ }

	
	
	
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

;================================== | uo  |========================================	
capslock & o::
	Send , ^{Right}
	return 
	
capslock & u::
	Send , ^{Left}
	return


;==================================| yb  |========================================
capslock & y::
	Send,{up 10}
	return

capslock & b::
	Send, {down 10}
	return
;==================================| im  |========================================
capslock & i::
	Send, ^{home}
	return
capslock & m::
	Send, ^{end}
	return

;================================== | hjkl |========================================
capslock & h::
	if (getkeystate("alt","p"))
	{
		Send ,!{left}
		return
	}
	else
	{
		Send,{Left}
		return
	}	
	
capslock & l::
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
	if (getkeystate("alt","p"))
	{
		Send,!{down}
		return
	}
	else
	{
		if shift_mode = 0
		{
			if shift_down_mode = 0
			{
				Send, {shift up}
				Send, {left}
				Send,{Shift down}
				Send,{end}
				Shift_down_mode := 1
				return
			}
			else
			{
				Send ,{Down}
				return
			}
		}
		else
		{
			Send,{Down}
			return
		}
	}

capslock & k::
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
	send, ^{a}{BackSpace}^{v}
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
	
space & M::
	Send ^!+{o}
	return
	
	
	
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
	

capslock & w::
	Send ,{BackSpace}
	return
	
capslock & r::
	Send,{delete}
	return
;==================================| word skips shift|========================================

space & o::
	Send , +^{Right}
	return 

space & u::
	Send , +^{Left}
	return
	
;==================================| top end |========================================
Space & y::
	Send,^{Home}
	return
	
Space & b::
	Send,^{end}
	return
	
;================================== | hjkl |========================================
space & h::
if getkeystate("Lalt","p")
{
	MouseMove ,-30,0,1,R
		return
}
else
{
	Send,+{Left}
	return
}

space & j::
if getkeystate("Lalt","p")
{

	MouseMove ,0,30,1,R
		return
}

else
{
	Send ,+{Down}
	return
}

space & l::
if getkeystate("Lalt","p")
{
	MouseMove ,30,0,1,R
		return
}

else
{
	Send,+{right}
	return
}

space & k::
if getkeystate("Lalt","p")
{
	MouseMove ,0,-30,1,R
		return

}
else
{
	Send, +{up}
	return
}


space & `;::
	Send, +{End}
	return

space & p::
	Send, +{home}
	return

Space & enter::
	Send, {LButton}
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
