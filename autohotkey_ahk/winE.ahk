#Include, ./superkey.ahk

#e::
if(longPress("e") == True)
{
    winEsignal := True
}Else{
    run d:\
    winEsignal := False
}
return

#if (winEsignal == true)
CapsLock::winE()

d::winE("D:\download")
k::winE("D:\考研")
w::winE("D:\文档")
#if


winE(path:=""){
    global winEsignal
    if path == ""
        func_tooltip("exit winE mode")
    Else
        run %path%
    winEsignal := False
}