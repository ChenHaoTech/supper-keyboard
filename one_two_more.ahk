; ʾ�� #3: ����ȼ��ĵ���, ���κ����ΰ���. ����
; �����ȼ����������´����Ķ���
; ִ�в�ͬ�Ĳ�����
CapsLock::
if cap_num > 0 ; SetTimer �Ѿ�����, �������Ǽ�¼����.
{
    cap_num	+= 1
    return
}			
; ����, �����¿�ʼϵ���е��״ΰ���. �Ѵ�����Ϊ 1 ������
; ��ʱ����
cap_num = 1
SetTimer, KeyCap, 400 ; �� 400 �����ڵȴ�����ļ���.
return

KeyCap:
SetTimer, KeyCap, off
if cap_num = 1 ; �˼�������һ��.
{
    MsgBox You pressed and released the Capslock key.1
}
else if cap_num = 2 ; �˼�����������.
{
    MsgBox You pressed and released the Capslock key.2
}
else if cap_num > 2
{
    MsgBox, Three or more clicks detected.
}
; ���۴�����������ĸ�����, ���� count ��������
; Ϊ��һ��ϵ�еİ�����׼��:
cap_num = 0
return
