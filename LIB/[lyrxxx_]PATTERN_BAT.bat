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

echo ==================================================================
echo SET %0 ...
echo ==================================================================
setlocal enableextensions disabledelayedexpansion
rem CURRENT_DIR - Текущий каталог
set CURRENT_DIR=%CD%
set DIR_SAVE=%CURRENT_DIR%
set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
call :__SET_SCRIPTS_DIR || exit /b 1
call :__SET_VAR_SCRIPT %0 || exit /b 1
call :__SET_VAR_DEFAULT || exit /b 1
call :__SET_VAR_PROJECTS || exit /b 1
call :__SET_CHECK_REPO || exit /b 1
call :__SET_LOG || exit /b 1

call :StartLogFile || exit /b 1

:begin
echo ================================================================= >> %LOG_FULLFILENAME%
echo START %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ================================================================== >> %LOG_FULLFILENAME%

rem BODY script ..............................................
call :__Check_P1 || exit /b 1
rem BODY script ..............................................

echo ================================================================= >> %LOG_FULLFILENAME%
echo STOP %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ================================================================== >> %LOG_FULLFILENAME%
cd /D %DIR_SAVE%
rem far -v %LOG_FULLFILENAME%

call :StopLogFile || exit /b 1
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================
:__SET_SCRIPTS_DIR
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_SCRIPT
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
:__SET_VAR_DEFAULT
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_PROJECTS
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
exit /b 0
:__SET_CHECK_REPO
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
exit /b 0
:__SET_LOG
%SCRIPTS_DIR%\LIB\__SET_LIB.bat %*
exit /b 0

:StartLogFile
%SCRIPTS_DIR%\LIB\LYRLog.bat %*
exit /b 0
:StopLogFile
%SCRIPTS_DIR%\LIB\LYRLog.bat %*
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
