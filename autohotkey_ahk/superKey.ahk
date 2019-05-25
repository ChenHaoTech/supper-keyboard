;TODO 干脆使用ini文件来当做变量
;使用全局变量 ahk自带==>当signal
#Persistent
#InstallKeybdHook	
#SingleInstance	force
#WinActivateForce
SetCapsLockState, AlwaysOff
SendMode Input
SetTitleMatchMode, 2
FileEncoding utf-8
;=======|	exe pid	|============================================
pid_shadowsR := "100-100"
IniRead pid_shadowsR ,config.ini.exe_id,shadowsR
;=======|	mouse	|============================================
CoordMode, mouse, window
;==================================================================================
;==================================================================================
;
;		initial variable from file
;
;==================================================================================
;==================================================================================
;=======|	winTop	|============================================
toggleWindows := object()
lastTopWindow := ""
;=======|	PDF	|============================================
FOXITREADER_signal := False
areaHightLIght := False
;=======|	UWP config 	|============================================
UWPedgeSignal := False
;=======|	winA mode	|============================================
noteSignal := False
codeSignal := False
IniRead, rootFile,./config.ini,filePath,ROOTFILE
noteFile := rootFile . "note\"
IniRead, lastDate, ./config.ini, DATE, Today, "20190502"
IniRead, lastDateName, ./config.ini, DATE, TodayString, "2019_05_02"
IniRead,notePath,./config.ini,filePath,todayNotePath
;=======|	debug	|============================================
allStringWithNum := "1,2,3,4,5,6,7,8,9,0,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
allString := "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
;=======|	search string	|============================================
searchSignal := False
SearchString := ""
searchEnginName := Object()
searchEnginString := Object()
searchPrompt :="please input SearchString`n"
IniRead ,searchEnginDefauleName,config.ini,SearchEnginName,default
IniRead ,searchEnginDefaultString,config.ini,SearchEngin,default
Loop 10{
	iniKey := "alt" . A_Index
	IniRead ,temp1,config.ini,SearchEnginName,%iniKey%,%searchEnginDefauleName%
	IniRead ,temp2,config.ini,SearchEngin,%iniKey%,%searchEnginDefaultString%
	searchEnginName[A_Index] := temp1
	searchEnginString[A_Index] := temp2
}
; prompt
Loop 5{
	temp1 := searchEnginName[A_Index*2-1]
	temp2 := searchEnginName[A_Index*2]
	searchPrompt := searchPrompt . "`nAlt+" . A_Index*2-1 . ": " . temp1 . "	Alt+" . A_Index*2 . ": " . temp2
}
;=======|	oneNote	|============================================
signStateOneNote := 0

;=======|	winBind	winActice |============================================
keyWinBind := Object()
loop 20{
	winID := "win" . A_Index
	IniRead  temp, config.ini,winBind_id, %winID%
	keyWinBind[A_Index] := temp
}
keyWinBindPath := Object()
loop 20{
	winID := "win" . A_Index
	IniRead  temp, config.ini,winBind_path, %winID%
	keyWinBindPath[A_Index] := temp
}

; ;=======|	winRmode	|============================================
winRsignal := 0
; winRsignal2 := 0
; winRArray := Object()
; loop 676{
; 	IniRead  temp, config.ini,winR, %A_Index%
; 	winRArray[A_Index] := temp
; }
;=======|	winEmode	|============================================
winEsignal := False
; winEsignal2 := 0
; winEArray := Object()
; loop 676{
; 	IniRead  temp, config.ini,winE, %A_Index%
; 	winEArray[A_Index] := temp
; }

;=======|	daily record	|============================================
IniRead  dailyRecordPath, config.ini,filePath, dailyRecordPathKey
;=======|	temp	|============================================
IniRead  tempFile, config.ini,filePath, tempKey
;=======|	yinxiang	|============================================
IniRead yinxiang ,config.ini.filePath,yinxiang
;=======|	Transparent	|============================================
global TransparentFlag := 0 
;=======|	groupadd string	|============================================
GroupAdd ,notePad ,ahk_class SciTEWindow
GroupAdd ,notePad ,ahk_class Notepad++
GroupAdd ,notePad ,ahk_class PX_WINDOW_CLASS
GroupAdd, notePad,ahk_exe Code.exe
;=======|	group IDE	|============================================
GroupAdd , IDE,ahk_exe Code.exe
GroupAdd ,IDE ,ahk_class PX_WINDOW_CLASS
GroupAdd ,IDE ,ahk_exe ConEmu64.exe
GroupAdd ,IDE,ahk_class SunAwtFrame
;=======|	shift==>ctrl	|============================================
GroupAdd , altNum,ahk_exe Code.exe
GroupAdd ,altNum, ahk_exe ConEmu64.exe
groupadd ,altNum, ahk_class PX_WINDOW_CLASS
;=======|	ahk file	|============================================
IniRead  exePath, config.ini,AHKPATH, exe
IniRead  exeFilePath, config.ini,AHKPATH, exeFile
IniRead  exeConfigPath, config.ini,AHKPATH, exeConfig
IniRead  ahkPath, config.ini,AHKPATH, ahk
IniRead  ahkFilePath, config.ini,AHKPATH, ahkFile
IniRead  ahkRunPath, config.ini,AHKPATH, ahkRun
; ListVars

