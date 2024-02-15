@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_BAT.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem Каталог журнала: каталог
rem     LOG_DIR=
rem Файл журнала: имя+расширение
rem     LOG_BASEFILENAME=
rem Файл журнала: имя
rem     LOG_FILENAME=
rem Формат имени файлф журнала: FILENAME,DT,...
rem     LOG_FILENAME_FORMAT=
rem Параметры журнала
rem     LOG_OPT=11
rem Каталог APP_KIX: каталог с файлами .KIX
rem     KIX_DIR=
rem Скрипт APP_KIX: имя+расширение
rem     APP_KIX=lyrxxx_ШАБЛОН.kix
rem -------------------------------------------------------------------

setlocal enableextensions disabledelayedexpansion

rem call %BAT_DIR%\LIB\__SET__.bat

:begin
call :__SET_VAR_SCRIPT || exit /b 1
call :__SET_BAT_DIR || exit /b 1
call :__SET_VAR_DEFAULT || exit /b 1
call :__SET_VAR_PROJECTS || exit /b 1
call :__SET_CHECK_REPO || exit /b 1
call :__SET_LOG || exit /b 1

call :__START_LOG || exit /b 1
echo -------------------------------------------------------
echo Start %SCRIPT_BASEFILENAME% ...
echo -------------------------------------------------------
set DIR_SAVE=%CURRENT_DIR%

rem echo BODY script %SCRIPT_BASEFILENAME% ... 
call :__Check_P1 || exit /b 1

rem far -v %LOG_FULLFILENAME%

cd /D %DIR_SAVE%

call :__STOP_LOG || exit /b 1

rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================
:__SET_VAR_SCRIPT
echo ---------------------------------------------------------------
echo __SET_VAR_SCRIPT
echo ---------------------------------------------------------------
rem Файл скрипта: каталог+имя+расширение
set SCRIPT_FULLFILENAME=%~f0
echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem Файл скрипта: имя+расширение
set SCRIPT_BASEFILENAME=%~n0%~x0
echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem Файл скрипта: имя
set SCRIPT_FILENAME=%~n0
echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem CURRENT_DIR - Текущий каталог
set CURRENT_DIR=%CD%
echo CURRENT_DIR: %CURRENT_DIR%
exit /b 0

:__SET_BAT_DIR
D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT\LIB\__SET.bat %*
exit /b 0
:__SET_VAR_DEFAULT
%BAT_DIR%\LIB\__SET.bat %*
exit /b 0
:__SET_VAR_PROJECTS
%BAT_DIR%\LIB\__SET.bat %*
exit /b 0
:__SET_CHECK_REPO
%BAT_DIR%\LIB\__SET.bat %*
exit /b 0
:__SET_LOG
%BAT_DIR%\LIB\__SET.bat %*
exit /b 0
:__START_LOG
%BAT_DIR%\LIB\__SET.bat %*
exit /b 0
:__STOP_LOG
%BAT_DIR%\LIB\__SET.bat %*
exit /b 0

:__Check_P1
echo ---------------------------------------------------------------
echo __Check_P1 [P1]
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
