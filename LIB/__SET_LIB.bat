@echo off
rem -------------------------------------------------------------------
rem __SET_LIB.bat
rem -------------------------------------------------------------------
rem chcp 1251
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :__SET_LIB
rem     :__SET_MAIN
rem     :__SET_CHECK_REPO
rem     :__SET_CHECK_PROJECT
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure __SET_LIB ()
rem --------------------------------------------------------------------------------
:__SET_LIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_LIB
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_SET ()
rem -----------------------------------------------
:__SET_MAIN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_MAIN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
 
    call :LYRConst %1 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_CHECK_REPO ()
rem --------------------------------------------------------------------------------
:__SET_CHECK_REPO
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_CHECK_REPO
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem Проверка существования файла REPO.ini
    if exist !REPO_INI! (
        for /f "eol=# delims== tokens=1,2" %%i in (%REPO_INI%) do (
            rem В переменной i - ключ
            rem В переменной j - значение
            set %%i=%%j
            rem echo %%i: %%%j%
        )
    ) else (
        echo INFO: File !REPO_INI! not exist
        rem exit /b 1
    )
    rem echo REPO_NAME: !REPO_NAME!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_CHECK_PROJECT ()
rem --------------------------------------------------------------------------------
:__SET_CHECK_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_CHECK_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem Проверка существования файла PROJECT.ini
    if exist !PROJECT_INI! (
        for /f "eol=# delims== tokens=1,2" %%i in (%PROJECT_INI%) do (
            rem В переменной i - ключ
            rem В переменной j - значение
            set %%i=%%j
            rem echo %%i: %%%j%
        )
    ) else (
        echo INFO: File !PROJECT_INI! not exist
        rem exit /b 1
    )
    rem echo PROJECT_NAME: !PROJECT_NAME!

    exit /b 0
rem endfunction


rem ===================================================================

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem __SET_LIB.bat
rem =================================================
:LYRConst
%LIB_BAT%\LYRConst.bat %*
exit /b 0
