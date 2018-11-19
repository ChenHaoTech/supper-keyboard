!`::Send, ^!{tab}
$*enter::normal_key("enter")

global soft_mode := 0

space & enter::
soft_mode := 1
tooltip in softMode
return

enter & t::
FormatTime , TimeString ,YYYYMMDDHH24MISS
msgbox, %TimeString%
return


global lockFlag := 0
#if soft_mode==1
capslock::
soft_mode := 0
tooltip
return
d & a:: stringRun("da") 
d & f:: stringRun("df") 
d & m:: stringRun("dm") 
b::stringRun("bb") 
b & e:: stringRun("be")
b & m:: stringRun("bm")
b & c:: stringRun("bc")
b & d::stringRun("bd")
q::stringRun("q")
g::stringRun("g")
m::stringRun("m")
esc::ExitApp
r & 2:: run C:\Program Files\AutoHotkey\Script\my_ahk_exe\superkey.exe
s & j::
send,^!{z}
Sleep 300
send,返字
sleep , 1000
send, {enter}
return
l:: ;lockFlag := 1
n & l:: ;lockFlag := 0
a::
c::
d::
e::
f::
h::
i::
j::
k::
;~ l::
n::
o::
p::
r::
s::
t::
u::
v::
w::
x::
y::
z::
0::
1::
2::
3::
4::
5::
6::
7::
8::
9::
`::
~::
!::
@::
#::
$::
%::
^::
&::
*::
(::
)::
-::
_::
=::
+::
[::
{::
]::
}::
\::
|::
:::
;::
'::
"::
,::
<::
.::
>::
func_tooltip("no-map-key")
return
#if

stringRun(keyString)
{
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
if( keyString == "bb")
{
	send,!{space}
	send,右右 lnk
	sleep , 300
	send, {enter}
}
if (keyString == "bd" and func_getClipboard())
{
	Run https://www.baidu.com/s?wd=%Clipboard%
}
if (keyString == "m" and func_getClipboard())
{
	Run https://ww2.mathworks.cn/help/search.html?qdoc=%Clipboard%
}
if (keyString == "g" and func_getClipboard())
{
	Run https://www.google.com/search?q=%Clipboard%
}
if (keyString == "q")
{	soft_mode :=0
	InputBox , SearchString, Searcher, please input SearchString
	if (SearchString == "")
	{
		func_tooltip("NoDataInput",500)
		return
	}
	Run https://www.baidu.com/s?wd=%SearchString%
}
soft_mode :=0
tooltip
}

func_getClipboard()
{
Clipboard = 
Send,^{c}
ClipWait 0.1
if ErrorLevel
{
	func_tooltip("no-clipboard-data",500)
	return 0
}
return 1
}
;====================================================| run-mark  |====================================================
!capslock::send,!+^{L}
!;::send,^!+{p}
capslock & `::
Run explore C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk
return

capslock & t::
Send,^{c}
send,!{0}
Sleep,300	
send, {Esc}
Send,^{v}
Send ,{enter}
return


;====================================================| special configulation |====================================================
#IfWinActive ahk_exe C:\Program Files\mindmaster\MindMaster.exe
tab::Send, ^{enter}
#if
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
If WinActive("ahk_exe C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
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
IfWinNotExist ahk_exe C:\Program Files\mindmaster\MindMaster.exe
	Run, C:\Program Files\mindmaster\MindMaster.exe
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
