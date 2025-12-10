@echo off
rem -------------------------------------------------------------------
rem DEPLOY_Python.bat
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
        rem set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
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

    set FILEINI=D:\PROJECTS_LYR\CHECK_LIST\PROJECTS.ini
    rem echo FILEINI:!FILEINI!

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
    set O1_Name=O1
    set O1_Caption=O1_Caption
    set O1_Default=O1_Default
    set O1=!O1_Default!
    set PN_CAPTION=!O1_Caption!
    call :Read_P O1 !O1! !O1_Caption! "" || exit /b 1
    rem echo O1:!O1!
    if defined O1 (
        set OPTION=!OPTION! -!O1_Name! "!O1!"
    ) else (
        echo INFO: O1 [O1_Name:!O1_Name! O1_Caption:!O1_Caption!] not defined ...
    )
    rem echo OPTION:!OPTION!

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set ARGS=
    set A1_Name=A1
    set A1_Caption=A1_Caption
    set A1_Default=A1_Default
    set A1=!A1_Default!
    set PN_CAPTION=!A1_Caption!
    call :Read_P A1 !A1! !A1_Caption! "" || exit /b 1
    rem echo A1:!A1!
    if defined A1 (
        set ARGS=!ARGS! "!A1!"
    ) else (
        echo ERROR: A1 [A1_Name:!A1_Name! A1_Caption:!A1_Caption!] not defined ...
        set OK=
        exit /b 1
    )
    rem echo ARGS:!ARGS!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetLenArray (Array)
