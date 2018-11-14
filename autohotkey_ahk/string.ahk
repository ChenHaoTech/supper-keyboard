;============================================================hot string convert===========================================================
:*?:%::%%{left}
:*?:''::''{left}
:*?:$::$${left}
:*?:<::<>{left}

:*?:h1::{#}{space}	
:*?:h2::{#}{#}{space}	
:*?:h3::{#}{#}{#}{space}	
:*?:h4::{#}{#}{#}{#}{space}
:*?:h5::{#}{#}{#}{#}{#}{space}
:*?:=com::==================================| |========================================{Left 42}
:*?:=2com::================================== ========================================{Left 42}{Enter}
:*?:3``::````````````{left 3}{enter}{up}{end}
:*?:yx::2630601704@qq.com
:*?:bam::beaman23333
:*?:dys::doyourself23333

;~ *j::
;~ Send ,{j}
;~ return
;~ f & j:: Send {bs}`,
;~ f & k:: Send, {bs}.
;~ f & l:: Send, {bs}/
#if GetKeyState("j","p")
:C*?:h::{BS}/
:C*?:k::{BS},
:C*?:l::{BS}.
:C*?:H::{BS}?
:C*?:K::{BS}<
:C*?:L::{BS}>
#if


; $*tab::
;     normal_key("tab")
;     return
; tab & =::
;     send,{+}
;     return
; tab & u::
;     send,1
;     return
; tab & i::
;     send,2
;     return
; tab & o::
;     send,3
;     return
; tab & j::
;     send,4
;     return
; tab & k::
;     send,5
;     return
; tab & l::
;     send,6
;     return
; tab & n::
;     send,7
;     return
; tab & m::
;     send,8
;     return
; tab & ,::
;     send,9
;     return
; tab & space::
;     send,0
;     return

