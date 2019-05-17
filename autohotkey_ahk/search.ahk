CapsLock & Q::
searchSignal := True
if(func_getClipboard())
	InputBox , SearchString, Searcher, %searchPrompt%,,250,230,,,,,%Clipboard%	
else{
	InputBox , SearchString, Searcher, %searchPrompt%,,250,230,,,,,%SearchString%
}
return

#if (searchSignal == true)
CapsLock:: 
searchSignal := False
Send {esc}
return
; $*Enter::funcSearch(1)
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
!g::funcSearch(-1,0)
return
funcSearch(modeID,direcRun:=False){
	global searchSignal
	global searchEnginString 
	global SearchString
	searchSignal := False
	mode := searchEnginString[modeID]
	Send, {Enter}	
	runString := mode . SearchString
	if (direcRun==False)
		run %runString%
	else
		run   %SearchString%
	return

}
#if