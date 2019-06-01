; 将win键映射为ctrl
; Lwin::Send, {ctrl}
; Lwin & 1::hwin("1")
; Lwin & ::hwin("")


hwin(key){
    Send, #{%key%}
}