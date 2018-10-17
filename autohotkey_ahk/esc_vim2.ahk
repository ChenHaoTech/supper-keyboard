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
esc & -::
	Send ,^+{Tab}
	return
	
esc & =::
	Send, ^{Tab}
	return


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
;====================================| esc_move-mark |========================================
esc::
  	send , {Esc}
  	return

esc & e::
	Send , {up}
	return
;================================== |asdf |========================================	
esc & d::
	Send , +{Down}
	return 
	
esc & s::
	Send , +{Left}
	return

esc & a::
	Send, ^+{left}
	return
	
esc & f::
	Send , +{right}
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
	
esc & n::
	Send,^+{Right}
	return
	
esc & p::
	Send,{Home}
	return

esc & `;::
	Send,{End}
	return
	
esc & g::
	Send, ^{right}
	return

esc & w::
	Send, {Backspace}
	return
	
esc & r::
	Send, {delete}
	return

esc & Enter::
	Send,{end}{enter}

esc & u::
	Send,+{home}
	return

esc & o::
	Send,+{end}
	return
	
	
esc & i::
	Send, +{up}
	return

	
esc & z::
	Send, ^{z}
	return

esc & c::
	Send ^{c}
	return
	

esc & v::
	
	return

esc & x::
	send,{delete}
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
		


;~ esc & 4::
	;~ if WinExist("ahk_exe C:\Program Files\Typora\Typora.exe")
		;~ IfWinActive
			;~ WinMinimize
		;~ else
			;~ WinActivate , ahk_exe C:\Program Files\Typora\Typora.exe
	;~ return
	



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

esc & Space::
	Send,{Enter}
	return

esc & m::
	Send,+^!{a}
	return

esc & \::
	Send , +^!{o}
	return
;============================================================hot string convert===========================================MMM================
:*:()::(){left}
:*:[]::[]{left}
:*:""::""{left}
:*:''::''{left}
:*:<>::<>{left}
:*:{}::{{}{}}{left}
:*:3#::{#}{#}{#}
:*:4#::{#}{#}{#}{#}
:*:5#::{#}{#}{#}{#}{#}
::===::==================================| |========================================{Left 41}
::cs::47.93.246.76
::ex::exit

Esc & f1::
	Suspend
	return










