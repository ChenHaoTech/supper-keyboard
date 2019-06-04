#SingleInstance, force
#Persistent
#NoTrayIcon
hideSignal := False
hideCurrentFullName := "D:\code\AHK\autohotkey_study\autohotkey_ahk\singleAHK\hideCurrent.ini"
#h::
if (hideSignal == true) ;已经hide一个窗口了
{
    IniRead, wid, %hideCurrentFullName%, wid, hideCurrent, Error
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
IniWrite, %tmp2%, %hideCurrentFullName%, wid, hideCurrent
WinHide,ahk_id %tmp2%
Return
