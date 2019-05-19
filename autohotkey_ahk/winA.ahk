#include ./superkey.ahk

#a::
IfWinExist, note ahk_class AutoHotkeyGUI
{
    WinActivate, note ahk_class AutoHotkeyGUI
}
Else
{
    func_tooltip()
    gui, add, Text, , &CODE
    gui,Add,Edit,vCode r20 w400 wanttab 
    gui, add, Text, , &NAME
    gui,Add,Edit,vCodeNote r1 w400 wanttab 
    gui,Show,x42 y50,note
    WinSet,Transparent,230,A
    WinSet AlwaysOnTop ,Toggle ,A
}
Return

#s:: Run "D:\Program Portable\VNote\VNote.exe" %notePath%   



ExitSuperKey:
if winActive("note ahk_class AutoHotkeyGUI")
{
    codeWrite(code)
}
return


GuiClose:
gui,Submit
gui,Destroy
codeWrite(code,CodeNote)
codeSignal := False
Return

codeWrite(code,fileName:="")
{
    global noteFile
    global lastDate
    global lastDateName
    global codeSignal
    global notePath

    ; if not input
    if (code == "")
    {
        func_tooltip("no data input")
        return
    }

    ; 若目录不存在则创建
    IfNotExist, %codeFile%
        FileCreateDir, %codeFile%    
    IfNotExist, %noteFile%,
        FileCreateDir, %noteFile%
    ; 定义ecode
    FileEncoding utf-8

    ; 当文件名不为空
    if (fileName != "")
    {
        fileName := noteFile . fileName . ".md"
        file := FileOpen(fileName, "a")
        if !IsObject(file)
        {
            MsgBox Can't open "%FileName%" for writing.
            return
        }
        func_tooltip("path:" . fileName,3000)
        file.Write(code)
        file.Close()
        return
    }

    ; 计算时间差
    currentDate := ""
    FormatTime, currentDate ,,yyyyMMdd
    lastDateTemp := lastDate
    EnvSub, lastDateTemp, %currentDate%, days
    ; 加上7天
    EnvAdd, currentDate, 7, days

    ; 若和上次相比, 差了7天==> 新建文件
    if (lastDateTemp < -7)  ;yes
    {
        ; 获得文件名
        fileName := ""
        FormatTime, fileName,,yyyy_MM_dd  
        ; MsgBox %fileName%
        fileName := fileName . "-7days"
        ; 写入当前时间, 用于方才的减
        IniWrite, %currentDate%, ./config.ini, DATE, Today
        ; 写入当前文件名 
        IniWrite, %fileName%,./config.ini,DATE,TodayString
        ; 写入今日文件路径 并配置变量
        fileName := noteFile . fileName . ".md"
        IniWrite, %fileName%,./config.ini,filePath,todayNotePath
        notePath := fileName
    }Else{
        fileName := lastDateName
        fileName := noteFile . fileName . ".md"
        notePath := fileName
    }
    file := FileOpen(fileName, "a")
    FormatTime, currentTime ,R
    ; add heading of note
    code := "# " . currentTime . "`r`n" . code . "`r`n"
    if !IsObject(file)
    {
        MsgBox Can't open "%FileName%" for writing.
        return
    }
    func_tooltip("path:" . fileName,3000)
    file.Write(code)
    file.Close()
    return
}



#if winActive("note ahk_class AutoHotkeyGUI")
^d::
Send +{Home}^{c}
Send ~~~~{Left 2}
Send ^{v}
return

!1::
^1::
Send {#}{Space}
return

!3::
^3::
Send {#}{#}{#}{Space}
return

!2::
^2::
Send {#}{#}{Space}
return

^M::
!M::
Send,^{Space}
Send, ``````{Enter}``````{up}
Sleep, 2000
Send,^{Space}
Return
#if