; path "D:\Program Portable\cmder\vendor\conemu-maximus5\ConEmu64.exe
; ahk_exe ConEmu64.exe
; ahk_class VirtualConsoleClass
; ahk_id 0x104ec
; pid 11248
; 管理员: powershell (Admin)
; #IfWinActive, ahk_class VirtualConsoleClass ahk_exe ConEmu64.exe
; #IfWinActive, ahk_class VirtualConsoleClass
#Include, ./Lib/utility.ahk
space & F1::
send #!^{F1}
convertTypeWriter("E")
return
#IfWinActive,  ahk_exe ConEmu64.exe
#F1::
<!-:: MouseMove, 430,491
<!=:: MouseMove , 1393,458
#if
