; C:\Windows\System32\WindowsPowerShell\v1.0\powershell_ise.exe
#SingleInstance, force
#Persistent
; MsgBox, hhe
#IfWinActive, ahk_exe powershell_ise.exe
<^/::
; MsgBox hhh
send, {Home}
send, {#}{Space}
Return
^+/::
send, {Home}
send, {Delete 2}
Return
#if

; path "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe



; #IfWinActive,powershell.exe ahk_class ConsoleWindowClass ahk_exe powershell.exe

; #if