capslock & ctrl::
send,{ctrl down}
return

Space & capslock::
Send, {LButton}
return
space & enter::
Send, {RButton}
return
space & \::
Send, {Appskey}
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
;==================================|space ctrl |========================================
space & z::
send, ^{z}
return
space & w::
send, ^{w}
return

space & q::
send,!{f4} 
return

space & s::
send,^{s}
return

space & c::
send , ^{c}
return
space & v::
send, ^{v}
return
space & x::
send , ^{x}
return

	;==================================|function |========================================
MoveCurses(key,speed := 100)
{
	if GetKeyState("alt","p")
	{
		speed := speed * 3
	   send,{shift up}
	}
	if GetKeyState("shift","p")
	{
		speed := 25
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
