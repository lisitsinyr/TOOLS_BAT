@echo off
rem -------------------------------------------------------------------
rem LYRLIB.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem --------------------------------------------------------------------------------
rem procedure LYRLIB () -> None
rem --------------------------------------------------------------------------------
:LYRLIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRLIB
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem CONST
    rem -------------------------------------------------------------------

    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------

    rem echo ERROR: function !FUNCNAME! not implemented! ...

    set LYRLIB=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure SET_LIB (ASCRIPT) -> None
rem -----------------------------------------------
:SET_LIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_LIB
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
 
    set ASCRIPT=%1

    call :LYRConst || exit /b 1
    call :LYRDateTime || exit /b 1
    call :LYRFileUtils || exit /b 1
    call :LYRLog || exit /b 1
    call :LYRParserINI || exit /b 1
    call :LYRPY || exit /b 1
    call :LYRStrUtils || exit /b 1
    call :LYRSupport || exit /b 1
    call :LYRConsole || exit /b 1

    call :LYRDEPLOY || exit /b 1
    call :LYRDEPLOYTools || exit /b 1

    call :__SET_VAR_SCRIPT !ASCRIPT! || exit /b 1
    call :__SET_VAR_DEFAULT || exit /b 1
    call :__SET_VAR_PROJECTS || exit /b 1
    call :__SET_LOG || exit /b 1

    set SET_LIB=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure SET_POETRY () -> None
rem --------------------------------------------------------------------------------
:SET_POETRY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_POETRY
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem POETRY - 
    rem -------------------------------------------------------------------
    set APP=poetry
    set OPTION= -v --no-ansi
    set OPTION= -v --ansi
    set ARGS=
    set APPRUN=

    set SET_POETRY=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure SET_KIX () -> None
rem --------------------------------------------------------------------------------
:SET_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem LIB_KIX - Каталог библиотеки KIX [каталог]
    rem -------------------------------------------------------------------
    if not defined LIB_KIX (
        echo INFO: Directory LIB_KIX not set ...
        if "!COMPUTERNAME!"=="!USERDOMAIN!" (
            set LIB_KIX=!SCRIPTS_DIR_KIX!\SRC\LIB
        ) else (
            set LIB_KIX=\\S73FS01\APPInfo\tools\LIB
        )
    )
    if exist !LIB_KIX! (
        echo INFO: Directory !LIB_KIX! exist ...
    ) else (
        echo INFO: Directory !LIB_KIX! not exist ...
        rem exit /b 1
    )
    echo LIB_KIX: !LIB_KIX!

    rem -------------------------------------------------------------------
    rem APP_KIX_DIR - каталог APP_KIX
    rem -------------------------------------------------------------------
    if not defined LIB_KIX (
        set APP_KIX_DIR=!SCRIPTS_DIR_KIX!\SRC\SCRIPTS
    )
    echo APP_KIX_DIR:!APP_KIX_DIR!

    rem -------------------------------------------------------------------
    rem APP_KIX - Скрипт APP_KIX имя
    rem -------------------------------------------------------------------
    if not defined APP_KIX (
        echo ERROR: Script APP_KIX not set...
        exit /b 1
    ) else (
        if exist !APP_KIX! (
            echo INFO: Script !APP_KIX! exist ...
            set APP_KIX_DIR=.
        ) else (
            echo INFO: Script !APP_KIX! not exist ...
            if exist KIX\!APP_KIX! (
                echo INFO: Script KIX\!APP_KIX! exist ...
                set APP_KIX_DIR=KIX
            ) else (
                echo INFO: Script KIX\!APP_KIX! not exist ...
                if exist !APP_KIX!\!APP_KIX! (
                    echo INFO: Script !APP_KIX!\!APP_KIX! exist ...
                    set APP_KIX_DIR=!APP_KIX!
                ) else (
                    if defined APP_KIX_DIR (
                        if exist !APP_KIX_DIR!\!APP_KIX!.kix (
                            echo INFO: Script !APP_KIX_DIR!\!APP_KIX! exist ...
                        ) else (
                            echo ERROR: Script !APP_KIX_DIR!\!APP_KIX! not exist ...
                            exit /b 1
                        )
                    ) else (
                        echo ERROR: Script !APP_KIX!\!APP_KIX! not exist ...
                        exit /b 1
                    )
                )
            )
        )
    )
    echo APP_KIX:!APP_KIX!

    set SET_KIX=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_SCRIPT (AFULLFILENAME) -> None
