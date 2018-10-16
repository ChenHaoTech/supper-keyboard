#SingleInstance force

count := 0
esc & v::
	#if Count == 0
		Count := 1
		Send, {Shift down}
		+k::
			send,{up}
			return
		+j::
			send,{down}
			return
		+h::
			send,{Left}
			return
		+l::
			send,{right}
			return
		return
	#if Count == 1
		Count := 0
		Send, {shift up}
		return

Esc & f2::
	Suspend
	return