$*;::
	normal_key(";")
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

roller(key)
{
	rooler_speed := 2
	if(key == "j")
		send ,{wheeldown %rooler_speed%}
	if(key == "k")
		send ,{wheelup %rooler_speed%}
	if(key == "h")
		send ,{wheelleft %rooler_speed%}
	if(key == "l")
		send ,{wheelright %rooler_speed%}
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
