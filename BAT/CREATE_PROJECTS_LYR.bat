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

    echo GDirectory:!GDirectory!
    rem echo GRepo:!GRepo!

    cd /d "!PROJECTS_LYR_ROOT!"

    if not exist "!GDirectory!"\ (
        mkdir "!GDirectory!"
    )
    if defined GRepo (
        cd /d !GDirectory!
        rem git clone !GRepo!
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

    set DIR_03_UNIX=PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX

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

    set DIR_02_Python=PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python

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
    rem SCRIPTS_DIR -  ‡Ú‡ÎÓ„ ÒÍËÔÚÓ‚
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    )

    rem -------------------------------------------------------------------
    rem LIB_BAT - Í‡Ú‡ÎÓ„ ·Ë·ÎËÓÚÂÍË ÒÍËÔÚÓ‚
    rem -------------------------------------------------------------------
    set LIB_BAT=!SCRIPTS_DIR!\LIB

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_KIX -  ‡Ú‡ÎÓ„ ÒÍËÔÚÓ‚ KIX
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR_KIX (
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_SRC_KIX
    )

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

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set PROJECTS_LYR_ROOT=D:\WORK
    set PN_CAPTION=PROJECTS_LYR_ROOT
    call :Read_P PROJECTS_LYR_ROOT %1 || exit /b 1
    rem echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!
    if defined PROJECTS_LYR_ROOT (
        set ARGS=!ARGS! !PROJECTS_LYR_ROOT!
    ) else (
        echo ERROR: PROJECTS_LYR_ROOT not defined ...
        set OK=
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

    call :MAIN_INIT || exit /b 1

    call :MAIN_CHECK_PARAMETR %* || exit /b 1

    rem set PROJECTS_LYR_ROOT=D:\WORK
    echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    if not exist "!PROJECTS_LYR_ROOT!"\ (
        mkdir "!PROJECTS_LYR_ROOT!"
    )

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
