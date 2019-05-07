$capslock:: send ,{Blind}{Esc}

capslock & space:: send, {enter}
CapsLock & \:: Send {Appskey}
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
CapsLock & z::Send,^{z}
capslock & c::
Clipboard = 
Send, ^{c}
ClipWait 0.1
if ErrorLevel
{
	Send,{Blind}{End}
	Send,{Blind}+{home}
	Send,{Blind}^{c}
	Sleep ,200
	Send,{Blind}{left}
}	
return

capslock & x::
Clipboard = 
Send, ^{x}
ClipWait 0.1
if ErrorLevel
{
Send,{Blind}{End}
Send,{Blind}+{home}
Sleep ,200
Send,{Blind}^{x}
}	
return

;=======|	�ַ�����	|============================================
capslock & {:: 
Clipboard = 
Send, ^{c}
ClipWait 0.1
if !ErrorLevel
{
Send,^{c}{{}{}}{left}^{v}
}
return

capslock & }:: 
Clipboard = 
Send, ^{c}
ClipWait 0.1
if !ErrorLevel
{
Send,^{c}{[}{]}{left}^{v}
}
return

capslock & ':: 
Clipboard = 
Send, ^{c}
ClipWait 0.1
if !ErrorLevel
{
Send,^{c}{`"}{`"}{Left}^{v}	
}
return

;=======|	del BS	|============================================
capslock & w:: 
KeyWait w
if (A_TimeSinceThisHotkey > 200)
{
	Send,^{BS}
}
else
{
	Send ,{Blind}{BackSpace}			
}
return

capslock & r:: 
KeyWait r
if (A_TimeSinceThisHotkey > 200)
{
	Send,^{Delete}
}
else
{
	Send,{Blind}{delete}			
}
return

;=======|	function	|============================================
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

CapsLock & F1::Run config.ini
;=======|	snipaste	|============================================
CapsLock & F2:: Send #^!+{F2}
CapsLock & F3:: Send  #!^+{F3}
;=======|	ScreenToGif	|============================================
CapsLock & F4:: Send !^+{F4}

