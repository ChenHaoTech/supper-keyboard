#r::
winRsignal := True
func_tooltip("win winR mode")
Return






#if winRsignal == TRUE
CapsLock::winRsignal := False1

z & y::winR("D:\Program Portable\zym7.64\fg766p.exe","ziyoumen")
WinActivate, ahk_exe 自由门.exe
Return
; ziyuan
f1::winR("C:\WINDOWS\system32\perfmon.exe","perform")
;C:\Windows\System32\control.exe

c::winR("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe","chrome")

v & s::winR("C:\Users\chen\AppData\Local\Programs\Microsoft VS Code\Code.exe","vscode")

w & x::winR("D:\Program Portable\wox\Wox-1.3.524.exe","wox")

esc::
MsgBox, it will exit superKey
ExitApp, 10085
Return

e & d::
Send, ^{l}
Send ^{c}
Send #{2}
Sleep, 500
Send {esc}
Send, ^{l}
Sleep, 500
Send ^{v}
Send {Enter}
#If

winR(path,exe){
    global winRsignal
    run %path%
    temp := exe . " runing...."
    func_tooltip(temp)
    winRsignal := False
    Return
}