@echo off
rem -------------------------------------------------------------------
rem createPROJECT_PY.bat
rem -------------------------------------------------------------------
rem 
rem Description:
rem   �������� �������
rem 
rem Usage:
rem   createPROJECT_PY <name>
rem 
rem Arguments:
rem   name - ��� �������
rem 
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo ����� !BATNAME! ...

    set DEBUG=

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir!

    rem ���������� ����������
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    set OK=yes
    rem call :MAIN_INIT %0 || exit /b 1
    rem call :MAIN_SET || exit /b 1
    rem call :StartLogFile || exit /b 1
    rem call :MAIN_SYNTAX || exit /b 1
    call :MAIN_CHECK_PARAMETR %* || exit /b 1
    call :MAIN %* || exit /b 1
    rem call :StopLogFile || exit /b 1

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

    if defined OK (

        echo �������� ������� !ProjectName! ...
        echo Directory: !Directory!
        if defined !Directory! (
            if exist "!Directory!"\ (
                echo ERROR: ������� ������� "!Directory!" ����������...
                set delete=
                set PN_CAPTION=�������?
                call :Read_F delete "yN" || exit /b 1
                if defined delete (
                    echo �������� �������� ������� "!Directory!"
                    rmdir "!Directory!" /s
                    rem --------------------------
                    rem POETRY
                    rem --------------------------
                    call lyrpoetry_new.bat --name=!ProjectName! --src !Directory!
                )
            ) else (
                rem --------------------------
                rem POETRY
                rem --------------------------
                call lyrpoetry_new.bat --name=!ProjectName! --src !Directory!
            )
            cd "!Directory!"
        ) else (
            rem --------------------------
            rem POETRY
            rem --------------------------
            call lyrpoetry_new.bat --name=!ProjectName! --src
        )

        rem --------------------------
        rem ��������� ���������
        rem --------------------------
        rem call updatePROJECT_PY.bat

        rem --------------------------
        rem GIT
        rem --------------------------
        rem call lyrgit_init.bat
    )

:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR ()
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set PN_CAPTION=��� �������
    set ProjectName=test
    call :Read_P ProjectName %1 || exit /b 1
    rem echo ProjectName: !ProjectName!

    set PN_CAPTION=������� �������
    set Directory=folder folder
    call :Read_P Directory %1 || exit /b 1
    echo Directory: !Directory!

    if not defined ProjectName (
        echo ERROR: ProjectName not defined ...
        set OK=
    ) else (
        set OK=yes
    )

    exit /b 0
rem endfunction

rem =================================================
rem ������� LIB
rem =================================================
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
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
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
