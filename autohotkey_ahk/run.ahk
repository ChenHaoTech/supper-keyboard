soft_mode := 0

space & r::
enter & r::
soft_mode := 1
GUI,NEW
GUI,show
sleep, 1000
GUI,Destroy 
return

enter & t::
FormatTime , TimeString ,YYYYMMDDHH24MISS
msgbox, %TimeString%
return


;==|baobao|===
enter & b::
stringRun("baobao")
return 
;===|baobao end|===

;===| dida |====
#if (soft_mode==1)
; #if (getkeystate("enter","p"))
:*?:da::
stringRun("da") 
return
:*?:df::
stringRun("df") 
return
:*?:dm::
stringRun("dm") 
return
;===| dida-end |====

;===| blog  |====
:*?:be::
stringRun("be")
return
:*?:bm::
stringRun("bm")
return
:*?:bc::
stringRun("bc")
return

;===| blog-end  |====
#if

stringRun(keyString)
{
	global soft_mode
		;blog
		if(keyString == "be")
		{
			Run https://mp.csdn.net/mdeditor
		}
	if(keyString == "bm")
	{
		Run https://mp.csdn.net 
	}
	if(keyString == "bc")
	{
		Run https://blog.csdn.net/column/mycolumn.html
	}
	;dida
		if(keyString == "dm")
		{
			send,!^+{o}
		}
	if(keyString == "da")
	{
		send, !+^{a}
	}
	if(keyString == "df")
	{
		send, !+^{f}
	}
	if(keyString == "baobao")
	{
		run,""
	}

soft_mode :=0
}
;====================================================| run-mark  |====================================================
capslock & `::
Run C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk\capslock.ahk
return

capslock & t::
Send,^{c}
send,!{0}
Sleep,300	
send, {Esc}
Send,^{v}
Send ,{enter}
return

capslock & q::
Send,^{c}
Sleep, 1
Send,!g^{v}
return
;====================================================| special configulation |====================================================
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

