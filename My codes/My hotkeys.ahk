;=== MY HOTKEYS ===
; This file is included in main Radial menu script. You can put your hotkeys here.

/*
;Example:
F1::MsgBox, Hello!
*/



XButton1::
#z::
IfWinActive, CLIP STUDIO PAINT ; if Paint is active window ...
MenuToShow := 57                    ; ... we will show menu for Paint (Gui number 56)
else IfWinActive, ahk_class 742DEA58-ED6B-4402-BC11-20DFC6D08040-6571DDC4-B3AA-45e4-9D35-57C0C1E90AD5                         ; in all other cases ...
MenuToShow := 57
else
MenuToShow := 99                ; ... we will show General menu (Gui number 58)
RMApp_MyRMHandler2(MenuToShow)      ; Shows appropriate menu, gets selected item and executes item action if something was selected
return


#a::
IfWinActive, CLIP STUDIO PAINT ; if Paint is active window ...
MenuToShow := 59                    ; ... we will show menu for Paint (Gui number 56)
else IfWinActive, ahk_class 742DEA58-ED6B-4402-BC11-20DFC6D08040-6571DDC4-B3AA-45e4-9D35-57C0C1E90AD5                         ; in all other cases ...
MenuToShow := 59
else
MenuToShow := 99                ; ... we will show General menu (Gui number 58)
RMApp_MyRMHandler2(MenuToShow)      ; Shows appropriate menu, gets selected item and executes item action if something was selected
return

#x::
IfWinActive, CLIP STUDIO PAINT ; if Paint is active window ...
MenuToShow := 58                    ; ... we will show menu for Paint (Gui number 56)
else IfWinActive, ahk_class 742DEA58-ED6B-4402-BC11-20DFC6D08040-6571DDC4-B3AA-45e4-9D35-57C0C1E90AD5                         ; in all other cases ...
MenuToShow := 58
else
MenuToShow := 99                ; ... we will show General menu (Gui number 58)
RMApp_MyRMHandler2(MenuToShow)      ; Shows appropriate menu, gets selected item and executes item action if something was selected
return

