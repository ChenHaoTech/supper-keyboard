#NoEnv
#SingleInstance force

;===================================space=====================================

;~ If ErrorLevel
;~ {
;~ ����KeyWait, CapsLock
;~ ����If (A_PriorKey == "CapsLock")
;~ ����{
;~ ��������SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
;~ ��������ToolTip, % "��д����: " . (GetKeyState("CapsLock", "T") ? "����" : "�ر�"), , , 13
;~ ��������SetTimer, RemoveToolTip, 1000
;~ ����}
;~ }
;~ Else
;~ {
;~ ����KeyWait, CapsLock
;~ ����MouseMode := !MouseMode
;~ ����ToolTip, % "�������ģʽ: " . (MouseMode ? "����" : "�ر�"), , , 13
;~ ����SetTimer, RemoveToolTip, 1000
;~ }
;~ Return

; �����ȼ����������´����Ķ���
; ִ�в�ͬ�Ĳ�����
;~ Space::
	;~ Send,{space}
	;~ if spa_num > 0 ; SetTimer �Ѿ�����, �������Ǽ�¼����.
	;~ {
		;~ spa_num	+= 1
		;~ return
	;~ }		
	;~ ; ����, �����¿�ʼϵ���е��״ΰ���. �Ѵ�����Ϊ 1 ������
	;~ ; ��ʱ����
	;~ spa_num = 1     
	;~ SetTimer, Spat, 150 ; �� 400 �����ڵȴ���f��ļ���.
	;~ return

;~ Spat:
;~ SetTimer, Spat, off
;~ if spa_num = 1 ; �˼�������һ��.
;~ {
    ;~ keywait,Space,T1
	;~ if ErrorLevel ; ����״̬,space,û��̧����
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
	;~ else{ ;�̰�״̬  
		;~ Send, {Space} 
		;~ }	  
;~ }
;~ else if spa_num = 2 ; �˼�����������.
;~ {
   ;~ Send,^{Space}
;~ }

; ���۴�����������ĸ�����, ���� count ��������
; Ϊ��һ��ϵ�еİ�����׼��:
;~ spa_num= 0
;~ return
SetCapsLockState, AlwaysOff ; set caplock key always off

$space::
	keywait,Space,T1
	if ErrorLevel ; ����״̬,space,û��̧����
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