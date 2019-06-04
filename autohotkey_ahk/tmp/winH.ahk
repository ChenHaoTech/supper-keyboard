#Warn ;提升警告描述
#NoEnv ;不会默认使用系统的环境变量
#Persistent ;脚本自动执行
#NoTrayIcon ;不显示托盘图标
;单例模式
#SingleInstance, force 
;此处开始写初始化语句:

return



;此处win+esc实现reload
#F1::reload



#F2::

return



#Esc::
msgbox, exit
return