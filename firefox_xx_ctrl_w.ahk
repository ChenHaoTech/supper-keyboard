#SingleInstance force




; ʾ�� #3: ����ȼ��ĵ���, ���κ����ΰ���. ����
; �����ȼ����������´����Ķ���
; ִ�в�ͬ�Ĳ�����
CapsLock::
if winc_presses > 0 ; SetTimer �Ѿ�����, �������Ǽ�¼����.
{
    winc_presses += 1
    return
}			
; ����, �����¿�ʼϵ���е��״ΰ���. �Ѵ�����Ϊ 1 ������
; ��ʱ����
winc_presses = 1
SetTimer, KeyWinC, 400 ; �� 400 �����ڵȴ�����ļ���.
return

KeyWinC:
SetTimer, KeyWinC, off
if winc_presses = 1 ; �˼�������һ��.
{
    MsgBox You pressed and released the Capslock key.1
}
else if winc_presses = 2 ; �˼�����������.
{
    MsgBox You pressed and released the Capslock key.2
}
else if winc_presses > 2
{
    MsgBox, Three or more clicks detected.
}
; ���۴�����������ĸ�����, ���� count ��������
; Ϊ��һ��ϵ�еİ�����׼��:
winc_presses = 0
return