; reference link : https://www.zhihu.com/question/19645501/answer/39906404
; make caplock convert esc to fit vi editor
SendMode Input
#SingleInstance force ;强制单进程
;#NoTrayIcon ; 不显示托盘图标


;====================================================| run-mark  |====================================================
esc & 0::
	Run https://mp.csdn.net/mdeditor
	return
esc & `::
	Run C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk\esc_vim.ahk
	return
	
;==================================| win tab|========================================
esc & -::
	Send ,^+{Tab}
	return
	
esc & =::
	Send, ^{Tab}
	return

;==================================| run specially |========================================
esc & 1::
	if WinExist("ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe	
	IfWinNotExist ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
		run ,C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
	return

esc & 2::
	if WinExist("ahk_exe C:\Program Files\mindmaster\MindMaster.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Program Files\mindmaster\MindMaster.exe
	return

esc & 3::
	if WinExist("ahk_exe C:\Users\26306\AppData\Local\atom\atom.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Users\26306\AppData\Local\atom\atom.exe
	return
	
esc & 4::
	if WinExist("ahk_exe C:\Program Files\Typora\Typora.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Program Files\Typora\Typora.exe
	return

esc & 5::
	if WinExist("ahk_exe C:\Windows\explorer.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Windows\explorer.exe
	return

	
	

;==================================| shift mode |========================================
shift_mode := 1 ; initinate true

esc::
  	send , {Esc}
	Shift_mode := 1
	Send, {shift up}
  	return
	
esc & v::
	if Shift_mode
	{
		Send , {Shift Down}
		Shift_mode := 0
		return
	}
	else
	{
		Send, {shift up}
		Shift_mode := 1
		return
	}

esc & c::
{
	Send, {End}
	Send, +{home}
	Send, ^{c}
	Sleep , 200
	Send, {left}
	return
}
esc & x::
{
	Send, {End}
	Send, +{home}
	Sleep , 200
	Send, ^{x}
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

	
	
	
;================================== |words skip |========================================	
esc & o::
	Send , ^{Right}
	return 
	
esc & u::
	Send , ^{Left}
	return

;==================================| home end |========================================
esc & `;::
	Send, {End}
	return

esc & p::
	Send, {home}
	return

	
;================================== | hjkl |========================================
esc & h::
	Send,{Left}
	return
	
esc & j::
	Send ,{Down}
	return

esc & l::
	Send,{right}
	return

esc & k::
	Send, {up}
	return


esc & Enter::
	Send,{end}{enter}
	return


	
esc & t::
	Send,^{c}!{0}
	Sleep,1	
	send, ^{a}{BackSpace}^{v}
	return

esc & q::
	Send,^{c}
	Sleep, 1
	Send,!g^{v}
	return
	
esc & BackSpace::
	Send,{End}+{Home}{BackSpace}
	return

;==================================| five skip |========================================
esc & y::
	Send,{up 5}
	return

esc & b::
	Send, {down 5}
	return

;====================================================| charactor complete |====================================================

esc & {::
	Send,^{c}{{}{}}{left}^{v}
	return
	
esc & }::
	Send,^{c}{[}{]}{left}^{v}
	return


esc & '::
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
esc & m::
	Send,+^!{i}
	return

esc & \::
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

esc & Space::
	Send, {down 17}
	Send, {up 17}
	return	
$+Space::
	Send, +{space}
	return
	
Space & BackSpace::
	Send,{delete}
	return

;================================== | hjkl |========================================
space & h::
	Send,+{Left}
	return
	
space & j::
	Send ,+{Down}
	return

space & l::
	Send,+{right}
	return

space & k::
	Send, +{up}
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
	


space & `;::
	Send, +{End}
	return

space & p::
	Send, +{home}
	return


;============================================================hot string convert===========================================MMM================
:*:()::(){left}
:*:[]::[]{left}
:*:""::""{left}
:*:''::''{left}
:*:<>::<>{left}
:*:{}::{{}{}}{left}{enter 2}{up}{tab}
:*:3#::{#}{#}{#}{space}
:*:4#::{#}{#}{#}{#}{space}
:*:5#::{#}{#}{#}{#}{#}{space}
:*:=== ::==================================| |========================================{Left 42}
:*:cs ::47.93.246.76
:*:ex ::exit

Esc & f1::
	Suspend
	return