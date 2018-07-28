;=== MY FUNCTIONS ===
; This file is included in main Radial menu script. You can put your functions here.



Demo1() {		; example
	MsgBox, 64, RM - executing function example, Hello! I'm function Demo1.`n`nI'm executed because you:`n1. specified "fun Demo1" as selected item's action and`n2. created Demo1().
}

Demo2(a="",b="",c="",d="",e="") {	; example
	MsgBox, 64, RM - executing function example, Hello! I'm function Demo2.`nI accepted the following parameters:`n%a%`n%b%`n%c%`n%d%`n%e%
}


SendSc(k) {	; example
;	k:="{j}"
	Send, %k%
}


SendScConfirm(){
	send,{enter} 	;確定
	send,^{d}		;選択解除
	send,{9}		;鉛筆ツールを選択
;	send,{F10}		;鉛筆ツールを選択

	send,{w}		;描画色を黒に
}


SendScWithW(k){
	Send, %k%
	send,{w}
}

SendScWithXV(k){
	send,^{x}
	send,^{v}
	Send, %k%
}

SendScAfterNewLayer(k) {	; example
;	k:="{j}"
	Send,{F16}
	Send, %k%
}

SendBrush(k, g="1", b="2"){
	send,%k%
}

runOBS(){
SetWorkingDir, "C:\Program Files (x86)\obs-studio\bin\64bit"
run, "C:\Program Files (x86)\obs-studio\bin\64bit\obs64.exe"

}

csp_onomatopeiaTone(){
	send,!+{F19}
	send,{v}
	send,{F1}
}

csp_bg_import() {	; example
	Send, +{F4}
	sleep, 2000
	Send,{o}
}


csp_text(){
	send,{F1}
	send,{t}
	send,{w}
}
csp_duplicate_tone(){
	send,+{F19}
	send,^{h}
}
csp_layerset(n){
	send,+!{F1}
	send,^!{n}
	send,%n%
	send,{return}

	Send,^!{F16}
	send,!{]}
	Send,^!+{t}

	Send,^!+{r}
	send,!{]}
}

csp_coma(){
	send,{u}
	sleep, 100
	send,^+{F7}
	sleep, 100
	send,{F1}
	send,{w}
}

csp_mosaic(){
	send,{e}
	send,^{F12}
}

makeLayer(k){
	Send, %k%
  Send ^{g}
}

; csp text function

_csp_pasteText(x, y, txt)
{
clipboard:=txt
MouseMove,x,y,30
click
sleep, 500
send,^{v}
send,+{return}
return
}

CountSubstring(fullstring, substring){
   StringReplace, junk, fullstring, %substring%, , UseErrorLevel
   return errorlevel
}

setSpeaking(scenario, backup, startX, startY)
{
	;msgbox, % scenario
    page := StrSplit(scenario, "`nl`n")
    startLocationX := startX+400
    startLocationY := startY+180

    x :=startLocationX
    y := startLocationY
    height := 180+100
    width := 10
    lineSpace := 30 + 50

	for index, line in page
	{

		speak := StrSplit(line, "`n`n`n")
		for i, txt in speak
		{
            num:=CountSubstring(txt, "`r`n")

        	_csp_pasteText(x,y, txt)
        	x:= x-lineSpace*(num+1)

		}

        if y < 500
        {
            y:= y+height
            x:=startLocationX
        }
    }
    _csp_pasteText(x,y,backup)
}


csp_set_speaking(){
backup:=Clipboard
csp_speaking_convert()
sleep,2000
send,{t}
setSpeaking(clipboard, backup,800, 0)
Return
}

csp_set_speaking2(){
backup:=Clipboard
csp_speaking_convert()
sleep,2000
send,{t}
setSpeaking(clipboard, backup,1300, 1200)
Return
}

csp_speaking_convert(){
run, C:\Users\sh1\Anaconda3\python.exe C:\Users\sh1\code\py\csp\speakingConvert.py
Return
}


csp_sketch(){
	send, ^+{F5}
	sleep, 1000
	send,^+{F2}
	sleep, 1600
	send,{F1}
	return
}

