@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_test.bat
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
    echo ARGS:!ARGS!

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


    set LFileNameINIT=INIT_TOOLS_SRC_BAT.bat
    if not exist "!LFileNameINIT!" (
        echo ERROR: Файл установки !LFileNameINIT! не существует ...
        rem read -n 1 -s -r -p $'Press any key to continue ...\n'
        pause
        exit /b 1
    ) else (
        call !LFileNameINIT! "$0"
    )

    call [lyrxxx_]LIB.bat

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