rem --------------------------------------------------------------------------------
:__SET_VAR_SCRIPT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_VAR_SCRIPT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFULLFILENAME=%1

    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%1
    rem echo SCRIPT_FULLFILENAME:%SCRIPT_FULLFILENAME%
    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%~f1
    rem echo SCRIPT_FULLFILENAME:!SCRIPT_FULLFILENAME!

    rem -------------------------------------------------------------------
    rem SCRIPT_BASEFILENAME - Файл скрипта [имя+расширение]
    rem -------------------------------------------------------------------
    set SCRIPT_BASEFILENAME=%~n1%~x1
    rem echo SCRIPT_BASEFILENAME: !SCRIPT_BASEFILENAME!

    rem -------------------------------------------------------------------
    rem SCRIPT_FILENAME - Файл скрипта [имя]
    rem -------------------------------------------------------------------
    set SCRIPT_FILENAME=%~n1
    rem echo SCRIPT_FILENAME:!SCRIPT_FILENAME!

    rem -------------------------------------------------------------------
    rem SCRIPT_FILEDIR - Файл скрипта: каталог
    rem -------------------------------------------------------------------
    set SCRIPT_FILEDIR=%~d1%~p1
    rem echo SCRIPT_FILEDIR:!SCRIPT_FILEDIR!

    rem -------------------------------------------------------------------
    rem SCRIPT_FILEEXT - Файл скрипта: расширение
    rem -------------------------------------------------------------------
    set SCRIPT_FILEEXT=%~x1
    rem echo SCRIPT_FILEEXT:!SCRIPT_FILEEXT!

    rem -------------------------------------------------------------------
    rem APPName - APP
    rem -------------------------------------------------------------------
    set APPName=%~n1
    rem echo APPName:!APPName!

    set __SET_VAR_SCRIPT=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_DEFAULT () -> None
rem --------------------------------------------------------------------------------
:__SET_VAR_DEFAULT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_VAR_DEFAULT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APP=
    set COMMAND=
    set OPTION=
    set ARGS=
    set APPRUN=

    set touchRUN=touch -f
    set touchRUN=D:\TOOLS\EXE\touch.exe
    set SetINIAPP=D:\TOOLS\EXE\setini.exe
    set GetINIAPP=D:\TOOLS\EXE\getini.exe
    rem set GetINIAPPPY=D:\TOOLS\TOOLS_PY\BAT\GetINI1_py.bat 
    set GetINIAPPPY=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\SCRIPTS_PY\SRC\SCRIPTS_PY\GetINI\GetINI1_py.bat

    rem -------------------------------------------------------------------
    rem DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
    rem -------------------------------------------------------------------
    set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    rem echo DATETIME_STAMP [YYYYMMDDHHMMSS]: !DATETIME_STAMP!

    rem -------------------------------------------------------------------
    rem SLEEP - Number
    rem -------------------------------------------------------------------
    set /a SLEEP=0
    rem echo SLEEP: !SLEEP!

    rem -------------------------------------------------------------------
    rem REPO_INI - Файл с параметрами репозитария
    rem -------------------------------------------------------------------
    set REPO_INI=REPO.ini
    rem echo REPO_INI [REPO.ini]: !REPO_INI!

    rem -------------------------------------------------------------------
    rem REPO_NAME - Имя репозитария
    rem -------------------------------------------------------------------
    set REPO_NAME=

    rem -------------------------------------------------------------------
    rem PROJECT_INI - Файл с параметрами проекта
    rem -------------------------------------------------------------------
    set PROJECT_INI=PROJECT.ini
    rem echo PROJECT_INI [PROJECT.ini]: !PROJECT_INI!

    rem -------------------------------------------------------------------
    rem PROJECT_NAME - Имя проекта
    rem -------------------------------------------------------------------
    set PROJECT_NAME=

    rem -------------------------------------------------------------------
    rem PROJECT_GROUP - Имя проекта
    rem -------------------------------------------------------------------
    set PROJECT_GROUP=

    rem -------------------------------------------------------------------
    rem POETRY_INI - Файл с параметрами проекта
    rem -------------------------------------------------------------------
    set POETRY_INI=POETRY.ini
    rem echo POETRY_INI [POETRY.ini]: !POETRY_INI!

    rem -------------------------------------------------------------------
    rem POETRY_NAME - Имя проекта
    rem -------------------------------------------------------------------
    set POETRY_NAME=

    set __SET_VAR_DEFAULT=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_PROJECTS () -> None
