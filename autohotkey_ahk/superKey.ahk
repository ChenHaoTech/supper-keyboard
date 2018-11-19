#Persistent
#SingleInstance force ;强制单进程
#InstallKeybdHook	
SetCapsLockState, AlwaysOff

#Include ./colon.ahk
#Include ./space.ahk        
#Include ./capslock.ahk
#Include ./run.ahk
#Include ./string.ahk    
#Include ./utility.ahk
#Include ./Transparent.ahk
#Include ./win.ahk
#Include ./typeWriting.ahk
;~ #Include ./lock.ahk

;~ #f1::
;~ ControlGetText, OutputVar [, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]
;~ ControlGet, OutputVar, Cmd [, Value, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]
;~ ControlGet, var, Hwnd,,A
;~ WinGetText, OutputVar ,,ahk_id, %var% 
;~ Run notepad.exe
;~ WinActivate
;~ send %outputVar%

