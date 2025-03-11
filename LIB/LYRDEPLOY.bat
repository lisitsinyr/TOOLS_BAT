@echo off
rem -------------------------------------------------------------------
rem LYRDEPLOY.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem Выход из сценария. Дальше - только функции.
    call :LYRDEPLOY
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
    set urlTOOLS_SRC_GIT=git@github.com:lisitsinyr/TOOLS_SRC_GIT.git
    set urlTOOLS_GIT=git@github.com:lisitsinyr/TOOLS_GIT.git

    set urlTOOLS_SRC_BAT=git@github.com:lisitsinyr/TOOLS_SRC_BAT.git
    set urlTOOLS_BAT=git@github.com:lisitsinyr/TOOLS_BAT.git

    set urlTOOLS_SRC_KIX=git@github.com:lisitsinyr/TOOLS_SRC_KIX.git
    set urlTOOLS_KIX=git@github.com:lisitsinyr/TOOLS_KIX.git

    set urlTOOLS_PS=git@github.com:lisitsinyr/TOOLS_PS.git

    set urlINFO_JAVA=git@github.com:lisitsinyr/INFO_JAVA.git
    set urlTESTS_JAVA=git@github.com:lisitsinyr/TESTS_JAVA.git
    set urlTOOLS_SRC_JAVA=git@github.com:lisitsinyr/TOOLS_SRC_JAVA.git
    set urlTOOLS_JAVA=git@github.com:lisitsinyr/TOOLS_JAVA.git

    set urlLUIS_D7=git@github.com:lisitsinyr/LUIS_D7.git
    set urlTOOLS_D7=git@github.com:lisitsinyr/TOOLS_D7.git
    set urlLUIS_D11=git@github.com:lisitsinyr/LUIS_D11.git
    set urlTOOLS_D11=git@github.com:lisitsinyr/TOOLS_D11.git

    set urlEXAMPLES_PY=git@github.com:lisitsinyr/EXAMPLES_PY.git
    set urlINFO_PYTHON=git@github.com:lisitsinyr/INFO_PYTHON.git
    set urlLANG_PYTHON=git@github.com:lisitsinyr/LANG_PYTHON.git
    set urlLIBRARY_PY=git@github.com:lisitsinyr/LIBRARY_PY.git
    set urlMobileAPP_PY=git@github.com:lisitsinyr/MobileAPP_PY.git
    set urlPATTERN_PY=git@github.com:lisitsinyr/PATTERN_PY.git
    set urlSCRIPTS_PY=git@github.com:lisitsinyr/SCRIPTS_PY.git
    set urlTESTS_PY=git@github.com:lisitsinyr/TESTS_PY.git
    set urlTOOLS_SRC_PY=git@github.com:lisitsinyr/TOOLS_SRC_PY.git
    set urlYOUTUBE_PY=git@github.com:lisitsinyr/YOUTUBE_PY.git
    set urlTOOLS_PY=git@github.com:lisitsinyr/TOOLS_PY.git

    set urlCOMMANDS_SH=git@github.com:lisitsinyr/COMMANDS_SH.git
    set urlINFO_UNIX=git@github.com:lisitsinyr/INFO_UNIX.git
    set urlTOOLS_SRC_SH=git@github.com:lisitsinyr/TOOLS_SRC_SH.git
    set urlTOOLS_SH=git@github.com:lisitsinyr/TOOLS_SH.git

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
    echo ADirectory:!ADirectory!

    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )

    echo PROJECT_NAME:!PROJECT_NAME!

    cd /D "!ADirectory!"

    set APYTHON=%2
    rem echo APYTHON:!APYTHON!

    rem del *.bat
    rem del *.sh

    set LFileName=DEPLOY.bat
    if exist !LFileName!\ (
        del !LFileName! > NUL
    )

    set LDirectory=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\SRC\BAT\A.WORK
    set LFileName=!LDirectory!\lyrgit_push_main.bat
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
    )
    set LFileName=!LDirectory!\lyrgit_pull.bat
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
    )

    set LDirectory=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\SCRIPTS_BAT\SRC\SCRIPTS_BAT\99.DEPLOY
    set LFileName=!LDirectory!\DEPLOY_PROJECT.bat
    if !PROJECT_NAME!==TOOLS_BAT (
        set LFileName=!LDirectory!\DEPLOY_PROJECT_TOOLS_BAT.bat
    )    
    if !PROJECT_NAME!==TOOLS_KIX (
        set LFileName=!LDirectory!\DEPLOY_PROJECT_TOOLS_KIX.bat
    )    
    if !PROJECT_NAME!==TOOLS_PS (
        set LFileName=!LDirectory!\DEPLOY_PROJECT_TOOLS_PS.bat
    )    
    if !PROJECT_NAME!==TOOLS_GIT (
        set LFileName=!LDirectory!\DEPLOY_PROJECT_TOOLS_GIT.bat
    )    
    if !PROJECT_NAME!==TOOLS_PY (
        set LFileName=!LDirectory!\DEPLOY_PROJECT_TOOLS_PY.bat
    )    
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
    )

    if !APYTHON!==1 (
        set LDirectory=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\PATTERN_PY
        set LFileName=!LDirectory!\PROJECT_PYupdate.bat
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName!
            copy !LFileName! > NUL
        )
        set LFileName=!LDirectory!\pyproject.toml
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
    rem echo DIR_PROJECT_NAME:!DIR_PROJECT_NAME!

    cd /D !DIR_PROJECT_NAME!
    rem set APPRUN=!DIR_PROJECT_NAME!\DEPLOY.bat
    set APPRUN=DEPLOY.bat
    set APPRUN=DEPLOY_PROJECT.bat
    echo APPRUN:!APPRUN!
    if exist "!APPRUN!" (
        call !APPRUN!
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

rem =================================================
rem procedure git_clone (Aurl)
rem =================================================
:git_clone
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set ADIR_PROJECTS_ROOT=%1
    echo ADIR_PROJECTS_ROOT:!ADIR_PROJECTS_ROOT!
    set url=%2
    echo url:!url!

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
rem procedure PULL_PROJECT ()
rem --------------------------------------------------------------------------------
:PULL_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PULL_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set ADIR_PROJECTS_ROOT=%1
    echo ADIR_PROJECTS_ROOT:!ADIR_PROJECTS_ROOT!
    set APROJECT_NAME=%2
    echo APROJECT_NAME:!APROJECT_NAME!

    call :WritePROCESS PULL проекта: !APROJECT_NAME! ...

    set LDIR_PROJECT_NAME=!ADIR_PROJECTS_ROOT!\!APROJECT_NAME!
    echo LDIR_PROJECT_ROOT:!LDIR_PROJECT_NAME!

    if exist "!LDIR_PROJECT_NAME!"\ (
        cd /D "!LDIR_PROJECT_NAME!"
        if exist ".git"\ (
            rem echo "call lyrgit_pull.bat ..."
            call lyrgit_pull.bat
        )
    ) else (
        echo info: Каталог !LDIR_PROJECT_NAME! не существует...
        if !APROJECT_NAME!==TOOLS_SRC_GIT (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_GIT!
        )
        if !APROJECT_NAME!==TOOLS_GIT (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_GIT!
        )

        
        if !APROJECT_NAME!==TOOLS_SRC_BAT (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_BAT!
        )
        if !APROJECT_NAME!==TOOLS_BAT (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_BAT!
        )
        if !APROJECT_NAME!==COMMANDS_BAT (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlCOMMANDS_BAT!
        )
        if !APROJECT_NAME!==INFO_BAT (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlINFO_BAT!
        )
        if !APROJECT_NAME!==SCRIPTS_BAT (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlSCRIPTS_BAT!
        )

        if !APROJECT_NAME!==TOOLS_SRC_KIX (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_KIX!
        )
        if !APROJECT_NAME!==TOOLS_KIX (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_KIX!
        )
        if !APROJECT_NAME!==INFO_KIX (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlINFO_KIX!
        )
        if !APROJECT_NAME!==SCRIPTS_KIX (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlSCRIPTS_KIX!
        )

        if !APROJECT_NAME!==INFO_JAVA (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlINFO_JAVA!
        )
        if !APROJECT_NAME!==LANG_JAVA (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlLANG_JAVA!
        )
        if !APROJECT_NAME!==LIBRARY_JAVA (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlLIBRARY_JAVA!
        )
        if !APROJECT_NAME!==PATTERNS_JAVA (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlPATTERNS_JAVA!
        )
        if !APROJECT_NAME!==TESTS_JAVA (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTESTS_JAVA!
        )
        if !APROJECT_NAME!==TOOLS_SRC_JAVA (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_JAVA!
        )
        if !APROJECT_NAME!==TOOLS_JAVA (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_JAVA!
        )

        if !APROJECT_NAME!==APPInfo_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlAPPInfo_PY!
        )
        if !APROJECT_NAME!==EXAMPLES_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlEXAMPLES_PY!
        )
        if !APROJECT_NAME!==FRAMEWORK_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlFRAMEWORK_PY!
        )
        if !APROJECT_NAME!==INFO_PYTHON (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlINFO_PYTHON!
        )
        if !APROJECT_NAME!==LANG_PYTHON (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlLANG_PYTHON!
        )
        if !APROJECT_NAME!==LIBRARY_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlLIBRARY_PY!
        )
        if !APROJECT_NAME!==MobileAPP_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlMobileAPP_PY!
        )
        if !APROJECT_NAME!==PATTERN_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlPATTERN_PY!
        )
        if !APROJECT_NAME!==PATTERNS_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlPATTERNS_PY!
        )
        if !APROJECT_NAME!==PROJECTS_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlPROJECTS_PY!
        )
        if !APROJECT_NAME!==SCRIPTS_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlSCRIPTS_PY!
        )
        if !APROJECT_NAME!==SOFTWARE_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlSOFTWARE_PY!
        )
        if !APROJECT_NAME!==TEST_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTEST_PY!
        )
        if !APROJECT_NAME!==TESTS_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTESTS_PY!
        )
        if !APROJECT_NAME!==TOOLS_SRC_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_PY!
        )
        if !APROJECT_NAME!==YOUTUBE_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlYOUTUBE_PY!
        )
        if !APROJECT_NAME!==TOOLS_PY (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_PY!
        )

        if !APROJECT_NAME!==LUIS_D7 (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlLUIS_D7!
        )
        if !APROJECT_NAME!==TOOLS_D7 (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_D7!
        )
        if !APROJECT_NAME!==LUIS_D11 (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlLUIS_D11!
        )
        if !APROJECT_NAME!==TOOLS_D11 (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_D11!
        )

        if !APROJECT_NAME!==COMMANDS_SH (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlCOMMANDS_SH!
        )
        if !APROJECT_NAME!==INFO_UNIX (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlINFO_UNIX!
        )
        if !APROJECT_NAME!==SCRIPTS_SH (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlSCRIPTS_SH!
        )
        if !APROJECT_NAME!==SOFTWARE (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlSOFTWARE!
        )
        if !APROJECT_NAME!==TOOLS_SRC_SH (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_SH!
        )
        if !APROJECT_NAME!==TOOLS_SH (
            call :git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SH!
        )

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
