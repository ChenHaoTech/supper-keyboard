; #Include, ./winA.ahk



#IfWinActive, 运行 ahk_class #32770 ahk_exe Explorer.EXE 
winR(path,exe){
    global winRsignal
    run %path%
    temp := exe . " runing...."
    hToolTip(temp)
    winRsignal := False
    Return
}
#if