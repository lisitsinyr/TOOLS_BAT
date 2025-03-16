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
rem procedure CopyFilesFromPATTERN ()
rem --------------------------------------------------------------------------------
:CopyFilesFromPATTERN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CopyFilesFromPATTERN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem echo PROJECT_GROUP:!PROJECT_GROUP!
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!
    rem echo DIR_PROJECT_NAME:!DIR_PROJECT_NAME!
    rem echo PROJECT_NAME:!PROJECT_NAME!

    set LDirPATTERN=

    set res=
    if !PROJECT_GROUP!==PROJECTS_GIT set res=true
    if !PROJECT_GROUP!==GIT set res=true
    if defined res ( 
        set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\GIT\PATTERN_GIT
    )

    set res=
    if !PROJECT_GROUP!==PROJECTS_BAT set res=true
    if !PROJECT_GROUP!==BAT set res=true
    if defined res ( 
        set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PATTERN_BAT
    )

    set res=
    if !PROJECT_GROUP!==PROJECTS_KIX set res=true
    if !PROJECT_GROUP!==KIX set res=true
    if defined res ( 
        set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PATTERN_KIX
    )

    set res=
    if !PROJECT_GROUP!==PROJECTS_PS set res=true
    if !PROJECT_GROUP!==PowerShell set res=true
    if defined res ( 
        set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\PowerShell\PATTERN_PS
    )

    set res=
    if !PROJECT_GROUP!==PROJECTS_SH set res=true
    if !PROJECT_GROUP!==UNIX set res=true
    if defined res ( 
        set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\OS\UNIX\PATTERN_SH
    )

    set res=
    if !PROJECT_GROUP!==PROJECTS_JAVA set res=true
    if !PROJECT_GROUP!==JAVA set res=true
    if defined res ( 
        set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\JAVA\PATTERN_JAVA
    )

    set res=
    if !PROJECT_GROUP!==PROJECTS_D7 set res=true
    if !PROJECT_GROUP!==PROJECTS_D11 set res=true
    if !PROJECT_GROUP!==Pascal_Delphi set res=true
    if defined res ( 
        set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Pascal_Delphi\PATTERN_PAS
    )

    set res=
    if !PROJECT_GROUP!==PROJECTS_PY set res=true
    if !PROJECT_GROUP!==Python set res=true
    if defined res ( 
        set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PATTERN_PY
        set LFileName=!LDirPATTERN!\PROJECT_PYupdate.bat
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME!
        )
        set LFileName=!LDirPATTERN!\pyproject.toml
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME!
        )
        set LFileName=!LDirPATTERN!\requirements.txt
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME!
        )
        set LFileName=!LDirPATTERN!\POETRY.ini
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME!
        )
        
        rem set POETRY.ini

        set LFileName=!LDirPATTERN!\.pypirc
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME!
        )
    )

    if defined LDirPATTERN if exist "!LDirPATTERN!"\ ( 

        call :WritePROCESS ... !FUNCNAME! ...
        call :WritePROCESS LDirPATTERN         : !LDirPATTERN!
        call :WritePROCESS DIR_PROJECT_NAME    : !DIR_PROJECT_NAME!

        set LFileName=!LDirPATTERN!\PROJECT.INI
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME! > NUL
        )
        set LFileName=!LDirPATTERN!\REPO.INI
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME! > NUL
        )
        set LFileName=!LDirPATTERN!\.editorconfig
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME! > NUL
        )
        set LFileName=!LDirPATTERN!\.env
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME! > NUL
        )
        set LFileName=!LDirPATTERN!\.gitignore
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME! > NUL
        )
        set LFileName=!LDirPATTERN!\.gitmodules
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME! > NUL
        )
        set LFileName=!LDirPATTERN!\LICENSE
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName! !DIR_PROJECT_NAME!
            copy /Y !LFileName! !DIR_PROJECT_NAME! > NUL
        )

        set LARG=/D /S /E /V /F /H /R /K /Y /O
        set LMASK=*.*

        set LDIR_FROM=!LDirPATTERN!\BUILD
        set LDIR_TO=!DIR_PROJECT_NAME!\BUILD
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\CONFIG
        set LDIR_TO=!DIR_PROJECT_NAME!\CONFIG
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\DATA
        set LDIR_TO=!DIR_PROJECT_NAME!\DATA
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\DIST
        set LDIR_TO=!DIR_PROJECT_NAME!\DIST
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\DOC
        set LDIR_TO=!DIR_PROJECT_NAME!\DOC
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\EXE
        set LDIR_TO=!DIR_PROJECT_NAME!\EXE
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\LOG
        set LDIR_TO=!DIR_PROJECT_NAME!\LOG
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\NOTEBOOKS
        set LDIR_TO=!DIR_PROJECT_NAME!\NOTEBOOKS
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\OUT
        set LDIR_TO=!DIR_PROJECT_NAME!\OUT
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\SRC
        set LDIR_TO=!DIR_PROJECT_NAME!\SRC
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\TESTS
        set LDIR_TO=!DIR_PROJECT_NAME!\TESTS
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\WORK
        set LDIR_TO=!DIR_PROJECT_NAME!\WORK
        if exist !LDIR_FROM!\ (
            rem echo LDIR_FROM:!LDIR_FROM!
            rem xcopy !LDIR_FROM! !DIR_PROJECT_NAME! !LARG! >> %LOG_FULLFILENAME%
            rem call :CheckErrorlevel CopyFilesFromPATTERN !errorlevel! 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CopyFilesROOT ()
rem --------------------------------------------------------------------------------
:CopyFilesROOT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem set ADirectory=%~1
    rem echo ADirectory:!ADirectory!

    rem echo PROJECT_GROUP:!PROJECT_GROUP!
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!
    rem echo DIR_PROJECT_NAME:!DIR_PROJECT_NAME!
    rem echo PROJECT_NAME:!PROJECT_NAME!

    call :WritePROCESS ... !FUNCNAME! ...

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
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure SetPROJECT_INI ()
rem --------------------------------------------------------------------------------
:SetPROJECT_INI
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :WritePROCESS SetPROJECT_INI ...

    call :SetINI !DIR_PROJECT_NAME!\PROJECT.ini general PROJECT_GROUP !PROJECT_GROUP!
    call :SetINI !DIR_PROJECT_NAME!\PROJECT.ini general PROJECT_NAME !PROJECT_NAME!
    call :SetINI !DIR_PROJECT_NAME!\PROJECT.ini general DIR_GROUP_ROOT !DIR_GROUP_ROOT!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure SetREPO_INI ()
rem --------------------------------------------------------------------------------
:SetREPO_INI
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :WritePROCESS SetREPO_INI ...

    call :SetINI !DIR_PROJECT_NAME!\REPO.ini general REPO_NAME !PROJECT_NAME!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure REPO_WORK (ADirectory)
rem --------------------------------------------------------------------------------
:REPO_WORK
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :WritePROCESS DEPLOY проекта [REPO_WORK]: !PROJECT_NAME!

    rem call :WritePROCESS PROJECT_GROUP: !PROJECT_GROUP!
    rem call :WritePROCESS DIR_PROJECTS_ROOT: !DIR_PROJECTS_ROOT!
    rem call :WritePROCESS DIR_PROJECT_NAME: !DIR_PROJECT_NAME!

    set ADirectory=%~1
    rem echo ADirectory:!ADirectory!

    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )

    cd /D "!ADirectory!"

    call :CopyFilesROOT

    call :CopyFilesFromPATTERN

    call :SetPROJECT_INI

    call :SetREPO_INI

    if exist ".git"\ (
        echo call lyrgit_push_main.bat ...
        call lyrgit_push_main.bat
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure REPO_WORK_TOOLS (ADirectory)
rem --------------------------------------------------------------------------------
:REPO_WORK_TOOLS
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :WritePROCESS DEPLOY проекта [REPO_WORK_TOOLS]: !PROJECT_NAME!

    rem call :WritePROCESS PROJECT_GROUP: !PROJECT_GROUP!
    rem call :WritePROCESS DIR_PROJECTS_ROOT: !DIR_PROJECTS_ROOT!
    rem call :WritePROCESS DIR_PROJECT_NAME: !DIR_PROJECT_NAME!

    set ADirectory=%~1
    rem echo ADirectory:!ADirectory!

    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )

    cd /D "!ADirectory!"

    call :CopyFilesROOT

    rem call :CopyFilesFromPATTERN

    call :SetPROJECT_INI

    call :SetREPO_INI

    if exist ".git"\ (
        echo call lyrgit_push_main.bat ...
        call lyrgit_push_main.bat
    )

    call :PULL_PROJECT D:\TOOLS !PROJECT_NAME!

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

    call :WritePROCESS DEPLOY_PROJECT ...

    rem call :WritePROCESS PROJECT_GROUP : !PROJECT_GROUP!
    rem call :WritePROCESS PROJECT_NAME  : !PROJECT_NAME!
    rem call :WritePROCESS DIR_GROUP_ROOT: !DIR_GROUP_ROOT!

    rem echo PROJECT_GROUP : !PROJECT_GROUP!
    echo PROJECT_NAME  : !PROJECT_NAME!
    rem echo DIR_GROUP_ROOT: !DIR_GROUP_ROOT!

    set DIR_PROJECT_NAME=!DIR_PROJECTS_ROOT!\!PROJECT_NAME!
    rem echo DIR_PROJECT_NAME:!DIR_PROJECT_NAME!

    if !PROJECT_NAME!==TOOLS_BAT (
        call :CLEAR_TOOLS_BAT
        call :UPDATE_TOOLS_BAT_SCRIPTS_BAT
        call :UPDATE_TOOLS_BAT_TOOLS_SRC_BAT
        call :REPO_WORK_TOOLS !DIR_PROJECT_NAME!
        exit /b 0
    )    
    if !PROJECT_NAME!==TOOLS_GIT (
        call :CLEAR_TOOLS_GIT
        call :UPDATE_TOOLS_GIT_TOOLS_SRC_GIT
        call :REPO_WORK_TOOLS !DIR_PROJECT_NAME!
        exit /b 0
    )    
    if !PROJECT_NAME!==TOOLS_JAVA (
        call :CLEAR_TOOLS_JAVA
        call :UPDATE_TOOLS_JAVA_SCRIPTS_JAVA
        call :UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA
        call :REPO_WORK_TOOLS !DIR_PROJECT_NAME!
        exit /b 0
    )    
    if !PROJECT_NAME!==TOOLS_KIX (
        call :CLEAR_TOOLS_KIX
        call :UPDATE_TOOLS_KIX_SCRIPTS_KIX
        call :UPDATE_TOOLS_KIX_TOOLS_SRC_KIX
        call :REPO_WORK_TOOLS !DIR_PROJECT_NAME!
        exit /b 0
    )    
    if !PROJECT_NAME!==TOOLS_PY (
        call :CLEAR_TOOLS_PY
        call :UPDATE_TOOLS_PY_SCRIPTS_PY
        call :UPDATE_TOOLS_PY_TOOLS_SRC_PY
        call :REPO_WORK_TOOLS !DIR_PROJECT_NAME!
        exit /b 0
    )    
    if !PROJECT_NAME!==TOOLS_SH (
        call :CLEAR_TOOLS_SH
        call :UPDATE_TOOLS_SH_SCRIPTS_SH
        call :UPDATE_TOOLS_SH_TOOLS_SRC_SH
        call :UPDATE_TOOLS_SH_TOOLS_SRC_GIT_SH
        call :REPO_WORK_TOOLS !DIR_PROJECT_NAME!
        exit /b 0
    )    
    if !PROJECT_NAME!==TOOLS_PS (
        rem call :REPO_WORK_TOOLS !DIR_PROJECT_NAME!
        exit /b 0
    )    

    call :REPO_WORK !DIR_PROJECT_NAME!

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

    rem echo "git pull ..."

    call lyrgit_pull.bat
    
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
    rem echo ADIR_PROJECTS_ROOT:!ADIR_PROJECTS_ROOT!
    set APROJECT_NAME=%2
    rem echo APROJECT_NAME:!APROJECT_NAME!

    call :WritePROCESS PULL проекта: !APROJECT_NAME! ...

    set LDIR_PROJECT_NAME=!ADIR_PROJECTS_ROOT!\!APROJECT_NAME!
    rem echo LDIR_PROJECT_ROOT:!LDIR_PROJECT_NAME!

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
rem LYRDEPLOYTools.bat
rem =================================================
:LYRDEPLOYTools.bat
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_BAT_SCRIPTS_BAT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_BAT_TOOLS_SRC_BAT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:CLEAR_TOOLS_BAT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_GIT_TOOLS_SRC_GIT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:CLEAR_TOOLS_GIT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_JAVA_SCRIPTS_JAVA
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:CLEAR_TOOLS_JAVA
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_KIX_SCRIPTS_KIX
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:CLEAR_TOOLS_KIX
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_PY_SCRIPTS_PY
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_PY_TOOLS_SRC_PY
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:CLEAR_TOOLS_PY
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
:CLEAR_TOOLS_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0

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
