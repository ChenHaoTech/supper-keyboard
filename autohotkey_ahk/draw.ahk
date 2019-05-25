;=======|      word  |============================================
; #IfWinActive,ahk_exe WINWORD.EXE
; <!1:: highlightWord(517,212)
; <!2:: highlightWord(568,208)
; <!3:: highlightWord(434,218)
; highlightWord(xpos, ypos){
;     CoordMode, mouse,Relative
;     MouseGetPos, x, y
;     click 467,180
;     Sleep 1000
;     click %xpos%, %ypos%
;     click %xpos%, %ypos%
;     click %xpos%, %ypos%
;     MouseMove, %x%, %y%
; }
; #if

;=======|	uwp	|============================================
#IfWinActive, ahk_class ApplicationFrameWindow
!capslock::
if UWPedgeSignal == true
	UWPedgeSignal := False
else
{
	MsgBox, 4,, is edge?
	IfMsgBox Yes
	{
		UWPedgeSignal := True
		MouseGetPos x1,y1
		click 1305,94
		MouseMove %x1% , %y1%
	}
	else
	UWPoneNoteSignal := True
}
#if
#if (UWPedgeSignal == true) and WinActive("ahk_class ApplicationFrameWindow")
!1::edgeDraw(1513,225)
!2::edgeDraw(1427,240)
!3::edgeDraw(1184,225)
edgeDraw(x,y){
	MouseGetPos x1,y1
	click 1527,87
	click 1391,95
	click 1391,95
	Sleep 100
	Click %x%,%y%	
	MouseMove %x1% , %y1%
	return
}
!4::
MouseGetPos x1,y1
click 1527,87
click 1329,77
MouseMove %x1% , %y1%
return

; erazer
!z::
MouseGetPos x1,y1
click 1527,87
click 1451,77
MouseMove %x1% , %y1%
return

!a::
MouseGetPos x,y
click 1532,95
MouseMove %x%, %y%
return
#if
;=======|	ppt	|============================================
#IfWinActive,  ahk_class screenClass
!a::
click 380,1047
Sleep 500
click 380,1047
return
#If
;=======|	截图	|============================================
#F2:: send !^+{F2}
#F3:: send !+^{F3}
#IfWinActive ahk_class TTextBoard
capslock::send {F1}
<+`::send {F9}
<+1::send {F8}
<+2::send {F6}
<+3::send {F3}
<+4::send {F7}
^s::send ^{p}

!1:: TTextBoard(246,529)
!2:: TTextBoard(336,515)
!3:: TTextBoard(618,524)
TTextBoard(x,y){
	MouseGetPos xpos,ypos
	send {F12}
	click 278,990
	click %x% ,%y%
	MouseMove %xpos%, %ypos%
}
#if
;=======|	FOXITREADER pdf	|============================================
FOXITREADER(x,y){
	global FOXITREADER_signal
	global areaHightLIght
	MouseGetPos, xpos, ypos 
	; not in hightlisgt mode
	if (FOXITREADER_signal == False)
	{
		; MsgBox %FOXITREADER_signal%
		; click 注释
		click 430,52
		if( areaHightLIght == true)
		{
			send {esc}
			; areaHight
			click 768,109
			FOXITREADER_signal := False
		}else{
			; textHight
			click 152,114
			FOXITREADER_signal := true
		}
		; click 注释格式
		; MsgBox %areaHightLIght%
		click 1026,67
		func_tooltip("in hightLight mode")
	}
	
	Click %x%,%y%
	MouseMove xpos, ypos
}
FOXITREADER2(x,y){
	global FOXITREADER_signal
	FOXITREADER_signal := False
	MouseGetPos, xpos, ypos 
	click %x% ,%y%
	MouseMove xpos, ypos
}

#IfWinActive, ahk_class classFoxitPhantom
$capslock::
send {esc}
FOXITREADER_signal := False
; MsgBox %FOXITREADER_signal%
return

$esc:: 
if (areaHightLIght == true)
{
	areaHightLIght := False
	func_tooltip("textHightLight")
}
else
{
	areaHightLIght := true
	func_tooltip("aeraHightLight")
}
FOXITREADER_signal := False
return

<!1::FOXITREADER(366,119)
<!2::FOXITREADER(283,137)
<!3::FOXITREADER(51,125)

!CapsLock::
MouseGetPos, xpos, ypos 
; click 注释
click 431,60
; click 文本注释
click 169,111
; click 注释格式
click 1004,66
MouseMove xpos, ypos
FOXITREADER_signal := trueMMM 
return
<+`::FOXITREADER2(67,27)
<+1::FOXITREADER2(103,29)
<+2::FOXITREADER2(128,18)
<+3::FOXITREADER2(156,21)
<+4::FOXITREADER2(190,27)
#if




;=======|	oneNote	|============================================
func_oneNote3(x,y,addAction:=1,addAction2:=1){
		send {esc}
		MouseGetPos, xpos, ypos 
		if(addAction2 == true){
			click 398,132
		}
		if(addAction == true){
			Click %x%,%y%			
		}
		MouseMove xpos, ypos
	}
	func_oneNote(x,y,addAction:=0){
		MouseGetPos, xpos, ypos 
		click 55,128	
		Click %x%,%y%
		if(addAction == true){
			click 1051,144
		}
		MouseMove xpos, ypos
	}
	
#If WinActive("ahk_exe" "ONENOTE.EXE") and (signStateOneNote == 0 or signStateOneNote == "")
	<!1::func_oneNote(678,177)
	<!2::func_oneNote(758,173)
	<!3::func_oneNote(764,139)
	<!4::func_oneNote(521,140,1)
	<!z::func_oneNote(254,124)
	<+`::func_oneNote3(1047,154)
	<+1::func_oneNote3(1009,117)
	<+2::func_oneNote3(1049,115)
	<+3::func_oneNote3(46,157,1,0)
	<+4::func_oneNote3(-1,-1,0)
	
	!CapsLock::
	MouseGetPos, xpos, ypos
	signStateOneNote := 1
	func_tooltip("in write mode")
	Click 126,90
	MouseMove xpos, ypos
	return 
#if

func_oneNote2(x,y){	
	MouseGetPos, xpos, ypos 
	Click %x%,%y%
	MouseMove xpos, ypos
}
#If WinActive("ahk_exe" "ONENOTE.EXE") and (signStateOneNote == 1)
		!1::func_oneNote2(747,140)
		!2::func_oneNote2(757,186)
		; !3::func_oneNote2(31,30)	
		
		!CapsLock::
		MouseGetPos, xpos, ypos
		signStateOneNote := 0
		func_tooltip("in draw mode")
		Click 288,87
		MouseMove xpos, ypos
		return
#if