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

;~ #f1::
;~ ControlGetText, OutputVar [, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]
;~ ControlGet, OutputVar, Cmd [, Value, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]
;~ ControlGet, var, Hwnd,,A
;~ WinGetText, OutputVar ,,ahk_id, %var% 
;~ Run notepad.exe
;~ WinActivate
;~ send %outputVar%


SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}

;~ esc::
    ;~ ; �·������ֻ����һ��
    ;~ SwitchIME(0x08040804) ; Ӣ��(����) ��ʽ����
    ;~ SwitchIME(0x04090409) ; ����(�й�) ��������-��ʽ����
;~ return