/*
原作者的脚本网址和使用方法介绍 https://faxian.appinn.com/747
我这个脚本改进自该作者，所以先要看原来的说明文档才可以懂

原作者信息如下
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AHK版本：		1.1.23.01
; 语言：		中文
; 作者：		lspcieee <lspcieee@gmail.com>
; 网站：		http://www.lspcieee.com/
; 脚本功能：	自动切换输入法
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;--------------------------------------------------------------------------------------------------------------- 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 脚本名称：IME2
; 脚本版本号 v0.3
; AHK版本：		1.1.30
; 语言：		中文
; 改编者：		心如止水  <Autohotkey高手群（348016704）>
; 脚本功能：	自动切换输入法
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 和原作不一样的地方
1,我用的是系统设置输入法快捷键的方法切换
	Sleep 120
	send +^7
	Sleep 120
	send +^8
	Sleep 100
	
	;~ send +^7 是切换我的主输入法之外的"五笔"输入法 切换它的作用主要是"重置主输入法"没有其他作用
	;send +^8 是我的主输入法快捷键(我用的是搜狗)
	
2,我加入了一个日本作者的输入法状态检测程序,更智能(v0.3)
	
;--------------------------------------------------------------------------------------------------------------- 

*/

#SingleInstance force
SetTitleMatchMode RegEx


;借鉴了某日本人脚本中的获取输入法状态的内容,减少了不必要的切换,切换更流畅了
IME_GET(WinTitle="")
;-----------------------------------------------------------
; IMEの状態の取得
;    対象： AHK v1.0.34以降
;   WinTitle : 対象Window (省略時:アクティブウィンドウ)
;   戻り値  1:ON 0:OFF
;-----------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_GETOPENSTATUS
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x005,0,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}



;=====分组配置
;新开窗口时，切换到中文输入法的分组
GroupAdd,cn,ahk_class TXGuiFoundation  ;QQ
GroupAdd,cn,ahk_class HwndWrapper


;新开窗口时，切换到英文输入法的分组
;~ GroupAdd,en,ahk_exe devenv.exe  ;Visual Studio



;窗口切换时，切换到中文输入法
GroupAdd,cn32772,ahk_class TXGuiFoundation  ;QQ
GroupAdd,cn32772,ahk_class HwndWrapper
GroupAdd,cn32772, - 滴答清单 

;窗口切换时，切换到英文输入法
;~ GroupAdd,en32772,ahk_class Listary_WidgetWin_0

;编辑器分组
;~ GroupAdd,editor,ahk_exe devenv.exe  ;Visual Studio
;~ GroupAdd,editor,ahk_exe notepad.exe ;记事本
;~ GroupAdd,editor,ahk_class Notepad++
GroupAdd,editor,ahk_exe idea64.exe
;~ GroupAdd,editor,ahk_class idea.exe




;函数
;从剪贴板输入到界面
sendbyclip(var_string)
{
    ClipboardOld = %ClipboardAll%
    Clipboard =%var_string%
	ClipWait
    send ^v
    sleep 99
    Clipboard = %ClipboardOld%  ; Restore previous contents of clipboard.
}


setChineseLayout(){
	If (IME_GET()=1){
	return
	}
	;~ MsgBox,5
   TrayTip,AHK, 已切换到中文输入法
	;发送中文输入法切换快捷键，请根据实际情况设置。
	Sleep 148
	send {Shift Down}{Ctrl Down}7
	send {Shift Up} {Ctrl Up}
		Sleep 123
	send {Shift Down}^8
	send {Shift Up}
	return

}


setEnglishLayout(){
	If (IME_GET()=2){
	return
	}
	;~ MsgBox,5
	TrayTip,AHK, 已切换到英文输入法
	Sleep 120
	send +^7
	Sleep 120
	send +^8
	Sleep 100
	send {Shift}
	return
	
}



;监控消息回调ShellMessage，并自动设置输入法
Gui +LastFound
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage")

ShellMessage( wParam,lParam ) {

;1 顶级窗体被创建 
;2 顶级窗体即将被关闭 
;3 SHELL 的主窗体将被激活 
;4 顶级窗体被激活 
;5 顶级窗体被最大化或最小化 
;6 Windows 任务栏被刷新，也可以理解成标题变更
;7 任务列表的内容被选中 
;8 中英文切换或输入法切换 
;9 显示系统菜单 
;10 顶级窗体被强制关闭 
;11 
;12 没有被程序处理的APPCOMMAND。见WM_APPCOMMAND 
;13 wParam=被替换的顶级窗口的hWnd 
;14 wParam=替换顶级窗口的窗口hWnd 
;&H8000& 掩码 
;53 全屏
;54 退出全屏
;32772 窗口切换
	If ( wParam = 1 )
	{
		;WinGetclass, WinClass, ahk_id %lParam%
		;MsgBox,%Winclass%
		Sleep, 1000
		;WinActivate,ahk_class %Winclass%
		;WinGetActiveTitle, Title
		;MsgBox, The active window is "%Title%".
		IfWinActive,ahk_group cn
		{
			setChineseLayout()
			;~ TrayTip,AHK, 已自动切换到中文输入法
			return
		}
		IfWinActive,ahk_group en
		{
			setEnglishLayout()
			;~ TrayTip,AHK, 已自动切换到英文输入法
			return
		}
	}
	If ( wParam = 32772 )
	{
		IfWinActive,ahk_group cn32772
		{
			setChineseLayout()
			;TrayTip,AHK, 已自动切换到中文输入法
			return
		}
		IfWinActive,ahk_group en32772
		{
			setEnglishLayout()
			;TrayTip,AHK, 已自动切换到英文输入法
			return
		}
	}
}

;在所有编辑器中自动切换中英文输入法
#IfWinActive,ahk_group editor
:*:// ::
	;//加空格 时 切换到中文输入法
	setEnglishLayout()
	sendbyclip("//")
	setChineseLayout()
return

/*

:Z*:///::
	;///注释时 切换到中文输入法（也可以输入///加空格）
	setEnglishLayout()
	sendbyclip("//")
	SendInput /
	setChineseLayout()
return

*/

:*:" ::
	;引号加空格 时 切换到中文输入法
	setEnglishLayout()
	SendInput "
	setChineseLayout()
return
:*:`;`n::
	;分号加回车 时 切换的英文输入法
	setEnglishLayout()
	sendbyclip(";")
	SendInput `n
return
:Z?*:`;`;::
	;两个分号时 切换的英文输入法
	setEnglishLayout()
return
:Z?*:  ::
	;输入两个空格 切换的中文输入法
	setEnglishLayout()
	setChineseLayout()
return

#IfWinActive