normal_key(key)
{
	sendInput,{blind}{%key%}
	return
}

func_tooltip(string:="",time := 1000)
{
ToolTip %string%
Sleep 1000
ToolTip
}