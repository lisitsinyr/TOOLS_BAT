@echo off
rem -------------------------------------------------------------------
rem PROJECT_PYupdate.bat
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Создание/изменение структуры проекта PROJECT_PY
rem 
rem Usage:
rem   PROJECT_PYupdate.bat <ProjectName>
rem 
rem Arguments:
rem   name - Имя проекта
rem 
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    set DEBUG=

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    echo CurrentDir: !CurrentDir!

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    set OK=yes
    rem echo OK: !OK!
    call :MAIN_INIT %0 || exit /b 1
    call :MAIN_SET || exit /b 1
    call :StartLogFile || exit /b 1
    rem call :MAIN_SYNTAX || exit /b 1
    call :MAIN_CHECK_PARAMETR %* || exit /b 1
    call :MAIN %* || exit /b 1
    call :StopLogFile || exit /b 1

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
        echo ProjectName: !ProjectName!

        set LDir=.devcontainer
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!

        set LDir=.idea
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=.venv
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=.vscode
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=BUILD
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=CONFIG
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=DATA
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=DIST
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=DOC
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=EXE
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=LOG
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=NOTEBOOKS
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=OUT
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=SRC
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=SRC\!ProjectName!
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=TESTS
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!
        set LDir=WORK
        call :AddLog !loAll! !TEXT! CreateDir !LDir! || exit /b 1
        call :CreateDir !LDir!

        set LFileName=.gitmodules
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        call :CreateFile !LFileName!
        set LFileName=.pypirc
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        call :CreateFile !LFileName!
        set LFileName=src\test\__init__.py
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        call :CreateFile !LFileName!
        set LFileName=tests\__init__.py
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        call :CreateFile !LFileName!

        set DIR_TO=!CurrentDir!
        rem echo DIR_TO: !DIR_TO!

        set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
        rem echo DIR_FROM: !DIR_FROM!
        set LFileName=lyrgit_push_main.bat
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        copy "!DIR_FROM!\!LFileName!" "!DIR_TO!" > NUL
        set LFileName=lyrgit_init.bat
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        copy "!DIR_FROM!\!LFileName!" "!DIR_TO!" > NUL

        set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\PATTERN_PY
        rem echo DIR_FROM: !DIR_FROM!
        set LFileName=.gitignore
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        copy "!DIR_FROM!\!LFileName!" "!DIR_TO!" > NUL
        set LFileName=LICENSE
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        copy "!DIR_FROM!\!LFileName!" "!DIR_TO!" > NUL

        set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\BATPY
        rem echo DIR_FROM: !DIR_FROM!
        set LFileName=PROJECT_PYupdate.bat
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        copy "!DIR_FROM!\!LFileName!" "!DIR_TO!" > NUL
        
        set LFileName=UPDATE_!ProjectName!.bat
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        call :CreateFile !LFileName!

        set LFileName=README.md
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        call :CreateFile !LFileName!
        call :FileSize !LFileName!
        if !FileSize!==0 (
            echo !ProjectName! >> !LFileName!
            echo ---------- >> !LFileName!
            echo You can use [GitHub-flavored Markdown]^(https://guides.github.com/features/mastering-markdown/^) >> !LFileName!
        )

        set LFileName=POETRY.ini
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        call :CreateFile !LFileName!
        call :FileSize !LFileName!
        if !FileSize!==0 (
            echo # Это простой файл с настройками >> !LFileName!
            echo PROJECT_NAME=!ProjectName! >> !LFileName!
        )

        set LFileName=PROJECT.ini
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        call :CreateFile !LFileName!
        call :FileSize !LFileName!
        if !FileSize!==0 (
            echo # Это простой файл с настройками >> !LFileName!
            echo PROJECT_NAME=!ProjectName! >> !LFileName!
        )

        set LFileName=REPO.ini
        call :AddLog !loAll! !TEXT! CreateFile !LFileName! || exit /b 1
        call :CreateFile !LFileName!
        call :FileSize !LFileName!
        if !FileSize!==0 (
            echo # Это простой файл с настройками >> !LFileName!
            echo REPO_NAME=!ProjectName! >> !LFileName!
        )
    )

    exit /b 0
:end

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
    rem PROJECTS - имя проекта
    rem -------------------------------------------------------------------
    set PROJECTS=PROJECTS_BAT

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - каталог проектов
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    if "!SCRIPTS_DIR!" == "" (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    )
    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%1
    rem echo PROJECTS_LYR_DIR: !PROJECTS_LYR_DIR!
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
  
    rem -------------------------------------------------------------------
    rem PROJECTS_DIR - каталог проекта
    rem -------------------------------------------------------------------
    set PROJECTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\03_SCRIPT\04_BAT\!PROJECTS!
    rem echo PROJECTS_DIR: !PROJECTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов
    rem -------------------------------------------------------------------
    if "!LIB_BAT!" == "" (
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
    call :__SET_CHECK_PROJECT || exit /b 1
    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT -
    rem set LOG_DT_FORMAT=
    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    rem set LOG_FILENAME_FORMAT=
    rem -------------------------------------------------------------------
    rem LOG_FILE_ADD - Параметры журнала [0]
    if "!LOG_FILE_ADD!"=="" set LOG_FILE_ADD=0
    rem echo LOG_FILE_ADD: !LOG_FILE_ADD!
    rem -------------------------------------------------------------------
    rem LOG_FILE_DT - Параметры журнала [0]
    if "!LOG_FILE_DT!"=="" set LOG_FILE_DT=0
    rem  -------------------------------------------------------------------
    rem LOG_DIR - Каталог журнала [каталог]
    rem set LOG_DIR=
    rem -------------------------------------------------------------------
    rem LOG_FILENAME - Файл журнала [имя]
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

    echo OK: !OK!

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    if not defined PROJECT_NAME (
        set PN_CAPTION=Имя проекта
        set ProjectName=test
        call :Read_P ProjectName %1 || exit /b 1
        rem echo ProjectName: !ProjectName!

        if not defined ProjectName (
            echo ERROR: ProjectName not defined ...
            set OK=
        ) else (
            set OK=yes
        )
    ) else (
        set ProjectName=!PROJECT_NAME!
    )

    exit /b 0

rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
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
:__SET_CHECK_PROJECT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_LOG
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_KIX
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
