#Persistent
#SingleInstance force ;å¼ºåˆ¶å•è¿›ç¨‹
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
    ;~ ; ÏÂ·½´úÂë¿ÉÖ»±£ÁôÒ»¸ö
    ;~ SwitchIME(0x08040804) ; Ó¢Óï(ÃÀ¹ú) ÃÀÊ½¼üÅÌ
    ;~ SwitchIME(0x04090409) ; ÖĞÎÄ(ÖĞ¹ú) ¼òÌåÖĞÎÄ-ÃÀÊ½¼üÅÌ
;~ return