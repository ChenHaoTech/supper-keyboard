#SingleInstance force




; 示例 #3: 检测热键的单次, 两次和三次按下. 这样
; 允许热键根据您按下次数的多少
; 执行不同的操作：
CapsLock::
if winc_presses > 0 ; SetTimer 已经启动, 所以我们记录键击.
{
    winc_presses += 1
    return
}			
; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
; 计时器：
winc_presses = 1
SetTimer, KeyWinC, 400 ; 在 400 毫秒内等待更多的键击.
return

KeyWinC:
SetTimer, KeyWinC, off
if winc_presses = 1 ; 此键按下了一次.
{
    MsgBox You pressed and released the Capslock key.1
}
else if winc_presses = 2 ; 此键按下了两次.
{
    MsgBox You pressed and released the Capslock key.2
}
else if winc_presses > 2
{
    MsgBox, Three or more clicks detected.
}
; 不论触发了上面的哪个动作, 都对 count 进行重置
; 为下一个系列的按下做准备:
winc_presses = 0
return