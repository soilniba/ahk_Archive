;msgbox, 编辑器自动按键宏
;设置两次控件操作类命令之间的延时
; naiping0703@sina.com
; 196913

Delay = 50
;设置操作间隔时间（Sleep）

SetKeyDelay, Delay
;设置按键时间间隔

CoordMode, Mouse, Relative
;设置鼠标点击坐标为窗口内坐标

SetTitleMatchMode, Slow
;设置WinTitle的匹配模式 Fast|Slow

szTianDaoLink = %A_Desktop%\天涯明月刀.lnk
;循环检测关闭outlook警告窗口
Loop
{
	;IfWinExist,WARNING
	;{
	;	WinClose,WARNING
	;}
	;IfWinExist,ERROR
	;{
	;	WinClose,ERROR
	;}
	;IfWinExist,ahk_exe AurCrashSender.exe
	; 	WinClose
	; 	send,{Enter}
	; IfWinExist,ahk_exe WerFault.exe
	; {
	; 	WinActivate
	; 	;WinClose
	; 	Send,{up}{enter}
	; }
	IfWinExist, Aurogon_tabManagerTools
	{
		WinActivate
		ControlClick , Button1
	}
	IfWinExist, 保存提示
	{
		WinActivate
		ControlClick , Button1
	}
	IfWinExist, ahk_class NUIDialog
	{
		send, !n
	}
	IfWinExist, 查找和替换
	{
		ControlSetText, EDTBX1, overwrite_action_walk_f
		Send, {esc}
	}
	IfWinExist,ahk_exe EXCEL.EXE,Unicode 文本
	{
		sleep,500
		send,!y
	}
	;IfWinExist,ahk_exe WerFault.exe,取消
	;{
	;	send,{esc}
	;}
	;scene_editor定时保存
	;if Mod(A_Index,(60*1000/100))==0
	;{
	;	IfWinActive,SceneEditor
	;	{
	;		send,^s
	;		MsgBox, 0, "ok", "ok", 2
	;	}
	;}
	IfExist, %szTianDaoLink%
	{
		FileSetAttrib, -R, %szTianDaoLink%
		FileRecycle, %szTianDaoLink%
	}
	sleep,100
}


!x::
IfWinActive, ahk_exe Mattermost.exe
{
	WinMinimize, ahk_exe Mattermost.exe
} Else {
	WinActivate, ahk_exe Mattermost.exe	
}
Return

