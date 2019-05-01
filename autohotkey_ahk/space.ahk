MoveCurses(key,speed := 100)
{
	if GetKeyState("alt","p")
	{
		speed := speed * 3
	   send,{shift up}
	}
	if GetKeyState("shift","p")
	{
		speed := speed / 3 
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
;=======|	key	|============================================
$*space::normal_key("space")
capslock & ctrl:: send,{ctrl down}

Space & u:: Send, {LButton}
space & o:: Send, {RButton}
Space & r:: Send , {f5}

space & `:: num_char("``")
space & -:: num_char("-")
space & =:: num_char("=")
space & }:: Send,{[}{]}{Left}
space & {:: Send,{{}{}}{Left}
space & 1:: num_char("1")
space & 2:: num_char("2")
space & 3:: num_char("3")
space & 4:: num_char("4")
space & 5:: num_char("5")
space & 6:: num_char("6")
space & 7:: num_char("7")
space & 8:: num_char("8")
space & 0:: num_char("0")
space & 9:: 
IfWinActive ahk_group IDE
	send , (){left}
else
{
	Clipboard := ""
	Send ^{c}
	ClipWait 0.1
	if ErrorLevel
		Send,(){left}
	else{
		Send, ^{c}
		Send, (){Left}
		Send, ^{v}
	}
}
return
space & ':: num_char("'",2)

num_char(key,num:=1){
	IfWinActive, ahk_group IDE
		send +{%key%}
	else
	{
		Clipboard := ""
		Send ^{c}
		ClipWait 0.1
		if ErrorLevel
			Send,+{%key% %num%}{left}
		else{
			Send, ^{c}
			Send,+{%key% 2}{left}			
			Send, ^{v}
		}
	}
}

;================================== | mouse move |========================================
space & h:: MoveCurses("h")
space & j:: MoveCurses("j")
space & l:: MoveCurses("l")
space & k:: MoveCurses("k")
;==================================|mouse move plus|========================================
space & m:: MoveCurses("m")
space & i:: MoveCurses("i")
space & `;:: Send,{:}
;==================================|space ctrl |========================================
space & w::send, ^{s}
space & q:: send,!{f4} 
Space & x:: Send, ^{w}

space & F1::
send #!^{F1}
convertTypeWriter("E")
return
Space & F2:: 
MouseGetPos, xpos, ypos 
Clipboard := xpos . "," . ypos
return

Space & F8::
WinGet ,temp0,ProcessPath,A
WinGet ,temp1,ProcessName,A
WinGetClass ,temp2,A
WinGet temp3 ,ID,A
WinGet temp4,PID,A
Clipboard :="path """ .  temp0 . "`nahk_exe " . temp1 . "`nahk_class " . temp2 . "`nahk_id " . temp3
				. "`npid " . temp4
func_tooltip(Clipboard)
return
Space & F12::Run D:\����\��Ҫ��ͼ\�α�.png

space & F10::run C:\Windows\System32\control.exe



space & t::
WinSet AlwaysOnTop ,Toggle ,A
WinGet winName, ProcessName,A
func_tooltip(winName,time := 1000)
return