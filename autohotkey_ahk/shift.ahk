; #IfWinNotActive, ahk_group SHIFTGOOD
; $<+1::explore("1")
; $<+2::explore("2")
; $<+3::explore("3")
; $<+4::explore("4")
; $<+5::explore("5")
; $<+6::explore("6")
; $<+7::explore("7")
; $<+8::explore("8")
; $<+9::explore("9")
explore(key){
    IfWinActive, ahk_group altNum
	    send !{%key%}
    Else
	    send ^{%key%}
}
; #If

