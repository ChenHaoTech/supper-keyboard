capslock::
send ,{Blind}{Esc}
return

;==================================| win tab|========================================
capslock & -::
Send ,{Blind}^+{Tab}
return

capslock & =::
Send,{Blind}^{Tab}
return

;==================================| home end |========================================

capslock & `;::
capslock_movtion(";")
return

capslock & p::
capslock_movtion("p")
return

;==================================|sdfe |========================================
capslock & d::
Send,{Blind}{PGdn}
return
capslock & e::
Send,{Blind}{PGUP}
return

capslock & s::
Send,!{left}
return

capslock & f::
Send,!{Right}
return


;==================================|im |========================================
capslock & i::
capslock_movtion("i")
return
capslock & m::
capslock_movtion("m")
return
;================================== | uo  |========================================	
capslock & o::
capslock_movtion("o")
return 

capslock & u::
capslock_movtion("u")
return


;==================================| yb  |========================================
capslock & y::
capslock_movtion("y")
return

capslock & b::
capslock_movtion("b")
return
;================================== | hjkl |========================================

capslock & h::
capslock_movtion("h")
return
capslock & j::
capslock_movtion("j")
return
capslock & k::
capslock_movtion("k")
return
capslock & l::
capslock_movtion("l")
return

capslock & Enter::
Send,{Blind}{end}{enter}
return


capslock & BackSpace::
Send,{Blind}{End}+{Home}{BackSpace}
return

capslock & a::
Send,{Blind}{end}
Send,{Blind}+{home}
return

capslock & v::
sendinput,%clipboard%
return

capslock & c::
if shift_mode = 1
{
	Send,{Blind}{End}
	Send,{Blind}+{home}
	Send,{Blind}^{c}
	Sleep ,200
	Send,{Blind}{left}
	return
}
else
{
	Send,{Blind}{shift up}
	Send ,{Blind}^{c}
	Shift_down_mode := 0
	 Shift_mode := 1
 	return
}

capslock & x::
if shift_mode = 1
{
	Send,{Blind}{End}
	Send,{Blind}+{home}
	Sleep ,200
	Send,{Blind}^{x}
	Send,{Blind}+{home}
	Send,{Blind}{BackSpace}
	return
}
else 
{
	Send ,{Blind}{shift  up}
	Send,{Blind}^{x}
	Shift_down_mode := 0
	 Send,{Blind}+{home}
	 Send,{Blind}{BackSpace}
	Shift_mode := 1
	return
}


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


capslock & w::
Send ,{Blind}{BackSpace}
return

capslock & r::
Send,{Blind}{delete}
return
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

