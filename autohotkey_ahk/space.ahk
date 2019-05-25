#Include, ./superKey.ahk
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
	send , (
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
	if(longPress(key)){
		send +{%key%}		
		return
	}
	IfWinActive, ahk_group IDE
		send +{%key%}
	else
	{
		Clipboard := ""
		Send ^{c}
		ClipWait 0.1
		if ErrorLevel
			Send,+{%key% %num%}
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
space & w::	send, ^{s}

space & q:: 
; IfWinActive, ahk_group DONOTWANTKILL
; IfWinActive, ahk_class Chrome_WidgetWin_1
; {
; 	; send , !{esc}
; 	return
; }else{2
	send,!{f4} 
; }
return
Space & x::
IfWinActive ahk_group IDE
	send ^{F4}
else
 	Send, ^{w}
return

space & F1::
send #!^{F1}
convertTypeWriter("E")
return
;
Space & F2:: 
CoordMode, mouse, Screen
MouseGetPos, xpos, ypos 
Clipboard :=xpos . "," . ypos
func_tooltip(Clipboard)
return

Space & F8::
WinGet ,temp0,ProcessPath,A
WinGet ,temp1,ProcessName,A
WinGetClass ,temp2,A
WinGet temp3 ,ID,A
WinGet temp4,PID,A
WinGetTitle, temp5, A
Clipboard :="path """ .  temp0 . "`nahk_exe " . temp1 . "`nahk_class " . temp2 . "`nahk_id " . temp3
				. "`npid " . temp4 . "`n" . temp5
func_tooltip(Clipboard)
return

;TODO 更加全屏
space & F11::
; 去除标题栏
WinSet, Style, ^0xC00000, A
WinMaximize, A ;最大化
return

space & t::
WinSet AlwaysOnTop ,off, %lastTopWindow%
toggleWindows.Remove(toggleWindows.MaxIndex())
WinGet wName, ProcessName, A
WinGetTitle, title, A
WinSet AlwaysOnTop ,off , %title%
output := "confirm toggleTop:`n" . wName . "-" . title 
; for index, element in toggleWindows
; {
; 	output := output . toggleWindows[index] . "`n"
; }
MsgBox, 4,, % output
WinSet AlwaysOnTop ,on ,ahk_class #32770
IfMsgBox Yes
{
	WinSet AlwaysOnTop ,on ,A	
	lastTopWindow := title . "ahk_exe" . wName
	toggleWindows.Insert(wName . title)
}else{
	WinSet AlwaysOnTop ,off ,A	
	toggleWindows.Remove(toggleWindows.MaxIndex())
}
return
;实现win 短按查看,  长按 
; *Lwin::
; if (!longPress("Lwin")){
; 	MouseGetPos x, y
; 	send #{b}
; 	; MouseMove 735,1079, 100
; 	; Sleep, 100
; 	; MouseMove 735,1079 100
; 	Sleep 1000
; 	send !{Esc}
; 	MouseMove %x%, %y%
; }else{
; 	send {Blind}{Lwin}
; }
; return

