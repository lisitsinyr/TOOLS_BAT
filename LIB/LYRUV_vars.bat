@echo off
rem -------------------------------------------------------------------
rem LYRUV_vars.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem Выход из сценария. Дальше - только функции.
    exit /b 0
:end

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRUV_vars_INIT () -> None
rem --------------------------------------------------------------------------------
:LYRUV_vars_INIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRUV_vars_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem CONST
    rem -------------------------------------------------------------------

    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------

    rem echo ERROR: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __INIT_project_types (VarName) -> None
rem --------------------------------------------------------------------------------
:__INIT_project_types
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=INIT_project_types
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo VarName:!VarName!

    set !VarName!_caption.1=1.app
    set !VarName!_caption.2=2.lib
    set !VarName!_caption.3=3.bare
    set !VarName!_caption.4=4.script
    set !VarName!_value.1=app
    set !VarName!_value.2=lib
    set !VarName!_value.3=bare
    set !VarName!_value.4=script

    rem set !VarName!_caption
    rem set !VarName!_value

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __DEL_project_types (VarName) -> None
rem --------------------------------------------------------------------------------
:__DEL_project_types
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__DEL_project_types
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo VarName:!VarName!

    :: относительно просто удалить переменные
    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_caption' ) do (
        set %%k=
    )
    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_value' ) do (
        set %%k=
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __GET_project_type_str (VarName VarValue) -> None
rem --------------------------------------------------------------------------------
:__GET_project_type_str
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__GET_project_type_str
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    set VarValue=%~2

    set /a i=0
    set /a result=0
    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_value' ) do (
        set /a i=i+1
        if !%%k!==!VarValue! set /a result=i
    )

    set !VarName!=!result!
    set __GET_project_type_str=!result!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __GET_project_type_number (VarName VarValue) -> None
rem --------------------------------------------------------------------------------
:__GET_project_type_number
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__GET_project_type
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    set /a VarValue=%~2

    set /a i=0
    set result=
    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_value' ) do (
        set /a i=i+1
        if !i! == !VarValue! set result=!%%k!
    )

    set !VarName!=!result!
    set __GET_project_type_number=!result!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __SHOW_project_types (VarName) -> None
rem --------------------------------------------------------------------------------
:__SHOW_project_types
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SHOW_project_types
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo VarName:!VarName!

    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_caption' ) do (
        echo !%%k!
    )

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
