SendMode, Input
do(num,item){
    
    outputString :=  "*" . item . "::" . "winR(" . num . ",""" . item . """,""" . item . """)`n"
    Send, %outputString%
}
do1(num,item,keyup){   
    outputString := item . "::" . "winR(" . num . ",""" . keyup . """,""" . item . """)`n"
    Send, %outputString%
    Sleep,  100
}


; #!^+f1::
temp1 := StrSplit(allString, "`,")
count := temp1._maxIndex()
Loop, %count%
{
    do(A_Index,temp1[A_Index])
}
currentCount := count
Loop, %count%
{
    outerCount := A_Index
    Loop, %count%
    {
        CountNum := (outerCount-1) * 25 +A_Index + currentCount
        If (temp1[outerCount] == temp1[A_index])
            Continue
        key := temp1[outerCount] . " & " . temp1[A_Index]
        do1(countNum,key,temp1[A_index])
    }
}
Return


CapsLock & esc::
func_tooltip("reloading")
Reload
return

; capslock & `::
; FileCopy, ./config.ini , "D:\code\AHK\autohotkey_study\autohotkey_ahk\config.ini"
; Run,  "C:\Users\chen\AppData\Local\Programs\Microsoft VS Code\Code.exe" "D:\code\AHK\autohotkey_study\autohotkey_ahk"
; Run, "D:\code\AHK\AutoHotkey.exe" "D:\code\AHK\autohotkey_study\autohotkey_ahk\superKey.ahk"
; ExitApp
; return

; !+#^F2::Run "powershell.exe" "ahk.ps1"
