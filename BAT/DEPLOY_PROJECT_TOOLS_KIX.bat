@echo off
rem -------------------------------------------------------------------
rem DEPLOY_PROJECT_TOOLS_KIX.bat
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
    rem echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - Каталог проектов LYR
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!
    if not exist "!PROJECTS_LYR_DIR!"\ (
        rem echo INFO: Dir "!PROJECTS_LYR_DIR!" not exist ...
        rem echo INFO: Create "!PROJECTS_LYR_DIR!" ...
        rem mkdir "!PROJECTS_LYR_DIR!"
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов BAT
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        rem set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
    )
    rem echo SCRIPTS_DIR:!SCRIPTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов BAT
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
    )
    rem echo LIB_BAT:!LIB_BAT!
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
rem procedure MAIN_SET_DEFAULT ()
rem --------------------------------------------------------------------------------
:MAIN_SET_DEFAULT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_SET_DEFAULT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem PROJECT_GROUP - группа проектов
    rem -------------------------------------------------------------------
    set PROJECT_GROUP=KIX
    rem -------------------------------------------------------------------
    rem DIR_GROUP_ROOT - каталог группы проектов
    rem -------------------------------------------------------------------
    set DIR_GROUP_ROOT=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\KIX
    rem -------------------------------------------------------------------
    rem DIR_PROJECT_ROOT - Каталог группы проектов
    rem -------------------------------------------------------------------
    set DIR_PROJECTS_ROOT=!DIR_GROUP_ROOT!
    rem -------------------------------------------------------------------
    rem PROJECT_NAME - 
    rem -------------------------------------------------------------------
    set PROJECT_NAME=TOOLS_KIX

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

    rem ------------------------------------------------
    rem PROJECT_GROUP
    rem ------------------------------------------------
    if not defined PROJECT_GROUP (
        call :GetINIParametr !PROJECT_INI! general PROJECT_GROUP || exit /b 1
    )
    rem echo PROJECT_GROUP:!PROJECT_GROUP!

    rem ------------------------------------------------
    rem PROJECT_NAME
    rem ------------------------------------------------
    if not defined PROJECT_NAME (
        call :GetINIParametr !PROJECT_INI! general PROJECT_NAME || exit /b 1
    )
    rem echo PROJECT_NAME:!PROJECT_NAME!

    rem -------------------------------------------------------------------
    rem DIR_GROUP_ROOT - каталог группы проектов
    rem -------------------------------------------------------------------
    if not defined DIR_GROUP_ROOT (
        call :GetINIParametr !PROJECT_INI! general DIR_GROUP_ROOT || exit /b 1
    )
    rem echo DIR_GROUP_ROOT:!DIR_GROUP_ROOT!

    rem -------------------------------------------------------------------
    rem DIR_PROJECTS_ROOT - каталог группы проектов
    rem -------------------------------------------------------------------
    if not defined DIR_PROJECTS_ROOT (
        call :GetINIParametr !PROJECT_INI! general DIR_PROJECTS_ROOT || exit /b 1
    )
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!

    rem ------------------------------------------------
    rem DIR_PROJECT
    rem ------------------------------------------------
    set DIR_PROJECT=!DIR_PROJECTS_ROOT!
    rem echo DIR_PROJECT:!DIR_PROJECT!

    rem ------------------------------------------------
    rem DIR_PROJECT_NAME
    rem ------------------------------------------------
    set DIR_PROJECT_NAME=!DIR_PROJECT!\!PROJECT_NAME!
    rem echo DIR_PROJECT_NAME:!DIR_PROJECT_NAME!

    rem call :GetINIParametr !REPO_INI! general REPO_NAME || exit /b 1
    rem echo REPO_NAME:!REPO_NAME!

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
    set O1_Name=O1
    set O1_Caption=O1_Caption
    set O1_Default=
    set O1=!O1_Default!
    set PN_CAPTION=!O1_Caption!
    rem call :Read_P O1 !O1! || exit /b 1
    rem echo O1:!O1!
    rem if defined O1 (
    rem     set OPTION=!OPTION! -!O1_Name! "!O1!"
    rem ) else (
    rem     echo INFO: O1 [O1_Name:!O1_Name! O1_Caption:!O1_Caption!] not defined ...
    rem )
    rem echo OPTION:!OPTION!

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set ARGS=

    set A1_Name=DIR_PROJECTS_ROOT
    set A1_Caption=DIR_PROJECTS_ROOT
    set A1_Default=%1
    if not defined A1 (
        set A1_Default=!DIR_PROJECTS_ROOT!
    )
    set A1=!A1_Default!
    set PN_CAPTION=!A1_Caption!
    call :Read_P A1 !A1! || exit /b 1
    rem echo A1:!A1!
    if defined A1 (
        set ARGS=!ARGS! "!A1!"
        set DIR_PROJECTS_ROOT=!A1!
    ) else (
        set DIR_PROJECTS_ROOT=
        echo INFO: A1 [A1_Name:!A1_Name! A1_Caption:!A1_Caption!] not defined ... 
    )

    set A2_Name=PROJECT_NAME
    set A2_Caption=PROJECT_NAME
    set A2_Default=%2
    if not defined A2 (
        set A2_Default=!PROJECT_NAME!
    )
    set A2=!A2_Default!
    set PN_CAPTION=!A2_Caption!
    call :Read_P A2 !A2! || exit /b 1
    rem echo A2:!A2!
    if defined A2 (
        set ARGS=!ARGS! !A2!
        set PROJECT_NAME=!A2!
    ) else (
        set PROJECT_NAME=
        echo INFO: A2 [A2_Name:!A2_Name! A2_Caption:!A2_Caption!] not defined ... 
    )

    rem echo ARGS:!ARGS!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_KIX_SCRIPTS_KIX ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_KIX_SCRIPTS_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_KIX_SCRIPTS_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :WritePROCESS FUNCNAME:!FUNCNAME!

    rem --------------------------------------------------------
    rem !DIR_PROJECT_NAME!\SRC\SCRIPTS_BAT -> !DIR_GROUP_ROOT!\TOOLS_BAT\BAT
    rem --------------------------------------------------------
    rem set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\SCRIPTS_KIX\SRC\SCRIPTS_KIX
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_FROM=!DIR_GROUP_ROOT!\PROJECTS_KIX\SCRIPTS_KIX\SRC\SCRIPTS_KIX
    rem echo LDIR_FROM:!LDIR_FROM!

    rem set LDIR_TO=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\TOOLS_BAT\SCRIPTS_KIX
    rem echo LDIR_TO:!LDIR_TO!
    set LDIR_TO=!DIR_PROJECT_NAME!\SCRIPTS_KIX
    rem echo LDIR_TO:!LDIR_TO!

    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (                        
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME% 
    )

    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_PROJECT_NAME!\SRC\SCRIPTS_BAT -> !DIR_GROUP_ROOT!\TOOLS_BAT\BAT
    rem --------------------------------------------------------
    rem set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\SCRIPTS_KIX\SRC\SCRIPTS_KIX
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_FROM=!DIR_GROUP_ROOT!\PROJECTS_KIX\SCRIPTS_KIX\SRC\SCRIPTS_KIX
    rem echo LDIR_FROM:!LDIR_FROM!

    rem set LDIR_TO=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\TOOLS_KIX\KIX
    rem echo LDIR_TO:!LDIR_TO!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem UPDATE_TOOLS_KIX_TOOLS_SRC_KIX ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_KIX_TOOLS_SRC_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_KIX_TOOLS_SRC_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :WritePROCESS FUNCNAME:!FUNCNAME!

    rem --------------------------------------------------------
    rem !DIR_PROJECT_NAME!\SRC\BAT -> !DIR_GROUP_ROOT!\TOOLS_BAT\BAT
    rem --------------------------------------------------------
    rem set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\TOOLS_SRC_KIX\SRC\BAT
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_FROM=!DIR_GROUP_ROOT!\PROJECTS_KIX\TOOLS_SRC_KIX\SRC\BAT
    rem echo LDIR_FROM:!LDIR_FROM!

    rem set LDIR_TO=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\TOOLS_KIX\BAT
    rem echo LDIR_TO:!LDIR_TO!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_PROJECT_NAME!\SRC\LIB -> !DIR_GROUP_ROOT!\TOOLS_BAT\LIB
    rem --------------------------------------------------------
    rem set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\TOOLS_SRC_KIX\SRC\KIX
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_FROM=!DIR_GROUP_ROOT!\PROJECTS_KIX\TOOLS_SRC_KIX\SRC\LIB
    rem echo LDIR_FROM:!LDIR_FROM!

    rem set LDIR_TO=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\TOOLS_KIX\LIB
    rem echo LDIR_TO:!LDIR_TO!
    set LDIR_TO=!DIR_PROJECT_NAME!\LIB
    rem echo LDIR_TO:!LDIR_TO!

    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )

    set LMASK=*.kxl
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CLEAR_TOOLS_KIX ()
rem --------------------------------------------------------------------------------
:CLEAR_TOOLS_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CLEAR_TOOLS_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem --------------------------------------------------------
    rem D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\TOOLS_KIX\BAT - очистка
    rem --------------------------------------------------------
    rem set LDIR_CLEAR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\TOOLS_KIX\BAT
    set LDIR_CLEAR=!DIR_GROUP_ROOT!\TOOLS_KIX\BAT
    rem echo LDIR_CLEAR:!LDIR_CLEAR!

    call :WritePROCESS Очистка !LDIR_CLEAR! ...

    if exist "!LDIR_CLEAR!"\ (
        del /F /S /Q "!LDIR_CLEAR!"\*.bat >> %LOG_FULLFILENAME% 
    ) else (
        mkdir "!LDIR_CLEAR!"              >> %LOG_FULLFILENAME%
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_DEPLOY_PROJECT ()
rem --------------------------------------------------------------------------------
:MAIN_DEPLOY_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DEPLOY_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :CLEAR_TOOLS_KIX
    call :UPDATE_TOOLS_KIX_SCRIPTS_KIX
    call :UPDATE_TOOLS_KIX_TOOLS_SRC_KIX

    call :REPO_WORK !DIR_PROJECT_NAME! 0 || exit /b 1

    rem set DIR_TOOLS_KIX=D:\TOOLS\TOOLS_KIX
    rem call :git_pull !DIR_TOOLS_KIX! || exit /b 1

    rem set PROJECT_NAME=TOOLS_BAT
    call :PULL_PROJECT D:\TOOLS !PROJECT_NAME!

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

    call :MAIN_DEPLOY_PROJECT %* || exit /b 1

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

    call :StartLogFile || exit /b 1

    set OK=yes

    call :MAIN_SET_DEFAULT || exit /b 1

    call :MAIN_SET || exit /b 1

    call :MAIN_CHECK_PARAMETR %* || exit /b 1

    if defined OK (
        call :MAIN_FUNC || exit /b 1
    )

    call :StopLogFile || exit /b 1

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRConst.bat
rem =================================================
:LYRConst
%LIB_BAT%\LYRConst.bat %*
exit /b 0

rem =================================================
rem LYRDEPLOY.bat
rem =================================================
:LYRDEPLOY
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
:PULL_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0

rem =================================================
rem LYRLIB.bat
rem =================================================
:LYRLIB
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
:LYRDateTime
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
:LYRFileUtils
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
:LYRLog
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
:LYRStrUtils
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
:LYRSupport
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
:LYRParserINI
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
:LYRConsole
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
