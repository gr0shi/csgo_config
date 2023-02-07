#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

bhop := A_ScriptDir . "\\..\\bhop.exe"
vibrance := A_ScriptDir . "\\..\\vibranceGUI.exe"
nircmd := A_ScriptDir . "\\..\\nircmd.exe"

; run csgo
Run, steam://rungameid/730

Process, Wait, csgo.exe

Run, %bhop%
Run, %vibrance%
Run, %nircmd% changebrightness +100
SoundSet, 100

Process, WaitClose, csgo.exe

Process, close, vibranceGUI.exe
Process, close, bhop.exe
Run, %nircmd% changebrightness -50
SoundSet, 50

ExitApp
