; 实现双击

#SingleInstance force

$Esc::
Keywait, Escape, , t0.5
if errorlevel = 1
return
else
Keywait, Escape, d, t0.1
if errorlevel = 0
{
WinGetActiveTitle, Title
WinClose, %Title%
return
}
return