;==================================================================================
;==================================================================================
;
;		include file
;
;==================================================================================
;==================================================================================
#Include, ./capslock.ahk
#Include, ./winActive.ahk
#Include, ./space.ahk
#Include, ./typing.ahk	
#Include, ./roller.ahk
#Include, ./search.ahk
#Include, ./string.ahk
#Include, ./transparent.ahk
#Include, ./winActive.ahk
#Include, ./debug.ahk
#Include, ./winR.ahk
#Include,  ./winE.ahk
#Include, ./shift.ahk
#Include, ./winA.ahk
#Include, ./wheel.ahk 
#Include, ./draw.ahk
;=======|	function	|============================================ 
longPress(key,time:=200)
{
	KeyWait %key%
	if (A_TimeSinceThisHotkey > time)
	{
		return True
	}else{
		return False
	}
}

normal_key(key)
{
	sendInput,{blind}{%key%}
	return
}
_IniRead(sectionName,key,path := "./config.ini"){
    IniRead temp,%path%,%sectionName%,%key%
    Return temp
}

_IniWrite(sectionName,key,value,path := "./config.ini"){
    IniWrite, %Value%, %path%, %sectionName%, %Key%
    Return
}

;return 0 : no data clip
;return 1 : has data clip
func_getClipboard()
{
Clipboard = 
Send,^{c}
ClipWait 0.1
if ErrorLevel
return 0
return 1
}
;=======|	tooltip	|============================================
func_tooltip(string:="",time := 1000)
{
ToolTip %string%
SetTimer ,toollable ,%time%
}
toollable:
	ToolTip
	return
;=======|	若exe未运行就运行	|============================================
ch_activate(name:="explorer.exe",path := "explorer.exe"){
; TODO 若对应exe未运行就运行		
		
}


;==================================================================================
;==================================================================================
;
;		other runSet
;
;==================================================================================
;==================================================================================
;=======|	mindmaster	|============================================
#IfWinActive ahk_exe C:\Program Files\mindmaster\MindMaster.exe
tab::Send, ^{enter}
#if
#IfWinActive ahk_class  SWT_Window0
$F2::Send , {F2}{Right}
#If
;=======|	vnote	|============================================
#IfWinActive ahk_exe D:\Program Portable\VNote\VNote.exe
\::send ^{e}
!i::
send !{i}
send {i}
return
#if
;=======|	dito	|============================================
Space & v::send !^+#{v}
`; & 7::Send #!^+{1}
`; & 8::Send #!^+{2}
`; & 9::Send #!^+{3}
`; & 0::Send #!^+{4}
;=======|	qq tim	|============================================
; TODO 若对应exe未运行就运行
CapsLock & Tab::
Send !^+{z}
Sleep 100
IfWinActive, ahk_exe tim.exe
{
	convertTypeWriter("C")
}
return
#IfWinActive ahk_exe TIM.exe
; alt
!F::Click 205,52
!s::click 579,736
!v::
Click 1002,113 
Sleep 1000
Click 1060,308
return

<!-::MouseMove 139,397
<!=::MouseMove 698,418

!p::
Click 205,52
send 手机
Sleep 100
send {enter}
return

!b::
Click 205,52
send 宝宝
Sleep 100
send {enter}
return

!m::click 717,200

; shift
<+`:: click 151,122
<+1:: click 226,198
<+2:: click 187,296
<+3:: click 199,398
<+4:: click 148,480
<+5:: click 133,593
<+6:: click 151,665
<+7:: click 117,753
<+8:: click 110,855


;string
`::
send ``
convertTypeWriter("E")
Sleep 2000
convertTypeWriter("C")
return
#if
;=======|	wechat	|============================================
Enter & \:: 
Send !^{w} 
IfWinActive, ahk_exe wechat.exe
	convertTypeWriter("C")
