@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo ����� !BATNAME! ...

    set DEBUG=

    call :MAIN_INIT %0 0 || exit /b 1
    call :MAIN_SET || exit /b 1
    call :StartLogFile || exit /b 1
    rem set DIR_SAVE=!CURRENT_DIR!
    call :MAIN_CHECK_PARAMETR %1 || exit /b 1
    rem call :MAIN_SYNTAX || exit /b 1
    call :MAIN || exit /b 1
    call :StopLogFile || exit /b 1
    rem far -v !LOG_FULLFILENAME!
    rem cd /D !DIR_SAVE!
:Exit
exit /b 0
rem --------------------------------------------------------------------------------

rem -----------------------------------------------
rem procedure MAIN_INIT (FULLFILENAME, DEBUG)
rem -----------------------------------------------
:MAIN_INIT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem PROJECTS - ��� �������
    rem -------------------------------------------------------------------
    set PROJECTS=PROJECTS_BAT

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - ������� ��������
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - ������� ��������
    rem -------------------------------------------------------------------
    if "!SCRIPTS_DIR%!" == "" (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    )
    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - ���� ������� [�������+���+����������]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%1
    rem echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
  
    rem -------------------------------------------------------------------
    rem PROJECTS_DIR - ������� �������
    rem -------------------------------------------------------------------
    set PROJECTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\03_SCRIPT\04_BAT\!PROJECTS!
    rem echo PROJECTS_DIR: !PROJECTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - ������� ���������� ��������
    rem -------------------------------------------------------------------
    if "!LIB_BAT!" == "" (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
        rem echo LIB_BAT: !LIB_BAT!
    )
    if not exist !LIB_BAT!\ (
        echo ERROR: ������� ���������� LYR !LIB_BAT! �� ����������...
        exit /b 0
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_KIX - ������� �������� KIX
    rem -------------------------------------------------------------------
    if "!SCRIPTS_DIR_KIX!" == "" (
        set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
    )
    rem echo SCRIPTS_DIR_KIX: !SCRIPTS_DIR_KIX!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_SET ()
rem -----------------------------------------------
:MAIN_SET
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :__SET_VAR_DEFAULT !DEBUG! || exit /b 1
    call :__SET_VAR_SCRIPT !SCRIPT_FULLFILENAME! || exit /b 1
    call :__SET_VAR_PROJECTS || exit /b 1
    call :__SET_CHECK_REPO || exit /b 1
    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT -
    rem set LOG_DT_FORMAT=
    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - ������ ����� ����� ������� [FILENAME,DATETIME,...]
    rem set LOG_FILENAME_FORMAT=
    rem -------------------------------------------------------------------
    rem LOG_FILE_ADD - ��������� ������� [0]
    if "!LOG_FILE_ADD!"=="" set LOG_FILE_ADD=0
    rem echo LOG_FILE_ADD: !LOG_FILE_ADD!
    rem -------------------------------------------------------------------
    rem LOG_FILE_DT - ��������� ������� [0]
    if "!LOG_FILE_DT!"=="" set LOG_FILE_DT=0
    rem  -------------------------------------------------------------------
    rem LOG_DIR - ������� ������� [�������]
    rem set LOG_DIR=
    rem -------------------------------------------------------------------
    rem LOG_FILENAME - ���� ������� [���]
    rem set LOG_FILENAME=
    call :__SET_LOG || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR ()
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set PN_CAPTION=���� �������� P1
    set P1=P1_default
    set P1=
    call :Check_P P1 %1 || exit /b 1
    rem echo P1: !P1!

    rem call :AddLog !loStandard! !TEXT! "P1: !P1!" || exit /b 1
    rem call :AddLog !loTextFile! !TEXT! "P1: !P1!" || exit /b 1
    call :AddLog !loAll! !TEXT! P1: !P1! || exit /b 1
    call :AddLog !loAll! !INFO! P1: !P1! || exit /b 1

    rem set F=LYRLog.txt
    rem call :AddLogFile !loAll! !F!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_SYNTAX ()
rem --------------------------------------------------------------------------------
:MAIN_SYNTAX
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    exit /b 0
rem endfunction

rem =================================================
rem procedure MAIN ()
rem =================================================
:MAIN
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :MAIN_FUNC || exit /b 1

    rem call :Pause !SLEEP! || exit /b 1
    rem call :PressAnyKey || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    exit /b 0
rem endfunction

rem =================================================
rem ������� LIB
rem =================================================
rem __SET_LIB.bat
rem =================================================
:__SET_VAR_SCRIPT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_DEFAULT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_PROJECTS
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_CHECK_REPO
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_LOG
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
rem =================================================
rem LYRConst.bat
rem =================================================
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
:CurrentDir
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
rem =================================================
rem LYRSupport.bat
rem =================================================
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
