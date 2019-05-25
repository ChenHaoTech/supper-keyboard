; Initial Preferences
#SingleInstance Force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Few global variables

IniFile = %A_ScriptDir%\wpchange.ini
TempWallpaper = %A_MyDocuments%\currentwallpaper.jpg

IniRead, WallPaperFolder, %IniFile%, Settings, WPFolder, NOT_SET ;  读取配置文件，获取之前保存的路径，如果有的话。

If WallPaperFolder = NOT_SET ; 如果不存在配置文件，或者需要重新更换路径。
{
	FileSelectFolder, SetFolder, , 3 ; Show a folder for the wallpapers
	if SetFolder =
	{
		MsgBox, You didn't select a folder, the program will now close.	; We can't function without a folder, if the user didn't select one, exit.
		ExitApp
	}
	else
	{
		SetFolder := RegExReplace(SetFolder, "\\$")  ; Removes the trailing backslash, if present.
		WallPaperFolder = %SetFolder%\ ; We need the trailing backslash for our purposes, but removing it first eliminates the possibility of dual slashes.
		IniWrite, %WallPaperFolder%, %IniFile%, Settings, WPFolder ; Now that we have all the settings, write them to IniFile so we don't need to ask them again at relaunch
		MsgBox Setting saved. To reset, choose the "Reset Folder" item from tray or delete file %IniFile%.`n`nYou can now change your wallpaper at will by pressing "Win+MiddleMouseButton". The program will select a random image from the folder you provided and set it as your wallpaper.
	}
}

RefreshWPs()
{
	Global
	ArrayCount=0
	Loop, %WallPaperFolder%*.jpg ; check all jpg images in the WallpaperFolder
	{
	ArrayCount+=1
	Array%ArrayCount% := A_LoopFileName ; Make an array of all the available filenames
	}
}
filenum=0 ;因为我不喜欢随机功能，所以在函数中借用了一个变量，使用了+=，这样每按一次，就意味着使用下一张图片，而不是随机。
;在脚本中先定义函数为0，这样第一次就是从1开始了。需要随机功能的朋友请删除这个。
ChangeWP()
{
	global
	
	filenum+=1 ;需要随机功能的朋友请删除这个。并把下面一行取消注释
	;~ Random, filenum, 1, %ArrayCount% ;这里设定了随机数，如果从这里入手，应该是可以改成顺序显示的。traytip的语句全部被我禁用了。之后再改。
	filecalled := Array%filenum% ;利用随机数和伪数组，搞定下一张图片
	if (filenum=ArrayCount) ;因为是顺序换图，所以循环，就这样。需要随机功能的朋友请删除这部分。
	{
		filenum=0
	}
	
	
	TrayTip, Wallpaper Changer, Setting "%filecalled%" as your wallpaper,,1
	FileCopy, %WallPaperFolder%%filecalled%, %TempWallpaper%, 1 ; copy the file to a temp location
	FileCopyError = %ErrorLevel%
	If ErrorLevel = 1
	{
		MsgBox While copying %WallPaperFolder%%filecalled% to a temporary location at %TempWallpaper%, a FileCopy error occured, please contact the developer!
	}
	DllCall("SystemParametersInfo", UInt, 0x14, UInt, 0, Str, TempWallpaper, UInt, 2)
	RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, WallPaper, %WallPaperFolder%%filecalled%
	Sleep, 500 ; can't change the wallpaper too quickly in succession.
	return
}

;~ Traytip, Wallpaper Changer, Refreshing Wallpapers...,,1
RefreshWPs()
;~ TrayTip, Wallpaper Changer, Wallpaper list refreshed! (%ArrayCount% Found),,1
Menu, TRAY, Add
Menu, TRAY, Add, Refresh Wallpapers, RefreshWallpapers ; Manual refresh
Menu, TRAY, Add, Change Wallpaper, ChangeWallpaper ; Add a menu for it too
Menu, TRAY, Add
Menu, TRAY, Add, Reset Folder, RstFolder ; Add menu for resetting folder
Return ; Ends the auto-execute section

RefreshWallpapers: ; does the same job as the auto-execute
;~    Traytip, Wallpaper Changer, Refreshing Wallpapers...,,1
   RefreshWPs()
;~    TrayTip, Wallpaper Changer, Wallpaper list refreshed! (%ArrayCount% Found),,1
   Return

ChangeWallpaper:
	ChangeWP()
	Return

RstFolder:
	MsgBox, 52, Wallpaper Changer, Resetting folder settings requires program restart. You can choose new folder on next launch. Do you want to reset the settings and close the application now?
	IfMsgBox Yes
	{
		IniWrite, NOT_SET, %IniFile%, Settings, WPFolder ; Set the WPFolder as "NOT_SET" so next launch the user can choose a new folder.
		ExitApp
	}
	Else
	{
;~ 		TrayTip, Wallpaper Changer, Reset cancelled. Nothing done!,,1 ; Inform the user that we did nothing when "No" was clicked.
	}
	Return

!w::ChangeWP() ;热键手动切换壁纸
go:	;利用标签引用函数
	ChangeWP()
	return
!r::SetTimer,go,3000 ;定时，每3秒触发一次go标签，也就是每3秒换一张壁纸。这个随意了。
; Debug Stuff

!q::MsgBox IsAdmin: %A_IsAdmin% - My Documents: %A_MyDocuments%
!a::ListVars
!z::MsgBox Last Copy: "%WallPaperFolder%%filecalled%" to "%A_MyDocuments%\currentwallpaper.jpg"
f5::Reload