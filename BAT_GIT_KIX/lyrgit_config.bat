@echo off
rem -------------------------------------------------------------------
chcp 1251

if "%KXLDIR%" == "" goto Begin
goto Stop

:Begin
echo �������� ���������� ����� KXLDIR �� �����������
if "%COMPUTERNAME%" == "%USERDOMAIN%" goto Local

:Network
set KXLDIR=\\S73FS01\APPInfo\tools
goto Stop

:Local
set KXLDIR=D:\TOOLS
set KXLDIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX
goto Stop

:Stop
echo �������� ���������� ����� KXLDIR=%KXLDIR%

kix32.exe %KXLDIR%\APP\GITKIX.kix "$BATFILENAME=%~n0" "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$KxlDir=%KXLDIR%"

:Exit
