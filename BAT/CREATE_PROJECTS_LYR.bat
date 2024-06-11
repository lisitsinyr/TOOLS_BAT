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

    set ROOT_PROJECTS_LYR=D:\WORK
    echo ROOT_PROJECTS_LYR:!ROOT_PROJECTS_LYR!
    set PROJECTS_LYR=PROJECTS_LYR
    echo PROJECTS_LYR:!PROJECTS_LYR!
    set DIR_PROJECTS_LYR=!ROOT_PROJECTS_LYR!\!PROJECTS_LYR!
    echo DIR_PROJECTS_LYR:!DIR_PROJECTS_LYR!

    if not exist "!ROOT_PROJECTS_LYR!"\ (
        mkdir "!ROOT_PROJECTS_LYR!"
    )
    cd /d "!ROOT_PROJECTS_LYR!"

    if not exist "!PROJECTS_LYR!"\ (
        mkdir "!PROJECTS_LYR!"
    )
    cd /d "!PROJECTS_LYR!"
    rem set DIR_PROJECTS_LYR=!CD!
    rem echo DIR_PROJECTS_LYR:!DIR_PROJECTS_LYR!
    
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

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX"
    cd "CHECK_LIST\01_OS\03_UNIX"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^!SOFTWARE"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^!SOFTWARE"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^!ƒŒ ”Ã≈Õ“¿÷»ﬂ"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^!ƒŒ ”Ã≈Õ“¿÷»ﬂ"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^!ƒŒ ”Ã≈Õ“€"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^!ƒŒ ”Ã≈Õ“€"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^! Õ»√»"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^! Õ»√»"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^! ”–—€"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^! ”–—€"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\^!^!—“¿“‹»"
    cd "CHECK_LIST\01_OS\03_UNIX\^!^!—“¿“‹»"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\FRAMEWORK"
    cd "CHECK_LIST\01_OS\03_UNIX\FRAMEWORK"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\LIBRARY"
    cd "CHECK_LIST\01_OS\03_UNIX\LIBRARY"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS\UBUNTU"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS\UBUNTU"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\COMMANDS"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\COMMANDS"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TESTS_SH"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TESTS_SH"

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TOOLS_SRC_SH"
    cd "CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX"
    git clone git@github.com:lisitsinyr/TOOLS_SRC_SH.git

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\TOOLS_SH"
    cd "CHECK_LIST\01_OS\03_UNIX"
    git clone git@github.com:lisitsinyr/TOOLS_SH.git

    cd /d "!DIR_PROJECTS_LYR!"
    mkdir "CHECK_LIST\01_OS\03_UNIX\WORK"
    cd "CHECK_LIST\01_OS\03_UNIX\WORK"

    exit /b 0
:end

rem ===================================================================