rem --------------------------------------------------------------------------------
:__SET_VAR_PROJECTS
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_VAR_PROJECTS
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_ROOT -
    rem -------------------------------------------------------------------
    if not defined PROJECTS_LYR_ROOT (
        set PROJECTS_LYR_ROOT=D:
    )
    rem echo PROJECTS_LYR_ROOT: !PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR -
    rem -------------------------------------------------------------------
    if not defined PROJECTS_LYR_DIR (
        set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    )
    rem echo PROJECTS_LYR_DIR: !PROJECTS_LYR_DIR!

    rem -------------------------------------------------------------------
    rem PROJECT - проект
    rem -------------------------------------------------------------------
    set PROJECT=
    rem echo PROJECT: !PROJECT!
  
    rem -------------------------------------------------------------------
    rem PROJECT_DIR -
    rem -------------------------------------------------------------------
    set PROJECT_DIR=
    rem echo PROJECT_DIR: !PROJECT_DIR!

    rem -------------------------------------------------------------------
    rem CURRENT_SYSTEM -
    rem -------------------------------------------------------------------
    set CURRENT_SYSTEM=%OS%
    rem echo CURRENT_SYSTEM: !CURRENT_SYSTEM!

    rem -------------------------------------------------------------------
    rem UNAME - COMPUTERNAME
    rem -------------------------------------------------------------------
    set UNAME=%COMPUTERNAME%
    rem echo UNAME: !UNAME!

    rem -------------------------------------------------------------------
    rem USERNAME - USERNAME
    rem -------------------------------------------------------------------
    set USERNAME=%USERNAME%
    rem echo USERNAME: !USERNAME!

    rem -------------------------------------------------------------------
    rem CURRENT_DIR - Текущий каталог
    rem -------------------------------------------------------------------
    set CURRENT_DIR=%CD%
    rem echo CURRENT_DIR: !CURRENT_DIR!

    rem -------------------------------------------------------------------
    rem TEMP_DIR - Временный каталог
    rem -------------------------------------------------------------------
    set TEMP_DIR=%temp%
    rem echo TEMP_DIR: !TEMP_DIR!

    set __SET_VAR_PROJECTS=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_LOG () -> None