return
#IfWinActive ahk_exe WeChat.exe
!F::Click 313,54
<!-::MouseMove 308,326
<!=::MouseMove 666,319

<+1::click 366,145
<+2::click 333,255
<+3::click 273,313
<+4::click 263,456
<+5::click 237,544
<+6::click 236,636
<+7::click 222,730
#if
;=======|	Scite notePad++ subLine++	|============================================
#IfWinActive ahk_class SciTEWindow
F5::click 506,83
#If
;=======|	chm exe	|============================================
#IfWinActive, ahk_exe ExtraChm.exe
<!-::MouseMove 129,570
<!=::MouseMove 1071,525

<!1::chm(54,130)
<!2::chm(157,143)
<!3::chm(234,129)
<!4::chm(291,128)
chm(x,y){
	MouseGetPos xpos,ypos
	click %x%,%y%
	MouseMove % xpos,ypos
}
#if
#IfWinActive ahk_exe C:\Windows\hh.exe
!p::
; click 280,100
send ^{p}
Sleep 500
Send {enter}
Sleep 500
Send {enter}
return
#If
;=======|	explore.exe	|============================================
#IfWinActive, 另存为 ahk_class #32770
<!a::click 181,110
<!-::MouseMove 137,331
<!=::MouseMove 717,322
<!w::fileSwitcher("D:\文档")
<!D::fileSwitcher("D:\下载")
<!c::fileSwitcher("D:\code")
fileSwitcher(fileName:="D:\"){
	send ^{l}
	Sleep 300
	send {bs}
	send ^{space}
	send %fileName%
	Sleep 300
	send {enter}
	send ^{space}
	return
}
#If
#IfWinActive ahk_class CabinetWClass
<!=::
click 738,638
Sleep 300
send {esc}
return
<!-::MouseMove 328,597

!a::
Sleep 500
Send ,{RButton}
Send {p 2}
Send {enter}
return
#if
!`::Send,^!{tab}
;=======|	dida	|============================================
Enter & d::Send, !+^{o}
space & a::send, !+^{a}
Space & f::send, !+^{f}
;=======|	Translate |============================================
CapsLock & T::
IfWinActive ahk_exe idea64.exe
{
	send ^+{y}
	return
}else{
	send ^{c}
	send !{0}
	Sleep 100
	send ^{a}{bs}
	send ^{v}
	send {enter}
}
return
;=======|	eveerything		|============================================
CapsLock & n::Run C:\Program Files\Everything\Everything.exe

;=======|	xortime	|============================================
#IfWinActive,  ahk_exe XorTime.exe
F5::
send {f6}{up}
Sleep 500
send {down}
Sleep 300
send {F5}
return
#If


$~*F5::normal_key("F5")
F5 & t::
Run D:\Program Portable\TinyCountdown\TinyCountdown.exe
Sleep 900
convertTypeWriter("E")
Sleep 100
Send M
Send {enter}
return


;=======|	chrome	|============================================
#IfWinActive, ahk_exe chrome.exe
; 关闭下载状态栏
esc::
MouseGetPos x, y
click 1889,996
MouseMove %x%, %y%
return
; 左右栏
<!-::MouseMove 172,506
<!=::MouseMove 1178,477
; 点击hightlight
!capslock::
click 1492,94
MouseMove 1396,156
return
; bookmark
<!d::
send ^+{b}
return
; if (bookmarkSignal == False or bookmarkSignal == ""){
; 	; 不动
; 	return
; 	bookmarkSignal := True
; }else{
; 	bookmarkSignal := False
; 	MouseMove 673,116
; 	return
; }
; oneNote
!a::
send !{a}
Sleep 500
click 1696,315
MouseMove 300,513
return
#if





;=======|	eagle	|============================================
#IfWinActive, ahk_class EagleGet
$*enter::click 1228,780
#if	



;=======|	listary	|============================================
; !space::send !+^{l}
;=======|	cocall	|============================================
capslock & `::
WinActivate, ahk_exe cocall.exe
Send +!^{c}
return

;=======|	idea	|============================================
; #IfWinActive, ahk_exe idea64.exe
; +1::IDEA(489,91)
; +2::IDEA(726,92)
; +3::IDEA(903,97)
; +4::IDEA(1132,97)
; +5::IDEA(1324,92)
; #if
; IDEA(x,y){
; 	MouseGetPos xpos,ypos
; 	Sleep 200
; 	click %x% ,%y%
; 	MouseMove %xpos%, %ypos%
; }

