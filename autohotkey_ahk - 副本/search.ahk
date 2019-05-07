CapsLock & Q::
if(func_getClipboard())
	run % searchEnginDefaultString . Clipboard
else{
	InputBox , SearchString, Searcher, %searchPrompt%,,250,230,,,,,%SearchString%
}
return

#If WinActive("ahk_exe D:\AHK\AutoHotkey.exe")
!1::funcSearch(1)
!2::funcSearch(2)
!3::funcSearch(3)
!4::funcSearch(4)
!5::funcSearch(5)
!6::funcSearch(6)
!7::funcSearch(7)
!8::funcSearch(8)
!9::funcSearch(9)
!0::funcSearch(10)
return
funcSearch(modeID){
	global searchEnginString 
	global SearchString
	mode := searchEnginString[modeID]
	Send, {Enter}	
	runString := mode . SearchString
	run %runString%
	return
}
#if