soft_mode := 0
capslock & space::
soft_mode := 1
GUI,NEW
GUI,show,hide
; GUI,Destroy
return

$enter::
send,{enter}
return

enter & t::
FormatTime , TimeString ,YYYYMMDDHH24MISS
msgbox, %TimeString%
return


;==================================| dida |========================================
#if soft_mode==1
:*?:dm::
stringRun("dm") 
return
:*?:da::
stringRun("da") 
return
:*?:df::
stringRun("df") 
return
#if

stringRun(keyString)
{

	if(keyString == "dm")
	{
		send,{enter}
		send,!^+{o}
soft_mode := 0
	}
	if(keyString == "da")
	{
		send, !+^{a}
soft_mode := 0
	}
	if(keyString == "df")
	{
		send, !+^{f}
soft_mode := 0
	}}
;====================================================| run-mark  |====================================================
capslock & 0::
Run https://mp.csdn.net/mdeditor
return

capslock & `::
Run C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk\capslock.ahk
return

capslock & t::
Send,^{c}!{0}
Sleep,1	
send, {Esc}
Send ,{enter}
return

capslock & q::
Send,^{c}
Sleep, 1
Send,!g^{v}
return
;====================================================| special configulation |====================================================
; add perfix $ make tab key can not reverse
$Tab::
if WinExist("ahk_exe C:\Program Files\mindmaster\MindMaster.exe")
IfWinActive
Send,^{Enter}
IfWinNotActive
Send,{Tab}
return
IfWinNotExist ahk_exe C:\Program Files\mindmaster\MindMaster.exe
Send,{Tab}
return



; in xmind
$F2::
if winExist( "ahk_exe C:\Program Files (x86)\XMind\XMind.exe")
ifwinActive
Send , {F2}{Right}
IfWinNotActive 
Send , {F2}
IfWinNotExist ahk_exe C:\Program Files (x86)\XMind\XMind.exe
Send, {F2}
return

;==================================| run specially |========================================
capslock & 1::
if WinExist("ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe	
IfWinNotExist ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
run ,C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
return

capslock & 2::
if WinExist("ahk_exe C:\Program Files\mindmaster\MindMaster.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Program Files\mindmaster\MindMaster.exe
return

capslock & 3::
if WinExist("ahk_exe C:\Users\26306\AppData\Local\atom\atom.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Users\26306\AppData\Local\atom\atom.exe
return

capslock & 4::
if WinExist("ahk_exe C:\Program Files\Typora\Typora.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Program Files\Typora\Typora.exe
return

capslock & 5::
if WinExist("ahk_exe C:\Windows\explorer.exe")
IfWinActive
WinMinimize
else
WinActivate , ahk_exe C:\Windows\explorer.exe
return