csp_brushcolor(buf_cspsketch){
	if buf_cspsketch =1
	{
		send, ^+!{F6}
	}
	else if buf_cspsketch =2
	{
		send, ^+!{F7}
	}
		else if buf_cspsketch =3
	{
		send, ^+!{F8}
	}
		else if buf_cspsketch =4
	{
		send, ^+!{F9}
	}
	else {
		send, ^+!{F2}
	}
	sleep, 1000
	csp_sketch()
	return
}

csp_brush_purple(){
	;send,^!+{F8}
	send,{8}
}

layer_folder(n){
	send,+!{F1}
	send,^!{n}
	send,%n%
	sleep, 300
	send,{return}
}

run_clipjump(){
	Runwait, taskkill /im Clipjump.exe /f
	Run, "C:\tool\Clipjump\Clipjump.exe"
	return
}
run_clipjumpmono(){
	Runwait, taskkill /im Clipjump.exe /f
	Run, "C:\tool\Clipjump-mono\Clipjump.exe"
	return
}

csp_setBrushBlur(k,m){
	csp_brushSoftExtMax()
	SendSc(k)
	SendSc(m)
}
csp_brushSoftExtMax(){
	SendSc("^!{] 10}")
	SendSc("+{] 10}")
}

csp_setBrushInk(k,m){
	csp_brushInkMax()
	SendSc(k)
	SendSc(m)
}
csp_brushInkMax(){
	SendSc("^+!{] 10}")
	SendSc("!+{] 10}")
}

shadow2gradation(){
    send,^!+{d} ; delete and select gradation tool
    send,{y}
    send,{F8}
}

shadow2gradationSkin(){
    send,^!+{d} ; delete and select gradation tool
    send,{7}
    send,{F8}
}
csp_toolselect(k){
	SendSc(k)
    send,{F8}
}
copyImages(){
If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
WinHWND := WinActive()
For win in ComObjCreate("Shell.Application").Windows
If (win.HWND = WinHWND) {
dir := SubStr(win.LocationURL, 9) ; remove "file:///"
dir := RegExReplace(dir, "%20", " ")
Break
}
}
;Run, cmd, % dir ? dir : A_Desktop
Loop Files, %dir%\*.jpg, R  ; Recurse into subfolders.
{
	run "c:\tool\nircmd-x64\nircmd.exe" "clipboard" "copyimage" "%A_LoopFileFullPath%"
	sleep, 300
}
}

/*===Description======================================================================================
To execute specific function when you select RM item you must:
1.	specify name of that function (+ "fun" prefix) as item's action. Example: Action = fun Demo1
2.	create that function here, or in Radial menu.ahk, or any other included file.
If you want to perform some more complicated actions, create stand-alone script and launch it by selecting RM item.

You can pass parameters to custom functions. Example: Action = fun Demo2|param1|param2|param3 calls: MF_Demo2("param1", "param2", "param3")
It's good to know that with Radial menu, you can control any other script and most of other programs via custom
functions or mouse gestures. Study OnMessage(), PostMessage, Send, etc.

When you press RMShowHotkey, RM stores some useful info:
- unique ID number (hwnd) of window under the mouse cursor. To get it, call:   WinUMID := RMApp_Reg("WinUMID")   ; "UM" means "under mouse".
- unique ID number (hwnd) of active window. To get it, call:   ActiveWinID := RMApp_Reg("ActiveWinID")
- class of the control under the mouse cursor. To get it, call:   ControlUMClass := RMApp_Reg("ControlUMClass")
- unique ID number (hwnd) of the control under the mouse cursor. To get it, call: ControlUMID := RMApp_Reg("ControlUMID")
- class of control that has input focus in active window. To get it, call ControlFocClass := RMApp_Reg("ControlFocClass")
- x coordinate relative to screen.  To get it, call:   x := RMApp_Reg("x")
- y coordinate relative to screen.  To get it, call:   y := RMApp_Reg("y")
To get current profile, call: CurrentProfile := RMApp_Reg("CurrentProfile")
*/
