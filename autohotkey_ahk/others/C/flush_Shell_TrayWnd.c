#include "stdafx.h"
#include <Windows.h>
#include "tlhelp32.h"
 
//刷新任务栏图标
void RefreshTaskbarIcon()
{
	//任务栏窗口
	HWND hShellTrayWnd = ::FindWindow("Shell_TrayWnd",NULL);
	//任务栏右边托盘图标+时间区
	HWND hTrayNotifyWnd = ::FindWindowEx(hShellTrayWnd,0,"TrayNotifyWnd",NULL);
	//不同系统可能有可能没有这层
	HWND hSysPager = ::FindWindowEx(hTrayNotifyWnd,0,"SysPager",NULL);
	//托盘图标窗口
	HWND hToolbarWindow32;
	if (hSysPager)
	{
		hToolbarWindow32 = ::FindWindowEx(hSysPager,0,"ToolbarWindow32",NULL);
	}
	else
	{
		hToolbarWindow32 = ::FindWindowEx(hTrayNotifyWnd,0,"ToolbarWindow32",NULL);
	}
	if (hToolbarWindow32)
	{
		RECT r;
		::GetWindowRect(hToolbarWindow32,&r);
		int width = r.right - r.left;
		int height = r.bottom - r.top;
		//从任务栏中间从左到右 MOUSEMOVE一遍，所有图标状态会被更新
		for (int x = 1; x<width; x++)
		{
			::SendMessage(hToolbarWindow32,WM_MOUSEMOVE,0,MAKELPARAM(x,height/2));
		}
	}
}
 

 
int main(int argc, char* argv[])
{
	//关闭QQ
	// CloseQQ();
	//刷新任务栏图标
	RefreshTaskbarIcon();
	return 0;
}