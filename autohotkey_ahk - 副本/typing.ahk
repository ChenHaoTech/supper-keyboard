#Persistent
#SingleInstance, force
#Include, ./superKey.ahk


;=======|	function	|============================================
convertTypeWriter(key){
    if(key == "E"){
        PostMessage, 0x50,, 0x4090409,, A
        func_tooltip("English")
			
    }
    if(key == "C"){
        PostMessage, 0x50,, 0x8040804,, A
        Send, ^{space}
        func_tooltip("chinese")
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
space & e:: convertTypeWriter("E")
space & c:: convertTypeWriter("C")