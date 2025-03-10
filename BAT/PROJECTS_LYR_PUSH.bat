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
    rem PROJECTS_LYR_ROOT - ������� ROOT
    rem -------------------------------------------------------------------
    rem set PROJECTS_LYR_ROOT=D:\WORK\WIN
    set PROJECTS_LYR_ROOT=D:
    rem echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - ������� �������� LYR
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!
    if not exist "!PROJECTS_LYR_DIR!"\ (
        rem echo INFO: Dir "!PROJECTS_LYR_DIR!" not exist ...
        rem echo INFO: Create "!PROJECTS_LYR_DIR!" ...
        rem mkdir "!PROJECTS_LYR_DIR!"
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - ������� �������� BAT
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        rem set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        rem set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
    )
    rem echo SCRIPTS_DIR:!SCRIPTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - ������� ���������� �������� BAT
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
    )
    rem echo LIB_BAT:!LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: ������� ���������� LYR !LIB_BAT! �� ����������...
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem ���������� ����������
    rem -------------------------------------------------------------------
    call :Read_N %* || exit /b 1

    rem -------------------------------------------------------------------
    rem ��������� �����
    rem -------------------------------------------------------------------
    call :SET_LIB %~f0 || exit /b 1

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
    rem 05_Python
    rem ------------------------------------------------
    set DIR_PYTHON=!PROJECTS_LYR_DIR!\CHECK_LIST\DESKTOP\Python\PROJECTS_PY
    rem echo DIR_PYTHON:!DIR_PYTHON!
    set DIR_EXAMPLES_PY=!DIR_PYTHON!\EXAMPLES_PY
    set DIR_MobileAPP_PY=!DIR_PYTHON!\MobileAPP_PY
    set DIR_PATTERN_PY=!DIR_PYTHON!\PATTERN_PY
    rem set DIR_TEST_PY=!DIR_PYTHON!\TEST_PY
    set DIR_YOUTUBE_PY=!DIR_PYTHON!\YOUTUBE_PY
    set DIR_TESTS_PY=!DIR_PYTHON!\TESTS_PY
    set DIR_TOOLS_SRC_PY=!DIR_PYTHON!\TOOLS_SRC_PY
    set DIR_TOOLS_PY=!PROJECTS_LYR_DIR!\CHECK_LIST\DESKTOP\Python\TOOLS_PY
    rem echo DIR_TOOLS_PY:!DIR_TOOLS_PY!

    set DIR_TOOLS_PY_=D:\TOOLS\TOOLS_PY
    rem echo DIR_TOOLS_PY_:!DIR_TOOLS_PY_!

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
    echo OPTION:!OPTION!

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem �������� �� ������������ ���������
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
    echo ARGS:!ARGS!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_01_UNIX ()
rem --------------------------------------------------------------------------------
:MAIN_01_UNIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_01_UNIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 01_UNIX ...
    echo ===============================

    call :REPO_WORK !DIR_COMMANDS_SH! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SRC_SH! 0 || exit /b 1
    call :UPDATE_TOOLS_SH || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SH! 0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_03_KIX ()
rem --------------------------------------------------------------------------------
:MAIN_03_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_03_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 03_KIX ...
    echo ===============================

    call :REPO_WORK !DIR_TOOLS_SRC_KIX! 0 || exit /b 1
    call :UPDATE_TOOLS_KIX || exit /b 1
    call :REPO_WORK !DIR_TOOLS_KIX! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_KIX_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_03_BAT ()
rem --------------------------------------------------------------------------------
:MAIN_03_BAT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_03_BAT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 03_BAT ...
    echo ===============================

    call :REPO_WORK !DIR_TOOLS_SRC_BAT! 0 || exit /b 1
    call :UPDATE_TOOLS_BAT || exit /b 1
    call :REPO_WORK !DIR_TOOLS_BAT! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_BAT_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_Pascal_Delphi ()
rem --------------------------------------------------------------------------------
:MAIN_05_Pascal_Delphi
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DESKTOP_Pascal_Delphi
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_Pascal_Delphi ...
    echo ===============================

    call :REPO_WORK !DIR_LUIS_D7! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_D7! 0 || exit /b 1
    call :UPDATE_TOOLS_D7 || exit /b 1

    call :REPO_WORK !DIR_LUIS_D11! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_D11! 0 || exit /b 1
    rem call :UPDATE_TOOLS_D11 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_Python ()
