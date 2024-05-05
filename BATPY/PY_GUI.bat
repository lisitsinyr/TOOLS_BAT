@echo off
chcp 1251

rem echo %1
rem echo %~n1
rem echo %~dpn1

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
set PyFile=%1
echo %PyFile%
goto P2
:P1_Input
set /p PyFile=PyFile:
if "%PyFile%" == "" goto P1_Error
goto P2
:P1_Error
echo Значение параметра PyFile не установлено
goto Exit
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
:P2
set ExeFile=%~n1.exe
set SpecFile=%~n1.spec
echo %ExeFile%
if "%ExeFile%" == "" goto Begin1
goto Begin2
rem -------------------------------------------------------------------

:begin1
echo begin1
goto Exit

:begin2
echo begin2
echo %PyFile%
echo %ExeFile%
del %ExeFile%
D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\P311\Scripts\pyinstaller.exe --clean -w --log-level INFO --onefile --workpath D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\WORK --distpath . %PyFile%
goto Exit

:Exit
