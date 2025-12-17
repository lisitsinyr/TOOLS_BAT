@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_easy.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    call :MAIN %* || exit /b 1

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem -----------------------------------------------
rem procedure MAIN_INIT ()
rem -----------------------------------------------
:MAIN_INIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_ROOT - Каталог ROOT
    rem -------------------------------------------------------------------
    rem set PROJECTS_LYR_ROOT=D:\WORK\WIN
    set PROJECTS_LYR_ROOT=D:
    rem echo ..S1.. PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - Каталог проектов LYR
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    rem echo ..S1.. PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!
    if not exist "!PROJECTS_LYR_DIR!"\ (
        rem echo ..S1.. INFO: Dir "!PROJECTS_LYR_DIR!" not exist ...
        rem echo ..S1.. INFO: Create "!PROJECTS_LYR_DIR!" ...
        rem mkdir "!PROJECTS_LYR_DIR!"
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов BAT
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        rem set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        rem set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
    )
    rem echo ..S1.. SCRIPTS_DIR:!SCRIPTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов BAT
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
    )
    rem echo ..S1.. LIB_BAT:!LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem Количество аргументов
    rem -------------------------------------------------------------------
    call :Read_N %* || exit /b 1

    rem -------------------------------------------------------------------
    rem Настройка среды
    rem -------------------------------------------------------------------
    call :SET_LIB %~f0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_SET ()
rem --------------------------------------------------------------------------------
:MAIN_SET
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_SET
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR (%*)
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_CHECK_PARAMETR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set OPTION=
    echo OPTION:!OPTION!

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set ARGS=
    echo ARGS:!ARGS!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_FUNC
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    exit /b 0
rem endfunction

rem =================================================
rem procedure MAIN (%*)
rem =================================================
:MAIN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=

    set /a LOG_FILE_ADD=0

    call :MAIN_INIT || exit /b 1

    rem call :StartLogFile || exit /b 1

    set OK=yes
    
    call :MAIN_SET || exit /b 1
    
    call :MAIN_CHECK_PARAMETR %* || exit /b 1
    
    if defined OK (
        call :MAIN_FUNC || exit /b 1
    )
    
    echo НАЧАЛО

    rem echo ..S1.. [101;93m NORMAL FOREGROUND COLORS [0m
    rem echo ..S1.. ^<ESC^>[33m [33mYellow[0m
    rem call :ConsoleTEST_00 %* || exit /b 1
    rem set cFG8_WHITE = 37 &rem Белый
    rem echo ..S1.. cFG8_WHITE:!cFG8_WHITE!
    rem echo ..S1.. [33mYellow[0m

    call :WriteLN !cS_BOLD! !cFG8_GREEN! !cBG8_WHITE! Тест
    call :WriteLN !cS_BOLD! !cFG8_GREEN! !cBG8_WHITE! "Тест Тест Тест"

    call :SetColor !cERROR!
    call :Write Тест
    call :WriteCR
    call :Write Тест Тест Тест
    call :ReSetColor

    call :WriteLOG !lNOTSET! NOTSET
    call :WriteLOG !lDEBUG! DEBUG
    call :WriteLOG !lINFO! INFO
    call :WriteLOG !lWARNING! WARNING
    call :WriteLOG !lERROR! ERROR
    call :WriteLOG !lCRITICAL! CRITICAL
    call :WriteLOG !lBEGIN! BEGIN
    call :WriteLOG !lEND! END
    call :WriteLOG !lPROCESS! PROCESS
    call :WriteLOG !lDEBUGTEXT! DEBUGTEXT
    call :WriteLOG !TEXT! TEXT
    
    call :WriteNOTSET NOTSET NOTSET NOTSET
    call :WriteDEBUG DEBUG DEBUG DEBUG
    call :WriteINFO INFO INFO INFO
    call :WriteWARNING WARNING WARNING WARNING
    call :WriteERROR ERROR ERROR ERROR
    call :WriteCRITICAL CRITICAL CRITICAL CRITICAL
    call :WriteBEGIN BEGIN BEGIN BEGIN
    call :WriteEND END END END
    call :WritePROCESS PROCESS PROCESS PROCESS
    call :WriteDEBUGTEXT DEBUGTEXT DEBUGTEXT DEBUGTEXT
    call :WriteTEXT TEXT TEXT TEXT

    echo КОНЕЦ

    rem call :StopLogFile || exit /b 1

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRConst.bat
rem =================================================
:LYRConstINIT
%LIB_BAT%\LYRConst.bat %*
exit /b 0

rem =================================================
rem LYRDEPLOY.bat
rem =================================================
:LYRDEPLOYINIT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:REPO_WORK
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:git_pull
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:DEPLOY_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0

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

rem =================================================
rem LYRDateTime.bat
rem =================================================
:LYRDateTimeINIT
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
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
:COPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:XCOPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0

rem =================================================
rem LYRLog.bat
rem =================================================
:LYRLogINIT
%LIB_BAT%\LYRLog.bat %*
exit /b 0
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
rem LYRStrUtils.bat
rem =================================================
:LYRStrUtilsINIT
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimLeft
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimRight
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Trim
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Left
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Mid
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimQuotes
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:ListToStr
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0

rem =================================================
rem LYRSupport.bat
rem =================================================
:LYRSupportINIT
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetDir
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetFile
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:FORCicle
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetSET
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetCMD
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:CheckErrorlevel
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem =================================================
rem LYRParserINI.bat
rem =================================================
:LYRParserINIINIT
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:SetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINIParametr
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetFileParser
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0

rem =================================================
rem LYRConsole.bat
rem =================================================
:LYRConsoleINIT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:Write
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLOG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:SetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteNOTSET
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteINFO
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteWARNING
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteERROR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCRITICAL
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteBEGIN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteEND
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WritePROCESS
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUGTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0

rem =================================================
