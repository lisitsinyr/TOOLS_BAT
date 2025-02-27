@echo off
rem -------------------------------------------------------------------
rem DEPLOY.bat [[lyrxxx_]PATTERN.bat]
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
    rem PROJECTS_LYR_ROOT - ������� ROOT
    rem -------------------------------------------------------------------
    rem set PROJECTS_LYR_ROOT=D:\WORK\WIN
    set PROJECTS_LYR_ROOT=D:
    rem echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - ������� �������� LYR
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
    rem SCRIPTS_DIR - ������� �������� BAT
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        rem set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        rem set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
    )
    rem echo SCRIPTS_DIR:!SCRIPTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - ������� ���������� �������� BAT
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
    )
    rem echo LIB_BAT:!LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: ������� ���������� LYR !LIB_BAT! �� ����������...
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem ���������� ����������
    rem -------------------------------------------------------------------
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    rem -------------------------------------------------------------------
    rem ��������� �����
    rem -------------------------------------------------------------------
    call :SET_LIB %~f0 || exit /b 1
    rem echo CURRENT_DIR: !CURRENT_DIR!

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

    set /a LOG_FILE_ADD=1

    rem ------------------------------------------------
    rem PROJECT_GROUP
    rem ------------------------------------------------
    call :GetINIParametr !PROJECT_INI! general PROJECT_GROUP || exit /b 1

    rem ------------------------------------------------
    rem PROJECT_NAME
    rem ------------------------------------------------
    call :GetINIParametr !PROJECT_INI! general PROJECT_NAME || exit /b 1
    echo ------------------------------------------------
    echo !PROJECT_GROUP!: !PROJECT_NAME!
    echo ------------------------------------------------

    rem -------------------------------------------------------------------
    rem DIR_GROUP_ROOT - ������� ������ �������� BAT
    rem -------------------------------------------------------------------
    if not defined DIR_GROUP_ROOT (
        set DIR_GROUP_ROOT=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT
    )

    rem -------------------------------------------------------------------
    rem DIR_PROJECTS_ROOT - ������� ������ �������� BAT
    rem -------------------------------------------------------------------
    if not defined DIR_PROJECTS_ROOT (
        set DIR_PROJECTS_ROOT=!DIR_GROUP_ROOT!\PROJECTS_BAT
    )

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
    set O1_Caption=O1
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
    set A1_Name=A1
    set A1_Caption=A1
    set A1_Default=
    set A1=!A1_Default!
    set PN_CAPTION=!A1_Caption!
    rem call :Read_P A1 !A1! || exit /b 1
    rem echo A1:!A1!
    rem if defined A1 (
    rem     set ARGS=!ARGS! "!A1!"
    rem ) else (
    rem     echo ERROR: A1 [A1_Name:!A1_Name! A1_Caption:!A1_Caption!] not defined ... 
    rem     set OK=
    rem     exit /b 1
    rem )
    rem echo ARGS:!ARGS!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_BAT ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_BAT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem --------------------------------------------------------
    rem !DIR_PROJECT_NAME!\SRC\BAT -> !DIR_GROUP_ROOT!\TOOLS_BAT\BAT
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_PROJECT_NAME!\SRC\BAT
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_GROUP_ROOT!\TOOLS_BAT\BAT
    rem echo LDIR_TO:!LDIR_TO!
    rem rmdir "!LDIR_TO!"

    rem if exist "!LDIR_TO!" (
    rem     del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    rem ) else (
    rem     mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    rem )

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_PROJECT_NAME!\SRC\BAT\99.[lyr]LYR -> !DIR_GROUP_ROOT!\TOOLS_BAT\BAT
    rem --------------------------------------------------------
    rem set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC\BAT\99.[lyr]LYR
    set LDIR_FROM=!DIR_PROJECT_NAME!\SRC\BAT\99.[lyr]LYR
    rem echo LDIR_FROM:!LDIR_FROM!
    rem set LDIR_TO=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\TOOLS_BAT\BAT
    set LDIR_TO=!DIR_GROUP_ROOT!\TOOLS_BAT\BAT
    rem echo LDIR_TO:!LDIR_TO!
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_PROJECT_NAME!\SRC\LIB -> !DIR_GROUP_ROOT!\TOOLS_BAT\LIB
    rem --------------------------------------------------------
    rem set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC\LIB
    set LDIR_FROM=!DIR_PROJECT_NAME!\SRC\LIB
    rem echo LDIR_FROM:!LDIR_FROM!
    rem set LDIR_TO=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\TOOLS_BAT\LIB
    set LDIR_TO=!DIR_GROUP_ROOT!\TOOLS_BAT\LIB
    rem echo LDIR_TO:!LDIR_TO!
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

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

    call :REPO_WORK !DIR_PROJECT_NAME! 0 || exit /b 1
    call :UPDATE_TOOLS_BAT || exit /b 1

    rem -------------------------------------------------------------------
    rem DIR_PROJECT_ROOT - ������� ������ ��������
    rem -------------------------------------------------------------------
    set DIR_PROJECTS_ROOT=!DIR_GROUP_ROOT!
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!
    set PROJECT_NAME=TOOLS_BAT
    call :DEPLOY_PROJECT

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
    rem call :PressAnyKey || exit /b 1

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
    call :MAIN_SET || exit /b 1
    if defined OK if not defined Read_N (
        call :MAIN_CHECK_PARAMETR %* || exit /b 1
    )
    if defined OK (
        call :MAIN_FUNC || exit /b 1
    )

    call :StopLogFile || exit /b 1
    rem call :PressAnyKey || exit /b 1

    exit /b 0
rem endfunction

rem =================================================
rem ������� LIB
rem =================================================

rem =================================================
rem LYRDEPLOY.bat
rem =================================================
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
rem LYRConst.bat
rem =================================================
:SET_LIB
%LIB_BAT%\LYRConst.bat %*
exit /b 0
:SET_POETRY
%LIB_BAT%\LYRConst.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRConst.bat %*
exit /b 0

rem =================================================
rem LYRDateTime.bat
rem =================================================
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0

rem =================================================
rem LYRFileUtils.bat
rem =================================================
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
:FormatStr
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

rem =================================================
rem LYRSupport.bat
rem =================================================
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

rem =================================================
rem LYRParserINI.bat
rem =================================================
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
