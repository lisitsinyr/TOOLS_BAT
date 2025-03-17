@echo off
rem -------------------------------------------------------------------
rem PROJECTS_LYR_PULL.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem -------------------------------------------------------------------
rem SCRIPTS_DIR -  ‡Ú‡ÎÓ„ ÒÍËÔÚÓ‚
rem -------------------------------------------------------------------
if not defined SCRIPTS_DIR (
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
)
rem -------------------------------------------------------------------
rem LIB_BAT - Í‡Ú‡ÎÓ„ ·Ë·ÎËÓÚÂÍË ÒÍËÔÚÓ‚
rem -------------------------------------------------------------------
set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB

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
    rem PROJECTS_LYR_ROOT - Î¡‘¡Ãœ« ”À“…–‘œ◊
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_ROOT=D:\WORK\WIN
    set PROJECTS_LYR_ROOT=D:
    rem echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - Î¡‘¡Ãœ« ”À“…–‘œ◊
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!
    if not exist "!PROJECTS_LYR_DIR!"\ (
        rem echo INFO: Dir "!PROJECTS_LYR_DIR!" not exist ...
        echo INFO: Create "!PROJECTS_LYR_DIR!" ...
        mkdir "!PROJECTS_LYR_DIR!"
    )

    exit /b 0
rem endfunction

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

    if not exist "!GDirectory!"\ (
        echo GDirectory:!GDirectory!
        rem echo INFO: Dir "!GDirectory!" not exist ...
        echo INFO: Create "!GDirectory!" ...
        mkdir "!GDirectory!"
    )

    cd /d !GDirectory!

    if defined GRepo (
        echo GDirectory:!GDirectory!
        rem echo GRepo:!GRepo!
        if not exist ".git"\ (
            cd ..\
            echo ...git clone:!GRepo!
            git clone !GRepo!
        ) else (
            echo ...git pull:!GRepo!
            git pull
            rem call :PressAnyKey || exit /b 1
        )
    )

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_01_UNIX ()
rem -----------------------------------------------
:MAIN_01_UNIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 01_UNIX ...
    echo ===============================

    set DIR_01_UNIX=CHECK_LIST\OS\UNIX

    set GDirectory=!DIR_01_UNIX!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_01_UNIX!\TOOLS_SH
    set GRepo="git@github.com:lisitsinyr/TOOLS_SH.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_01_UNIX!\PROJECTS\UBUNTU
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\PROJECTS_UNIX\COMMANDS_SH
    set GRepo=git@github.com:lisitsinyr/COMMANDS_SH.git
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\PROJECTS_UNIX\TESTS_SH
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_01_UNIX!\PROJECTS_UNIX\TOOLS_SRC_SH
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_SH.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_03_KIX ()
rem -----------------------------------------------
:MAIN_03_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 03_KIX ...
    echo ===============================

    set DIR_03_KIX=CHECK_LIST\SCRIPT\KIX

    set GDirectory=!DIR_03_KIX!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_KIX!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_KIX!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_KIX!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_KIX!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_KIX!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_KIX!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_KIX!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_KIX!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_KIX!\TOOLS_KIX
    set GRepo="git@github.com:lisitsinyr/TOOLS_KIX.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_KIX!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_KIX!\PROJECTS_KIX\TOOLS_SRC_KIX
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_KIX.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    exit /b 0
    
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_03_BAT ()
rem -----------------------------------------------
:MAIN_03_BAT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 03_BAT ...
    echo ===============================

    set DIR_03_BAT=CHECK_LIST\SCRIPT\BAT

    set GDirectory=!DIR_03_BAT!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_BAT!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_BAT!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_BAT!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_BAT!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_BAT!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_BAT!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_BAT!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_BAT!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_BAT!\TOOLS_BAT
    set GRepo="git@github.com:lisitsinyr/TOOLS_BAT.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_BAT!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_BAT!\PROJECTS_BAT\TOOLS_SRC_BAT
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_BAT.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    exit /b 0
    
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_Pascal_Delphi ()
rem -----------------------------------------------
:MAIN_05_Pascal_Delphi
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_Pascal_Delphi ...
    echo ===============================

    set DIR_05_Pascal_Delphi=CHECK_LIST\DESKTOP\Pascal_Delphi

    set GDirectory=!DIR_05_Pascal_Delphi!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\01_Delphi_5
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi!\02_Delphi_7
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_05_Pascal_Delphi!\03_Delphi_11
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_05_Pascal_Delphi!\04_TP5
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_05_Pascal_Delphi!\99_Õ¿—“–Œ… »
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_Pascal_Delphi_01_Delphi_5 ()
rem -----------------------------------------------
:MAIN_05_Pascal_Delphi_01_Delphi_5
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_05_Pascal_Delphi_01_Delphi_5=CHECK_LIST\DESKTOP\Pascal_Delphi\01_Delphi_5

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\Õ¿—“–Œ… »
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\LIBRARY_D5
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_01_Delphi_5!\PROJECTS_D5
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_Pascal_Delphi_02_Delphi_7 ()
rem -----------------------------------------------
:MAIN_05_Pascal_Delphi_02_Delphi_7
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_05_Pascal_Delphi_02_Delphi_7=CHECK_LIST\DESKTOP\Pascal_Delphi\02_Delphi_7

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\Õ¿—“–Œ… »
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\LIBRARY_D7
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\PROJECTS_D7\LUIS_D7
    set GRepo="git@github.com:lisitsinyr/LUIS_D7.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_02_Delphi_7!\PROJECTS_D7\TOOLS_D7
    set GRepo="git@github.com:lisitsinyr/TOOLS_D7.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_Pascal_Delphi_03_Delphi_11 ()