rem --------------------------------------------------------------------------------
:GetLenArray
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetLenArray
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo %1
    set AArray=%1

    :: Here we initializing an variable named len to calculate length of array
    set len=0
    :: To iterate the element of array
    :Loop 
    :: It will check if the element is defined or not
    if defined Sections[%len%] (
    rem if defined %1[%len%] (
        echo !Sections[%len%]!
        set /a len+=1
        GOTO :Loop 
    )

    set !FUNCNAME!=!len!
    rem echo !FUNCNAME!:!%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_TEST ()
rem --------------------------------------------------------------------------------
:MAIN_TEST
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_TEST
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :GetINI !FILEINI!
    rem call :GetINIPY !FILEINI!
    rem call :GetINIParametr !FILEINI!

    rem call :GetLenArray !Sections!
    rem echo GetLenArray:!GetLenArray!

    rem set /a nmax=SectionsCount-1
    for /L %%i in (0,1,!SectionsCount!) do (
        set Section=!Sections[%%i]!
        rem echo !Section! 

        call :GetINI !FILEINI! !Section!
        rem set /a kmax=ParametersCount-1
        for /L %%i in (0,1,!ParametersCount!) do (
            set Parameter=!Parameters[%%i]!
            rem echo !Parameter!

            call :GetINI !FILEINI! !Section! !Parameter!
            rem echo !GetINI!
            
            rem call :GetINIParametr !FILEINI! !Section! !Parameter!
            rem echo !GetINIParametr!

            rem echo !ParameterValue!
        )
    )

    rem set list=A B C D
    rem for %%a in (%list%) do ( 
    rem     echo %%a
    rem )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_GITIGNORE ()
rem --------------------------------------------------------------------------------
:MAIN_GITIGNORE
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_GITIGNORE
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set gitignoreJava=D:\PROJECTS_LYR\CHECK_LIST\GitHub\PROJECTS\PATTERN\GITIGNORE\Java\.gitignore
    set gitignorePython=D:\PROJECTS_LYR\CHECK_LIST\GitHub\PROJECTS\PATTERN\GITIGNORE\Python\.gitignore

    set Section=PATTERNS
    call :GetINI !FILEINI! !Section!
    rem set /a kmax=ParametersCount-1
    for /L %%i in (0,1,!ParametersCount!) do (
        set Parameter=!Parameters[%%i]!
        rem echo !Parameter!
        call :GetINI !FILEINI! !Section! !Parameter!
        if !Parameter!==GIT (
            set LFileName=!gitignorePython!
            if exist !LFileName! (
                rem echo !ParameterValue!
                call :COPY_FILE !LFileName! !ParameterValue! /Y || exit /b 1
            )
        )
        if !Parameter!==BAT (
            set LFileName=!gitignorePython!
            rem echo LFileName:!LFileName!
            if exist !LFileName! (
                rem echo !ParameterValue!
                call :COPY_FILE !LFileName! !ParameterValue! /Y || exit /b 1
            )
        )
        if !Parameter!==KIX (
            set LFileName=!gitignorePython!
            if exist !LFileName! (
                rem echo !ParameterValue!
                call :COPY_FILE !LFileName! !ParameterValue! /Y || exit /b 1
            )
        )
        if !Parameter!==PowerShell (
            set LFileName=!gitignorePython!
            if exist !LFileName! (
                rem echo !ParameterValue!
                call :COPY_FILE !LFileName! !ParameterValue! /Y || exit /b 1
            )
        )
        if !Parameter!==UNIX (
            set LFileName=!gitignorePython!
            if exist !LFileName! (
                rem echo !ParameterValue!
                call :COPY_FILE !LFileName! !ParameterValue! /Y || exit /b 1
            )
        )
        if !Parameter!==Java (
            set LFileName=!gitignoreJava!
            if exist !LFileName! (
                rem echo !ParameterValue!
                call :COPY_FILE !LFileName! !ParameterValue! /Y || exit /b 1
            )
        )
        if !Parameter!==Pascal_Delphi (
            set LFileName=!gitignorePython!
            if exist !LFileName! (
                rem echo !ParameterValue!
                call :COPY_FILE !LFileName! !ParameterValue! /Y || exit /b 1
            )
        )
        if !Parameter!==Python (
            set LFileName=!gitignorePython!
            if exist !LFileName! (
                rem echo !ParameterValue!
                call :COPY_FILE !LFileName! !ParameterValue! /Y || exit /b 1
            )
        )
    )

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

    set PROJECT_GROUP=ALL

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_DEPLOY - Каталог скриптов DEPLOY
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR_DEPLOY (
        set SCRIPTS_DIR_DEPLOY=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\SCRIPTS_BAT\SRC\99.DEPLOY
    )
    rem echo SCRIPTS_DIR_DEPLOY:!SCRIPTS_DIR_DEPLOY!

    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_BAT.bat
    rem echo APPRUN:!APPRUN!

    if exist "!APPRUN!" (
        call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_KIX.bat
    if exist "!APPRUN!" (
        call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_PS.bat
    if exist "!APPRUN!" (
        call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_GIT.bat
    if exist "!APPRUN!" (
        call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_JAVA.bat
    if exist "!APPRUN!" (
        call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_Python.bat
    if exist "!APPRUN!" (
        call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_Pascal_Delphi.bat
    if exist "!APPRUN!" (
        call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_UNIX.bat
    if exist "!APPRUN!" (
        call !APPRUN!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure TEST_FUNC ()
rem --------------------------------------------------------------------------------
:TEST_FUNC
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

    call :StartLogFile || exit /b 1

    set OK=yes

    call :MAIN_SET_DEFAULT || exit /b 1

    call :MAIN_SET || exit /b 1

    call :MAIN_CHECK_PARAMETR %* || exit /b 1

    if defined OK (
        echo НАЧАЛО

        call :MAIN_GITIGNORE

        call :MAIN_FUNC || exit /b 1

        echo КОНЕЦ
    )

    call :StopLogFile || exit /b 1

    exit /b 0
rem endfunction
rem =================================================

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRConsole.bat
rem =================================================
:LYRConsoleINIT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_00
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_01
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_02
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:FormatColorStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:aListToStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:bListToStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:SetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColorCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColor
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
rem LYRConst.bat
rem =================================================
:LYRConstINIT
%LIB_BAT%\LYRConst.bat %*
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
rem LYRDEPLOY.bat
rem =================================================
:LYRDEPLOYINIT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:CopyFilesFromPATTERN
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:CopyFilesROOT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:SetPROJECT_INI
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:SetREPO_INI
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:REPO_WORK
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:DEPLOY_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:git_pull
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:git_clone
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:PULL_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
rem =================================================
rem LYRDEPLOYTools.bat
rem =================================================
:LYRDEPLOYToolsINIT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_BAT_SCRIPTS_BAT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_BAT_TOOLS_SRC_BAT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_GIT_TOOLS_SRC_GIT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_JAVA_SCRIPTS_JAVA
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_KIX_SCRIPTS_KIX
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_PY_SCRIPTS_PY
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_PY_TOOLS_SRC_PY
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_SH_SCRIPTS_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_SH_TOOLS_SRC_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_SH_TOOLS_SRC_GIT_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
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
:ClearDir
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
:LYRLogINIT
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SETVarLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SHORTLevelName
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__LOG_STR
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogConsole
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
rem LYRParserINI.bat
rem =================================================
:LYRParserINIINIT
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:SetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINIPY
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINIParametr
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetFileParser
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
rem =================================================
rem LYRPY.bat
rem =================================================
:LYRPYINIT
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:VENV_START
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:VENV_STOP
%LIB_BAT%\LYRPY.bat %*
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
