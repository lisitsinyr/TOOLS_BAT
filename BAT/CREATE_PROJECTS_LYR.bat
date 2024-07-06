@echo off
rem -------------------------------------------------------------------
rem CREATE_PROJECTS_LYR.bat
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
rem procedure MAIN_CreateDirectory ()
rem -----------------------------------------------
:MAIN_CreateDirectory
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_CreateDirectory
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    cd /d "!PROJECTS_LYR_DIR!"

    echo GDirectory:!GDirectory!

    if not exist "!GDirectory!"\ (
        rem echo INFO: Dir "!GDirectory!" not exist ...
        rem echo INFO: Create "!GDirectory!" ...
        mkdir "!GDirectory!"
    )

    cd /d !GDirectory!

    if defined GRepo (
        rem echo GRepo:!GRepo!
        if not exist ".git"\ (
            cd ..\
            echo git clone: !GRepo!
            git clone !GRepo!
        ) else (
            echo git pull: !GRepo!
            git pull
        )
    )

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_07_GIT ()
rem -----------------------------------------------
:MAIN_07_GIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_07_GIT=CHECK_LIST\07_GIT

    set GDirectory=!DIR_07_GIT!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_07_GIT!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_07_GIT!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_07_GIT!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_07_GIT!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_07_GIT!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_07_GIT!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_07_GIT!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_07_GIT!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_07_GIT!\TOOLS_GIT
    set GRepo="git@github.com:lisitsinyr/TOOLS_GIT.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_07_GIT!\PROJECTS_GIT\TOOLS_SRC_GIT
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_GIT.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_01_03_UNIX ()
rem -----------------------------------------------
:MAIN_01_03_UNIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_01_03_UNIX=CHECK_LIST\01_OS\03_UNIX

    set GDirectory=!DIR_01_03_UNIX!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_01_03_UNIX!\TOOLS_SH
    set GRepo="git@github.com:lisitsinyr/TOOLS_SH.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_01_03_UNIX!\PROJECTS\UBUNTU
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\PROJECTS_UNIX\COMMANDS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\PROJECTS_UNIX\TESTS_SH
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_03_UNIX!\PROJECTS_UNIX\TOOLS_SRC_SH
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_SH.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_02_Python ()
rem -----------------------------------------------
:MAIN_05_02_Python
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_05_02_Python=CHECK_LIST\05_DESKTOP\02_Python

    set GDirectory=!DIR_05_02_Python!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\TOOLS_PY
    set GRepo=git@github.com:lisitsinyr/TOOLS_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\VENV\312
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\EXAMPLES_PY
    set GRepo=git@github.com:lisitsinyr/EXAMPLES_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\MobileAPP_PY
    rem set GRepo=git@github.com:lisitsinyr/MobileAPP.git
    set GRepo=git@github.com:lisitsinyr/MobileAPP_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\PATTERN_PY
    set GRepo=git@github.com:lisitsinyr/PATTERN_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\TEST_PY
    set GRepo=git@github.com:lisitsinyr/TEST_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\TESTS_PY
    set GRepo=git@github.com:lisitsinyr/TESTS_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\TOOLS_SRC_PY
    set GRepo=git@github.com:lisitsinyr/TOOLS_SRC_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\YOUTUBE_PY
    rem set GRepo=git@github.com:lisitsinyr/YOUTUBE.git
    set GRepo=git@github.com:lisitsinyr/YOUTUBE_PY.git
    call :MAIN_CreateDirectory || exit /b 1

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

    set PROJECTS_LYR_ROOT=D:
    set PROJECTS_LYR_ROOT=D:\WORK\WIN
    echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!

    if not exist "!PROJECTS_LYR_DIR!"\ (
        rem echo INFO: Dir "!PROJECTS_LYR_DIR!" not exist...
        rem echo INFO: Create "!PROJECTS_LYR_DIR!" ...
        mkdir "!PROJECTS_LYR_DIR!"
    )

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

    call :MAIN_SetROOT || exit /b 1

    call :MAIN_01_03_UNIX || exit /b 1
    
    call :MAIN_05_02_Python || exit /b 1
    
    call :MAIN_07_GIT || exit /b 1

    exit /b 0
:end

rem =================================================
rem ‘”Õ ÷»» LIB
rem =================================================

rem =================================================
rem LYRSupport.bat
rem =================================================
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem ===================================================================
