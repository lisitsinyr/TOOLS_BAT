@echo off
rem -------------------------------------------------------------------
rem UPDATE_PROJECTS_GIT_WORK.bat
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

    rem set UPDATE_BAT=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT\BAT
    set UPDATE_BAT=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\PROJECTS_BAT
    rem echo UPDATE_BAT: %UPDATE_BAT%
    set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
    rem echo DIR_FROM: !DIR_FROM!
    set FILES=*.bat
    rem echo FILES: %FILES%

    call :REPO_WORK PROJECTS_GIT  || exit /b 1
    call :REPO_WORK TOOLS_GIT     || exit /b 1

    call :REPO_WORK PROJECTS_UNIX || exit /b 1
    call :REPO_WORK TOOLS_SH      || exit /b 1
    
    call :REPO_WORK PROJECTS_KIX  || exit /b 1
    call :REPO_WORK TOOLS_KIX     || exit /b 1
    
    call :REPO_WORK PROJECTS_BAT  || exit /b 1
    call :REPO_WORK TOOLS_BAT     || exit /b 1

    call :REPO_WORK EXAMPLES_PY   || exit /b 1
    call :REPO_WORK MobileAPP     || exit /b 1
    call :REPO_WORK PROJECTS_PY   || exit /b 1
    call :REPO_WORK TESTS_PY      || exit /b 1
    call :REPO_WORK TOOLS_PY      || exit /b 1
    call :REPO_WORK YOUTUBE       || exit /b 1
    call :REPO_WORK PATTERN_PY    || exit /b 1
    call :REPO_WORK TEST_PY       || exit /b 1

    call :REPO_WORK PROJECTS_JAVA || exit /b 1
    call :REPO_WORK TESTS_JAVA    || exit /b 1
    call :REPO_WORK TOOLS_JAVA    || exit /b 1

    rem call :Pause %SLEEP% || exit /b 1
    rem call :PressAnyKey || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_FUNC (PROJECTS_REPO)
rem --------------------------------------------------------------------------------
:REPO_WORK
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set APROJECTS_REPO=%1
    set DIR_TO=


    if "!APROJECTS_REPO!" == "PROJECTS_GIT" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT
    )
    if "!APROJECTS_REPO!" == "TOOLS_GIT" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT
    )
    if "!APROJECTS_REPO!" == "PROJECTS_UNIX" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX
    )
    if "!APROJECTS_REPO!" == "TOOLS_SH" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH
    )
    if "!APROJECTS_REPO!" == "PROJECTS_KIX" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX
    )
    if "!APROJECTS_REPO!" == "TOOLS_KIX" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
    )
    if "!APROJECTS_REPO!" == "PROJECTS_BAT" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT
    )
    if "!APROJECTS_REPO!" == "TOOLS_BAT" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
    )

    if "!APROJECTS_REPO!" == "EXAMPLES_PY" (
        set /a PROJECTS_PY=1
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\EXAMPLES_PY
    )
    if "!APROJECTS_REPO!" == "MobileAPP" (
        set /a PROJECTS_PY=1
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\MobileAPP
    )
    if "!APROJECTS_REPO!" == "PROJECTS_PY" (
        set /a PROJECTS_PY=1
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\PROJECTS_PY
    )
    if "!APROJECTS_REPO!" == "TESTS_PY" (
        set /a PROJECTS_PY=1
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TESTS_PY
    )
    if "!APROJECTS_REPO!" == "TOOLS_PY" (
        set /a PROJECTS_PY=1
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TOOLS_PY
    )
    if "!APROJECTS_REPO!" == "YOUTUBE" (
        set /a PROJECTS_PY=1
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\YOUTUBE
    )
    if "!APROJECTS_REPO!" == "PATTERN_PY" (
        set /a PROJECTS_PY=1
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\PATTERN_PY
    )
    if "!APROJECTS_REPO!" == "TEST_PY" (
        set /a PROJECTS_PY=1
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TEST_PY
    )

    if "!APROJECTS_REPO!" == "PROJECTS_JAVA" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\PROJECTS_JAVA
    )
    if "!APROJECTS_REPO!" == "TESTS_JAVA" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\TESTS_JAVA
    )
    if "!APROJECTS_REPO!" == "TOOLS_JAVA" (
        set /a PROJECTS_PY=0
        set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\TOOLS_JAVA
    )

    if defined APROJECTS_REPO (
        echo --------------------------------------------------------- >> !LOG_FULLFILENAME!
        rem echo PROJECTS_REPO: !APROJECTS_REPO!
        echo PROJECTS_REPO: !APROJECTS_REPO! >> !LOG_FULLFILENAME!
        rem echo DIR_TO: !DIR_TO!               
        echo DIR_TO: !DIR_TO!               >> !LOG_FULLFILENAME!
        echo --------------------------------------------------------- >> !LOG_FULLFILENAME!

        echo DEL: !DIR_TO!\*.bat                         >> !LOG_FULLFILENAME!
        del !DIR_TO!\*.bat                               

        echo COPY: !DIR_FROM!\lyrgit_push_main.bat       >> !LOG_FULLFILENAME!
        copy !DIR_FROM!\lyrgit_push_main.bat !DIR_TO!    >> !LOG_FULLFILENAME!
        echo COPY: !DIR_FROM!\lyrgit_init.bat            >> !LOG_FULLFILENAME!
        copy !DIR_FROM!\lyrgit_init.bat !DIR_TO!         >> !LOG_FULLFILENAME!

        set LFileName=!UPDATE_BAT!\UPDATE_!PROJECTS_REPO!.bat
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            echo COPY: !LFileName!                        >> !LOG_FULLFILENAME!
            copy !LFileName! !DIR_TO!                     >> !LOG_FULLFILENAME!
        )

        set LFileName=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\TOOLS_PY\BATPY\PROJECT_PYupdate.bat
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            echo COPY: !LFileName!                        >> !LOG_FULLFILENAME!
            if PROJECTS_PY==1 (
                copy !LFileName! !DIR_TO!                     >> !LOG_FULLFILENAME!
            rem ) else (
            rem     del !DIR_TO!\PROJECT_PYupdate.bat
            )
        )
        echo --------------------------------------------------------- >> !LOG_FULLFILENAME!
    )

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
