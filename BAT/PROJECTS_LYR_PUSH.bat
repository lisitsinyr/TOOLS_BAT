@echo off
rem -------------------------------------------------------------------
rem PROJECTS_LYR_PUSH.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    call :MAIN %* || exit /b 1
    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem -----------------------------------------------
rem procedure MAIN_INIT ()
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
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_SRC_BAT
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
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_SRC_KIX
    )
    rem echo SCRIPTS_DIR_KIX: !SCRIPTS_DIR_KIX!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_SetROOT ()
rem -----------------------------------------------
:MAIN_SetROOT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_SetROOT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set PROJECTS_LYR_ROOT=D:\WORK\WIN
    set PROJECTS_LYR_ROOT=D:
    echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!

    if not exist "!PROJECTS_LYR_DIR!"\ (
        echo INFO: Dir "!PROJECTS_LYR_DIR!" not exist ...
        echo INFO: Create "!PROJECTS_LYR_DIR!" ...
        mkdir "!PROJECTS_LYR_DIR!"
    )

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

    set /a LOG_FILE_ADD=1

    call :MAIN_SetROOT || exit /b 1

    rem ------------------------------------------------
    rem 01_03_UNIX
    rem ------------------------------------------------
    set DIR_COMMANDS_SH=!PROJECTS_LYR_DIR!\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\COMMANDS_SH
    echo DIR_COMMANDS_SH:!COMMANDS_SH!
    set DIR_TOOLS_SRC_SH=!PROJECTS_LYR_DIR!\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TOOLS_SRC_SH
    echo DIR_TOOLS_SRC_SH:!DIR_TOOLS_SRC_SH!
    set DIR_TOOLS_SH=!PROJECTS_LYR_DIR!\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH
    echo DIR_TOOLS_SH:!DIR_TOOLS_SH!

    rem ------------------------------------------------
    rem 03_01_KIX
    rem ------------------------------------------------
    set DIR_TOOLS_SRC_KIX=!PROJECTS_LYR_DIR!\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_SRC_KIX
    echo DIR_TOOLS_SRC_KIX:!DIR_TOOLS_SRC_KIX!
    set DIR_TOOLS_KIX=!PROJECTS_LYR_DIR!\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
    echo DIR_TOOLS_KIX:!DIR_TOOLS_KIX!

    set DIR_TOOLS_KIX_=D:\TOOLS\TOOLS_KIX
    echo DIR_TOOLS_KIX_:!DIR_TOOLS_KIX_!

    rem ------------------------------------------------
    rem 03_04_BAT
    rem ------------------------------------------------
    set DIR_TOOLS_SRC_BAT=!PROJECTS_LYR_DIR!\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    echo DIR_TOOLS_SRC_BAT:!DIR_TOOLS_SRC_BAT!
    set DIR_TOOLS_BAT=!PROJECTS_LYR_DIR!\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
    echo DIR_TOOLS_BAT:!DIR_TOOLS_BAT!

    set DIR_TOOLS_BAT_=D:\TOOLS\TOOLS_BAT
    echo DIR_TOOLS_BAT_:!DIR_TOOLS_BAT_!

    rem ------------------------------------------------
    rem 05_01_Pascal_Delphi
    rem ------------------------------------------------
    set DIR_DELPHI7=!PROJECTS_LYR_DIR!\CHECK_LIST\05_DESKTOP\01_Pascal_Delphi\02_Delphi_7\PROJECTS_D7
    echo DIR_DELPHI7:!DIR_DELPHI7!
    set DIR_LUIS_D7=!DIR_DELPHI7!\LUIS_D7
    set DIR_TOOLS_D7=!DIR_DELPHI7!\TOOLS_D7
    set DIR_DELPHI11=!PROJECTS_LYR_DIR!\CHECK_LIST\05_DESKTOP\01_Pascal_Delphi\03_Delphi_11\PROJECTS_D11
    echo DIR_DELPHI11:!DIR_DELPHI11!
    set DIR_LUIS_D11=!DIR_DELPHI11!\LUIS_D11
    set DIR_TOOLS_D11=!DIR_DELPHI11!\TOOLS_D11

    rem ------------------------------------------------
    rem 05_02_Python
    rem ------------------------------------------------
    set DIR_PYTHON=!PROJECTS_LYR_DIR!\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY
    echo DIR_PYTHON:!DIR_PYTHON!
    set DIR_EXAMPLES_PY=!DIR_PYTHON!\EXAMPLES_PY
    set DIR_MobileAPP_PY=!DIR_PYTHON!\MobileAPP_PY
    set DIR_PATTERN_PY=!DIR_PYTHON!\PATTERN_PY
    set DIR_TEST_PY=!DIR_PYTHON!\TEST_PY
    set DIR_YOUTUBE_PY=!DIR_PYTHON!\YOUTUBE_PY
    set DIR_TESTS_PY=!DIR_PYTHON!\TESTS_PY
    set DIR_TOOLS_SRC_PY=!DIR_PYTHON!\TOOLS_SRC_PY
    set DIR_TOOLS_PY=!PROJECTS_LYR_DIR!\CHECK_LIST\05_DESKTOP\02_Python\TOOLS_PY
    echo DIR_TOOLS_PY:!DIR_TOOLS_PY!

    set DIR_TOOLS_PY_=D:\TOOLS\TOOLS_PY
    echo DIR_TOOLS_PY_:!DIR_TOOLS_PY_!

    rem ------------------------------------------------
    rem 05_03_Java
    rem ------------------------------------------------
    set DIR_JAVA=!PROJECTS_LYR_DIR!\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA
    echo DIR_JAVA:!DIR_JAVA!
    set DIR_TESTS_JAVA=!DIR_JAVA!\TESTS_JAVA
    echo DIR_TESTS_JAVA:!DIR_TESTS_JAVA!
    set DIR_TOOLS_SRC_JAVA=!DIR_JAVA!\TOOLS_SRC_JAVA
    echo DIR_TOOLS_SRC_JAVA:!DIR_TOOLS_SRC_JAVA!
    set DIR_TOOLS_JAVA=!PROJECTS_LYR_DIR!\CHECK_LIST\05_DESKTOP\03_Java\TOOLS_JAVA
    echo DIR_TOOLS_JAVA:!DIR_TOOLS_JAVA!

    rem ------------------------------------------------
    rem 07_GIT
    rem ------------------------------------------------
    set DIR_TOOLS_SRC_GIT=!PROJECTS_LYR_DIR!\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_SRC_GIT
    echo DIR_TOOLS_SRC_GIT:!DIR_TOOLS_SRC_GIT!
    set DIR_TOOLS_GIT=!PROJECTS_LYR_DIR!\CHECK_LIST\07_GIT\TOOLS_GIT
    echo DIR_TOOLS_GIT:!DIR_TOOLS_GIT!

    set DIR_TOOLS_GIT_=D:\TOOLS\TOOLS_GIT
    echo DIR_TOOLS_GIT_:!DIR_TOOLS_GIT_!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR (%*)
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
    set O1=
    set PN_CAPTION=O1
    call :Read_P O1 O1 || exit /b 1
    rem echo O1:!O1!
    if defined O1 (
        set OPTION=!OPTION! --O1 !O1!
    ) else (
        echo INFO: O1 not defined ...
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set A1=
    set PN_CAPTION=A1
    call :Read_P A1 A1 || exit /b 1
    rem echo A1:!A1!
    if defined A1 (
        set ARGS=!ARGS! !A1!
    ) else (
        echo ERROR: A1 not defined ...
        set OK=
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_01_03_UNIX ()
rem --------------------------------------------------------------------------------
:MAIN_01_03_UNIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_01_03_UNIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 01_03_UNIX ...
    echo ===============================

    call :REPO_WORK !DIR_COMMANDS_SH! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SRC_SH! 0 || exit /b 1
    call :UPDATE_TOOLS_SH || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SH! 0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_03_01_KIX ()
rem --------------------------------------------------------------------------------
:MAIN_03_01_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_03_01_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 03_01_KIX ...
    echo ===============================

    call :REPO_WORK !DIR_TOOLS_SRC_KIX! 0 || exit /b 1
    call :UPDATE_TOOLS_KIX || exit /b 1
    call :REPO_WORK !DIR_TOOLS_KIX! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_KIX_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_03_04_BAT ()
rem --------------------------------------------------------------------------------
:MAIN_03_04_BAT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_03_04_BAT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 03_04_BAT ...
    echo ===============================

    call :REPO_WORK !DIR_TOOLS_SRC_BAT! 0 || exit /b 1
    call :UPDATE_TOOLS_BAT || exit /b 1
    call :REPO_WORK !DIR_TOOLS_BAT! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_BAT_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_01_Pascal_Delphi ()
rem --------------------------------------------------------------------------------
:MAIN_05_01_Pascal_Delphi
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_05_DESKTOP_01_Pascal_Delphi
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_01_Pascal_Delphi ...
    echo ===============================

    call :REPO_WORK !DIR_LUIS_D7! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_D7! 0 || exit /b 1
    call :REPO_WORK !DIR_LUIS_D11! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_D11! 0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_02_Python ()
rem --------------------------------------------------------------------------------
:MAIN_05_02_Python
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_05_02_Python
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_02_Python ...
    echo ===============================

    call :REPO_WORK !DIR_EXAMPLES_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_MobileAPP_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_PATTERN_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_TEST_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_YOUTUBE_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_TESTS_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SRC_PY! 1 || exit /b 1
    call :UPDATE_TOOLS_PY || exit /b 1
    call :REPO_WORK !DIR_TOOLS_PY! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_PY_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_03_Java ()
rem --------------------------------------------------------------------------------
:MAIN_05_03_Java
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_05_03_Java
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_03_Java ...
    echo ===============================

    call :REPO_WORK !DIR_TESTS_JAVA! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SRC_JAVA! 0 || exit /b 1
    call :UPDATE_TOOLS_JAVA || exit /b 1
    call :REPO_WORK !DIR_TOOLS_JAVA! 0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_07_GIT ()
rem --------------------------------------------------------------------------------
:MAIN_07_GIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_07_GIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 07_GIT ...
    echo ===============================

    call :REPO_WORK !DIR_TOOLS_SRC_GIT! 0 || exit /b 1
    call :UPDATE_TOOLS_GIT || exit /b 1
    call :REPO_WORK !DIR_TOOLS_GIT! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_GIT_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_FUNC
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :MAIN_01_03_UNIX %* || exit /b 1
    rem call :PressAnyKey || exit /b 1

    call :MAIN_03_01_KIX %* || exit /b 1
    rem call :PressAnyKey || exit /b 1

    call :MAIN_03_04_BAT %* || exit /b 1
    rem call :PressAnyKey || exit /b 1

    call :MAIN_05_01_Pascal_Delphi %* || exit /b 1
    rem call :PressAnyKey || exit /b 1

    call :MAIN_05_02_Python %* || exit /b 1
    rem call :PressAnyKey || exit /b 1
    
    call :MAIN_05_03_Java %* || exit /b 1
    rem call :PressAnyKey || exit /b 1
    
    call :MAIN_07_GIT %* || exit /b 1
    rem call :PressAnyKey || exit /b 1

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

    call :GetINIParametr REPO.ini general REPO_NAME || exit /b 1
    echo REPO_NAME:!REPO_NAME!

    del *.bat
    del *.sh > NUL

    set LFileName=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_SRC_GIT\BAT\A.WORK\lyrgit_push_main.bat
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
    )
    set LFileName=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_SRC_GIT\BAT\A.WORK\lyrgit_pull.bat
    rem echo LFileName:!LFileName!
    if exist !LFileName! (
        rem echo COPY:!LFileName!
        copy !LFileName! > NUL
    )

    if !APYTHON!==1 (
        set LFileName=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\PATTERN_PY\PROJECT_PYupdate.bat
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName!
            copy !LFileName! > NUL
        )
        set LFileName=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\PATTERN_PY\pyproject.toml
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName!
            copy !LFileName! > NUL
        )
    )
   
    call lyrgit_push_main.bat

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_BAT ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_BAT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_BAT!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\BAT
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\BAT\99.[lyr]LYR
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_BAT!\LIB
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\LIB
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_SH (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_SH
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_SH!\SH
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_SH!\SH
    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    set LDIR_TO=!DIR_TOOLS_SH!\LIB
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_SH!\LIB
    set LMASK=*.*
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_SH!\SH_GIT
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\SH
    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_KIX (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_KIX
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_KIX!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    rem set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\BAT
    rem set LMASK=*.bat
    rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_KIX!\LIB
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\LIB
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_KIX!\SCRIPTS
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SCRIPTS
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_GIT (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_GIT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_GIT!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\BAT
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    set LDIR_TO=!DIR_TOOLS_GIT!\BAT_KIX
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\BAT_KIX
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_PY (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_PY
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_PY!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\BAT
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_PY!\SCRIPTS
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_JAVA (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_JAVA
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
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

    call lyrgit_pull.bat
    rem git pull    

    exit /b 0
rem endfunction

rem =================================================
rem procedure MAIN (%*)
rem =================================================
:MAIN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=
    set /a LOG_FILE_ADD=0

    call :MAIN_INIT || exit /b 1

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    call :SET_LIB %~f0 || exit /b 1
    rem echo CURRENT_DIR: !CURRENT_DIR!

    call :StartLogFile || exit /b 1
    set OK=yes
    call :MAIN_SET || exit /b 1
    if defined OK if not defined Read_N (
        call :MAIN_CHECK_PARAMETR %* || exit /b 1
    )
    if defined OK (
        call :MAIN_FUNC || exit /b 1
    )
    call :StopLogFile || exit /b 1

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
:SET_POETRY
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
:COPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:XCOPY_FILES
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
rem =================================================
rem LYRSupport.bat
rem =================================================
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
