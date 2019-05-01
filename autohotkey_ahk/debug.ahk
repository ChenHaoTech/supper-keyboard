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


#!^+f1::
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


CapsLock & esc::Reload

capslock & `::
Run %ahkFilePath%
run %ahkRunPath% %ahkPath%
Run %ahkPath%
run %exeFilePath%
FileCopy,%exeConfigPath% ,%ahkConfigPath%
ExitApp
return

