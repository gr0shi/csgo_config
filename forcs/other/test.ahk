#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

FileBHOP := A_ScriptDir . "\\..\\nircmd.exe"

Run, %FileBHOP% changebrightness +100
; Run, "C:\Users\maxjm\maxjmagic\steam\CS+\config\csgo_config\forcs\bhop.exe"