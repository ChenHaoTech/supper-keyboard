/*
ԭ���ߵĽű���ַ��ʹ�÷������� https://faxian.appinn.com/747
������ű��Ľ��Ը����ߣ�������Ҫ��ԭ����˵���ĵ��ſ��Զ�

ԭ������Ϣ����
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AHK�汾��		1.1.23.01
; ���ԣ�		����
; ���ߣ�		lspcieee <lspcieee@gmail.com>
; ��վ��		http://www.lspcieee.com/
; �ű����ܣ�	�Զ��л����뷨
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;--------------------------------------------------------------------------------------------------------------- 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; �ű����ƣ�IME2
; �ű��汾�� v0.3
; AHK�汾��		1.1.30
; ���ԣ�		����
; �ı��ߣ�		����ֹˮ  <Autohotkey����Ⱥ��348016704��>
; �ű����ܣ�	�Զ��л����뷨
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ��ԭ����һ���ĵط�
1,���õ���ϵͳ�������뷨��ݼ��ķ����л�
	Sleep 120
	send +^7
	Sleep 120
	send +^8
	Sleep 100
	
	;~ send +^7 ���л��ҵ������뷨֮���"���"���뷨 �л�����������Ҫ��"���������뷨"û����������
	;send +^8 ���ҵ������뷨��ݼ�(���õ����ѹ�)
	
2,�Ҽ�����һ���ձ����ߵ����뷨״̬������,������(v0.3)
	
;--------------------------------------------------------------------------------------------------------------- 

*/

#SingleInstance force
SetTitleMatchMode RegEx


;�����ĳ�ձ��˽ű��еĻ�ȡ���뷨״̬������,�����˲���Ҫ���л�,�л���������
IME_GET(WinTitle="")
;-----------------------------------------------------------
; IME��״�B��ȡ��
;    ���� AHK v1.0.34�Խ�
;   WinTitle : ����Window (ʡ�ԕr:�����ƥ��֥�����ɥ�)
;   ���ꂎ  1:ON 0:OFF
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



;=====��������
;�¿�����ʱ���л����������뷨�ķ���
GroupAdd,cn,ahk_class TXGuiFoundation  ;QQ
GroupAdd,cn,ahk_class HwndWrapper


;�¿�����ʱ���л���Ӣ�����뷨�ķ���
;~ GroupAdd,en,ahk_exe devenv.exe  ;Visual Studio



;�����л�ʱ���л����������뷨
GroupAdd,cn32772,ahk_class TXGuiFoundation  ;QQ
GroupAdd,cn32772,ahk_class HwndWrapper
GroupAdd,cn32772, - �δ��嵥 

;�����л�ʱ���л���Ӣ�����뷨
;~ GroupAdd,en32772,ahk_class Listary_WidgetWin_0

;�༭������
;~ GroupAdd,editor,ahk_exe devenv.exe  ;Visual Studio
;~ GroupAdd,editor,ahk_exe notepad.exe ;���±�
;~ GroupAdd,editor,ahk_class Notepad++
GroupAdd,editor,ahk_exe idea64.exe
;~ GroupAdd,editor,ahk_class idea.exe




;����
;�Ӽ��������뵽����
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
   TrayTip,AHK, ���л����������뷨
	;�����������뷨�л���ݼ��������ʵ��������á�
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
	TrayTip,AHK, ���л���Ӣ�����뷨
	Sleep 120
	send +^7
	Sleep 120
	send +^8
	Sleep 100
	send {Shift}
	return
	
}



;�����Ϣ�ص�ShellMessage�����Զ��������뷨
Gui +LastFound
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage")

ShellMessage( wParam,lParam ) {

;1 �������屻���� 
;2 �������弴�����ر� 
;3 SHELL �������彫������ 
;4 �������屻���� 
;5 �������屻��󻯻���С�� 
;6 Windows ��������ˢ�£�Ҳ�������ɱ�����
;7 �����б�����ݱ�ѡ�� 
;8 ��Ӣ���л������뷨�л� 
;9 ��ʾϵͳ�˵� 
;10 �������屻ǿ�ƹر� 
;11 
;12 û�б��������APPCOMMAND����WM_APPCOMMAND 
;13 wParam=���滻�Ķ������ڵ�hWnd 
;14 wParam=�滻�������ڵĴ���hWnd 
;&H8000& ���� 
;53 ȫ��
;54 �˳�ȫ��
;32772 �����л�
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
			;~ TrayTip,AHK, ���Զ��л����������뷨
			return
		}
		IfWinActive,ahk_group en
		{
			setEnglishLayout()
			;~ TrayTip,AHK, ���Զ��л���Ӣ�����뷨
			return
		}
	}
	If ( wParam = 32772 )
	{
		IfWinActive,ahk_group cn32772
		{
			setChineseLayout()
			;TrayTip,AHK, ���Զ��л����������뷨
			return
		}
		IfWinActive,ahk_group en32772
		{
			setEnglishLayout()
			;TrayTip,AHK, ���Զ��л���Ӣ�����뷨
			return
		}
	}
}

;�����б༭�����Զ��л���Ӣ�����뷨
#IfWinActive,ahk_group editor
:*:// ::
	;//�ӿո� ʱ �л����������뷨
	setEnglishLayout()
	sendbyclip("//")
	setChineseLayout()
return

/*

:Z*:///::
	;///ע��ʱ �л����������뷨��Ҳ��������///�ӿո�
	setEnglishLayout()
	sendbyclip("//")
	SendInput /
	setChineseLayout()
return

*/

:*:" ::
	;���żӿո� ʱ �л����������뷨
	setEnglishLayout()
	SendInput "
	setChineseLayout()
return
:*:`;`n::
	;�ֺżӻس� ʱ �л���Ӣ�����뷨
	setEnglishLayout()
	sendbyclip(";")
	SendInput `n
return
:Z?*:`;`;::
	;�����ֺ�ʱ �л���Ӣ�����뷨
	setEnglishLayout()
return
:Z?*:  ::
	;���������ո� �л����������뷨
	setEnglishLayout()
	setChineseLayout()
return

#IfWinActive