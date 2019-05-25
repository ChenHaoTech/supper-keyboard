; #IfWinNotActive, ahk_group SHIFTGOOD
$<+1::explore("1")
$<+2::explore("2")
$<+3::explore("3")
$<+4::explore("4")
$<+5::explore("5")
$<+6::explore("6")
$<+7::explore("7")
$<+8::explore("8")
$<+9::explore("9")
explore(key){
    IfWinActive, ahk_group altNum
	    send !{%key%}
    Else
	    send ^{%key%}
}
; #If

;=======|      mailbox |============================================
enter & bs::send !+^{p}
#IfWinActive,ahk_class MainWindow
<!-::MouseMove 257,336
<!=::MouseMove 951,290
<+1::mailbox(258,223)
<+2::mailbox(234,313)
<+3::mailbox(222,458)
<+4::mailbox(215,561)
<+5::mailbox(199,692)
<+6::mailbox(193,796)
!enter::mailbox(344,117)
mailbox(xpos, ypos){
	MouseGetPos x, y
	Sleep 300
	click %xpos%, %ypos%
	MouseMove %x%, %y%
}
#if