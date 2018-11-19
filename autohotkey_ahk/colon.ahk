*`;:: normal_key(";")
`; & j:: roller("j")
`; & k:: roller("k")
`; & h:: roller("h")
`; & l:: roller("l")
`; & f:: roller("f")
`; & s:: roller("s")

`; & u:: Send, {LButton}
`; & o:: Send, {RButton}

`; & i:: Send, ^{Home}
`; & m:: Send, ^{end}

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
	{
		if (roller_speed <= 1)
			roller_speed := 1
		else
			roller_speed -= 1
	}
	if(key == "f")	
	{
		if (roller_speed > 10)
			roller_speed := 10
		else
			roller_speed += 1
	}		
	ToolTip %roller_speed%
	SetTimer , message_rollerSpeed , 1000
	;~ tooltip %roller_speed%
	return 
}
message_rollerSpeed:
SetTimer , message_rollerSpeed , off
ToolTip
return


























