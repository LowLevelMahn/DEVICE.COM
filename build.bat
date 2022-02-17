@echo off

set my_root=F:\projects\fun\dos_games_rev
set tools_dir=%my_root%\tools

set uasm_exe=%tools_dir%\uasm_x64\uasm64.exe

set WATCOM=%tools_dir%\open-watcom-2_0-c-win-x64
set WATCOM_BIN=%watcom%\binnt64
set INCLUDE=%watcom%\h
set PATH=%WATCOM_BIN%;%PATH%
set wlink_exe=%watcom_bin%\wlink.exe

pause

%uasm_exe% dv.asm 

pause

%wlink_exe% name dv.com format dos com file dv.obj

pause

fc /B DEVICE.COM dv.COM
if %ERRORLEVEL% == 0 goto success
echo !!!!
echo !!!! Resulting dv.COM is not binary identical to original DEVICE.COM !!!
echo !!!!

pause

exit /b 1

:success

echo DRV.COM binary equal to original DEVICE.COM

pause