rem --------------------------------------------------------------------------------
:__SET_LOG
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_LOG
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem ------------------------------------------------------
    rem LOG_FILESCRIPT - Файл первого скрипта [имя]
    rem ------------------------------------------------------
    set LOG_FILESCRIPT=

    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT_DEFAULT -
    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT_DEFAULT='%Y%m%d'
    set LOG_DT_FORMAT_DEFAULT=%date:~6,4%%date:~3,2%%date:~0,2%
    rem echo LOG_DT_FORMAT_DEFAULT: !LOG_DT_FORMAT_DEFAULT!

    rem -------------------------------------------------------------------
    rem LOG_FILE_ADD - Параметры журнала [0]
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_ADD (
        set /a LOG_FILE_ADD=0
    )
    rem echo LOG_FILE_ADD: !LOG_FILE_ADD!

    rem -------------------------------------------------------------------
    rem LOG_FILE_DT - Параметры журнала [0]
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_DT (
        set /a LOG_FILE_DT=0
    )
    rem echo LOG_FILE_DT: !LOG_FILE_DT!

    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT -
    rem -------------------------------------------------------------------
    rem set LOG_DT_FORMAT=
    if not defined LOG_DT_FORMAT (
        set LOG_DT_FORMAT=!LOG_DT_FORMAT_DEFAULT!
    )
    rem echo LOG_DT_FORMAT: !LOG_DT_FORMAT!

    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    rem -------------------------------------------------------------------
    rem set LOG_FILENAME_FORMAT=
    if not defined LOG_FILENAME_FORMAT (
        set LOG_FILENAME_FORMAT=FILENAME
        rem set LOG_FILENAME_FORMAT=DATETIME
    )
    rem echo LOG_FILENAME_FORMAT [FILENAME,DATETIME,...]: !LOG_FILENAME_FORMAT!

    rem -------------------------------------------------------------------
    rem LOG_DIR - Каталог журнала [каталог]
    rem -------------------------------------------------------------------
    rem set LOG_DIR=
    if not defined LOG_DIR (
        set LOG_DIR=!PROJECTS_LYR_DIR!\LOGS
    )
    rem echo LOG_DIR: !LOG_DIR!
    if not exist !LOG_DIR! (
        echo INFO: Dir !LOG_DIR! not exist ...
        rem echo INFO: Каталог "!LOG_DIR!" не существует...
        echo INFO: Create !LOG_DIR! ...
        mkdir "!LOG_DIR!"
        rem echo ERRORLEVEL: !ERRORLEVEL!
        if not !ERRORLEVEL! EQU 0 (
            echo ERROR: Dir !LOG_DIR! not created...
            exit /b 1
        )
    )

    rem -------------------------------------------------------------------
    rem LOG_FILENAME - Файл журнала [имя]
    rem -------------------------------------------------------------------
    rem set LOG_FILENAME=
    if not defined LOG_FILENAME (
        if "!LOG_FILENAME_FORMAT!"=="FILENAME" (
            set LOG_FILENAME=!SCRIPT_FILENAME!
        ) else (
            if "!LOG_FILENAME_FORMAT!"=="DATETIME" (
                set LOG_FILENAME=!DATETIME_STAMP!
            ) else (
                echo ERROR: LOG_FILENAME_FORMAT not set...
                exit /b 1
            )
        )
    )
    if "!LOG_FILENAME_FORMAT!"=="FILENAME" (
        if LOG_FILE_DT==1 (
           set LOG_FILENAME=!DATETIME_STAMP!_!LOG_FILENAME!
        )
    )
    rem echo LOG_FILENAME: !LOG_FILENAME!

    rem -------------------------------------------------------------------
    rem LOG_FULLFILENAME - Файл журнала [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set LOG_FULLFILENAME=!LOG_DIR!\!LOG_FILENAME!.log
    rem echo LOG_FULLFILENAME: !%LOG_FULLFILENAME!
   
    rem -------------------------------------------------------------------
    rem DirectoryLOG - Каталог журнала
    rem -------------------------------------------------------------------
    set DirectoryLOG=D:\PROJECTS_LYR\LOGS
    rem echo DirectoryLOG:!DirectoryLOG!
    rem -------------------------------------------------------------------
    rem FileNameLOG - Файл журнала
    rem -------------------------------------------------------------------
    set FileNameLOG=!APPName!.log
    rem echo FileNameLOG:!FileNameLOG!
    set FileNameLOGjson=!APPName!_json.log
    rem echo FileNameLOGjson:!FileNameLOGjson!

    set __SET_LOG=

    exit /b 0
rem endfunction
rem =================================================

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRConsole.bat
rem =================================================
:LYRConsole
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
:LYRConst
%LIB_BAT%\LYRConst.bat %*
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
rem LYRDEPLOY.bat
rem =================================================
:LYRDEPLOY
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
:LYRDEPLOYTools
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
:LYRLog
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
:LYRParserINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:SetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINI
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
:LYRPY
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:PY_ENV_START
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:PY_ENV_STOP
%LIB_BAT%\LYRPY.bat %*
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
