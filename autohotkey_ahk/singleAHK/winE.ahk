#Persistent 
#NoTrayIcon ;不显示托盘图标
#SingleInstance, force 

path := Object() ; 路径 关联数组实现
fileFullName := "D:\code\AHK\autohotkey_study\autohotkey_ahk\config\winE.ch"
Loop
{
    FileReadLine, line,  %fileFullName%, %A_Index%
    if ErrorLevel ; 文件读结束
        break
    ; 行字符操作
    ATmp := StrSplit(line, "=")
    ; abbre.push( ATmp[1])
    ; path.push(ATmp[2])
    path[ATmp[1]] := ATmp[2]
}
#Include, Lib/utility.ahk
#e:: 
IfWinActive,winEBox ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe 
{
    Winkill, winEBox ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe 
    return
}Else{
    Loop
    {
        FileReadLine, line,  %fileFullName%, %A_Index%
        if ErrorLevel ; 文件读结束
            break
        ; 行字符操作
        ATmp := StrSplit(line, "=")
        ; abbre.push( ATmp[1])
        ; path.push(ATmp[2])
        path[ATmp[1]] := ATmp[2]
    }
    ; 创建含名称和  大小两列的 ListView:
    Gui, Add, ListView, r20 w200, abbre|path
    ; 从文件夹中获取文件名列表并把它们放入 ListView:
    for index, element in path
        LV_Add("ColN", index, element)
    LV_ModifyCol(1, "AutoHdr")  ; 根据内容自动调整每列的大小.
    Gui, Add, Edit, r1 w200 vinputPath
    Gui, Show, , winEBox
    ControlFocus Edit1, A
    send, ^{Space}
}
return




GuiClose:
gui,Submit
gui,Destroy
winE(inputPath)
Return
winE(abbre){
    global path
    pathTmp := path[abbre]
    if(pathTmp == ""){
        hTooltip("no path found!", 2000)
        return
    }Else{
        Run, %pathTmp%
    }
}


#IfWinActive winEBox ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe
*$Enter:: Goto, GuiClose
; 修改路径
F1::
Run C:\Program Files (x86)\Notepad++\notepad++.exe %fileFullName%
Goto, GuiClose
return
esc::
; Goto, GuiClose
Run, D:\code\AHK\autohotkey_study\autohotkey_ahk\singleAHK\reload.ahk
reload
; Goto, readFile
; Goto, GuiNew
Return 
#if