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

    cd /d "!PROJECTS_LYR!"

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
rem procedure MAIN_03_UNIX ()
rem -----------------------------------------------
:MAIN_03_UNIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_03_UNIX=CHECK_LIST\01_OS\03_UNIX

    set GDirectory=!DIR_03_UNIX!\"^!^!SOFTWARE"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"^!^!ƒŒ ”Ã≈Õ“¿÷»ﬂ"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"^!^!ƒŒ ”Ã≈Õ“€"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"^!^! Õ»√»"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"^!^! ”–—€"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"^!^!—“¿“‹»"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"FRAMEWORK"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"LIBRARY"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"WORK"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_UNIX!\"TOOLS_SH"
    set GRepo="git@github.com:lisitsinyr/TOOLS_SH.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_UNIX!\"PROJECTS\UBUNTU"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"PROJECTS_UNIX\COMMANDS"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"PROJECTS_UNIX\TESTS_SH"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_UNIX!\"PROJECTS_UNIX\TOOLS_SRC_SH"
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_SH.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_02_Python ()
rem -----------------------------------------------
:MAIN_02_Python
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_02_Python=CHECK_LIST\05_DESKTOP\02_Python

    set GDirectory=!DIR_02_Python!\"^!^!SOFTWARE"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"^!^!ƒŒ ”Ã≈Õ“¿÷»ﬂ"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"^!^!ƒŒ ”Ã≈Õ“€"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"^!^! Õ»√»"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"^!^! ”–—€"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"^!^!—“¿“‹»"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"FRAMEWORK"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"LIBRARY"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"PROJECTS"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"TOOLS_PY"
    set GRepo=git@github.com:lisitsinyr/TOOLS_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"VENV\312"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"WORK"
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"PROJECTS_PY\EXAMPLES_PY"
    set GRepo=git@github.com:lisitsinyr/EXAMPLES_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"PROJECTS_PY\MobileAPP_PY"
    set GRepo=git@github.com:lisitsinyr/MobileAPP.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"PROJECTS_PY\PATTERN_PY"
    set GRepo=git@github.com:lisitsinyr/PATTERN_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"PROJECTS_PY\TEST_PY"
    set GRepo=git@github.com:lisitsinyr/TEST_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"PROJECTS_PY\TESTS_PY"
    set GRepo=git@github.com:lisitsinyr/TESTS_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"PROJECTS_PY\TOOLS_SRC_PY"
    set GRepo=git@github.com:lisitsinyr/TOOLS_SRC_PY.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_02_Python!\"PROJECTS_PY\YOUTUBE_PY"
    set GRepo=git@github.com:lisitsinyr/YOUTUBE.git
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
    set PROJECTS_LYR_ROOT=D:\WORK
    echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!
    set PROJECTS_LYR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    echo PROJECTS_LYR:!PROJECTS_LYR!

    if not exist "!PROJECTS_LYR!"\ (
        rem echo INFO: Dir "!PROJECTS_LYR!" not exist...
        rem echo INFO: Create "!PROJECTS_LYR!" ...
        mkdir "!PROJECTS_LYR!"
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

    call :MAIN_03_UNIX || exit /b 1
    
    call :MAIN_02_Python || exit /b 1

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
