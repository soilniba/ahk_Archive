#include <MsgBoxConstants.au3>

; 点击 Esc 键中止脚本, 点击 Pause/Break 键暂停脚本

Global $gbPaused = False

HotKeySet("{F7}", "postf7")
HotKeySet("{F8}", "postf8")
HotKeySet("{F9}", "postf9")
HotKeySet("{F10}", "postf10")
HotKeySet("{F11}", "postf11") 
;HotKeySet("{ESC}", "Terminate")


While 1
    Sleep(100)
WEnd

Func postf7()
	Local $aPos = MouseGetPos()
	MouseClick("left", $aPos[0], $aPos[1]+25, 1, 3 )
EndFunc   ;==>TogglePause


Func postf8()
	Local $aPos = MouseGetPos()
	MouseClick("left", 1640, 936, 1, 3 )
	MouseMove($aPos[0], $aPos[1] , 0)
EndFunc   ;==>TogglePause

Func postf9()
	Local $aPos = MouseGetPos()
	;MouseClick("left", 1573, 939, 1, 3 )
	;MouseClick("left", 1636, 966, 1, 3 )
	MouseClick("left", 1519, 969, 2, 3 )
	MouseMove($aPos[0], $aPos[1] , 0)
EndFunc   ;==>TogglePause

Func postf10()
	Local $aPos = MouseGetPos()
	MouseClick("left", 153, 39, 1, 3 )
	Sleep(400)
	MouseClick("left", 153, 39, 1, 3 )
	MouseClick("left", $aPos[0], $aPos[1], 1, 2)
	;MouseMove($aPos[0], $aPos[1] , 0)
EndFunc   ;==>Terminate

Func postf11()
    MsgBox($MB_SYSTEMMODAL, "", "这是一条消息.")
EndFunc   ;==>ShowMessage

Func Terminate()
    Exit
EndFunc   ;==>Terminate


