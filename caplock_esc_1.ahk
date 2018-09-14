;如果只按一下 , 发送esc键
;如果长按, 暂停该脚本, 使用pause语句 用if判断
; 参考http://tieba.baidu.com/p/5124622942
; 按键前的修饰符 学习
;参考 KeyWait, w, T1


#SingleInstance force

~CapsLock::
	KeyWait , CapsLock,,t0.5
	
	SetStoreCapslockMode,off
	Send ,{Esc}
	SetStoreCapslockMode,Off
	return
	
