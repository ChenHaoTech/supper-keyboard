; TODO  %A_ScriptDir%\ 路径修改
;=======|	function	|============================================ 
hLongPress(key,time:=200)
{
	KeyWait %key%
	if (A_TimeSinceThisHotkey > time)
	{
		return True
	}else{
		return False
	}
}

hNormalKey(key)
{
	sendInput,{blind}{%key%}
	return
}
hIniRead(key,sectionName,path := "%A_scriptDir%/config/config.ini"){
    IniRead temp,%path%,%sectionName%,%key%
    Return temp
}

hIniWrite(key,sectionName, value,path := "%A_scriptDir%/config/config.ini"){
    IniWrite, %Value%, %path%, %sectionName%, %Key%
    Return
}

;return 0 : no data clip
;return 1 : has data clip
ClipboarNotNull()
{
Clipboard := ""
Send,^{c}
ClipWait 0.1
if (ErrorLevel == 1) ; 到达等待时间
{
	return 0
}
return 1
}

;=======|	tooltip	|============================================
hToolTip(string:="",time := 1000)
{
ToolTip %string%
SetTimer ,toollable ,%time%
}
toollable:
	ToolTip
	return

;=======|	文件尾添加	|============================================
hFileAppend(filePath,value){
	file := FileOpen(filePath,"a") ; 文件不存在创建, 覆盖写
	FileEncoding UTF-8
	if !IsObject(file)
	{
		MsgBox Can't open "%filePath%" for writing.
		return
	}
	file.Write(value)
	file.Close()
}


