; reference link : https://www.zhihu.com/question/19645501/answer/39906404
; make caplock convert esc to fit vi editor


#SingleInstance force ;强制单进程
;#NoTrayIcon ; 不显示托盘图标
SetCapsLockState, AlwaysOff ; set caplock key always off

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
	
CapsLock & z::
	Send, !{z}
	return
	
CapsLock & i::
	Send, +{up}
	return

CapsLock & k::
	Send, +{down}
	return
	
CapsLock & Space::
	Send,{enter}
	return

CapsLock & {::
	Send,{{}{}}{left}
	return
	
CapsLock & }::
	Send,{[}{]}{left}
	return
	
CapsLock & BackSpace::
	Send,{End}+{Home}{BackSpace}
	return

CapsLock & q::
	Send,!{b}
	return
	
CapsLock & t::
	Send,^{c}!{0}^{v}

CapsLock & x::
	Send,^+{c}!{b}^{v}



	
	
	
	
	
	
	
	
	
	
	
	
	
	