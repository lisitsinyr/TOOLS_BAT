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
rem procedure LYRDEPLOY ()
rem --------------------------------------------------------------------------------
:LYRDEPLOY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRConst
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

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure REPO_WORK (ADirectory, APYTHON)
rem --------------------------------------------------------------------------------
:REPO_WORK
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set ADirectory=%~1
    rem echo REPO_WORK:!ADirectory!

    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )

    cd /D "!ADirectory!"

    set APYTHON=%2
    rem echo APYTHON:!APYTHON!

    rem del *.bat
    rem del *.sh

    set LFileName=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\SRC\BAT\A.WORK\lyrgit_push_main.bat
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
    )

    set LFileName=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\SRC\BAT\A.WORK\lyrgit_pull.bat
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
    )

    set LFileName=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\SCRIPTS_BAT\SRC\SCRIPTS_BAT\99.DEPLOY\DEPLOY_PROJECT.bat
    echo LFileName:!LFileName!
    if exist !LFileName! (
        echo COPY:!LFileName!
        copy !LFileName!
    )

    if !APYTHON!==1 (
        set LFileName=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\PATTERN_PY\PROJECT_PYupdate.bat
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName!
            copy !LFileName! > NUL
        )
        set LFileName=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\PATTERN_PY\pyproject.toml
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName!
            copy !LFileName! > NUL
        )
    )
   
    if exist ".git"\ (
        rem echo "call lyrgit_push_main.bat ..."
        call lyrgit_push_main.bat
    )

    exit /b 0
rem endfunction

rem =================================================
rem procedure git_pull (ADirectory)
rem =================================================
:git_pull
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LOG_FILE_ADD=1
    set ADirectory=%~1
    rem echo git_pull:!ADirectory!
    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )

    cd /D "!ADirectory!"

    call lyrgit_pull.bat
    
    rem echo "git pull ..."
    rem git pull
    rem call :CheckErrorlevel !FUNCNAME! !errorlevel! 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure DEPLOY_PROJECT ()
rem --------------------------------------------------------------------------------
:DEPLOY_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=DEPLOY_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :WritePROCESS DEPLOY проекта: !PROJECT_NAME! ...

    set DIR_PROJECT_NAME=!DIR_PROJECTS_ROOT!\!PROJECT_NAME!
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!

    cd /D !DIR_PROJECT_NAME!
    rem set APPRUN=!DIR_PROJECT_NAME!\DEPLOY.bat
    set APPRUN=DEPLOY.bat
    rem echo APPRUN:!APPRUN!
    if exist "!APPRUN!" (
        call !APPRUN!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure PULL_PROJECT ()
rem --------------------------------------------------------------------------------
:PULL_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PULL_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :WritePROCESS PULL проекта: !PROJECT_NAME! ...

    set DIR_PROJECT_NAME=!DIR_PROJECTS_ROOT!\!PROJECT_NAME!
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!

    if EXIST !DIR_PROJECT_NAME!\ (
        cd /D !DIR_PROJECT_NAME!
        if exist ".git"\ (
            rem echo "call lyrgit_push_main.bat ..."
            call lyrgit_pull_main.bat
        )
    ) else (
        rem git clone 
    )

    rem set APPRUN=!DIR_PROJECT_NAME!\DEPLOY.bat
    rem set APPRUN=DEPLOY.bat
    rem echo APPRUN:!APPRUN!
    rem if exist "!APPRUN!" (
    rem     call !APPRUN!
    rem )

    exit /b 0
rem endfunction

rem =================================================

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRConsole.bat
rem =================================================
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
:SetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColor
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
rem LYRSupport.bat
rem =================================================
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:CheckErrorlevel
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
