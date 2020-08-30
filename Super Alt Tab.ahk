#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global clickEvent := true
~LButton:: global clickEvent := true

F19:: ; Remap Super Alt Tab key here, if desired.
{
global clickEvent := false
Send, ^!{Tab} 
KeyWait F19,

; This block and 'launchy' subroutine allows a rapid double-press ot the Super Alt Tab key
; to bring forward a Launchy prompt, if installed.
KeyWait, F19, D T.075
If (!ErrorLevel)
	{
	goto, launchy
	}

; This conditional enables that a window is automatically selected when the Super Alt Tab key
; is released, while ensuring that if a window is selected by mouse click
; an erroneous 'Enter' command is not passed into the window's processes.
if (clickEvent = false)
	{
	Send, {Enter} 
	}

Return

; This block and the double-press block can be deleted if Launchy is not used
launchy:
	{
	Send !{Space}
	}

Return
}


$i::
	if (GetKeyState("F19")) {
		Send {Up}
		}		
	else if (GetKeyState("Capslock", "T"))  {
		Send {I}
		}
	else {
		Send {i}

		}
Return

$k::
	if (GetKeyState("F19")) {
		Send {Down}
		}
	else if (GetKeyState("Capslock", "T"))  {
		Send {K}
		}
	else {
		Send {k}
		}
Return

$j::
	if (GetKeyState("F19")) {
		Send {Left}
		}
	else if (GetKeyState("Capslock", "T"))  {
		Send {J}
		}
	else {
		Send {j}
		}
Return

$l::
	if (GetKeyState("F19")) {
		Send {Right}
		}
	else if (GetKeyState("Capslock", "T"))  {
		Send {L}
		}
	else {
		Send {l}
		}
Return