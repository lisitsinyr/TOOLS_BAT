@echo off
rem -------------------------------------------------------------------
rem EveryDay.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов BAT
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC\LIB
    )
    rem echo LIB_BAT:!LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem Настройка среды
    rem -------------------------------------------------------------------
    call :SET_LIB %~f0 || exit /b 1



:begin
    set BATNAME=%~nx0
    rem echo Старт !BATNAME! ...

    rem -------------------------------------------------------------------
    rem LOG_FULLFILENAME - Файл журнала [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set LOG_FULLFILENAME=G:\___РАЗБОР\LOG\EveryDay.log
    rem echo LOG_FULLFILENAME: !%LOG_FULLFILENAME!

    rem call :StartLogFile || exit /b 1

    call :AddLog !loTextFile! !PROCESS! "..."

    rem G:\___РАЗБОР\STORE\MHT_LUIS_24_4000\2026\04
    rem call D:\TOOLS\TOOLS_BAT\BAT\GGGGMMDD.bat

    rem G:\___РАЗБОР\STORE\YOUTUBE_LUIS_24_4000\2026\04
    rem call D:\TOOLS\TOOLS_BAT\BAT\GGGGMMDD.bat

    rem call :StopLogFile || exit /b 1

    exit /b 0
:end

rem ===================================================================

rem =================================================
rem LYRLIB.bat
rem =================================================
:LYRLIBINIT
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_LIB
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_POETRY
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:__SET_VAR_SCRIPT
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:__SET_VAR_DEFAULT
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:__SET_VAR_PROJECTS
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:__SET_LOG
%LIB_BAT%\LYRLIB.bat %*
exit /b 0

rem =================================================
rem LYRLog.bat
rem =================================================
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
