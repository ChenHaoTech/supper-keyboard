a:= ""

F1::
Gui, Add, Edit,va x42 y-50 w100 h30 , Edit
Gui, Add, Edit, x2 y19 w460 h210 , Edit
Gui, Add, Edit, x2 y239 w460 h60 , Edit
Gui, Add, Edit, x2 y309 w100 h30 +Left, Edit
Gui, Add, Edit, x322 y309 w140 h30 , Edit
; Generated using SmartGUI Creator 4.0
Gui, Show, w479 h360        , 
Return

GuiClose:
gui,Submit
Return

F2::MsgBox, %a%
~esc::Reload