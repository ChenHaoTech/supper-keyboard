﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

space & t::
WinGet, active_id, ID, A
loop
{
WinActivate, ahk_id %active_id%
if GetKeyState("esc","p")
	break
}
return