;批量替换
#IfWinActive, ahk_class PX_WINDOW_CLASS
F8::
	DelayTimeMS = 3000

	Send, {esc}^+f
	Clipboard = \b(skill|buff|dummy|passive|effect|projectile)(_*)(skill|)(_*)(templ|tpl|temp)(\[、\]|\.(\w+))
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = \1\2\3\4\5[\U\1_TPL_\U\7\U\8]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = \b(Get(skill|buff|dummy|passive|effect|projectile)(skill|)Templ\(\w+\))(\[['"](\w+)['"]\]|\.(\w+))
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = \1[\U\2_TPL_\U\5\U\6]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = \b(Set|Get)(skill|buff|dummy|passive|effect|projectile)(skill|)Data\(['"](\w+)['"]
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = \1\2\3Data(\U\2_TPL_\U\4
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = \b(Get(skill|buff|dummy|passive|effect|projectile)(skill|)Templ\((\d+,\s*|\w+,\s*|)\w+\))(\[['"](\w+)['"]\]|\.(\w+))
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = \1[\U\2_TPL_\U\6\U\7]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	; Clipboard = -- AddPropScope改模板
	Send, {enter}{esc}^+f
	Clipboard = PROP_COMBAT_TEMPLS_(skill|buff|dummy|passive|effect|projectile)(_*)(skill|)(\s*,[^,]+,\s*)['"](\w+)['"]
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = PROP_COMBAT_TEMPLS_\1\2\3\4\U\1_TPL_\U\5
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	; Clipboard = 不替换BillBoardCell
	Send, {enter}{esc}^+f
	Clipboard = \b((t|)(skill|buff|dummy|passive|effect|projectile)(skill|)(Template|templ|tpl|temp))(\[['"](\w+)['"]\]|\.(\w+))
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = \1[\U\3_TPL_\U\7\U\8]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = compute_result\.(\w+)
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = compute_result[COMPUTE_RESULT_\U\1]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = \btScope\.([a-z]\w+)
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = tScope[COMPUTE_RESULT_\U\1]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = \btComputeResult\.([a-z]\w+)
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = tComputeResult[COMPUTE_RESULT_\U\1]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = \brs\.([a-z]\w+)
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = rs[COMPUTE_RESULT_\U\1]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = \btHitResults(\[.+\])\.(\w+)
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = tHitResults\1[COMPUTE_RESULT_\U\2]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = \btHitResult\.([a-z]\w+)
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = tHitResult[COMPUTE_RESULT_\U\1]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

	Send, {enter}{esc}^+f
	Clipboard = \btEV\.([a-z]\w+)
	Send, ^a^v
	Send, {tab}{tab}
	Clipboard = tEV[COMPUTE_RESULT_\U\1]
	Send, ^a^v
	Send, ^!{enter}
	Sleep, DelayTimeMS

return

; ;大师兄复制技能
; F1::
; 	Send, {down}^c
; 	WinActivate, ahk_exe dopus.exe
; 	ControlFocus, dopus.searchctl1, ahk_exe dopus.exe
; 	Send, ^v{Enter}
; 	Sleep, 500
; 	ControlFocus, dopus.filedisplay10, ahk_exe dopus.exe
; 	Send, {Down}^c
; 	; Sleep, 500
; 	Send, {Backspace}^v
; Return

; ;大师兄复制技能
; F2::
; 	Send, +{Home}^c
; 	Sleep, 500
; 	send, {Enter}
; 	WinActivate, ahk_exe emeditor.exe
; 	Sleep, 500
; 	Send, ^v
; Return

; auto_click = 0
; ;————————————————————————————————————————————
; ;auto_click
; F10::
; 	auto_click = 0
; Return

; ;后台点击
; F8::
; 	if auto_click != 1
; 	{
; 		auto_click = 1
; 		MouseGetPos, xposSave, yposSave, ClickWindowId, VarControl
; 		while auto_click=1 {
; 			{
; 				ControlClick, %VarControl%, ahk_id %ClickWindowId%,,,,NA Xn:%xposSave% Yn:%yposSave%
; 				;sleep 100
; 			}
; 		}
; 	}
; Return

; ;前台点击
; F9::
; 	if auto_click != 1
; 	{
; 		auto_click = 1
; 		MouseGetPos, xpos, ypos, ClickWindowId, VarControl
; 		click,xpos,ypos
; 		;msgbox %ClickWindowId%
; 		while auto_click=1 {
; 			IfWinActive ,ahk_id %ClickWindowId%	;如果初始点击的窗口未处于激活状态，则不点击
; 			{
; 				MouseGetPos, xpos, ypos, VarWin, VarControl
; 				click,xpos,ypos
; 				sleep 100
; 			}
; 		}
; 	}
; Return

;截图快捷键
; ^!a::
	; Run, SnippingTool
	; WinWait, ahk_exe SnippingTool.exe
	; Send, ^{PrintScreen}{Ctrl Up}
; Return

; ;资源管理器
; ;#e::
; ;	IfWinExist,tools,D:\SoftLink\tools
; ;	{
; ;		WinActivate
; ;	}
; ;	Else
; ;	{
; ;		run, explorer D:\SoftLink\tools
; ;		WinWait,	tools
; ;		WinActivate, tools
; ;	}
; ;Return

; ;————————————————————————————————————————————
; ;skill_editor

;  ;测试技能-复制技能id
; #IfWinActive , SKILL(
; F1::
; 	MouseGetPos, xpos, ypos, VarWin, VarControlw
; 	;ControlClick, x580 y520, skill_editor.exe,,,1
; 	;ControlClick, x1400 y100, skill_editor.exe,,,3
; 	;WinActivate ,skill_editor.exe
; 	click,1570,140,3
; 	clipboard =
; 	Send,^a^c
; 	ClipWait
; 	Clipboard = combat a %Clipboard%
; 	WinActivate ,ahk_class VVideoClass
; 	;click,747,363,2
; 	;click,786,551,2
; 	;click,877,489,2
; 	click,808,475,2
; 	;Send,``
; 	;Send,^v{enter}``
; 	;WinActivate ,skill_editor.exe
; 	;WinActivate ,ahk_id %VarWin%
; 	;MouseMove, xpos, ypos
; return

; ;测试技能-目标释放技能
; #IfWinActive , skill_editor.exe
; F2::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	ControlClick, x580 y520, skill_editor.exe,,,1
; 	ControlClick, x1400 y100, skill_editor.exe,,,3
; 	WinActivate ,skill_editor.exe
; 	clipboard =
; 	Send,^a^c
; 	ClipWait
; 	Clipboard = gm script id:[t] atk %Clipboard% [s]
; 	WinActivate ,ahk_class VVideoClass
; 	Send,``^v{enter}``
; 	;WinActivate ,skill_editor.exe
; 	WinActivate ,ahk_id %VarWin%
; 	MouseMove, xpos, ypos
; return

; ;复制skill脚本到effect脚本中
; #IfWinActive , skill_editor.exe
; F3::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	click,702,318
; 	;clipboard =
; 	send,^a^c
; 	;ClipWait
; 	click,600,425
; 	send,{tab}{tab}{tab}{tab}{tab}{tab}{space}
; 	WinWaitActive,效果编辑
; 	click,75,241
; 	click,81,374
; 	send,^a^v
; 	click,81,715
; 	ClipSaved := ClipboardAll
; 	clipboard = and effect.self_id == 1
; 	send,^v{Space}!f
; 	Clipboard := ClipSaved
; 	ClipSaved =


; 	;WinActivate ,ahk_id %VarWin%
; 	;MouseMove, xpos, ypos
; return

; ;技能效果调整-编辑保存
; #IfWinActive ,SKILL(
; ^s::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	WinActivate ,skill_editor.exe
; 	Click, 169, 59
; 	WinActivate ,ahk_id %VarWin%
; 	MouseMove, xpos, ypos
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return

; ;技能效果调整-点上一项
; #IfWinActive ,SKILL(
; Up::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	MouseMove, xpos, ypos-20
; 	Click, xpos, ypos-20
; return

; ;技能效果调整-点下一项
; #IfWinActive ,SKILL(
; Down::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	MouseMove, xpos, ypos+20
; 	Click, xpos, ypos+20
; return













; ;————————————————————————————————————————————
; ;效果编辑


; ;技能效果调整-删除行
; #IfWinActive ,效果编辑
; F12::
; 	send,{home}{home}+{end}{bs}{bs}
; return

; ;技能效果调整-替换替换
; #IfWinActive ,效果编辑
; ^r::
; 	send,!r
; return

; ;效果编辑器-保存
; #IfWinActive ,效果编辑
; ^s::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	Click, 1100,769
; 	MouseMove, xpos, ypos
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return





















; ;————————————————————————————————————————————
; ;古剑奇谭OL

; ;释放技能
; #IfWinActive , ahk_exe gujianol-release.exe
; F1::
; 	Send,``^v{enter}``
; 	;click,808,475,3
; 	;SendPlay, {tab}
; return

; ;进入副本
; #IfWinActive , ahk_exe gujianol-release.exe
; F2::
; 	ClipSaved := ClipboardAll ;将剪贴板的所有内容存储到你选的一个变量里。
; 	Clipboard = gm scene enter 1000
; 	Send,``{Home}+{End}^v
; 	Clipboard := ClipSaved ;恢复剪贴板原本的内容。注意使用的是 Clipboard (不是 ClipboardAll)。
; 	ClipSaved = ;释放内存
; return

; ; ;切换地图
; ; #IfWinActive , ahk_class VVideoClass
; ; F3::
; ; 	ClipSaved := ClipboardAll ;将剪贴板的所有内容存储到你选的一个变量里。
; ; 	Clipboard = gm scene enter 910038
; ; 	Send,``{Home}+{End}^v
; ; 	Clipboard := ClipSaved ;恢复剪贴板原本的内容。注意使用的是 Clipboard (不是 ClipboardAll)。
; ; 	ClipSaved = ;释放内存
; ; return

; ;刷新技能数据
; #IfWinActive , ahk_exe gujianol-release.exe
; F5::
; 	;WinActivate ,古剑奇谭OL
; 	ClipSaved := ClipboardAll
; 	Clipboard = combat r
; 	;Send,``{Home}+{End}^v{enter}``
; 	Clipboard := ClipSaved
; 	ClipSaved =
; return
; ;刷新服务端脚本
; #IfWinActive , ahk_exe gujianol-release.exe
; ^F5::
; 	WinActivate, scene(
; 	ClipSaved := ClipboardAll
; 	Clipboard = __contentdb__.try_call_script('content/quest_sheet.lua')
; 	Send,!{Space}ep{Enter}
; 	Clipboard = __script_system__.design_script_reload_all(true,true)
; 	Send,!{Space}ep{Enter}
; 	Clipboard := ClipSaved
; 	ClipSaved =
; 	WinActivate, ahk_exe gujianol-release.exe
; return

; ;飞行模式
; #IfWinActive , ahk_exe gujianol-release.exe
; ^f::
; 	ClipSaved := ClipboardAll
; 	Clipboard = debug fly
; 	Send,``^v{Enter}``
; 	Clipboard := ClipSaved
; 	ClipSaved =
; return














; ;————————————————————————————————————————————
; ;SceneEditor

; ;调整窗口位置
; #IfWinActive , SceneEditor
; +F12::
; 	WinRestore, A
; 	WinMove, A, , 66, 0, 1613, 1050
; 	WinActivateBottom ,SceneEditor
; 	WinRestore, A
; 	WinMove, A, , 1680, 0, 1613, 1050
; 	;调整统一窗口大小
; return


; ;创建人物
; #IfWinActive ,SceneEditor
; !F1::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	Click, 1575, 805 							;点击DBID框
; 	;click, 1451, 820
; 	clipboard =									;清空剪切板
; 	Send, {Tab}^a^c 							;点击复制按钮
; 	ClipWait									;等待复制成功
; 	WinActivateBottom ,SceneEditor		;切换到另一个窗口
; 	Click, 60, 140 								;点击展开按钮
; 	Click, 126, 201								;点到下面npc列表
; 	Send, ^f^v{Enter}							;点ctrl+f查找到名字
; 	Click, 800, 600 right						;在地图中间点击右键
; 	Sleep, Delay								;等待
; 	Click, 810, 610								;点击“创建NPC”
; 	WinActivate ,ahk_id %VarWin%				;回到原来的窗口
; 	MouseMove, xpos, ypos
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return

; ;复制坐标
; #IfWinActive ,SceneEditor
; !F2::
; 	ClickPosX1:=1575
; 	ClickPosY1:=880
; 	ClickPosX2:=1575
; 	ClickPosY2:=930
; 	ClickPosX3:=1575
; 	ClickPosY3:=950
; 	ClickPosX4:=1575
; 	ClickPosY4:=975
; 	ClickPosX5:=1575
; 	ClickPosY5:=1000

; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	loop, 5
; 	{
; 		ClickPosX = % ClickPosX%A_Index%
; 		ClickPosY = % ClickPosY%A_Index%
; 		Click, %ClickPosX%, %ClickPosY%, 3
; 		Sleep, Delay
; 		clipboard =
; 		Send,^a^c
; 		ClipWait
; 		Sleep, Delay
; 		WinActivateBottom ,SceneEditor
; 		Click, %ClickPosX%, %ClickPosY%, 3
; 		Sleep, Delay
; 		Send,^a^v
; 		Sleep, Delay
; 		WinActivateBottom ,SceneEditor
; 	}
; 	WinActivate ,ahk_id %VarWin%
; 	MouseMove, xpos, ypos
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return

; ;复制坐标-绑定体
; #IfWinActive ,SceneEditor
; !F3::
; 	ClickPosLX1:=1575
; 	ClickPosLY1:=830
; 	ClickPosLX2:=1575
; 	ClickPosLY2:=878
; 	ClickPosLX3:=1575
; 	ClickPosLY3:=900
; 	ClickPosLX4:=1575
; 	ClickPosLY4:=923
; 	ClickPosLX5:=1575
; 	ClickPosLY5:=950

; 	ClickPosRX1:=1575
; 	ClickPosRY1:=880
; 	ClickPosRX2:=1575
; 	ClickPosRY2:=930
; 	ClickPosRX3:=1575
; 	ClickPosRY3:=950
; 	ClickPosRX4:=1575
; 	ClickPosRY4:=975
; 	ClickPosRX5:=1575
; 	ClickPosRY5:=1000

; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	loop, 5
; 	{
; 		ClickPosX = % ClickPosLX%A_Index%
; 		ClickPosY = % ClickPosLY%A_Index%
; 		Click, %ClickPosX%, %ClickPosY%, 3
; 		Sleep, Delay
; 		clipboard =
; 		Send,^a^c
; 		ClipWait
; 		Sleep, Delay
; 		WinActivateBottom ,SceneEditor
; 		ClickPosX = % ClickPosRX%A_Index%
; 		ClickPosY = % ClickPosRY%A_Index%
; 		Click, %ClickPosX%, %ClickPosY%, 3
; 		Sleep, Delay
; 		Send,^a^v
; 		Sleep, Delay
; 		WinActivateBottom ,SceneEditor
; 	}
; 	WinActivate ,ahk_id %VarWin%
; 	MouseMove, xpos, ypos
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return

; ;幽山古陵-修改权重和类型
; #IfWinActive ,SceneEditor
; F1::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	;WinActivate ,SceneEditor - 幽山古陵
; 	MouseMove, 1368, 986
; 	loop 2
; 		Click, WD
; 	Click, 1525, 986, 3
; 	send, 3
; 	;MouseMove, 1525, 826
; 	;loop 3
; 		;Click, WD
; 	;WinActivate ,ahk_id %VarWin%
; 	MouseMove, xpos, ypos
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return


; ;幽山古陵-复制多难度id
; #IfWinActive ,SceneEditor
; F3::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	;WinActivate ,SceneEditor - 幽山古陵
; 	send,{enter}
; 	Click, 1580, 877
; 	Clipboard =
; 	Send, {home}+{end}^c
; 	ClipWait
; 	MouseMove, xpos, ypos
; 	Click, Right
; 	send,{AppsKey}{up}{enter}
; 	Sleep, Delay
; 	;MouseMove, xpos+10, ypos+10
; 	;Click, xpos+10, ypos+10
; 	Sleep, Delay*5
; 	click,46,46,2
; 	send,{down}{right}
; 	WinActivate ,Microsoft Excel
; 	;StringReplace, clipboard, clipboard, *, ~*, All
; 	send,^f^v{enter}{esc}{home}^c
; 	WinActivate ,ahk_class gdkWindowToplevel
; 	send,{enter}^v{Enter}{down}
; 	loop,4
; 	{
; 		WinActivate ,Microsoft Excel
; 		send,{right}^c
; 		WinActivate ,ahk_class gdkWindowToplevel
; 		send,{enter}^v{Enter}{down}
; 	}
; 	send,!o
; return

; ;场景编辑器-新建vtm
; #IfWinActive ,SceneEditor
; f4::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl

; 	Click, 278, 777
; 	send,talk!o
; 	click,770,777,2
; 	send,{down}{down}

; 	Click, 278, 777
; 	send,main!o
; 	click,770,777,2
; 	send,{down}

; 	MouseMove, xpos, ypos
; return


; ;场景编辑器-复制名称到别名
; #IfWinActive ,ahk_exe scene_editor.exe
; f3::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	ClipSaved := ClipboardAll ;将剪贴板的所有内容存储到你选的一个变量里。
; 	Click, 390, 781
; 	send,{home}+{end}^c
; 	StringSplit, SplitArr, Clipboard , "**"
; 	Clipboard = %SplitArr1%
; 	Click,160,778
; 	Send,{Home}+{End}^v{home}
; 	;Clipboard := ClipSaved ;恢复剪贴板原本的内容。注意使用的是 Clipboard (不是 ClipboardAll)。
; 	ClipSaved = ;释放内存
; 	MouseMove, xpos, ypos
; return

; ; ;场景编辑器-新建vtm
; ; #IfWinActive ,ahk_exe scene_editor.exe
; ; f4::
; ; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; ; 	Click, 456, 755
; ; 	send,main{enter}!o
; ; 	Sleep, Delay
; ; 	click,1439, 836
; ; 	send,{Enter}behavs\^v{Enter}{Left}{Enter}{Down}{Down}{Enter}
; ; 	FileCopy,D:\GJOL\datadesign\behavs\maps\113004\behavs\scene_0_1_main.behav,D:\NewSVN\maps\113004\behavs\%Clipboard%.behav
; ; 	MouseMove, xpos, ypos
; ; return


; ;场景编辑器-修改行为预设点类型
; #IfWinActive ,SceneEditor
; f6::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	MouseMove,1431,872
; 	loop,6
; 		Click, WD
; 	MouseMove, xpos, ypos
; return

; ;查找同DBID的NPC
; #IfWinActive ,SceneEditor
; F7::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	MouseMove, 542,760
; 	click, WheelDown
; 	click,606,855
; 	click,1444,907
; 	send,{enter}60000{enter}
; 	Click, 1333, 800
; 	click,1527,811
; 	send,^a^c
; 	WinActivateBottom ,SceneEditor		;切换到另一个窗口
; 	click,1400,128
; 	click,1519,181
; 	send,^f^v{Enter}
; 	MouseMove, 542,760
; 	click, WheelDown
; 	click,606,855
; 	click,1444,907
; 	send,{enter}60000{enter}
; 	WinActivateBottom ,SceneEditor		;切换到另一个窗口
; 	MouseMove, xpos, ypos
; return

; ;发布功能临时修复
; #IfWinActive ,SceneEditor
; ^r::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	ClipSaved := ClipboardAll
; 	send,^s
; 	click, 1579,830
; 	send,{end}+{home}^c
; 	ClipSaved := ClipboardAll ;将剪贴板的所有内容存储到你选的一个变量里。
; 	Clipboard = gm /npc/reload aid=%clipboard%
; 	WinActivate, ahk_class VVideoClass
; 	Send,``^v{enter}``
; 	Clipboard := ClipSaved ;恢复剪贴板原本的内容。注意使用的是 Clipboard (不是 ClipboardAll)。
; 	ClipSaved = ;释放内存
; 	WinActivate ,ahk_id %VarWin%
; 	MouseMove, xpos, ypos
; return

; ;修改行为预设点
; #IfWinActive ,SceneEditor
; !MButton::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	click,1506,871,3
; 	MouseMove, xpos, ypos
; return


; ;场景编辑器-查找怪物
; #IfWinActive ,SceneEditor
; !f::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	;WinActivate ,SceneEditor - 幽山古陵
; 	MouseMove, 1368, 817
; 	Click, WU, 2
; 	Click, 1553, 817
; 	send, {tab}{end}^a^c
; 	StringReplace, clipboard, clipboard, *, ~*, All
; 	MouseMove, xpos, ypos
; 	;MsgBox, %Clipboard%
; 	WinActivate ,Microsoft Excel - 数据编辑器.xlsm
; 	send, {esc}{esc}^{home}{PgDn}^f{end}+{home}^v{Enter}{Enter}{Enter}{Esc}!q
; 	WinActivate ,ahk_id %VarWin%
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return








; ;————————————————————————————————————————————
; ;Microsoft Excel

; #IfWinActive ,E@$game$pub$data$tables$maps
; F1::
; 	Send, ^f
; 	; ControlSetText, EDTBX1, "overwrite_action_walk_f"
; 	; Control, EditPaste, "overwrite_action_walk_f", EDTBX1
; 	Send, {Enter}
; return
; F2::
; 	Send, {esc}{AppsKey}i{Enter}c{Enter}{f2}{esc}
; 	Send, relate_hmap_mask{Enter}
; 	Send, ^s^w
; return
; F3::
; 	Send, ^w
; return




; ;怪物动作表-复制搜索
; #IfWinActive ,Microsoft Excel - 副本NPC怪物动作图量表.xlsx
; !f::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	WinActivate, Microsoft Excel - 副本NPC怪物动作图量表.xlsx
; 	send, {f2}+{home}^c{enter}
; 	WinActivate ,Microsoft Excel - 副本特效需求表.xlsx
; 	send, ^f+{home}^v{bs}{bs}{bs}{bs}{enter}
; 	;WinActivate ,ahk_id %VarWin%
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return

; ;怪物动作表-标红
; #IfWinActive ,Microsoft Excel - 副本NPC怪物动作图量表.xlsx
; !d::
; #IfWinActive ,Microsoft Excel - 副本特效需求表.xlsx
; !d::
; #IfWinActive ,查找和替换
; !d::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	WinActivate, Microsoft Excel - 副本NPC怪物动作图量表.xlsx
; 	send, {LAlt}hfc{up}{up}{Right}{Right}{enter}
; 	;WinActivate ,ahk_id %VarWin%
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return

; ;怪物ID表-复制怪物到新ID
; #IfWinActive ,Microsoft Excel - 数据编辑器.xlsm
; F1::
; loop,18
; {
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	WinActivate ,Microsoft Excel - 九钟寺怪物.xlsx
; 	send,{home}{down}^c
; 	WinActivate ,Microsoft Excel - 数据编辑器.xlsm
; 	click,320,296
; 	send,1{f2}{end}+{home}^v{bs}{enter}
; 	click,70,90
; 	WinActivate ,Microsoft Excel - 九钟寺怪物.xlsx
; 	send,{Right}{Right}{Right}^c
; 	WinActivate ,Microsoft Excel - 数据编辑器.xlsm
; 	send,{up}{f2}{end}+{home}^v{bs}{Enter}{down}{down}+{down}^h!a
; 	Sleep, Delay*5
; 	send,{Enter}{esc}
; 	click, 113,102
; 	Sleep, Delay*10
; 	send,{Enter}
; 	;WinActivate ,Microsoft Excel - 九钟寺怪物.xlsx
; 	;WinActivate ,ahk_id %VarWin%
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; }
; return

; ;怪物ID表-删除npc
; #IfWinActive ,Microsoft Excel - 数据编辑器.xlsm
; F3::
; loop,10
; {
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	WinActivate ,Microsoft Excel - 九钟寺怪物.xlsx
; 	send,{down}^c
; 	WinActivate ,Microsoft Excel - 数据编辑器.xlsm
; 	click,320,296
; 	send,1{f2}{end}+{home}^v{BS}{Enter}
; 	click,70,90
; 	Sleep, Delay*5
; 	click,200,100
; 	send,{enter}
; 	Sleep, Delay*5
; 	send,{Enter}
; 	Sleep, Delay*10
; 	;WinActivate ,Microsoft Excel - 九钟寺怪物.xlsx
; 	;WinActivate ,ahk_id %VarWin%
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; }
; return

; ;数值加一
; #IfWinActive ,Microsoft Excel - 数据编辑器.xlsm
; ^WheelDown::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	ClipSaved := ClipboardAll
; 	Send,^c
; 	Num = 0
; 	Num = %clipboard%
; 	Num++
; 	clipboard = %Num%
; 	Send,^v
; 	Clipboard := ClipSaved
; 	ClipSaved =
; 	click,70,100
; 	MouseMove, xpos, ypos
; return

; ;数值减一
; #IfWinActive ,Microsoft Excel - 数据编辑器.xlsm
; ^WheelUp::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	ClipSaved := ClipboardAll
; 	Send,^c
; 	Num = 0
; 	Num = %clipboard%
; 	Num--
; 	clipboard = %Num%
; 	Send,^v
; 	Clipboard := ClipSaved
; 	ClipSaved =
; 	click,70,100
; 	MouseMove, xpos, ypos
; return

; ; ;点击保存按钮
; ; #IfWinActive ,Microsoft Excel - 数据编辑器.xlsm
; ; ^s::
; ; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; ; 	send,{enter}
; ; 	click,150,100
; ; 	MouseMove, xpos, ypos
; ; return

; ;怪物ID表-在种子表中批量替换怪物ID
; #IfWinActive ,Microsoft Excel - 2014-09 幽山古陵怪物ID表.xlsx
; F1::
; loop,12
; {
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	send,{home}{down}{f2}+{home}^c{esc}
; 	str1 = %Clipboard%
; 	send,{Right}{Right}{Right}{f2}+{home}^c{esc}
; 	str2 = %Clipboard%
; 	WinActivate ,Microsoft Excel - 数据编辑器.xlsm
; 	send,^h!e^v
; 	Clipboard = %str1%
; 	send,!n^v!a{esc}
; 	WinActivate ,Microsoft Excel - 2014-09 幽山古陵怪物ID表.xlsx
; 	;Sleep, Delay*10
; 	;WinActivate ,Microsoft Excel - 九钟寺怪物.xlsx
; 	;WinActivate ,ahk_id %VarWin%
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; }
; return







; ;————————————————————————————————————————————
; ;actoreditor

; ;复制特效音效
; #IfWinActive ,actoreditor
; F1::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	clipboard =
; 	click,Right
; 	send,{down}
; 	sleep,Delay
; 	send,{enter}
; 	WinActivateBottom ,actoreditor
; 	click,50,50,Right
; 	send,{up}
; 	Sleep, Delay
; 	send,{enter}
; 	WinActivate ,ahk_id %VarWin%
; 	MouseMove, xpos,ypos
; 	;Msgbox, The cursor is at X%xpos% Y%ypos% %VarWin% %VarControl%.
; return


; ;————————————————————————————————————————————
; ;ActorEditor
; ;保存所有
; #IfWinActive ,ActorEditor
; F2::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	Loop,20
; 	{
; 		Click,1375,275
; 		send,{Down}
; 		Click,1149,170
; 	}
; 	MouseMove, xpos,ypos
; return












; ;————————————————————————————————————————————
; ;Outlook

; ;每日工作汇报邮件复制
; #IfWinActive , 已发送邮件 - 个人文件夹 - Outlook
; F2::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	click,1000,285
; 	send,^a^c
; 	WinActivateBottom ,ahk_class rctrl_renwnd32
; 	;激活最低端窗口
; 	click,1000,205
; 	send,^a{space}{bs}^v

; 	WinActivateBottom ,ahk_class rctrl_renwnd32
; 	click,1000,306
; 	send,^a^c
; 	WinActivateBottom ,ahk_class rctrl_renwnd32
; 	click,1000,235
; 	send,^a{space}{bs}^v

; 	WinActivateBottom ,ahk_class rctrl_renwnd32
; 	click,1000,500
; 	send,^a^c
; 	WinActivateBottom ,ahk_class rctrl_renwnd32
; 	click,1000,600
; 	send,^a{space}{bs}^v

; 	WinActivateBottom ,ahk_class rctrl_renwnd32
; 	click,1000,255
; 	send,^a^c
; 	WinActivateBottom ,ahk_class rctrl_renwnd32
; 	click,1000,265
; 	send,^a{space}{bs}^v^a{end}{left}{bs}{bs}

; 	;WinActivate ,ahk_id %VarWin%
; 	;MouseMove, xpos, ypos
; return

; #IfWinActive, BUFF
; ^s::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	click,163,49
; 	MouseMove, xpos, ypos
; Return







;  olmovemouse = 0
; ;————————————————————————————————————————————
; ;不停晃动鼠标
; #IfWinActive , 古剑奇谭网络版 技术封测版
; !F10::
; 	olmovemouse = 1
; 	while  olmovemouse=1 {
; 		IfWinActive , 古剑奇谭网络版 技术封测版v0.1.1.78
; 		{
; 			MouseMove, 714,65
; 			Sleep, Delay
; 			MouseMove, 590,160
; 			Sleep, Delay
; 		}
; 	}
; return

; #IfWinActive , 古剑奇谭网络版 技术封测版
; F11::
; 	olmovemouse = 1
; 	while  olmovemouse=1 {
; 		IfWinActive , 古剑奇谭网络版 技术封测版v0.1.1.78
; 		{
; 			click,572,864
; 			Sleep, Delay
; 		}
; 	}
; return

; #IfWinActive , 古剑奇谭网络版 技术封测版
; F12::
; 	olmovemouse = 0
; return



; #IfWinActive ,ahk_class PX_WINDOW_CLASS
; F1::
; 	MouseGetPos, xpos, ypos, VarWin, VarControl
; 	Send,^{home}^+{right}^x{del}
; 	WinActivate ,Microsoft Excel - 数据编辑器.xlsm
; 	send,^v
; 	click,77,93
; 	WinActivate ,ahk_class PX_WINDOW_CLASS
; 	send,+{end}^x{del}
; 	WinActivate ,Microsoft Excel - 数据编辑器.xlsm
; 	send,^v
; 	click,117,97
; 	Sleep, 500
; 	send,{Enter}
; 	WinActivate ,ahk_class PX_WINDOW_CLASS
; 	MouseMove, xpos, ypos
; return


; ccclick = 0
;————————————————————————————————————————————
;auto_click
;#IfWinActive,ahk_exe gujianol.exe
;F9::
;	ccclick = 1
;	MouseGetPos, xpos, ypos, VarWin, VarControl
;	while ccclick=1 {
;		IfWinActive ,ahk_exe gujianol.exe
;		{
;			;MouseGetPos, xpos, ypos, VarWin, VarControl
;			;click,xpos,ypos
;			Send {1 Down}
;			sleep 100
;			Send {1 up}
;			sleep 300
;			Send {1 Down}
;			sleep 100
;			Send {1 up}
;			sleep 300
;			Send {1 Down}
;			sleep 100
;			Send {1 up}
;			sleep 300
;			Send {1 Down}
;			sleep 100
;			Send {1 up}
;			sleep 300
;			Send {1 Down}
;			sleep 100
;			Send {1 up}
;			sleep 500
;			if false  {
;				Send {s Down}
;				sleep 100
;				Send {s up}
;				sleep 100
;				Send {s Down}
;				sleep 100
;				Send {s up}
;				sleep 300
;				Send {Space Down}
;				sleep 100
;				Send {Space up}
;				sleep 300
;			}
;		}
;	}
;Return


;#IfWinActive,ahk_exe gujianol.exe
;F10::
;	ccclick = 0
;Return

PauseOnShowModel = 0
ExitLoop = 0
#IfWinActive, ahk_class AurogonAssetViewerClass
F1::
	ExitLoop = 0
	Loop, 10
	{
		Loop, 4
		{
			IfWinActive, ahk_class AurogonAssetViewerClass
			{
				posX :=% 427 + (A_Index * 265)
				; MsgBox, %posX%
				MouseMove, %posX%, 300
				Sleep, 50
				Loop, 3	;双击
				{
					Click down
					Sleep, 50
					Click up
					Sleep, 100
				}
				Sleep, 1000
			}

			While, (PauseOnShowModel == 1){
				Sleep, 100
			}

			if (ExitLoop == 1){
				Send, {esc down}
				Send, {esc up}
				Return
			}

			IfWinActive, ahk_class AurogonAssetViewerClass
			{
				; MouseClick, left, %posX%, 300, 2, 10
				MouseMove, 180, 127
				Sleep, 100
			}

			IfWinActive, ahk_class AurogonAssetViewerClass
			{
				Click down
				Sleep, 100
				Click up
				Sleep, 100
			}
		}
		IfWinActive, ahk_class AurogonAssetViewerClass
		{
			MouseMove, % 427 + 265, 300
			Sleep, 100
			MouseClick, WheelDown, , , 4
		}
	}
return

F2::
	ExitLoop = 1
	; Send, {esc down}
	; Send, {esc up}

return
CapsLock::
	PauseOnShowModel = % !PauseOnShowModel
	; if (PauseOnShowModel == 1){
	; 	MsgBox, a
	; }else{
	; 	MsgBox, b
	; }
return

Ctrl::
	PauseOnShowModel = 1
return

Ctrl up::
	PauseOnShowModel = 0

return
; CapsLock::Pause

; CapsLock::
; 	MsgBox, "暂停一下"
; return