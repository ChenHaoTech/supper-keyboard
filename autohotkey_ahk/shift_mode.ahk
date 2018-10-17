#SingleInstance force

shift_mode := 1 ; initinate true

esc & v::
	if Shift_mode
	{
		Send , {Shift Down}
		Shift_mode := 0
		return
	}
	else
	{
		Send, {shift up}
		Shift_mode := 1
		return
	}
	
	