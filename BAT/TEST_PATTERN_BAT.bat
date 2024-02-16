@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_BAT.bat
rem -------------------------------------------------------------------
chcp 1251>NUL
setlocal enableextensions disabledelayedexpansion

rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
set SCRIPT_FULLFILENAME=%0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%

echo ==================================================================
echo SET %SCRIPT_FULLFILENAME% ...
echo ==================================================================
call :__SET_SCRIPTS_DIR || exit /b 1
call :__SET_VAR_SCRIPT %SCRIPT_FULLFILENAME% || exit /b 1
call :__SET_VAR_DEFAULT || exit /b 1
call :__SET_VAR_PROJECTS || exit /b 1
call :__SET_CHECK_REPO || exit /b 1
call :__SET_LOG || exit /b 1

:begin
call :StartLogFile || exit /b 1

echo ================================================================= >> %LOG_FULLFILENAME%
echo START %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ================================================================== >> %LOG_FULLFILENAME%
set DIR_SAVE=%CURRENT_DIR%

rem BODY script ..............................................

call :BODY || exit /b 1

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
rem ФУНКЦИИ LIB
rem =================================================
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
:Check_P
%SCRIPTS_DIR%\LIB\LYRSupport.bat %*
exit /b 0
rem =================================================
rem ФУНКЦИЯ :__SET_SCRIPTS_DIR
rem =================================================
:__SET_SCRIPTS_DIR
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo __SET_SCRIPTS_DIR
    rem echo ---------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    if "%SCRIPTS_DIR%" == "" (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    )
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИЯ :BODY
rem =================================================
:BODY
rem beginfunction
    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИЯ :BODY_TEST
rem =================================================
:BODY_TEST
rem beginfunction
    rem call :__Check_P1 Comment || exit /b 1
    set TEST=TEST
    call :Check_P Comment "" || exit /b 1
    echo Comment: %Comment%
    exit /b 0
rem endfunction
