@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_BAT.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem You may need to redirect both stdout and stderr:
rem timeout 2 >NUL 2>NUL

rem echo -------------------------------------------------------
rem Файл скрипта: каталог+имя+расширение
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem Файл скрипта: имя+расширение
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem Файл скрипта: имя
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem Каталог BAT_DIR: каталог
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT
    set BAT_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
)
rem echo BAT_DIR: %BAT_DIR%

call %BAT_DIR%\LIB\__SET__.bat

:begin
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo Start %SCRIPT_BASEFILENAME% ...       >> %LOG_FULLFILENAME%
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo CURRENT_DIR: %CURRENT_DIR%            >> %LOG_FULLFILENAME%
set DIR_SAVE=%CURRENT_DIR%

rem echo BODY script %SCRIPT_BASEFILENAME% ... 
call :Check_P1 || exit /b 1

rem far -v %LOG_FULLFILENAME%

cd /D %DIR_SAVE%

rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================
:Check_P1
echo ---------------------------------------------------------------
echo Check_P1 [P1]
echo ---------------------------------------------------------------
if "%1"=="" (
    rem set /p P1=P1:
    set P1=""
) else (
    set P1=%1
)
if "%P1%"=="" (
    set P1=""
)
echo P1: %P1%
exit /b 0
