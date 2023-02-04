@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

SET csgo_install_path=%PROGRAMFILES(x86)%\Steam\steamapps\common\Counter-Strike Global Offensive

XCOPY %~dp0cfg\* "%csgo_install_path%\csgo\cfg" /Y /F
XCOPY %~dp0resource\* "%csgo_install_path%\csgo\resource" /Y /F
XCOPY %~dp0scripts\* "%csgo_install_path%\csgo\scripts" /Y /F

PAUSE
EXIT /B 0
