#include ./superkey.ahk

#a::
if(longPress("a",time:=200)){ 
    Run "D:\Program Portable\VNote\VNote.exe" %notePath%   
}Else{
    noteSignal := True
    codeSignal := true
    gui,Add,Edit,vCode r20 w400 wanttab 
    gui,Show,x42 y50,note
}
Return


GuiClose:
gui,Submit
gui,Destroy
codeWrite(code)
noteSignal := False
codeSignal := False
Return

codeWrite(code,fileName:="./noteTemp.md"){
    global noteFile
    global lastDate
    global lastDateName
    global codeSignal
    global notePath

    ; if not input
    if (code == ""){
        func_tooltip("no data input")
        return
    }
    ; dir is exit ? ifnot create
    IfNotExist, %codeFile%
        FileCreateDir, %codeFile%    
    IfNotExist, %noteFile%,
        FileCreateDir, %noteFile%

    FileEncoding utf-8
    FormatTime, currentDate ,,yyyyMMdd
    lastDateTemp := lastDate
    EnvSub, lastDateTemp, %currentDate%, days
    ; is a new days?
    if lastDateTemp < 0 ;yes
    {
        FormatTime, fileName ,,yyyy_MM_dd        
        ; write in file config
        IniWrite, %currentDate%, ./config.ini, DATE, Today
        IniWrite, %fileName%,./config.ini,DATE,TodayString
        fileName := noteFile . fileName . ".md"
        IniWrite, %fileName%,./config.ini,filePath,todayNotePath
        notePath := fileName
    }
    Else    ;no
    {
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
}

#if noteSignal == true
!M::
Send,^{Space}
Send, ``````{Enter}``````{up}
Sleep, 2000
Send,^{Space}
Return
#if