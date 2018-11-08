;============================================================hot string convert===========================================================
:*?:(::(){left}
:*?:[]::[]{left}
:*?:""::""{left}
:*?:''::''{left}
:*?:<>::<>{left}
:*?:{::{{}{}}{left}
:*?:m1::{#}{space}	
:*?:m2::{#}{#}{space}	
:*?:m3::{#}{#}{#}{space}	
:*?:m4::{#}{#}{#}{#}{space}
:*?:m5::{#}{#}{#}{#}{#}{space}
:*?:=com::==================================| |========================================{Left 42}
:*?:=2com::================================== ========================================{Left 42}{Enter}
:*?:chS::47.93.246.76
:*?:3``::````````````{left 3}{enter}{up}{end}


tab & =::
	send,{+}
	return
tab & u::
	send,1
	return
tab & i::
	send,2
	return
tab & o::
	send,3
	return
tab & j::
	send,4
	return
tab & k::
	send,5
	return
tab & l::
	send,6
	return
tab & n::
	send,7
	return
tab & m::
	send,8
	return
tab & ,::
	send,9
	return
tab & space::
	send,0
	return

space & `::
num_char("``")
return
space & -::
num_char("-")
return
space & =::
num_char("=")
return
space & }::
num_char("}")
return
space & {::
num_char("{")
return
space & 1::
num_char("1")
return
space & 2::
num_char("2")
return
space & 3::
num_char("3")
return
space & 4::
num_char("4")
return
space & 5::
num_char("5")
return
space & 6::
num_char("6")
return
space & 7::
num_char("7")
return
space & 8::
num_char("8")
return
space & 9::
num_char("9")
return
space & 0::
num_char("0")
return

num_char(key)
{
	send,+{%key%}
	return
}
