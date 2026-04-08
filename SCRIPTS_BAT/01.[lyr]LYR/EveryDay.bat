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

    set YYYY=%date:~6,4%
    set MM=%date:~3,2%
    set DD=%date:~0,2%

    rem -------------------------------------------------------------------
    rem LOG_FULLFILENAME - Файл журнала [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set LOG_FULLFILENAME=G:\___РАЗБОР\LOG\!YYYY!!MM!!DD!_EveryDay.log
    rem echo LOG_FULLFILENAME: !%LOG_FULLFILENAME!

    rem call :StartLogFile || exit /b 1

    call :AddLog !loTextFile! !PROCESS! "!YYYY!!MM!!DD!_EveryDay ..."

    rem G:\___РАЗБОР\STORE\MHT_LUIS_24_4000\2026\04
    set _DIRECTORY=G:\___РАЗБОР\STORE\MHT_LUIS_24_4000\!YYYY!\!MM!
    call :AddLog !loTextFile! !PROCESS! !_DIRECTORY!
    call :CreateDir !_DIRECTORY!
    echo !CreateDir!
    cd /D "!CreateDir!"
    call D:\TOOLS\TOOLS_BAT\BAT\GGGGMMDD.bat

    rem G:\___РАЗБОР\STORE\YOUTUBE_LUIS_24_4000\2026\04
    set _DIRECTORY=G:\___РАЗБОР\STORE\YOUTUBE_LUIS_24_4000\!YYYY!\!MM!
    call :AddLog !loTextFile! !PROCESS! !_DIRECTORY!
    call :CreateDir !_DIRECTORY!
    echo !CreateDir!
    cd /D "!CreateDir!"
    call D:\TOOLS\TOOLS_BAT\BAT\GGGGMMDD.bat

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

rem =================================================
rem LYRFileUtils.bat
rem =================================================
:LYRFileUtilsINIT
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FullFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileNameWithoutExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileAttr
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileSize
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:COPY_FILE
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:COPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:XCOPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CHANGE_STR
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
