$`;::
	send,{Blind}`;
	return
$+`;::
	send,{Blind}:
	return
`; & j::
	roller("j")
	return
`; & k::
	roller("k")
	return
`; & h::
	roller("h")
	return
`; & l::
	roller("l")
	return
`; & y::
	roller("y")
	return
`; & b::
	roller("b")
	return
`; & i::
	roller("i")
	return
`; & m::
	roller("m")
	return 

roller(key,speed := 2 )
{
	if(getkeyState("shift","p"))
		speed := 1 
	if(key == "j")
		send ,{wheeldown %speed%}
	if(key == "k")
		send ,{wheelup %speed%}
	if(key == "h")
		send ,{wheelleft %speed%}
	if(key == "l")
		send ,{wheelright %speed%}
	if(key == "y")
		send ,{wheelup 3}
	if(key == "b")
		send ,{wheeldown 3}
	if(key == "i")
		send,^{home}
	if(key == "m")
		send,^{end}
	return 
}