rem -----------------------------------------------
:MAIN_05_Pascal_Delphi_03_Delphi_11
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_05_Pascal_Delphi_03_Delphi_11=CHECK_LIST\DESKTOP\Pascal_Delphi\03_Delphi_11

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\Õ¿—“–Œ… »
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\LIBRARY_D11
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\PROJECTS_D11\LUIS_D11
    set GRepo="git@github.com:lisitsinyr/LUIS_D11.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Pascal_Delphi_03_Delphi_11!\PROJECTS_D11\TOOLS_D11
    set GRepo="git@github.com:lisitsinyr/TOOLS_D11.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_Python ()
rem -----------------------------------------------
:MAIN_05_Python
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_Python ...
    echo ===============================

    set DIR_05_Python=CHECK_LIST\DESKTOP\Python

    set GDirectory=!DIR_05_Python!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\TOOLS_PY
    set GRepo="git@github.com:lisitsinyr/TOOLS_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\VENV\312
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\PROJECTS_PY\EXAMPLES_PY
    set GRepo="git@github.com:lisitsinyr/EXAMPLES_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\PROJECTS_PY\MobileAPP_PY
    rem set GRepo=git@github.com:lisitsinyr/MobileAPP.git
    set GRepo="git@github.com:lisitsinyr/MobileAPP_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\PROJECTS_PY\PATTERN_PY
    set GRepo="git@github.com:lisitsinyr/PATTERN_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\PROJECTS_PY\TEST_PY
    set GRepo="git@github.com:lisitsinyr/TEST_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\PROJECTS_PY\TESTS_PY
    set GRepo="git@github.com:lisitsinyr/TESTS_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\PROJECTS_PY\TOOLS_SRC_PY
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Python!\PROJECTS_PY\YOUTUBE_PY
    rem set GRepo="git@github.com:lisitsinyr/YOUTUBE.git"
    set GRepo="git@github.com:lisitsinyr/YOUTUBE_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_Java ()
rem -----------------------------------------------
:MAIN_05_Java
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_Java ...
    echo ===============================

    set DIR_05_Java=CHECK_LIST\DESKTOP\Java

    set GDirectory=!DIR_05_Java!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\TOOLS_JAVA
    set GRepo="git@github.com:lisitsinyr/TOOLS_JAVA.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\PROJECTS_JAVA\TESTS_JAVA
    set GRepo="git@github.com:lisitsinyr/TESTS_JAVA.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_Java!\PROJECTS_JAVA\TOOLS_SRC_JAVA
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_JAVA.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_GIT ()
rem -----------------------------------------------
:MAIN_GIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo GIT ...
    echo ===============================

    set DIR_GIT=CHECK_LIST\GIT

    set GDirectory=!DIR_GIT!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_GIT!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_GIT!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_GIT!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_GIT!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_GIT!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_GIT!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_GIT!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_GIT!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_GIT!\TOOLS_GIT
    set GRepo="git@github.com:lisitsinyr/TOOLS_GIT.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_GIT!\PROJECTS_GIT\TOOLS_SRC_GIT
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_GIT.git"
    call :MAIN_CreateDirectory || exit /b 1

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

    call :MAIN_01_UNIX || exit /b 1
    
    rem call :MAIN_03_KIX || exit /b 1

    rem call :MAIN_03_BAT || exit /b 1
    
    rem call :MAIN_05_Pascal_Delphi || exit /b 1
    rem call :MAIN_05_Pascal_Delphi_01_Delphi_5 || exit /b 1
    rem call :MAIN_05_Pascal_Delphi_02_Delphi_7 || exit /b 1
    rem call :MAIN_05_Pascal_Delphi_03_Delphi_11 || exit /b 1

    rem call :MAIN_05_Python || exit /b 1
    
    rem call :MAIN_05_Java || exit /b 1

    rem call :MAIN_GIT || exit /b 1

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
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem ===================================================================
