#Persistent
#InstallKeybdHook	
#SingleInstance	force
#WinActivateForce
SetCapsLockState, AlwaysOff
SendMode Input
SetTitleMatchMode, 2
;==================================================================================
;==================================================================================
;
;		initial variable from file
;
;==================================================================================
;==================================================================================
;=======|	debug	|============================================
allStringWithNum := "1,2,3,4,5,6,7,8,9,0,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
allString := "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
;=======|	search string	|============================================
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
Loop 5{
	temp1 := searchEnginName[A_Index*2-1]
	temp2 := searchEnginName[A_Index*2]
	searchPrompt := searchPrompt . "`nAlt+" . A_Index*2-1 . ": " . temp1 . "	Alt+" . A_Index*2 . ": " . temp2
}
;=======|	oneNote	|============================================
signStateOneNote := 0

;=======|	winBind	|============================================
keyWinBind := Object()
loop 20{
	winID := "win" . A_Index
	IniRead  temp, config.ini,winBind_id, %winID%
	keyWinBind[A_Index] := temp
}

;=======|	winRmode	|============================================
winRsignal := 0
winRsignal2 := 0
winRArray := Object()
loop 676{
	IniRead  temp, config.ini,winR, %A_Index%
	winRArray[A_Index] := temp
}
;=======|	winEmode	|============================================
winEsignal := 0
winEsignal2 := 0
winEArray := Object()
loop 676{
	IniRead  temp, config.ini,winE, %A_Index%
	winEArray[A_Index] := temp
}

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
;=======|	ahk file	|============================================
IniRead  exePath, config.ini,AHKPATH, exe
IniRead  exeFilePath, config.ini,AHKPATH, exeFile
IniRead  exeConfigPath, config.ini,AHKPATH, exeConfig
IniRead  ahkPath, config.ini,AHKPATH, ahk
IniRead  ahkFilePath, config.ini,AHKPATH, ahkFile
IniRead  ahkRunPath, config.ini,AHKPATH, ahkRun
;=======|	WINACTIVETEHIDE	|============================================
IniRead temp,config.ini,winBind_id
Loop, Parse, temp , "`n"
{
	; todo 文件写未完成
	array := StrSplit(A_LoopField, "=")
	winActiveHide[array[1]] := array[2]
}

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
#Include, ./winR.ahk
#Include, ./winE.ahk
#Include, ./winOther.ahk
#Include, ./debug.ahk

;=======|	function	|============================================
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
#if
;=======|	dito	|============================================
Space & v::send !^+#{v}
`; & 7::Send #!^+{1}
`; & 8::Send #!^+{2}
`; & 9::Send #!^+{3}
`; & 0::Send #!^+{4}
;=======|	qq tim	|============================================
CapsLock & Tab::
Send !^+{z}
IfWinActive, ahk_exe tim.exe
	convertTypeWriter("C")
return
#IfWinActive ahk_exe TIM.exe
!F::Click 205,52
!s::click 500,742
!v::
Click 1002,113 
Sleep 1000
Click 1060,308
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
#if
;=======|	Scite notePad++ subLine++	|============================================
#IfWinActive ahk_class SciTEWindow
F5::click 506,83
#If
;=======|	chm exe	|============================================
#IfWinActive ahk_exe C:\Windows\hh.exe
!p::
click 280,100
Sleep 500
Send {enter}
Sleep 500
Send {enter}
return
#If
;=======|	explore.exe	|============================================
#IfWinActive ahk_class CabinetWClass
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
;=======|	QTranslate |============================================
CapsLock & T::
Send !{0}
return
;=======|	eveerything		|============================================
CapsLock & n::Run C:\Program Files\Everything\Everything.exe

;=======|	xortime	|============================================
#IfWinActive,  ahk_exe XorTime.exe
F5::
send {f6}{up}
Sleep 300
send {down}
Sleep 300
send {F5}
return
#If

;=======|	oneNote	|============================================
#If WinActive("ahk_exe" "ONENOTE.EXE") and (signStateOneNote == 0 or signStateOneNote == "")
	!1::func_oneNote(678,177)
	!2::func_oneNote(758,173)
	!3::func_oneNote(764,139)
	!4::func_oneNote(521,140)
	!z::func_oneNote(297,140)
	func_oneNote(x,y){
		Send {esc}
		MouseGetPos, xpos, ypos 
		Click %x%,%y%
		MouseMove xpos, ypos
	}
	
	!CapsLock::
	MouseGetPos, xpos, ypos
	signStateOneNote := 1
	func_tooltip("in write mode")
	Click 126,90
	MouseMove xpos, ypos
	return 
#If WinActive("ahk_exe" "ONENOTE.EXE") and (signStateOneNote == 1)
		!1::func_oneNote2(23,196)
		!2::func_oneNote2(159,156)
		!3::func_oneNote2(31,30)
		func_oneNote2(x,y){	
			MouseGetPos, xpos, ypos 
			Click 447,196
			Click %x%,%y%
			MouseMove xpos, ypos
		}
		
		!CapsLock::
		MouseGetPos, xpos, ypos
		signStateOneNote := 0
		func_tooltip("in draw mode")
		Click 288,87
		MouseMove xpos, ypos
		
		return
#if

$~*F5::normal_key("F5")
F5 & t::
Run D:\Program Portable\TinyCountdown\TinyCountdown.exe
Sleep 900
convertTypeWriter("E")
Sleep 100
Send M
Send {enter}
return


;=======|      mailbox |============================================
enter & BS::Send !^+{p}