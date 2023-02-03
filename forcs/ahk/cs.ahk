#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

; Paths for exe files
vibrance := A_ScriptDir . "\\..\\vibranceGUI.exe" ; raises picture saturation
bhop := A_ScriptDir . "\\..\\bhop.exe" ; bhop.ahk script
bright := A_ScriptDir . "\\..\\nircmd.exe" ; needs for change brightness

; Open CS:GO using Steam protocol.
Run, steam://rungameid/730

; Wait for the game to start
Process, Wait, csgo.exe

; Open vibranceGUI и bhop
Run, %vibrance%
Run, %bhop%

; Set volume and brightness value to 100%
SoundSet, 100
Run, %bright% changebrightness +100

; Wait for the game to close
Process, WaitClose, csgo.exe

; Close vibranceGUI and bhop
Process, Close, vibranceGUI.exe
Process, Close, bhop.exe

; Set volume and brightness value to 50%
SoundSet, 50
Run, %bright% changebrightness -50

; Close script
ExitApp