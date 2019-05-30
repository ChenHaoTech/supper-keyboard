;=======|	qq tim	|============================================
#IfWinActive ahk_exe TIM.exe
tab:: click 443,796 

; 点击语音
!enter::click 554,626

; 聚焦搜索
!F::Click 205,52
; 点击抖动
!s::click 579,736
; TODO 失败的vedio s视频通话
!v::
Click 1002,113 
Sleep 1000
Click 1060,308
return
; 进入qq下载界面
^j:: run D:\download\QQfile

; 左右界面聚焦
<!-::MouseMove 139,397
<!=::MouseMove 698,418
; 进入手机
!p::
Click 205,52
send 手机
Sleep 100
send {enter}
return
; 宝宝聊天
!b::run,tencent://message/?uin=445494877
; TODO 点击 "more" (不好用)
!m::click 717,200
; 面板聊天激活
<^`:: click 151,122
<^1:: click 226,198
<^2:: click 187,296
<^3:: click 199,398
<^4:: click 148,480
<^5:: click 133,593
<^6:: click 151,665
<^7:: click 117,753
<^8:: click 110,855
; 激活表情包快捷键
`::
send ``
convertTypeWriter("E")
Sleep 2000
convertTypeWriter("C")
return
#if
;=======|	wechat	|============================================
Enter & \:: 
Send !^{w} 
IfWinActive, ahk_exe wechat.exe
	convertTypeWriter("C")
return
#IfWinActive ahk_exe WeChat.exe
!F::Click 313,54
<!-::MouseMove 308,326
<!=::MouseMove 666,319

<^1::click 366,145
<^2::click 333,255
<^3::click 273,313
<^4::click 263,456
<^5::click 237,544
<^6::click 236,636
<^7::click 222,730
#if
