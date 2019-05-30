#include Lib\utility.ahk
; ;=======|	winActiveHide	|============================================
; hWinActiveHide(ways,programPath,hideMode:=True)
; {
; 	; 窗口存在
; 	IfWinExist, %ways% 
; 	{
; 		; 窗口已激活
; 		IfWinActive, %ways% 
; 			{
; 				Send !{ESC}
; 				if (hideMode == 0)
; 					WinMinimize
; 				else
; 					WinHide, %ways%
; 			}
; 		; 窗口未激活
; 		else 
; 		{
; 			if(hideMode == False)
; 				WinMaximize
; 			else
; 				WinShow, %ways% 
; 			WinActivate, %ways%
; 		}
; 	}
; 	; 窗口不存在
; 	else{
; 		WinShow %ways% 
; 		WinActivate, %ways%
; 		IfWinNotActive, %ways% 
; 		{
; 			hToolTip("wait a moment",2000)
; 			run %programPath%
; 			WinActivate %ways%
; 		}
; 	}
; }