@echo off
rem -------------------------------------------------------------------
rem LYRStrUtils.bat
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
rem procedure LYRStrUtilsINIT () -> None
rem --------------------------------------------------------------------------------
:LYRStrUtilsINIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRStrUtilsINIT
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

    rem echo INFO: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function TrimLeft (ASTR) -> TrimLeft
rem --------------------------------------------------------------------------------
:TrimLeft
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=TrimLeft
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1
    rem echo ..LA.. ASTR:!ASTR!

    rem Обрезать слева - обрезать пробелы в начале строки
    for /f "tokens=* delims= " %%a in ("!ASTR!") do set ASTR=%%a

    set TrimLeft=!ASTR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function TrimRight (ASTR) -> TrimRight
rem --------------------------------------------------------------------------------
:TrimRight
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=TrimRight
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1
    rem echo ..LA.. ASTR:!ASTR!

    rem Обрезать справа - обрезать пробелы в конце строки
    for /l %%a in (1,1,31) do if "!ASTR:~-1!"==" " set ASTR=!ASTR:~0,-1!

    set TrimRight=!ASTR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function Trim (ASTR) -> Trim
rem --------------------------------------------------------------------------------
:Trim
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Trim
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1

    call :TrimLeft !ASTR!
    call :TrimRight !ASTR!

    set Trim=!ASTR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function Left (ASTR, Alen) -> Left
rem --------------------------------------------------------------------------------
:Left
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Left
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1
    rem echo ..LA.. ASTR:!ASTR!
    set /a Alen=%2
    rem echo ..LA.. Alen:!Alen!

    set Left=!ASTR:~0,%Alen%!
    rem set "substring=!string:~%start%,%length%!"

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function  Mid (ASTR, Aposition, Alen) -> Mid
rem --------------------------------------------------------------------------------
:Mid
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Mid
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1
    rem echo ..LA.. ASTR:!ASTR!
    set /a Aposition=%2
    rem echo ..LA.. Aposition:!Aposition!
    set /a Alen=%3
    rem echo ..LA.. Alen:!Alen!

    set Mid=!ASTR:~%Aposition%,%Alen%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function TrimQuotes (ASTR) -> TrimQuotes
rem --------------------------------------------------------------------------------
:TrimQuotes
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=TrimQuotes
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%1
    rem echo ..LA.. ASTR:!ASTR!

    for %%a in ( '%ASTR%' ) do (
        echo %%~a
        set ASTR=%%~a
    )

    set TrimQuotes=!ASTR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function ListToStr (ASTR*) -> ListToStr
rem --------------------------------------------------------------------------------
:ListToStr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ListToStr
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem echo ..LA.. _:%*
    set ASTR=%*

    set LSTR=
    call :Read_N %*
    rem echo ..LA.. Read_N:!Read_N!

    if !Read_N! GTR 0 (
        if !Read_N! EQU 1 (
            set LSTR=%1
        ) else (
            set n=1
            for %%a in ( %* ) do (
                rem echo ..LA.. a:%%a
                if !n! EQU 1 (
                    set LSTR=!LSTR! %%a
                ) else (
                    if !n! EQU !Read_N! (
                        set LSTR=!LSTR! %%a
                    ) else (
                        set LSTR=!LSTR! %%a
                    )
                )
                set /A n+=1
            )
            rem set LSTR=!LSTR!
        )
    )
    rem echo ..LA.. LSTR:!LSTR!

    set ListToStr=!LSTR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function StrLen (StrVar [RtnVar]) ->
rem --------------------------------------------------------------------------------
:StrLen
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=StrLen
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set s=#!%~1!
    rem echo s:!s!
    set var=%~2
    rem echo var:!var!

    rem ---------------------------------------------
    rem 1 вариант
    rem ---------------------------------------------
    set /a __len=0

    for %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
        if "!s:~%%N,1!" neq "" (
            rem echo %%N
            set /a __len+=%%N
            set s=!s:~%%N!
        )
    )
    if defined var (
        set !var!=!__len!
    )
    set StrLen=!__len!

    set /a __len=0

    exit /b
rem endfunction

rem --------------------------------------------------------------------------------
rem function StrLen2 (StrVar [RtnVar]) ->
rem --------------------------------------------------------------------------------
:StrLen2
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=StrLen2
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set s=#!%~1!
    rem echo s:!s!
    set var=%~2
    rem echo var:!var!

    rem ---------------------------------------------
    rem 2 вариант
    rem ---------------------------------------------
    set /a __len=0
    set nums=32 16 8 4 2 1
    for %%N in (%nums%) do if not "!s:~%%N,1!"=="" set /a __len+=%%N & set s=!s:~%%N!

    if defined var (
        set !var!=!__len!
    )
    set StrLen=!__len!

    set /a __len=0

    exit /b
rem endfunction

rem --------------------------------------------------------------------------------
rem function __StrLen4 (StrVar) ->
rem --------------------------------------------------------------------------------
:__StrLen4
    set __s=%~1
    rem echo __s:!__s!
    if not "%__s%"=="" set /a __len+=1 & call :__StrLen4 "%__s:~1%"

    exit /b
rem endfunction

rem --------------------------------------------------------------------------------
rem function StrLen4 (StrVar [RtnVar]) ->
rem --------------------------------------------------------------------------------
:StrLen4
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=StrLen4

    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set __s=%~1
    set __var=%~2
            
    rem ---------------------------------------------
    rem 4 вариант
    rem ---------------------------------------------
    set /a __len=0
    call :__StrLen4 "!__s!"

    if defined __var (
        set !__var!=!__len!
    )
    set StrLen4=!__len!

    exit /b
rem endfunction

rem --------------------------------------------------------------------------------
rem function StrLen5 (StrVar [RtnVar]) ->
rem --------------------------------------------------------------------------------
:StrLen5
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=StrLen4
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem ---------------------------------------------
    rem 5 вариант
    rem ---------------------------------------------
    rem :strlen4  StrVar  RtnVar  --  be sure to check if the returned errorlevel is 0
    rem (   setlocal enabledelayedexpansion & set /a "}=0"
    set /a "}=0"
    if "%~1" neq "" if defined %~1 (
        for %%# in (4096 2048 1024 512 256 128 64 32 16) do (
            if "!%~1:~%%#,1!" neq "" set "%~1=!%~1:~%%#!" & set /a "}+=%%#"
        )
        set "%~1=!%~1!0FEDCBA9876543211" & set /a "}+=0x!%~1:~32,1!!%~1:~16,1!"
    )

    set /a "%~2=%}%"

    exit /b
rem endfunction

rem =================================================
rem LYRSupport.bat
rem =================================================
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem ===================================================================
