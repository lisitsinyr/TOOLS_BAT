@echo off
rem -------------------------------------------------------------------
rem lyrrar.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo ����� !BATNAME! ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB

    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir!

    rem set PN_CAPTION=���� ��������
    set P1=P1_default
    set P1=
    call :Check_P P1 %1 || exit /b 1
    rem echo P1: %P1%    

    if "!P1!"=="" (
        echo ERROR: �������� P1 �� �����...
        echo �������������: !BATNAME! ����� [�����]
    ) else (
        call :MAIN || exit /b 1
    )

:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure MAIN ()
rem --------------------------------------------------------------------------------
:MAIN
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set OK=yes

    call :ExtractFileName "!P1!" || exit /b 1
    rem echo ExtractFileName: !ExtractFileName!

    call :ExtractFileNameWithoutExt "!P1!" || exit /b 1
    rem echo ExtractFileNameWithoutExt: !ExtractFileNameWithoutExt!

    call :FileAttr "!P1!" || exit /b 1
    rem echo FileAttr: !FileAttr!
    
    call :FullFileName "!P1!" || exit /b 1
    rem echo FullFileName: !FullFileName!

    if "!FOLDER!"=="D" (
        set RARCMD=rar a -r "!ExtractFileName!.rar" "!ExtractFileName!"
    )
    if "!FOLDER!"=="F" (
        set RARCMD=rar a "!ExtractFileNameWithoutExt!.rar" "!P1!"
    )
    if "!FOLDER!"=="" (
        set PN_CAPTION=�����
        set P2=*.*
        call :Check_P P2 %2 || exit /b 1
        rem echo P2: !P2!    

        set RARCMD=rar a -r "!P1!.rar" "!P2!"
    )
    echo RARCMD: !RARCMD!

    !RARCMD!

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
