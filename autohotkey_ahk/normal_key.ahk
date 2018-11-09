#SingleInstance force 
$*tab::
	normal_key("tab")
	return

$*enter::
	normal_key("enter")
	return
$*space::
	normal_key("space")
	return
$*;::
	normal_key(";")
	return

normal_key(key)
{
	sendInput,{blind}{%key%}
	return
}
