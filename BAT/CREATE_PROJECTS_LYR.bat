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
    set BATNAME=%~nx0
    echo —Ú‡Ú !BATNAME! ...

    set PROJECTS_LYR_ROOT=D:\WORK
    echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!

    if not exist "!PROJECTS_LYR_ROOT!"\ (
        mkdir "!PROJECTS_LYR_ROOT!"
    )
    cd /d "!PROJECTS_LYR_ROOT!"

    if not exist "PROJECTS_LYR"\ (
        mkdir "PROJECTS_LYR"
    )
    cd /d "PROJECTS_LYR"
    rem set PROJECTS_LYR_DIR=!CD!
    rem echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!
    
    call :MAIN_03_UNIX || exit /b 1
    
    exit /b 0
:end

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

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX"
    cd "CHECK_LIST\01_OS\03_UNIX"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^!SOFTWARE"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^!SOFTWARE"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^!ƒŒ ”Ã≈Õ“¿÷»ﬂ"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^!ƒŒ ”Ã≈Õ“¿÷»ﬂ"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^!ƒŒ ”Ã≈Õ“€"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^!ƒŒ ”Ã≈Õ“€"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^! Õ»√»"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^! Õ»√»"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^! ”–—€"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^! ”–—€"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^!—“¿“‹»"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^!—“¿“‹»"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\FRAMEWORK"
    cd "CHECK_LIST\01_OS\03_UNIX\FRAMEWORK"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\LIBRARY"
    cd "CHECK_LIST\01_OS\03_UNIX\LIBRARY"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS\UBUNTU"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS\UBUNTU"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\COMMANDS"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\COMMANDS"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TESTS_SH"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TESTS_SH"

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TOOLS_SRC_SH"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX"
    git clone git@github.com:lisitsinyr/TOOLS_SRC_SH.git

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\TOOLS_SH"
    cd "CHECK_LIST\01_OS\03_UNIX"
    git clone git@github.com:lisitsinyr/TOOLS_SH.git

    cd /d "!PROJECTS_LYR_DIR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\WORK"
    cd "CHECK_LIST\01_OS\03_UNIX\WORK"

    exit /b 0
:end

rem ===================================================================
