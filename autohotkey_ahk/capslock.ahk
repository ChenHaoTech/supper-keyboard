
; reference link : https://www.zhihu.com/question/19645501/answer/39906404
; make caplock convert esc to fit vi editor
SendMode Input
#SingleInstance force ;强制单进程
;#NoTrayIcon ; 不显示托盘图标
SetCapsLockState, AlwaysOff ; set caplock key always off

;====================================CapsLock========================================
CapsLock::
  	send , {Esc}
  	return

CapsLock & e::
	Send , {up}
	return
	
CapsLock & d::
	Send , {Down}
	return 
	
CapsLock & s::
	Send , {Left}
	return

CapsLock & f::
	Send , {right}
	return
	
CapsLock & h::
	Send,^+{Left}
	return

CapsLock & n::
	Send,^+{Right}
	return
	
CapsLock & p::
	Send,{Home}
	return

CapsLock & `;::
	Send,{End}
	return

CapsLock & a::
	Send, ^{left}
	return
	
CapsLock & g::
	Send, ^{right}
	return

CapsLock & w::
	Send, {Backspace}
	return
	
CapsLock & r::
	Send, {delete}
	return

CapsLock & Enter::
	Send,{end}{enter}

CapsLock & u::
	Send,+{home}
	return

CapsLock & o::
	Send,+{end}
	return
	
	
CapsLock & i::
	Send, +{up}
	return

CapsLock & k::
	Send, +{down}
	return
	
CapsLock & z::
	Send, ^{z}
	return

CapsLock & c::
	Send ^{c}
	return
	
		
CapsLock & v::
	Send ^{v}
	return

CapsLock & x::
	send,^{x}
	return

CapsLock & j::
	Send ,+{left}
	return

CapsLock & l::
	Send,+{right}
	return
	
CapsLock & t::
	Send,^{c}!{0}
	Sleep,1
	send, ^{a}{BackSpace}^{v}
	return

CapsLock & q::
	Send,^{c}
	Sleep, 1
	Send,!g^{v}
	return
	
CapsLock & BackSpace::
	;~ SetTitleMatchMode, 2
	;~ WinGet, id, List, shell
	;~ IfWinActive, ahk_id %id%
		;~ MsgBox sajfhjds
		;~ IfWinActive
			;~ Send, ^{k}
			;~ return
	;~ todo:
		;~ WinExist get uniqueId
		;~ what is wintitle
		;~ what id wintext
		;~ ensure cmder_id or cmder_other_id
			;~ on cmder.linux_class_shell ctrl+k
			;~ on powershell the original is ok
	;~ study method:
		;~ # use qq group chat
		;~ # use tieba post problem
		;~ # just read help file
	;~ Process,Exist,C:\Program Files\cmder\vendor\conemu-maximus5\ConEmu\wsl\wslbridge.exe
	;~ MsgBox ErrorLevel%ErrorLevel%
	;~ if (%ErrorLevel% = 0){
		;~ IfWinActive ahk_pid %ErrorLevel%
			;~ Send, ^{k}
			;~ return
		;~ IfWinNotActive ahk_pid %ErrorLevel%
			;~ MsgBox ajdh
		;~ return
	;~ }	
	Send,{End}+{Home}{BackSpace}
	;send,{Home}^{k}
	return
CapsLock & `::
	Send, ^{c}!{space}^{v}{enter}
	return

CapsLock & y::
	Send,{up 5}
	return

CapsLock & b::
	Send, {down 5}
	return

;====================================================| charactor complete |====================================================

CapsLock & {::
	Send,^{c}{{}{}}{left}^{v}
	return
	
CapsLock & }::
	Send,^{c}{[}{]}{left}^{v}
	return


CapsLock & '::
		Send,^{c}{`"}{`"}{Left}^{v}	
		return
		
;========================================================== window active hot key		===========================================================

CapsLock & -::
	Send ,^+{Tab}
	return
	
CapsLock & =::
	Send, ^{Tab}
	return


CapsLock & 1::
	if WinExist("ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe	
	IfWinNotExist ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
		run ,C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
	return

CapsLock & 2::
	if WinExist("ahk_exe C:\Program Files\mindmaster\MindMaster.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Program Files\mindmaster\MindMaster.exe
	return

CapsLock & 3::
	if WinExist("ahk_exe C:\Users\26306\AppData\Local\atom\atom.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Users\26306\AppData\Local\atom\atom.exe
	return
	
CapsLock & 4::
	if WinExist("ahk_exe C:\Program Files\Typora\Typora.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Program Files\Typora\Typora.exe
	return

CapsLock & 5::
	if WinExist("ahk_exe C:\Windows\explorer.exe")
		IfWinActive
			WinMinimize
		else
			WinActivate , ahk_exe C:\Windows\explorer.exe
	return

;~ CapsLock & 4::
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

;space configuration
$+Space::
	Send, {PGUP}
	return
CapsLock & Space::
	Send,{PGDN}
	return	
	
	
CapsLock & m::
	Send,+^!{a}
	return

CapsLock & \::
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
:*:es_help::-highlight -w -path-column -name
::===::====================================================| |===================================================={Left 54}

;====================================================| stop script |====================================================
CapsLock & F1::
	Suspend
	;Pause 
	return
	
	
	
	
		
;====================================================| number convert special charactor|====================================================
NumLock & u::
	send,{1}
	return
NumLock & i::
	send,{2}
	return
NumLock & o::
	send,{3}
	return
NumLock & j::
	send,{4}
	return
NumLock & k::
	send,{5}
	return
NumLock & l::
	send,{6}
	return
NumLock & n::
	send,{7}
	return
NumLock & m::
	send,{8}
	return
NumLock & ,::
	send,{9}
	return
NumLock & Space::
	send,{0}
	return









