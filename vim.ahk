#SingleInstance force
;NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; + is shift, ! is alt, ^ is ctrl
; AHK Command       ; key   = Effect        (Description)   

; ALT Keypress Implied for all below

;$LAlt::Ctrl 
;$LCtrl::Alt

if not A_IsAdmin
{
   ; Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
   ; Run *RunAs "D:/autohotkey/vim.ahk"  ; Requires v1.0.92.01+
   ExitApp
}

$^F1::
	Reload
  ;MsgBox, Vim.ahk Reloaded
Return

;$RCtrl::Alt
$!tab::Send ^{Tab}
$!+tab::Send ^+{Tab}
$^'::Send ^{Tab}
$^+'::Send ^+{Tab}
$^,::Send !{LEFT}
$^.::Send !{RIGHT}
$!,::Send ^{,}
$!'::Send ^{'}
$!.::Send ^{.}
$#+9::Send {U+0028}{U+0029}{Left}

$F1::
		If (Toggle){
			Toggle := false
		  Click, Up
		} else {
			Toggle := true
		    Click, Down
		}
return    

$^+h::Send +{F6}
$^+l::Send {F6}

$#,::Send <>{LEFT}
$#.::Send {space}{U+002D}>{space}
;$#.:: Send {->}
$#^.::Send {space}{=}>{space}
$#^,::Send {space}<{-}{space}

; Deletion
+Backspace::Send {Del}
$^+Backspace::Send ^{Del}
$^`::Send {U+0060}{U+0060}{U+0060}

; Win Key
LWin up::return
LWin & l::Send #l

$#`::Send {U+0060}{U+0060}{Left}
;$#+a::Send {U+2200}
$#+e::Send {U+2203}
$#+b::Send {U+2208}
$#f::Send {U+03BB}
$#+a::Send {U+2610}
;$#e::Send {U+25CA}
$#p::Send {U+03A0}
$#+p::Send {U+03A3}
$#h::Send #{DOWN}
$#+.::Send #^{RIGHT}
$#+,::Send #^{LEFT}
$#+f::Send {\}frac{{}{}}{{}{}}{Left}{Left}{Left}
$#n::Send {&}
$#+n::Send {F2}
$#+m::Send {F11}
$#m::Send #{up}
$#k::Send {U+002D}
$#j::Send {_}
$#+d::Send {$}{$}{Left}
$![::
  Send !+{0}
  Send {U+300C}{U+300D}{Left}
	Send ^+{5}
return
$#+[::Send {{}{}}{Left}
$#[::Send {[}{]}{Left}
$+3::Send {U+0023}

$#\::Send {\}{/}{Space}
; $#/::Send {/}{\}{Space}
; $#/::Send {\}{<}{\}{>}{Left}{Left}
$#+\::Send {|}{|}{Left}
$#+/::Send {t}{h}{i}{s}{i}{s}{u}{n}{s}{a}{f}{e}
$#;::Send {Raw}chuchu722
$#o::
    run "D:/note.lnk"
return


$#q::
	if(isU) {
		Send {v}
		isU := false
	} else {
		Send {u}
		isU := true
	}
return

;;; App functional
$#'::Send {'}{'}{Left}
$#+'::Send {"}{"}{Left}
$^u::Send {6}
; $+space::return


$^;::
  If (!state) {
    Send ^+{5}
    state := 1
  } Else {
    Send !+{0}
    state := 0
  }
  jp := 0
Return

$^n::
  If (!jp) {
    Send ^+{6}
    jp := 1
  } Else {
    ;Send !+{0}
    ;jp := 0
    Send !{``}
  }
  state := 0
Return

$^[::
  Send !+{0}
  Send {Esc}
	state := false
  jp := 0
return

$#Enter:: 
  Send !{Enter}
Return

$^Enter:: 
  Send {Enter}
  Send !+{0}
	state := 0
  jp := 0
Return


; terminal
; App Tab Control

$#^k::Send ^{=}
$#^j::Send ^{-}


;;;; Other App Workaround
$#+;::
	SoundSet, 8
    Send, {Volume_up}
	;Send, {Volume_Mute}
return	

$F12::Send, {Volume_down}
$F10::Send, {Volume_down}
$ins::Send, {Volume_up}

$#+k::Send, {Volume_up}
$#+j::
    Send, {Volume_down}
return	

$F9::
	;SoundSet, 10
	;Send, {Volume_Mute}
	SoundSet, 8
    Send, {Volume_up}
return	

$F11::
	;SoundSet, 10
	;Send, {Volume_Mute}
	SoundSet, 8
    Send, {Volume_up}
return	

$#1::Send ^#{1}
$#2::Send ^#{2}
$#3::Send ^#{3}
$#4::Send ^#{4}
$#5::Send ^#{5}

$#w::
  run "D:/memo/translate.url"
return

$#F1::
	Suspend on
Return

$#F2::
	Suspend Off
Return

#If drag_enabled
~LButton::
    drag_enabled := false
return

$RButton::
    Click, Up
    Send, {RButton}
    drag_enabled := false
return
#If

#^+F22:: ; 3 finger tap
    if (drag_enabled) 
        Click, Up
    else
        Click, Down
    drag_enabled := !drag_enabled
return

+^#F24:: 
    if (drag_enabled) 
        Click, Up
    Send {MButton} ;four finger
return

; Remap Ctrl-Tab to Alt-Tab
$^Tab::
Send {Alt down}{Tab}
;Keywait Alt
Keywait Ctrl
Send {Alt up}
return

; Remap Ctrl-Shift-Tab to Alt-Shift-Tab
$^+Tab::
Send {Alt down}{Shift down}{Tab}
;Keywait Alt
Keywait Ctrl
Send {Alt up}
Send {Shift up}
return

$!^#;::		; Left Ctrl + Esc = exit scripts
    DetectHiddenWindows, On
    WinGet, AHKList, List, ahk_class AutoHotkey
    Loop, %AHKList%
    {
        ID := AHKList%A_Index%
        If (ID <> A_ScriptHwnd) {
            MsgBox, %ID% close
            WinClose, ahk_id %ID%
        }
    }
return

F8::Send #{PrintScreen}

$#/::
    SendRaw set -o vi;alias ll='ls -l';alias lt='ls -ltr';cd() { command cd $@ && ls -la;};bind '"\e[A": history-search-backward';bind '"\e[B": history-search-forward'
    Send {Enter}
return     