rem --------------------------------------------------------------------------------
:MAIN_05_Python
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_05_Python
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_Python ...
    echo ===============================

    call :REPO_WORK !DIR_EXAMPLES_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_MobileAPP_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_PATTERN_PY! 1 || exit /b 1
    rem call :REPO_WORK !DIR_TEST_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_YOUTUBE_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_TESTS_PY! 1 || exit /b 1

    call :REPO_WORK !DIR_TOOLS_SRC_PY! 1 || exit /b 1
    call :UPDATE_TOOLS_PY || exit /b 1

    call :REPO_WORK !DIR_TOOLS_PY! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_PY_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_Java ()
rem --------------------------------------------------------------------------------
:MAIN_05_Java
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_05_Java
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_Java ...
    echo ===============================

    call :REPO_WORK !DIR_TESTS_JAVA! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SRC_JAVA! 0 || exit /b 1
    call :UPDATE_TOOLS_JAVA || exit /b 1
    call :REPO_WORK !DIR_TOOLS_JAVA! 0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_GIT ()
rem --------------------------------------------------------------------------------
:MAIN_GIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_GIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo GIT ...
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

    call :MAIN_01_UNIX %* || exit /b 1
    rem call :PressAnyKey || exit /b 1

    call :MAIN_03_KIX %* || exit /b 1
    rem call :PressAnyKey || exit /b 1

    call :MAIN_03_BAT %* || exit /b 1
    rem call :PressAnyKey || exit /b 1

    call :MAIN_05_Pascal_Delphi %* || exit /b 1
    rem call :PressAnyKey || exit /b 1

    call :MAIN_05_Python %* || exit /b 1
    rem call :PressAnyKey || exit /b 1
    
    call :MAIN_05_Java %* || exit /b 1
    rem call :PressAnyKey || exit /b 1
    
    call :MAIN_GIT %* || exit /b 1
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
        echo ERROR: ������� !ADirectory! �� ���������� ...
        exit /b 1
    )

    cd /D "!ADirectory!"

    set APYTHON=%2
    rem echo APYTHON:!APYTHON!

    call :GetINIParametr REPO.ini general REPO_NAME || exit /b 1
    echo -------------------------------
    echo REPO_NAME:!REPO_NAME!
    echo -------------------------------

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

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_BAT!\BAT
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\SRC\BAT
    set LDIR_TO=!DIR_TOOLS_BAT!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_BAT!\BAT\99.[lyr]LYR
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\SRC\BAT\99.[lyr]LYR
    set LDIR_TO=!DIR_TOOLS_BAT!\BAT
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_BAT!\LIB
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\SRC\LIB
    set LDIR_TO=!DIR_TOOLS_BAT!\LIB
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
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

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_SH!\SH
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_SH!\SRC\SH
    set LDIR_TO=!DIR_TOOLS_SH!\SH
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_SH!\LIB
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_SH!\SRC\LIB
    set LDIR_TO=!DIR_TOOLS_SH!\LIB
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_GIT!\SH
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\SH
    set LDIR_TO=!DIR_TOOLS_SH!\SH_GIT
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
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

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_KIX!\SRC\BAT
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SRC\BAT
    set LDIR_TO=!DIR_TOOLS_KIX!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_KIX!\SRC\LIB
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SRC\LIB
    set LDIR_TO=!DIR_TOOLS_KIX!\LIB
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_KIX!\SRC\LIB
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SRC\SCRIPTS
    set LDIR_TO=!DIR_TOOLS_KIX!\SCRIPTS
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_KIX!\SRC\SCRIPTS
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SRC\SCRIPTS
    set LDIR_TO=!DIR_TOOLS_KIX!\BAT
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

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

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_GIT!\BAT
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\BAT
    set LDIR_TO=!DIR_TOOLS_GIT!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_GIT!\BAT_KIX
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\BAT_KIX
    set LDIR_TO=!DIR_TOOLS_GIT!\BAT_KIX
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
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

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_PY!\SRC\BAT
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\BAT
    set LDIR_TO=!DIR_TOOLS_PY!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    set LDIR_TO=!DIR_TOOLS_PY!\SCRIPTS
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    set LDIR_TO=!DIR_TOOLS_PY!\BAT
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_D7 (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_D7
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=D:\TOOLS\EXE
    if exist "!LDIR_TO!" (
        rem del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_D7!\SRC\GetINI
    set LMASK=GetINI.exe
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_FROM=!DIR_TOOLS_D7!\SRC\SetINI
    set LMASK=SetINI.exe
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

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
        echo ERROR: ������� !ADirectory! �� ���������� ...
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

rem =================================================
rem ������� LIB
rem =================================================

rem =================================================
rem LYRDEPLOY.bat
rem =================================================
:REPO_WORK
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:git_pull
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:DEPLOY_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0

rem =================================================
rem LYRConst.bat
rem =================================================
:SET_LIB
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_POETRY
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRLIB.bat %*
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
