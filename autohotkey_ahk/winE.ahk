#Include, ./superkey.ahk

#e::
winEsignal := True
hToolTip("in winE softe")
return

#if (winEsignal == true)
CapsLock::
hToolTip("exit winE mode")
winEsignal := False
return
d::winE("D:\download")
k::winE("D:\考研")
w::winE("D:\文档")
F1::winE("D:\code\helpdoc_帮助文档")
Esc::
hToolTip("kill all explorer")
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