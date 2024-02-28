#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include "GUIHyperLink.au3"
#include <MsgBoxConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("streamlink gui 0.2", 460, 250, 192, 124)
$Input1 = GUICtrlCreateInput("", 48, 36, 240, 21)
$Button1 = GUICtrlCreateButton("Run HTTP", 48, 106, 105, 33)
$Button2 = GUICtrlCreateButton("Run VLC", 280, 106, 105, 33)
$Input2 = GUICtrlCreateInput("1024", 390, 36, 60, 21)
$Input3 = GUICtrlCreateCombo("", 300, 36, 68, 21)
GUICtrlSetData($Input3, "best|worst|178p|240p|266p|356p|360p|480p|534p|720p|800p|1068p|1068p|1602p|720p60", "best")

$Checkbox1 = GUICtrlCreateCheckbox("", 270, 70, 22, 22)

$Input4 = GUICtrlCreateInput("01:00:00", 300, 70, 68, 21)

$Label1 = GUICtrlCreateLabel("The URL of the stream", 48, 16, 108, 17)
$Label2 = GUICtrlCreateLabel("quality", 300, 16, 108, 17)
$Label3 = GUICtrlCreateLabel("Port", 390, 16, 108, 17)
$Label4 = GUICtrlCreateLabel("start-offset HH:MM:SS", 150, 72, 108, 17)




$nAutoItScript_Com_HyperLink = _GUICtrlHyperLink_Create("Website", 10, 200, 50, 15, 0x0000FF, 0x551A8B, _
	-1, 'https://dzen.ru/id/6469da5fc08e463733ea529c?share_to=link', 'Visit: https://dzen.ru/id/6469da5fc08e463733ea529c?share_to=link', $Form1) ;Intentionally set as google.com, will change later

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit



		Case $Button1

If BitAND(GUICtrlRead($Checkbox1),$gui_checked)=$gui_checked Then
               RunWait(@ComSpec & " /c " & @ScriptDir & '\streamlink.exe --hls-start-offset '&GUICtrlRead($Input4)& ' --player-external-http --player-external-http-port ' & GUICtrlRead($Input2) & " --player-no-close " & GUICtrlRead($Input1) & " " & GUICtrlRead($Input3)   , "", @SW_SHOW)
            ElseIf BitAND(GUICtrlRead($Checkbox1),$gui_unchecked)=$gui_unchecked Then
              RunWait(@ComSpec & " /c " & @ScriptDir & '\streamlink.exe --player-external-http --player-external-http-port ' & GUICtrlRead($Input2) & " --player-no-close " & GUICtrlRead($Input1) & " " & GUICtrlRead($Input3)   , "", @SW_SHOW)
            EndIf




		Case $Button2

			If BitAND(GUICtrlRead($Checkbox1),$gui_checked)=$gui_checked Then
                RunWait(@ComSpec & " /c " & @ScriptDir & '\streamlink.exe --hls-start-offset '&GUICtrlRead($Input4)&" " & GUICtrlRead($Input1) & " " & GUICtrlRead($Input3)   , "", @SW_SHOW)
            ElseIf BitAND(GUICtrlRead($Checkbox1),$gui_unchecked)=$gui_unchecked Then
                RunWait(@ComSpec & " /c " & @ScriptDir & '\streamlink.exe ' & GUICtrlRead($Input1) & " " & GUICtrlRead($Input3)   , "", @SW_SHOW)
            EndIf




EndSwitch

WEnd