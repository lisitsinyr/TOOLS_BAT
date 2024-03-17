@echo off
rem -------------------------------------------------------------------
rem lyrrar.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB

    rem set PN_CAPTION=Ввод значения
    set P1=P1_default
    set P1=
    rem echo P1: %P1%
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    rem set PN_CAPTION=Ввод значения
    set P2=P2_default
    set P2=
    call :Check_P P2 %2 || exit /b 1
    echo P2: %P2%    

    call :Check_P P1 %1 || exit /b 1
    rem echo P1: %P1%    
    if "%P1%"=="" (
        echo ERROR: Параметр P1 не задан...
        echo Использование: lyrrar.bat [архив] [файлы...]
    ) else (
        call :MAIN_FUNC
    )

:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    call :ExtractFileName "%P1%" || exit /b 1
    rem echo ExtractFileName: %ExtractFileName%

    call :ExtractFileNameWithoutExt "%P1%" || exit /b 1
    rem echo ExtractFileNameWithoutExt: %ExtractFileNameWithoutExt%

    call :FileAttr "%P1%" || exit /b 1
    rem echo FileAttr: %FileAttr%
    
    call :FullFileName "%P1%" || exit /b 1
    rem echo FullFileName: %FullFileName%

    if "%FOLDER%"=="D" (
        set RARCMD=rar a -r "%ExtractFileName%.rar" "%ExtractFileName%\*.*"
    )
    if "%FOLDER%"=="F" (
        set RARCMD=rar a "%ExtractFileNameWithoutExt%.rar" "%P1%"
    )
    if "%FOLDER%"=="" (
        set RARCMD=rar a -r "%P1%.rar" "%P2%"
    )
    echo RARCMD: %RARCMD%

    %RARCMD%

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
:Check_P
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
