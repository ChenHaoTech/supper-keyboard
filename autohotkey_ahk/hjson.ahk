#Include ./Lib/JSON.ahk

a := Object()
a[0] := 0
a[1] := 1
MsgBox, % JSON.Dump(a)