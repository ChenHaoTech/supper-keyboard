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
~RButton::
	return

normal_key(key)
{
	send,{blind}{%key%}
	return
}
