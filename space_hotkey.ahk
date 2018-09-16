#NoEnv
#SingleInstance force

;===================================space=====================================

;~ If ErrorLevel
;~ {
;~ 　　KeyWait, CapsLock
;~ 　　If (A_PriorKey == "CapsLock")
;~ 　　{
;~ 　　　　SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
;~ 　　　　ToolTip, % "大写锁定: " . (GetKeyState("CapsLock", "T") ? "开启" : "关闭"), , , 13
;~ 　　　　SetTimer, RemoveToolTip, 1000
;~ 　　}
;~ }
;~ Else
;~ {
;~ 　　KeyWait, CapsLock
;~ 　　MouseMode := !MouseMode
;~ 　　ToolTip, % "键盘鼠标模式: " . (MouseMode ? "开启" : "关闭"), , , 13
;~ 　　SetTimer, RemoveToolTip, 1000
;~ }
;~ Return

; 允许热键根据您按下次数的多少
; 执行不同的操作：
;~ Space::
	;~ Send,{space}
	;~ if spa_num > 0 ; SetTimer 已经启动, 所以我们记录键击.
	;~ {
		;~ spa_num	+= 1
		;~ return
	;~ }		
	;~ ; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
	;~ ; 计时器：
	;~ spa_num = 1     
	;~ SetTimer, Spat, 150 ; 在 400 毫秒内等待更f多的键击.
	;~ return

;~ Spat:
;~ SetTimer, Spat, off
;~ if spa_num = 1 ; 此键按下了一次.
;~ {
    ;~ keywait,Space,T1
	;~ if ErrorLevel ; 长按状态,space,没有抬起来
	;~ {
		;~ KeyWait, space
		;~ if(A_PriorKey== "space"){
			;~ Space & c::
				;~ Send ,^{c}
				;~ return
				
			;~ Space & v::
				;~ Send ,^{v}
				;~ return
				 
			;~ Space & w::
				;~ Send, ^{w}
				;~ return
			;~ Space & l::
				;~ Send,  ^{l}
				;~ return

			;~ Space & s::   
				;~ Send, ^{s}
				;~ return

			;~ Space & e::
				;~ Send, ^{e}
				;~ return         
			;~ Space & z::
				;~ Send, ^{z}
				;~ return 
			;~ Space & y::
				;~ Send , ^y
				;~ return
			;~ Space & tab::
				;~ Send , ^{tab}
				;~ return
			;~ Space & t::
				;~ Send, ^+{t}
				;~ return
		;~ }
	;~ }
	;~ else{ ;短按状态  
		;~ Send, {Space} 
		;~ }	  
;~ }
;~ else if spa_num = 2 ; 此键按下了两次.
;~ {
   ;~ Send,^{Space}
;~ }

; 不论触发了上面的哪个动作, 都对 count 进行重置
; 为下一个系列的按下做准备:
;~ spa_num= 0
;~ return
SetCapsLockState, AlwaysOff ; set caplock key always off

$space::
	keywait,Space,T1
	if ErrorLevel ; 长按状态,space,没有抬起来
	{
		KeyWait, space
		if(A_PriorKey== "space"){
			Space & c::
				Send ,^{c}
				return
				
			Space & v::
				Send ,^{v}
				return
			
			
			Space & w::
				Send, ^{w}
				return
			Space & l::
				Send,  ^{l}
				return

			Space & s::   
				Send, ^{s}
				return
			Space & e::
				Send, ^{e}
				return         
			Space & z::
				Send, ^{z}
				return 
			Space & y::
				Send , ^y
				return
			Space & tab::
				Send , ^{tab}
				return
			Space & t::
				Send, ^+{t}
				return
			Space & a::
				Send, ^{a}
				return
			Space & 1::
				Send , ^{1}
				return
			Space & 2::
				Send , ^{2}
				return
			Space & 3::
				Send , ^{3}
				return
			Space & 4::
				Send , ^{4}
				return
			Space & 5::
				Send , ^{5}
				return
			Space & 6::
				Send , ^{6}
				return
			Space & 7::
				Send , ^{7}
				return
			Space & 8::
				Send , ^{8}
				return
		}
	}else{
		CapsLock & Space::
			Send,^{Space}
			return
		! & Space::
			Send,!+^{F9}
			return
		Send,{space}
	}