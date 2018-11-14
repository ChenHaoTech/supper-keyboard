*`;:: normal_key(";")
`; & j:: roller("j")
`; & k:: roller("k")
`; & h:: roller("h")
`; & l:: roller("l")
`; & f:: roller("f")
`; & s:: roller("s")

roller(key)
{
	global static roller_speed := 1
	if(key == "j")
		send ,{wheeldown %roller_speed%}
	if(key == "k")
		send ,{wheelup %roller_speed%}
	if(key == "h")
		send ,{wheelleft %roller_speed%}
	if(key == "l")
		send ,{wheelright %roller_speed%}
	if(key == "s")
		roller_speed -= 1
	if(key == "f")	
		roller_speed += 1
	;~ tooltip %roller_speed%
	return 
}



























