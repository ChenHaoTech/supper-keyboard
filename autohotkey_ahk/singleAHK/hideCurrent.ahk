#SingleInstance, force
#Persistent
#NoTrayIcon
hideSignal := False
#h::
; ; 若alt key按下
; if(GetKeyState("alt", "P")) {
;     MsgBox , 重置hide的windows界面 
;     Goto, show
;     hideSignal := False
;     Return
; }
if (hideSignal == true) ;已经hide一个窗口了
{
    IniRead, wid, config/singleAHK.ini, wid, hideCurrent, Error
    WinShow, ahk_id %wid%
    WinWait, ahk_id %wid%, , 0.5
    if(ErrorLevel == 1){
        MsgBox,the hidden window has gone
        Return
    }
    WinActivate,ahk_id %wid%
    hideSignal := False
}Else{
    hideSignal := true
    Goto, show
}
Return

show:
WinGet, tmp2,ID, A
IniWrite, %tmp2%, config/singleAHK.ini, wid, hideCurrent
WinHide,ahk_id %tmp2%
Return
