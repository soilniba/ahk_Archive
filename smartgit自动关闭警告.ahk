; #NoTrayIcon
Loop
{
	IfWinExist, 非商业许可证
	{
		; GuiControl, Enable, Button2
		; GuiControl, Enable, Button3
		; GuiControl, Enable, Button1
		; ControlClick , Button2
		; ControlClick , Button3
		; ControlClick , Button1
		Control, Check, , Button2
		Control, Check, , Button3
		Control, Check, ,  Button1
		sleep,1000
	}
	IfWinExist, 您的订阅已过期
	{
		WinClose, 您的订阅已过期
		sleep,1000
	}
	sleep,100
}

