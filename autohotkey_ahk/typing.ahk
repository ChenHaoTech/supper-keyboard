#Persistent
#SingleInstance, force
#Include, ./Lib/utility.ahk


;=======|	function	|============================================
convertTypeWriter(key){
    if(key == "E"){
        PostMessage, 0x50,, 0x4090409,, A
        hToolTip("English")
			
    }
    if(key == "C"){
        PostMessage, 0x50,, 0x8040804,, A
        hToolTip("chinese")
    }
}
IME_GET(WinTitle="")
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_GETOPENSTATUS
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x005,0,,ahk_id %DefaultIMEWnd%
	MsgBox %ahk_id% ;%DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}
;=======|	key	|============================================
space & e:: 
if (hLongPress("e")){
    Send, ^{space}
    hToolTip("English sougou")
}Else{
    convertTypeWriter("E")
}
Return

space & c:: 
if (hLongPress("c")){
    Send, ^{space}
    hToolTip("Chinese sougou")
}Else{
    convertTypeWriter("C")
}
Return