;=======|       |============================================
; gui 超链接
Gui, Add, Link,, This is a <a href="http://ahkscript.org">link</a>

;=======|   listView    |============================================
;==================================================================================
;==================================================================================
;
;       它显示一个多行多列组成的表格视图,
;
;==================================================================================
;==================================================================================
; 创建含名称和大小两列的 ListView:
Gui, Add, ListView, r20 w700 gMyListView, Name|Size (KB)

; 从文件夹中获取文件名列表并把它们放入 ListView:
Loop, %A_MyDocuments%\*.*
    LV_Add("", A_LoopFileName, A_LoopFileSizeKB)

LV_ModifyCol()  ; 根据内容自动调整每列的大小.
LV_ModifyCol(2, "Integer")  ; 为了进行排序, 指出列 2 是整数.

; 显示窗口并返回. 每当用户点击一行时脚本会发出通知.
Gui, Show
return

MyListView:
if A_GuiEvent = DoubleClick
{
    LV_GetText(RowText, A_EventInfo)  ; 从行的第一个字段中获取文本.
    ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"
}
return

GuiClose:  ; 表示当窗口关闭时脚本应自动退出.
ExitApp

Gui, Add, ComboBox, vColorChoice, Red|Green|Blue|Black|White

path "D:\Program Portable\extrachm_jb51\ExtraChm.exe

ahk_class Afx:01060000:8:00010003:00000000:46BE0F19
ahk_id 0x8f1ee6
pid 6332
ahk.chm - ExtraChm
F1::
WinHide, A
Sleep, 1000
WinShow
WinActivate
return