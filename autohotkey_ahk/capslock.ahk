capslock::
send ,{Esc}
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

;==================================| win tab|========================================
capslock & -::
Send ,^+{Tab}
return

capslock & =::
Send, ^{Tab}
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
Send , {PGDN}
return

capslock & e::
Send, {PGUP}
return

capslock & s::
Send, !{left}
return

capslock & f::
Send , !{right}
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
Send,{end}{enter}
return


capslock & BackSpace::
Send,{End}+{Home}{BackSpace}
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
Send ,{BackSpace}
return

capslock & r::
Send,{delete}
return
	;============================================================|function|===========================================================
capslock_movtion(key)
{
	if (getkeystate("shift","p"))
	{
		if (key == "h")
		{
			Send ,+{left}
		}
		if (key == "j")
		{
			Send ,+{down}
		}
		if (key == "k")
		{
			Send ,+{up}
		}
		if (key == "l")
		{
			Send ,+{right}
		}
		if (key == "y")
		{
			Send ,+{up 5}
		}
		if (key == "b")
		{
			Send ,+{down 5}
		}
		if (key == "o")
		{
			Send ,^+{Right}
		}
		if (key == "u")
		{
			Send ,^+{left}
		}
		if (key == "m")
		{
			Send ,+^{end}
		}
		if (key == "i")
		{
			Send ,+^{home}
		}
		if (key == ";")
		{
			send,+{end}
		}
		if (key == "p")
		{
			send,+{home}
		}
		return
	}
	; if getkeystate("space","p")
	;     {
	;     if (key == "l")
	;         MouseClickDrag ,left,,,100,-50,3,R
	;     return
	;     }
	else
	{
		if (key == "h")
		{
			Send,{Left}
		}
		if (key == "j")
		{
			Send,{down}
		}
		if (key == "k")
		{
			Send,{up}
		}
		if (key == "l")
		{
			Send,{right}
		}
		if (key == "y")
		{
			Send ,{up 5}
		}
		if (key == "b")
		{
			Send ,{down 5}
		}
		if (key == "o")
		{
			Send ,^{Right}
		}
		if (key == "u")
		{
			Send ,^{left}
		}
		if (key == "m")
		{
			Send ,^{end}
		}
		if (key == "i")
		{
			Send ,^{home}
		}
		if (key == ";")
		{
			send,{end}
		}
		if (key == "p")
		{
			send,{home}
		}
		return
	}	
}

