@echo off
rem -------------------------------------------------------------------
rem PROJECTS_LYR_PULL.bat
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
        rem echo INFO: Dir "!PROJECTS_LYR_DIR!" not exist...
        rem echo INFO: Create "!PROJECTS_LYR_DIR!" ...
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
        rem echo INFO: Create "!GDirectory!" ...
        mkdir "!GDirectory!"
    )

    cd /d !GDirectory!

    if defined GRepo (
        rem echo GRepo:!GRepo!
        if not exist ".git"\ (
            cd ..\
            echo ...git clone: !GRepo!
            git clone !GRepo!
        ) else (
            echo ...git pull: !GRepo!
            git pull
        )
    )

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

    set GDirectory=!DIR_01_03_UNIX!\PROJECTS_UNIX\COMMANDS_SH
    set GRepo=git@github.com:lisitsinyr/COMMANDS_SH.git
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
rem procedure MAIN_03_01_KIX ()
rem -----------------------------------------------
:MAIN_03_01_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_03_01_KIX=CHECK_LIST\03_SCRIPT\01_KIX

    set GDirectory=!DIR_03_01_KIX!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_01_KIX!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_01_KIX!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_01_KIX!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_01_KIX!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_01_KIX!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_01_KIX!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_01_KIX!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_01_KIX!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_01_KIX!\TOOLS_KIX
    set GRepo="git@github.com:lisitsinyr/TOOLS_KIX.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_01_KIX!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_01_KIX!\PROJECTS_KIX\TOOLS_SRC_KIX
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_KIX.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    exit /b 0
    
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_03_04_BAT ()
rem -----------------------------------------------
:MAIN_03_04_BAT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_03_04_BAT=CHECK_LIST\03_SCRIPT\04_BAT

    set GDirectory=!DIR_03_04_BAT!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_04_BAT!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_04_BAT!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_04_BAT!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_04_BAT!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_04_BAT!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_04_BAT!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_04_BAT!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_04_BAT!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_04_BAT!\TOOLS_BAT
    set GRepo="git@github.com:lisitsinyr/TOOLS_BAT.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_03_04_BAT!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_03_04_BAT!\PROJECTS_BAT\TOOLS_SRC_BAT
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_BAT.git"
    call :MAIN_CreateDirectory || exit /b 1
    
    exit /b 0
    
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_01_Pascal_Delphi ()
rem -----------------------------------------------
:MAIN_05_01_Pascal_Delphi
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_05_01_Pascal_Delphi=CHECK_LIST\05_DESKTOP\01_Pascal_Delphi

    set GDirectory=!DIR_05_01_Pascal_Delphi!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\01_Delphi_5
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi!\02_Delphi_7
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_05_01_Pascal_Delphi!\03_Delphi_11
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_05_01_Pascal_Delphi!\04_TP5
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1
    
    set GDirectory=!DIR_05_01_Pascal_Delphi!\99_Õ¿—“–Œ… »
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_01_Pascal_Delphi_01_Delphi_5 ()
rem -----------------------------------------------
:MAIN_05_01_Pascal_Delphi_01_Delphi_5
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_05_01_Pascal_Delphi_01_Delphi_5=CHECK_LIST\05_DESKTOP\01_Pascal_Delphi\01_Delphi_5

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\Õ¿—“–Œ… »
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\LIBRARY_D5
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_01_Delphi_5!\PROJECTS_D5
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_01_Pascal_Delphi_02_Delphi_7 ()
rem -----------------------------------------------
:MAIN_05_01_Pascal_Delphi_02_Delphi_7
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_05_01_Pascal_Delphi_02_Delphi_7=CHECK_LIST\05_DESKTOP\01_Pascal_Delphi\02_Delphi_7

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\Õ¿—“–Œ… »
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\LIBRARY_D7
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\PROJECTS_D7\LUIS_D7
    set GRepo="git@github.com:lisitsinyr/LUIS_D7.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_02_Delphi_7!\PROJECTS_D7\TOOLS_D7
    set GRepo="git@github.com:lisitsinyr/TOOLS_D7.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_01_Pascal_Delphi_03_Delphi_11 ()
rem -----------------------------------------------
:MAIN_05_01_Pascal_Delphi_03_Delphi_11
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_05_01_Pascal_Delphi_03_Delphi_11=CHECK_LIST\05_DESKTOP\01_Pascal_Delphi\03_Delphi_11

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\Õ¿—“–Œ… »
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\LIBRARY_D11
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\PROJECTS_D11\LUIS_D11
    set GRepo="git@github.com:lisitsinyr/LUIS_D11.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_01_Pascal_Delphi_03_Delphi_11!\PROJECTS_D11\TOOLS_D11
    set GRepo="git@github.com:lisitsinyr/TOOLS_D11.git"
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
    set GRepo="git@github.com:lisitsinyr/TOOLS_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\VENV\312
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\EXAMPLES_PY
    set GRepo="git@github.com:lisitsinyr/EXAMPLES_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\MobileAPP_PY
    rem set GRepo=git@github.com:lisitsinyr/MobileAPP.git
    set GRepo="git@github.com:lisitsinyr/MobileAPP_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\PATTERN_PY
    set GRepo="git@github.com:lisitsinyr/PATTERN_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\TEST_PY
    set GRepo="git@github.com:lisitsinyr/TEST_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\TESTS_PY
    set GRepo="git@github.com:lisitsinyr/TESTS_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\TOOLS_SRC_PY
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_02_Python!\PROJECTS_PY\YOUTUBE_PY
    rem set GRepo="git@github.com:lisitsinyr/YOUTUBE.git"
    set GRepo="git@github.com:lisitsinyr/YOUTUBE_PY.git"
    call :MAIN_CreateDirectory || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_05_03_Java ()
rem -----------------------------------------------
:MAIN_05_03_Java
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_05_03_Java=CHECK_LIST\05_DESKTOP\03_Java

    set GDirectory=!DIR_05_03_Java!\SOFTWARE
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\ƒŒ ”Ã≈Õ“¿÷»ﬂ
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\ƒŒ ”Ã≈Õ“€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\ Õ»√»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\ ”–—€
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\—“¿“‹»
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\FRAMEWORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\LIBRARY
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\PROJECTS
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\TOOLS_JAVA
    set GRepo="git@github.com:lisitsinyr/TOOLS_JAVA.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\WORK
    set GRepo=
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\PROJECTS_JAVA\TESTS_JAVA
    set GRepo="git@github.com:lisitsinyr/TESTS_JAVA.git"
    call :MAIN_CreateDirectory || exit /b 1

    set GDirectory=!DIR_05_03_Java!\PROJECTS_JAVA\TOOLS_SRC_JAVA
    set GRepo="git@github.com:lisitsinyr/TOOLS_SRC_JAVA.git"
    call :MAIN_CreateDirectory || exit /b 1

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
    
    rem call :MAIN_03_01_KIX || exit /b 1

    rem call :MAIN_03_04_BAT || exit /b 1
    
    rem call :MAIN_05_01_Pascal_Delphi || exit /b 1
    rem call :MAIN_05_01_Pascal_Delphi_01_Delphi_5 || exit /b 1
    rem call :MAIN_05_01_Pascal_Delphi_02_Delphi_7 || exit /b 1
    rem call :MAIN_05_01_Pascal_Delphi_03_Delphi_11 || exit /b 1

    rem call :MAIN_05_02_Python || exit /b 1
    
    rem call :MAIN_05_03_Java || exit /b 1

    rem call :MAIN_07_GIT || exit /b 1

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
