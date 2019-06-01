;TODO 干脆使用ini文件来当做变量
;使用全局变量 ahk自带==>当signal
#Persistent
#InstallKeybdHook	
#SingleInstance	force
#WinActivateForce
SetCapsLockState, AlwaysOff
SendMode Input
SetTitleMatchMode, 2
;===================================
;===============| run ahk |===============
;===================================
run %A_ScriptDir%\singleAHK\searchBox.ahk
run, %A_ScriptDir%\special\powershell.ahk
;==================================================================================
;==================================================================================
;
;		initial variable from file
;
;==================================================================================
;==================================================================================
;========| debug|===========
Debugsignal := 0
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
IniRead, rootFile,%A_scriptDir%/config/config.ini,filePath,ROOTFILE
noteFile := rootFile . "note\"
IniRead, lastDate, %A_scriptDir%/config/config.ini, DATE, Today, "20190502"
IniRead, lastDateName, %A_scriptDir%/config/config.ini, DATE, TodayString, "2019_05_02"
IniRead,notePath,%A_scriptDir%/config/config.ini,filePath,todayNotePath
;=======|	debug	|============================================
allStringWithNum := "1,2,3,4,5,6,7,8,9,0,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
allString := "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
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
; GroupAdd, notePad,ahk_exe Code.exe
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
; TODO 简写 #include
; #Include, ./Lib/
; #Include, %A_ScriptDir%
 
#Include, ./capslock.ahk
#Include, ./winActive.ahk
#Include, ./space.ahk
#Include, ./typing.ahk	
#Include, ./roller.ahk
; #Include, ./search.ahk
; #Include, ./searchBox.ahk
#Include, superKey.ahk
#Include, ./string.ahk
#Include, ./transparent.ahk
#Include, ./debug.ahk
#Include, ./winR.ahk
#Include,  ./winE.ahk
#Include, ./shift.ahk
#Include, ./winA.ahk
#Include, ./wheel.ahk 
#Include, ./draw.ahk
#Include, ./translate2.ahk
; 特殊 exe的 快捷键配置
#Include, ./special/mailbox.ahk
#Include, ./special/chrome.ahk
#Include, ./special/qq_wechat.ahk
#Include, ./special/explorer.ahk
#Include, ./special/cmder.ahk
#Include, ./special/eagle.ahk
#Include, ./special/vnote.ahk

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

; TODO 判断选择 那个文档
^j:: run D:\文档\AHK
#if
chm(x,y){
	MouseGetPos xpos,ypos
	click %x%,%y%
	MouseMove % xpos,ypos
}
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

$~*F5::hNormalKey("F5")
F5 & t::
Run D:\Program Portable\TinyCountdown\TinyCountdown.exe
Sleep 900
convertTypeWriter("E")
Sleep 100
Send M
Send {enter}
return



;=======|	listary	|============================================
; !space::send !+^{l}
;=======|	cocall	|============================================
capslock & `::
WinActivate, ahk_exe cocall.exe
Send +!^{c}
return
;========| OCR|===========
capslock & F4::
Process, Exist,  天若OCR文字识别.exe
if(ErrorLevel == 0){ ;进程不存在
    run, D:\Program Portable\天若OCR\天若OCR文字识别.exe
    ; Process, Wait, 天若OCR文字识别.exe
    Sleep 1000
    send !{F5}
}else{
    Process, Close,  天若OCR文字识别.exe    
}
return


; TOCODE 此处用于编程 试验
#F1::
; WinGetText, var, A
; Clipboard := var
; MsgBox % var

; path "C:\Windows\explorer.exe
; ahk_exe Explorer.EXE
; ahk_class NotifyIconOverflowWindow
; ahk_id 0x101d4
; pid 8316
; DetectHiddenWindows, on
; WinActivate  ahk_class NotifyIconOverflowWindow

return

