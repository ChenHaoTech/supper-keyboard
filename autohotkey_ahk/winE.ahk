#Include, ./superkey.ahk

#e::
if(longPress("e") == False)
{
    winEsignal := True
}Else{
    run d:\
    winEsignal := False
}
return

#if (winEsignal == true)
CapsLock::
func_tooltip("exit winE mode")
winEsignal := False
return
d::winE("D:\download")
k::winE("D:\考研")
w::winE("D:\文档")
F1::winE("D:\code\helpdoc_帮助文档")
Esc::
func_tooltip("kill all explorer")
Loop, 10{
    IfWinExist,  ahk_class  CabinetWClass
        WinKill,ahk_class  CabinetWClass
}
winEsignal := False
return
#if


winE(path:=""){
    global winEsignal
    run %path%
    winEsignal := False
}