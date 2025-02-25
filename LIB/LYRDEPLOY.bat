@echo off
rem -------------------------------------------------------------------
rem LYRDEPLOY.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem -------------------------------------------------------------------
    rem CONST
    rem -------------------------------------------------------------------
    rem ------------------------------------------------
    rem 01_UNIX
    rem ------------------------------------------------
    set DIR_COMMANDS_SH=!PROJECTS_LYR_DIR!\CHECK_LIST\OS\UNIX\PROJECTS_UNIX\COMMANDS_SH
    rem echo DIR_COMMANDS_SH:!COMMANDS_SH!
    set DIR_TOOLS_SRC_SH=!PROJECTS_LYR_DIR!\CHECK_LIST\OS\UNIX\PROJECTS_UNIX\TOOLS_SRC_SH
    rem echo DIR_TOOLS_SRC_SH:!DIR_TOOLS_SRC_SH!
    set DIR_TOOLS_SH=!PROJECTS_LYR_DIR!\CHECK_LIST\OS\UNIX\TOOLS_SH
    rem echo DIR_TOOLS_SH:!DIR_TOOLS_SH!

    rem ------------------------------------------------
    rem 03_KIX
    rem ------------------------------------------------
    set DIR_TOOLS_SRC_KIX=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\TOOLS_SRC_KIX
    rem echo DIR_TOOLS_SRC_KIX:!DIR_TOOLS_SRC_KIX!
    set DIR_TOOLS_KIX=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\KIX\TOOLS_KIX
    rem echo DIR_TOOLS_KIX:!DIR_TOOLS_KIX!

    set DIR_TOOLS_KIX_=D:\TOOLS\TOOLS_KIX
    rem echo DIR_TOOLS_KIX_:!DIR_TOOLS_KIX_!

    rem ------------------------------------------------
    rem 03_BAT
    rem ------------------------------------------------
    set DIR_TOOLS_SRC_BAT=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    rem echo DIR_TOOLS_SRC_BAT:!DIR_TOOLS_SRC_BAT!
    set DIR_TOOLS_BAT=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\TOOLS_BAT
    rem echo DIR_TOOLS_BAT:!DIR_TOOLS_BAT!

    set DIR_TOOLS_BAT_=D:\TOOLS\TOOLS_BAT
    rem echo DIR_TOOLS_BAT_:!DIR_TOOLS_BAT_!

    rem ------------------------------------------------
    rem 05_Pascal_Delphi
    rem ------------------------------------------------
    set DIR_DELPHI7=!PROJECTS_LYR_DIR!\CHECK_LIST\DESKTOP\Pascal_Delphi\02_Delphi_7\PROJECTS_D7
    rem echo DIR_DELPHI7:!DIR_DELPHI7!
    set DIR_LUIS_D7=!DIR_DELPHI7!\LUIS_D7
    set DIR_TOOLS_D7=!DIR_DELPHI7!\TOOLS_D7
    set DIR_DELPHI11=!PROJECTS_LYR_DIR!\CHECK_LIST\DESKTOP\Pascal_Delphi\03_Delphi_11\PROJECTS_D11
    rem echo DIR_DELPHI11:!DIR_DELPHI11!
    set DIR_LUIS_D11=!DIR_DELPHI11!\LUIS_D11
    set DIR_TOOLS_D11=!DIR_DELPHI11!\TOOLS_D11

    rem ------------------------------------------------
    rem 05_Java
    rem ------------------------------------------------
    set DIR_JAVA=!PROJECTS_LYR_DIR!\CHECK_LIST\DESKTOP\Java\PROJECTS_JAVA
    rem echo DIR_JAVA:!DIR_JAVA!
    set DIR_TESTS_JAVA=!DIR_JAVA!\TESTS_JAVA
    rem echo DIR_TESTS_JAVA:!DIR_TESTS_JAVA!
    set DIR_TOOLS_SRC_JAVA=!DIR_JAVA!\TOOLS_SRC_JAVA
    rem echo DIR_TOOLS_SRC_JAVA:!DIR_TOOLS_SRC_JAVA!
    set DIR_TOOLS_JAVA=!PROJECTS_LYR_DIR!\CHECK_LIST\DESKTOP\Java\TOOLS_JAVA
    rem echo DIR_TOOLS_JAVA:!DIR_TOOLS_JAVA!

    rem ------------------------------------------------
    rem GIT
    rem ------------------------------------------------
    set DIR_TOOLS_SRC_GIT=!PROJECTS_LYR_DIR!\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT
    rem echo DIR_TOOLS_SRC_GIT:!DIR_TOOLS_SRC_GIT!
    set DIR_TOOLS_GIT=!PROJECTS_LYR_DIR!\CHECK_LIST\GIT\TOOLS_GIT
    rem echo DIR_TOOLS_GIT:!DIR_TOOLS_GIT!

    set DIR_TOOLS_GIT_=D:\TOOLS\TOOLS_GIT
    rem echo DIR_TOOLS_GIT_:!DIR_TOOLS_GIT_!

    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------

    rem Выход из сценария. Дальше - только функции.
    exit /b 0
:end

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure DEPLOY_LIB ()
rem --------------------------------------------------------------------------------
:DEPLOY_LIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRConst
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    echo ERROR: function !FUNCNAME! not implemented! ...

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
    rem echo ADirectory:!ADirectory!
    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )

    cd /D "!ADirectory!"

    set APYTHON=%2
    rem echo APYTHON:!APYTHON!

    rem del *.bat
    rem del *.sh

    set LFileName=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\BAT\A.WORK\lyrgit_push_main.bat
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
    )
    set LFileName=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\BAT\A.WORK\lyrgit_pull.bat
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
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
    rem echo ADirectory:!ADirectory!
    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )

    cd /D "!ADirectory!"

    rem call lyrgit_pull.bat
    git pull    

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

rem ===================================================================

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
