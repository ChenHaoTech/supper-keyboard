#SingleInstance force
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 脚本名称：Tab++框架
; 脚本版本号 v1.01
; AHK版本：	1.1.30
; 语言：中文
; 作者：心如止水<QQ:2531574300>   <Autohotkey高手群（348016704)>
; 脚本功能：	可让Tab作为修饰键，但是其它的功能都不受影响，实现各种功能(当然也可以改造为CapsLock++框架，让CapsLock做修饰键，我还没尝试，不过应该是同理)
; ^_^： 如果您有什么新的想法,或者有什么改进意见,欢迎加我的QQ,一起探讨改进 ：^_^
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;# 系统热键白名单
#inputlevel,3
;## 在这个层级是不覆盖系统默认键的,可以设置系统默认键的白名单
;~的意思是不覆盖系统本身的快捷键
~!Tab::	
~#Tab::
#inputlevel

#inputlevel,2			
;$的意思是使用钩子,防止自己被触发
$Tab::F20	
#inputlevel

;# 在这一层级可以用Tab做修饰键
#inputlevel,0

;## 开放单击(根据需求自己考虑开不开)
F20::	
send,{Tab}
return

;====================================================| number convert special charactor|====================================================
tab & u::
	send,{1}
	return
tab & i::
	send,{2}
	return
tab & o::
	send,{3}
	return
tab & j::
	send,{4}
	return
tab & k::
	send,{5}
	return
tab & l::
	send,{6}		Joi
	return
tab & n::
	send,{7}
	return
tab & m::
	send,{8}
	return
tab & ,::
	send,{9}
	return
tab & Space::
	send,{0}
	return

;## 这就是真正的作为修饰键的地方,可以搭配各种功能，实现很好的效果。

#inputlevel
