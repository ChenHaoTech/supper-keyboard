$*space::
	normal_key("space")
	return
capslock & ctrl:: send,{ctrl down}

Space & u:: Send, {LButton}
space & o:: Send, {RButton}
space & f:: Send, {Appskey}

space & `:: num_char("``")
space & -:: num_char("-")
space & =:: num_char("=")
space & }:: num_char("}")
space & {:: num_char("{")
space & 1:: num_char("1")
space & 2:: num_char("2")
space & 3:: num_char("3")
space & 4:: num_char("4")
space & 5:: num_char("5")
space & 6:: num_char("6")
space & 7:: num_char("7")
space & 8:: num_char("8")
space & 9:: num_char("9")
space & 0:: num_char("0")
space & ':: num_char("'")

num_char(key)
{
	send,+{%key%}
	return
}
;================================== | mouse move |========================================
space & h:: MoveCurses("h")
space & j:: MoveCurses("j")
space & l:: MoveCurses("l")
space & k:: MoveCurses("k")
;==================================|mouse move plus|========================================
space & p:: MoveCurses("p")
space & m:: MoveCurses("m")
space & i:: MoveCurses("i")
space & `;:: MoveCurses(";")
;==================================|space ctrl |========================================
space & z:: send, ^{z}
space & w:: send, ^{s}
space & q:: send,!{f4} 
space & c:: send ,^{c}
space & v:: send, ^{v}
space & x:: send ,^{w}

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
	if (key == "p")
	MouseMove ,speed * -16,0,0,R
	if (key == "m")
	MouseMove ,0,speed * 9,0,R
	if (key == "i")
	MouseMove ,0,speed * -9,0,R
	if (key == ";")
	MouseMove ,speed * 16,0,0,R
	return
}
