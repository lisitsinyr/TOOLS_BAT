@echo off
rem -------------------------------------------------------------------
rem UPDATE_PROJECTS_GIT.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem LIB_BAT - каталог библиотеки скриптов
    rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
    rem -------------------------------------------------------------------
    call :MAIN_INIT %* || exit /b 1

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    call :SET_LIB %0 || exit /b 1
    rem echo CURRENT_DIR: !CURRENT_DIR!

    call :StartLogFile || exit /b 1
    set OK=yes
    call :MAIN_SET %* || exit /b 1
    if defined OK if not defined Read_N (
        call :MAIN_CHECK_PARAMETR %* || exit /b 1
    )
    if defined OK (
        call :MAIN %* || exit /b 1
    )
    call :StopLogFile || exit /b 1

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem -----------------------------------------------
rem procedure MAIN_INIT (FULLFILENAME, DEBUG)
rem -----------------------------------------------
:MAIN_INIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    )
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
        rem echo LIB_BAT: !LIB_BAT!
    )
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 0
    )
    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR_KIX (
        set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
    )
    rem echo SCRIPTS_DIR_KIX: !SCRIPTS_DIR_KIX!

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
rem procedure MAIN_CHECK_PARAMETR ()
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

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    
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

    call :UPDATE_PROJECTS_GIT_WORK || exit /b 1
    call :COPY_BAT || exit /b 1
    call :COPY_BAT_KIX || exit /b 1
    call :COPY_SH || exit /b 1
    call :TOOLS_SH_git_push || exit /b 1
    call :PROJECTS_GIT_git_push || exit /b 1
    call :TOOLS_GIT_git_push || exit /b 1
    call :TOOLS_GIT_git_pull || exit /b 1

    rem call :Pause %SLEEP% || exit /b 1
    rem call :PressAnyKey || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure COPY_BAT ()
rem --------------------------------------------------------------------------------
:COPY_BAT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ---------------------------------------------------------
    echo 1.COPY: PROJECTS_GIT\TOOLS_GIT\BAT\*.bat - TOOLS_GIT\BAT
    echo ---------------------------------------------------------
    set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT
    echo DIR_FROM: %DIR_FROM%
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT\BAT
    echo DIR_TO: %DIR_TO%
    set FILES=*.bat
    del %DIR_TO%\%FILES%
    echo FILES: %FILES%
    for /R %DIR_FROM% %%f in (%FILES%) do (
        rem echo %%~nf%%~xf
        echo %%f             >> %LOG_FULLFILENAME%
        copy %%f %DIR_TO%\   >> %LOG_FULLFILENAME%
    )
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure COPY_BAT_KIX ()
rem --------------------------------------------------------------------------------
:COPY_BAT_KIX
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ---------------------------------------------------------
    echo 2.COPY: PROJECTS_GIT\TOOLS_GIT\BAT_KIX\*.bat - TOOLS_GIT\BAT_KIX
    echo ---------------------------------------------------------
    set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT_KIX
    echo DIR_FROM: %DIR_FROM%
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT\BAT_KIX
    echo DIR_TO: %DIR_TO%
    set FILES=*.bat
    del %DIR_TO%\%FILES%
    echo FILES: %FILES%
    for /R %DIR_FROM% %%f in (%FILES%) do (
        rem echo %%~nf%%~xf
        echo %%f             >> %LOG_FULLFILENAME%
        copy %%f %DIR_TO%\   >> %LOG_FULLFILENAME%
    )
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure COPY_SH ()
rem --------------------------------------------------------------------------------
:COPY_SH
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ---------------------------------------------------------
    echo 3.COPY: PROJECTS_GIT\SH\*.sh - TOOLS_SH\SH_GIT
    echo ---------------------------------------------------------
    set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\SH
    echo DIR_FROM: %DIR_FROM%
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH\SH_GIT
    echo DIR_TO: %DIR_TO%
    set FILES=*.sh
    echo FILES: %FILES%
    del %DIR_TO%\%FILES%
    for /R %DIR_FROM% %%f in (%FILES%) do (
        rem echo %%~nf%%~xf
        echo %%f             >> %LOG_FULLFILENAME%
        copy %%f %DIR_TO%\   >> %LOG_FULLFILENAME%
    )
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure TOOLS_SH_git_push ()
rem --------------------------------------------------------------------------------
:TOOLS_SH_git_push
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ---------------------------------------------------------
    echo 4.git push TOOLS_SH:
    echo ---------------------------------------------------------
    set DIR_TOOLS_SH=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH
    cd /D %DIR_TOOLS_SH%
    call lyrgit_push_main.bat
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure PROJECTS_GIT_git_push ()
rem --------------------------------------------------------------------------------
:PROJECTS_GIT_git_push
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ---------------------------------------------------------
    echo 5.git push PROJECTS_GIT:
    echo ---------------------------------------------------------
    set DIR_PROJECTS_GIT=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT
    cd /D %DIR_PROJECTS_GIT%
    call lyrgit_push_main.bat
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure TOOLS_GIT_git_push ()
rem --------------------------------------------------------------------------------
:TOOLS_GIT_git_push
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ---------------------------------------------------------
    echo 6.git push TOOLS_GIT:
    echo ---------------------------------------------------------
    set DIR_TOOLS_GIT=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT
    cd /D %DIR_TOOLS_GIT%
    call lyrgit_push_main.bat
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure TOOLS_GIT_git_pull ()
rem --------------------------------------------------------------------------------
:TOOLS_GIT_git_pull
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ---------------------------------------------------------
    echo 7.git pull TOOLS_GIT:
    echo ---------------------------------------------------------
    set DIR_TOOLS_GIT=D:\TOOLS\TOOLS_GIT
    cd /D %DIR_TOOLS_GIT%
    git pull    
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_PROJECTS_GIT_WORK ()
rem --------------------------------------------------------------------------------
:UPDATE_PROJECTS_GIT_WORK
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo --------------------------- >> %LOG_FULLFILENAME%
    echo 6.UPDATE_PROJECTS_GIT_WORK: >> %LOG_FULLFILENAME%
    echo --------------------------- >> %LOG_FULLFILENAME%
    set UPDATE_PROJECTS_GIT_WORK=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\PROJECTS_BAT
    call %UPDATE_PROJECTS_GIT_WORK%\UPDATE_PROJECTS_GIT_WORK.bat
    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem =================================================
rem LYRConst.bat
rem =================================================
:SET_LIB
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
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
