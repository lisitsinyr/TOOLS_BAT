@echo off
rem -------------------------------------------------------------------
rem LYRDEPLOY.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem Выход из сценария. Дальше - только функции.
    exit /b 0
:end

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRDEPLOYINIT () -> None
rem --------------------------------------------------------------------------------
:LYRDEPLOYINIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRDEPLOYINIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem CONST
    rem -------------------------------------------------------------------
    set GFILEINI=D:\PROJECTS_LYR\CHECK_LIST\PROJECTS.ini

    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------
    set GPROJECTS_GROUP=BAT
    set GPROJECTS_GROUP=

    set GPROJECTS_DIR_ROOT=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT
    set GPROJECTS_DIR_ROOT=
    set GPROJECTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT
    set GPROJECTS_DIR=
    
    set GPROJECT_NAME=

    set /a GPROJECT_DEPLOY=0

    set GPROJECT_PATTERN_DIR=
    
    set GPROJECT_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    set GPROJECT_DIR=

    set Gurl_github=git@github.com:lisitsinyr/TOOLS_SRC_BAT.git
    set Gurl_github=

    set GPROJECTS_INI=

    rem echo ERROR: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure DEPLOY_PROJECTS (PROJECTS_INI) -> None
rem --------------------------------------------------------------------------------
:DEPLOY_PROJECTS
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=DEPLOY_PROJECTS
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APROJECTS_INI=%~1
    rem echo APROJECTS_INI:!APROJECTS_INI!
    set __DEPLOY_PROJECTS_INI=!APROJECTS_INI!
    rem echo __DEPLOY_PROJECTS_INI:!__DEPLOY_PROJECTS_INI!

    call :GetINIParametr2 "!APROJECTS_INI!" PROJECTS_GROUP "" PROJECTS_GROUP
    rem call :GetINI "!__DEPLOY_PROJECTS_INI!" PROJECTS_GROUP
    set /a kmax=!KeyNamesCount!
    echo ..2.. kmax:!kmax!
    set /a m=0
    for /L %%i in (0,1,!kmax!) do (
        rem set LKeyName=!KeyNames[%%i]!
        set LKeyName=!PROJECTS_GROUP[%%i]!
        rem echo ..2.. LKeyName:!LKeyName!

        call :GetINIParametr "!__DEPLOY_PROJECTS_INI!" PROJECTS_GROUP !LKeyName!
        rem call :GetINI "!__DEPLOY_PROJECTS_INI!" PROJECTS_GROUP !LKeyName!
        rem echo ..2.. KeyValue:!KeyValue!

        set LPROJECTS_GROUP_INI=!KeyValue!\!LKeyName!.ini
        echo ..2.. LPROJECTS_GROUP_INI:!LPROJECTS_GROUP_INI!

        call :DEPLOY_PROJECTS_GROUP !LKeyName! !LPROJECTS_GROUP_INI!

        pause
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure DEPLOY_PROJECTS_GROUP (PROJECTS_GROUP PROJECTS_INI) -> None
rem --------------------------------------------------------------------------------
:DEPLOY_PROJECTS_GROUP
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=DEPLOY_PROJECTS_GROUP
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APROJECTS_GROUP=%~1
    rem echo ..2.. APROJECTS_GROUP:!APROJECTS_GROUP!
    set APROJECTS_INI=%~2
    rem echo ..2.. APROJECTS_INI:!APROJECTS_INI!

    call :GetINIParametr2 "!APROJECTS_INI!" PROJECTS_NAME "" PROJECTS_NAME
    set /a kmax=!KeyNamesCount!
    rem echo ..2.. kmax:!kmax!
    
    for /L %%i in (0,1,!kmax!) do (
        rem set LKeyName=!KeyNames[%%i]!
        set LKeyName=!PROJECTS_NAME[%%i]!
        rem echo ..2.. LKeyName:!LKeyName!

        call :GetINIParametr "!APROJECTS_INI!" PROJECTS_NAME !LKeyName!
        if !KeyValue! EQU 1 (
            rem echo ..2.. DEPLOY !APROJECTS_GROUP! !LKeyName!
            call :DEPLOY_PROJECT !APROJECTS_GROUP! !LKeyName!
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure DEPLOY_PROJECT (PROJECTS_GROUP PROJECT_NAME) -> None
rem --------------------------------------------------------------------------------
:DEPLOY_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=DEPLOY_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APROJECTS_GROUP=%~1
    rem echo APROJECTS_GROUP:!APROJECTS_GROUP!
    set APROJECT_NAME=%~2
    rem echo APROJECT_NAME:!APROJECT_NAME!

    call :GET_project_INFO !APROJECTS_GROUP! !APROJECT_NAME!

    if !GPROJECT_DEPLOY! EQU 1 (

        call :WriteBEGIN .... Старт DEPLOY проекта !GPROJECTS_GROUP! !GPROJECT_NAME! ...
    
        if !GPROJECT_NAME!==TOOLS_BAT (
            call :ClearDir !GPROJECT_DIR!\BAT *.bat
            call :UPDATE_TOOLS_BAT_SCRIPTS_BAT
            call :UPDATE_TOOLS_BAT_TOOLS_SRC_BAT
            call :__REPO_WORK !GPROJECT_DIR!
            call :PULL_PROJECT D:\TOOLS !GPROJECT_NAME!
            exit /b 0
        )    
    
        if !GPROJECT_NAME!==TOOLS_GIT (
            call :ClearDir !GPROJECT_DIR!\BAT *.bat
            call :ClearDir !GPROJECT_DIR!\BAT_KIX *.bat
            call :UPDATE_TOOLS_GIT_TOOLS_SRC_GIT
            call :__REPO_WORK !GPROJECT_DIR!
            call :PULL_PROJECT D:\TOOLS !GPROJECT_NAME!
            exit /b 0
        )    
    
        if !GPROJECT_NAME!==TOOLS_JAVA (
            call :ClearDir !GPROJECT_DIR!\BAT *.bat
            call :UPDATE_TOOLS_JAVA_SCRIPTS_JAVA
            call :UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA
            call :__REPO_WORK !GPROJECT_DIR!
            call :PULL_PROJECT D:\TOOLS !GPROJECT_NAME!
            exit /b 0
        )    
    
        if !GPROJECT_NAME!==TOOLS_KIX (
            call :ClearDir !GPROJECT_DIR!\BAT *.bat
            call :UPDATE_TOOLS_KIX_SCRIPTS_KIX
            call :UPDATE_TOOLS_KIX_TOOLS_SRC_KIX
            call :__REPO_WORK !GPROJECT_DIR!
            call :PULL_PROJECT D:\TOOLS !GPROJECT_NAME!
            exit /b 0
        )    
    
        if !GPROJECT_NAME!==TOOLS_PY (
            call :ClearDir !GPROJECT_DIR!\BAT *.bat
            call :UPDATE_TOOLS_PY_SCRIPTS_PY
            call :UPDATE_TOOLS_PY_TOOLS_SRC_PY
            call :__REPO_WORK !GPROJECT_DIR!
            call :PULL_PROJECT D:\TOOLS !GPROJECT_NAME!
            exit /b 0
        )    
    
        if !GPROJECT_NAME!==TOOLS_SH (
            call :ClearDir !GPROJECT_DIR!\SH_GIT *.sh
            call :UPDATE_TOOLS_SH_SCRIPTS_SH
            call :UPDATE_TOOLS_SH_TOOLS_SRC_SH
            call :UPDATE_TOOLS_SH_TOOLS_SRC_GIT_SH
            call :__REPO_WORK !GPROJECT_DIR!
            call :PULL_PROJECT D:\TOOLS !GPROJECT_NAME!
            exit /b 0
        )    
    
        if !GPROJECT_NAME!==TOOLS_PS (
            call :__REPO_WORK !GPROJECT_DIR!
            call :PULL_PROJECT D:\TOOLS !GPROJECT_NAME!
            exit /b 0
        )    
    
        call :__REPO_WORK !GPROJECT_DIR!
    
        call :WriteBEGIN .... Стоп DEPLOY проекта !GPROJECTS_GROUP! !GPROJECT_NAME! ...

    ) else (
        call :WriteINFO .... проект !GPROJECTS_GROUP! !GPROJECT_NAME! пропущен ...
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GET_project_INFO (PROJECTS_GROUP PROJECT_NAME) -> None
rem --------------------------------------------------------------------------------
:GET_project_INFO
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_project_INFO
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APROJECTS_GROUP=%~1
    rem echo APROJECTS_GROUP:!APROJECTS_GROUP!
    set APROJECT_NAME=%~2
    rem echo APROJECT_NAME:!APROJECT_NAME!

    if defined APROJECTS_GROUP if defined APROJECT_NAME (
        rem echo APROJECTS_GROUP APROJECT_NAME - True
        set res=Yes
    ) else (
        rem echo APROJECTS_GROUP APROJECT_NAME - False
        set res=
    )
    rem if defined APROJECTS_GROUP (
    rem     if defined APROJECT_NAME (
    rem         set res=Yes
    rem     )
    rem )
    rem if defined res (

    if defined APROJECTS_GROUP ( if defined APROJECT_NAME (
        rem echo !APROJECTS_GROUP! !APROJECT_NAME! - True
        set GPROJECTS_GROUP=!APROJECTS_GROUP!
        set GPROJECT_NAME=!APROJECT_NAME!
        rem ------------------------------------------------
        rem GPROJECTS_DIR_ROOT
        rem ------------------------------------------------
        call :GetINIParametr !GFILEINI! PROJECTS_GROUP !GPROJECTS_GROUP! || exit /b 1
        set GPROJECTS_DIR_ROOT=!KeyValue!
        rem echo GPROJECTS_DIR_ROOT:!GPROJECTS_DIR_ROOT!
        )
    ) else (
        rem echo .... APROJECTS_GROUP APROJECT_NAME - False
        if not exist !cd!\PROJECT.ini (
            echo INFO: !cd!\PROJECT.ini not exist ...
        ) else (
            rem ------------------------------------------------
            rem GPROJECT_DIR
            rem ------------------------------------------------
            set GPROJECT_DIR=!cd!
            rem echo GPROJECT_DIR:!GPROJECT_DIR!

            rem ------------------------------------------------
            rem GPROJECTS_GROUP
            rem ------------------------------------------------
            call :GetINIParametr !GPROJECT_DIR!\PROJECT.ini general PROJECTS_GROUP || exit /b 1
            set GPROJECTS_GROUP=!KeyValue!
            rem echo GPROJECTS_GROUP:!GPROJECTS_GROUP!
        
            rem -------------------------------------------------------------------
            rem GPROJECTS_DIR_ROOT
            rem -------------------------------------------------------------------
            call :GetINIParametr !GPROJECT_DIR!\PROJECT.ini general PROJECTS_DIR_ROOT || exit /b 1
            set GPROJECTS_DIR_ROOT=!KeyValue!
            rem echo GPROJECTS_DIR_ROOT:!GPROJECTS_DIR_ROOT!
        
            rem ------------------------------------------------
            rem GPROJECT_NAME
            rem ------------------------------------------------
            call :GetINIParametr !GPROJECT_DIR!\PROJECT.ini general PROJECT_NAME || exit /b 1
            set GPROJECT_NAME=!KeyValue!
            rem echo GPROJECT_NAME:!GPROJECT_NAME!
        )
    )

    set GPROJECTS_INI=!GPROJECTS_DIR_ROOT!\!GPROJECTS_GROUP!.ini
    rem echo GPROJECTS_INI:!GPROJECTS_INI!

    rem ------------------------------------------------
    rem GPROJECT_DIR
    rem ------------------------------------------------
    rem call :GetINI !GPROJECTS_INI! !GPROJECT_NAME! PROJECT_DIR || exit /b 1
    call :GetINIParametr !GPROJECTS_INI! !GPROJECT_NAME! PROJECT_DIR || exit /b 1
    set GPROJECT_DIR=!KeyValue!
    rem echo GPROJECT_DIR:!GPROJECT_DIR!

    rem ------------------------------------------------
    rem GPROJECT_PATTERN_DIR
    rem ------------------------------------------------
    rem call :GetINI !GPROJECTS_INI! !GPROJECT_NAME! PROJECT_PATTERN_DIR || exit /b 1
    call :GetINIParametr !GPROJECTS_INI! !GPROJECT_NAME! PROJECT_PATTERN_DIR || exit /b 1
    set GPROJECT_PATTERN_DIR=!KeyValue!
    rem echo GPROJECT_PATTERN_DIR:!GPROJECT_PATTERN_DIR!

    rem ------------------------------------------------
    rem Gurl_github
    rem ------------------------------------------------
    rem call :GetINI !GPROJECTS_INI! !GPROJECT_NAME! url || exit /b 1
    call :GetINIParametr !GPROJECTS_INI! !GPROJECT_NAME! url || exit /b 1
    set Gurl_github=!KeyValue!
    rem echo Gurl_github:!Gurl_github!

    rem ------------------------------------------------
    rem GPROJECT_DEPLOY
    rem ------------------------------------------------
    rem call :GetINI !GPROJECTS_INI! PROJECTS_NAME !GPROJECT_NAME! || exit /b 1
    call :GetINIParametr !GPROJECTS_INI! PROJECTS_NAME !GPROJECT_NAME! || exit /b 1
    if not defined KeyValue (
        set /a GPROJECT_DEPLOY=0
    ) else (
        set /a GPROJECT_DEPLOY=!KeyValue!
    )
    rem echo GPROJECT_DEPLOY:!GPROJECT_DEPLOY!

    if not defined GPROJECT_PATTERN_DIR (
        rem ------------------------------------------------
        rem PROJECTS_PATTERN_DIR
        rem ------------------------------------------------
        rem call :GetINI !GPROJECTS_INI! general PROJECTS_PATTERN_DIR || exit /b 1
        call :GetINIParametr !GPROJECTS_INI! general PROJECTS_PATTERN_DIR || exit /b 1
        set GPROJECT_PATTERN_DIR=!KeyValue!
        rem echo GPROJECT_PATTERN_DIR:!GPROJECT_PATTERN_DIR!
    )

    if not defined GPROJECT_PATTERN_DIR (
        echo INFO: GPROJECT_PATTERN_DIR not defined ...
    ) else (
        if not exist !GPROJECT_PATTERN_DIR!\ (
            echo INFO: !GPROJECT_PATTERN_DIR! not exist ...
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __CopyFromPATTERN_ALL () -> None
rem --------------------------------------------------------------------------------
:__CopyFromPATTERN_ALL
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__CopyFromPATTERN_ALL
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LDirPATTERN=%~1

    if defined LDirPATTERN if exist "!LDirPATTERN!"\ ( 

        rem ------------------------------------------------------
        rem 
        rem ------------------------------------------------------
        set LFileName=PROJECT.INI
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! /Y || exit /b 1
            )
        )

        set LFileName=.editorconfig
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
            )
        )

        set LFileName=.gitignore
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! /Y || exit /b 1
            )
        )

        set LFileName=.gitmodules
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
            )
        )

        set LFileName=README.md
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
            )
        )

        set LFileName=LICENSE
        if exist !LDirPATTERN!\!LFileName! (
            call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! /Y || exit /b 1
        )

        rem set LARG=/D /S /E /V /F /H /R /K /Y /O
        set LMASK=*.*

        set LDIR_FROM=!LDirPATTERN!\BUILD
        set LDIR_TO=!GPROJECT_DIR!\BUILD
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )

        set LDIR_FROM=!LDirPATTERN!\CONFIG
        set LDIR_TO=!GPROJECT_DIR!\CONFIG
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        
        set LDIR_FROM=!LDirPATTERN!\DATA
        set LDIR_TO=!GPROJECT_DIR!\DATA
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        
        set LDIR_FROM=!LDirPATTERN!\DIST
        set LDIR_TO=!GPROJECT_DIR!\DIST
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        
        set LDIR_FROM=!LDirPATTERN!\DOC
        set LDIR_TO=!GPROJECT_DIR!\DOC
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        
        set LDIR_FROM=!LDirPATTERN!\EXE
        set LDIR_TO=!GPROJECT_DIR!\EXE
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        
        set LDIR_FROM=!LDirPATTERN!\LOG
        set LDIR_TO=!GPROJECT_DIR!\LOG
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        
        set LDIR_FROM=!LDirPATTERN!\OUT
        set LDIR_TO=!GPROJECT_DIR!\OUT
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        
        set LDIR_FROM=!LDirPATTERN!\SRC
        set LDIR_TO=!GPROJECT_DIR!\SRC
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
            rem call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        
        set LDIR_FROM=!LDirPATTERN!\TESTS
        set LDIR_TO=!GPROJECT_DIR!\TESTS
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        
        set LDIR_FROM=!LDirPATTERN!\WORK
        set LDIR_TO=!GPROJECT_DIR!\WORK
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )

        rem ------------------------------------------------------
        rem PATTERN_PYTHON
        rem ------------------------------------------------------
        set LFileName=pyproject.toml
        if exist !LDirPATTERN!\!LFileName! if not exist !GPROJECT_DIR!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
            )
        )
        
        set LFileName=.env
        if exist !LDirPATTERN!\!LFileName! if not exist !GPROJECT_DIR!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
            )
        )
        
        set LFileName=.python-version
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
            )
        )
        
        set LDIR_FROM=!LDirPATTERN!\NOTEBOOKS
        set LDIR_TO=!GPROJECT_DIR!\NOTEBOOKS
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )

        rem ------------------------------------------------------
        rem CopyFilesROOT
        rem ------------------------------------------------------
        set LDirectory=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\SRC\BAT\A.WORK
        set LFileName=lyrgit_push_main.bat
        if exist !LDirectory!\!LFileName! (
            copy !LDirectory!\!LFileName! > NUL
        )
        
        set LFileName=lyrgit_pull.bat
        if exist !LDirectory!\!LFileName! (
            copy !LDirectory!\!LFileName! > NUL
        )
        
        set LDirectory=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\SCRIPTS_BAT\SRC\99.DEPLOY
        set LFileName=DEPLOY_PROJECT.bat
        if exist !LDirectory!\!LFileName! (
            copy !LDirectory!\!LFileName! > NUL
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SetPROJECT_INI () -> None
rem --------------------------------------------------------------------------------
:__SetPROJECT_INI
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SetPROJECT_INI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetINI !GPROJECT_DIR!\PROJECT.ini general PROJECTS_GROUP !GPROJECTS_GROUP!
    call :SetINI !GPROJECT_DIR!\PROJECT.ini general PROJECT_NAME !GPROJECT_NAME!
    call :SetINI !GPROJECT_DIR!\PROJECT.ini general PROJECTS_DIR_ROOT !GPROJECTS_DIR_ROOT!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __REPO_WORK (ADirectory) -> None
rem --------------------------------------------------------------------------------
:__REPO_WORK
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__REPO_WORK
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!

    call :WritePROCESS DEPLOY проекта [__REPO_WORK]: !PROJECT_NAME!
    
    set ADirectory=%~1
    rem echo ADirectory:!ADirectory!
    if not exist "!ADirectory!"\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )
    
    cd /D "!ADirectory!"
    
    call :__CopyFromPATTERN_ALL !GPROJECT_PATTERN_DIR!
    call :__SetPROJECT_INI
    
    cd /D "!ADirectory!"
    
    if exist .git\ (
        call lyrgit_push_main.bat
    ) else (
        echo INFO: Каталог .git не существует ...
    )
    
    cd /D "!LSaveDirectory!"
    
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __git_pull (ADirectory) -> None
rem --------------------------------------------------------------------------------
:__git_pull
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__git_pull
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!

    set LOG_FILE_ADD=1
    set ADirectory=%~1
    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )
    
    cd /D "!ADirectory!"
    
    call lyrgit_pull.bat
    
    cd /D "!LSaveDirectory!"

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __git_clone (Aurl) -> None
rem --------------------------------------------------------------------------------
:__git_clone
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__git_clone
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ADIR_PROJECTS_ROOT=%1
    rem echo ADIR_PROJECTS_ROOT:!ADIR_PROJECTS_ROOT!
    set url=%2
    rem echo url:!url!

    if exist "!ADIR_PROJECTS_ROOT!"\ (
        cd /D "!ADIR_PROJECTS_ROOT!"
        if defined url (
            rem git clone !url!
            call lyrgit_clone.bat "!url!"
        ) else (
            echo INFO: Github не существует...
        )
    ) else (
        echo ERROR: Каталог !ADIR_PROJECTS_ROOT! не существует...
        exit /b 1
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure PULL_PROJECT (PROJECT_GROUP PROJECT_NAME) -> None
rem --------------------------------------------------------------------------------
:PULL_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PULL_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!

    set ADIR_PROJECTS_ROOT=%1
    rem echo ADIR_PROJECTS_ROOT:!ADIR_PROJECTS_ROOT!
    set APROJECT_NAME=%2
    rem echo APROJECT_NAME:!APROJECT_NAME!

    call :WritePROCESS PULL проекта: !ADIR_PROJECTS_ROOT! ...

    if exist "!ADIR_PROJECTS_ROOT!\!APROJECT_NAME!"\ (
        cd /D "!ADIR_PROJECTS_ROOT!\!APROJECT_NAME!"
        if exist ".git"\ (
            rem call lyrgit_pull.bat
            git pull
        ) else (
            echo INFO: Каталог .git не существует ...
        )
    ) else (
        echo info: Каталог !APROJECT_DIR! не существует...
        if !APROJECT_NAME!==TOOLS_SRC_GIT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_GIT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        
        if !APROJECT_NAME!==TOOLS_SRC_BAT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )

        if !APROJECT_NAME!==TOOLS_BAT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==COMMANDS_BAT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==INFO_BAT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==SCRIPTS_BAT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )

        if !APROJECT_NAME!==TOOLS_SRC_KIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_KIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==INFO_KIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==SCRIPTS_KIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )

        if !APROJECT_NAME!==INFO_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==LANG_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==LIBRARY_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==PATTERNS_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TESTS_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_SRC_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )

        if !APROJECT_NAME!==APPInfo_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==EXAMPLES_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==FRAMEWORK_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==INFO_PYTHON (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==LANG_PYTHON (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==LIBRARY_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==MobileAPP_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==PATTERN_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==PATTERNS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==PROJECTS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==SCRIPTS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==SOFTWARE_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TEST_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TESTS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_SRC_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==YOUTUBE_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )

        if !APROJECT_NAME!==LUIS_D7 (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_D7 (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==LUIS_D11 (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_D11 (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )

        if !APROJECT_NAME!==COMMANDS_SH (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==INFO_UNIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==SCRIPTS_SH (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==SOFTWARE (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_SRC_SH (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
        if !APROJECT_NAME!==TOOLS_SH (
            call :__git_clone !ADIR_PROJECTS_ROOT! !Gurl_github!
        )
    )   

    cd /D "!LSaveDirectory!"

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
:UPDATE_TOOLS_KIX_TOOLS_SRC_KIX
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
:GetINIParametr2
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
