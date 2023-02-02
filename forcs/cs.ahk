#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; Открыть CS:GO по протоколу Steam.
Run, steam://rungameid/730

; Дождаться запуска игры
Process, Wait, csgo.exe

; Запустить vibranceGUI и bhop
Run, "C:\Users\maxjm\maxjmagic\steam\CS+\forcs\vibranceGUI.exe"
Run, "C:\Users\maxjm\maxjmagic\steam\CS+\forcs\bhop.exe"

; Установить значение громкости и яркости на 100%
SoundSet, 100
Run "C:\Users\maxjm\maxjmagic\steam\CS+\forcs\nircmd\nircmd.exe" changebrightness +100

; Дождаться закрытия игры
Process, WaitClose, csgo.exe

; Закрыть vibranceGUI, bhop и nircmd
Process, Close, vibranceGUI.exe
Process, Close, bhop.exe
Process, Close, nircmd.exe

; Установить значение громкости и яркости на 50%
SoundSet, 50
Run "C:\Users\maxjm\maxjmagic\steam\CS+\forcs\nircmd\nircmd.exe" changebrightness -50

; Закрыть nircmd
Process, Close, nircmd.exe

; Закрыть скрипт
ExitApp