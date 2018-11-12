capslock:: send ,{Blind}{Esc}
capslock & space:: send, {enter}

;==================================| win tab|========================================
capslock & -:: Send ,{Blind}^+{Tab}

capslock & =:: Send,{Blind}^{Tab}

;==================================| home end |========================================

capslock & `;:: capslock_movtion(";")

capslock & p:: capslock_movtion("p")

;==================================|sdfe |========================================
capslock & d:: Send,{Blind}{PGdn}
capslock & e:: Send,{Blind}{PGUP}

capslock & s:: Send,!{left}

capslock & f:: Send,!{Right}


;==================================|im |========================================
capslock & i:: capslock_movtion("i")
capslock & m:: capslock_movtion("m")
;================================== | uo  |========================================	
capslock & o:: capslock_movtion("o")

capslock & u:: capslock_movtion("u")


;==================================| yb  |========================================
capslock & y:: capslock_movtion("y")

capslock & b:: capslock_movtion("b")
;================================== | hjkl |========================================

capslock & h:: capslock_movtion("h")
capslock & j:: capslock_movtion("j")
capslock & k:: capslock_movtion("k")
capslock & l:: capslock_movtion("l")

capslock & Enter:: Send,{Blind}{end}{enter}


capslock & BackSpace:: Send,{Blind}{End}+{Home}{BackSpace}

capslock & a::
Send,{Blind}{end}
Send,{Blind}+{home}
return

capslock & v::send,^{v}

capslock & c::
	Send,{Blind}{End}
	Send,{Blind}+{home}
	Send,{Blind}^{c}
	Sleep ,200
	Send,{Blind}{left}
	return

capslock & x::
	Send,{Blind}{End}
	Send,{Blind}+{home}
	Sleep ,200
	Send,{Blind}^{x}
	Send,{Blind}+{home}
	Send,{Blind}{BackSpace}
	return

;====================================================| charactor complete |====================================================

capslock & {:: Send,^{c}{{}{}}{left}^{v}

capslock & }:: Send,^{c}{[}{]}{left}^{v}


capslock & ':: Send,^{c}{`"}{`"}{Left}^{v}	


capslock & w:: Send ,{Blind}{BackSpace}

capslock & r:: Send,{Blind}{delete}
	;============================================================|function|===========================================================
capslock_movtion(key)
{
	if (key == "h")
	{
		Send,{Blind}{Left}
	}
	if (key == "j")
	{
		Send,{Blind}{down}
	}
	if (key == "k")
	{
		; keywait,win
		; keywait,L
		Send,{Blind}{up}
	}
	if (key == "l")
	{
		Send,{Blind}{right}
	}
	if (key == "y")
	{
		Send ,{Blind}{up 5}
	}
	if (key == "b")
	{
		Send ,{Blind}{down 5}
	}
	if (key == "o")
	{
		Send ,{Blind}^{Right}
	}
	if (key == "u")
	{
		Send ,{Blind}^{left}
	}
	if (key == "m")
	{
		Send ,{Blind}^{end}
	}
	if (key == "i")
	{
		Send ,{Blind}^{home}
	}
	if (key == ";")
	{
		send,{Blind}{end}
	}
	if (key == "p")
	{
		send,{Blind}{home}
	}
	return
}

