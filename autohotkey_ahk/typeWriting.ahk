space & e::
    PostMessage, 0x50,, 0x4090409,, A
	func_tooltip("E")
return
space & c::
    PostMessage, 0x50,, 0x8040804,, A
	Sleep 50
    Send {ctrl}
	func_tooltip("C")
return