@echo off
rem -------------------------------------------------------------------
rem ListDirs.bat [lyrxxx_]PATTERN_empty.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    cls

    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    call :FOR_03

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem for /f [<parsingkeywords>] {%%|%}<variable> in (<set>) do <command> [<commandlinepptions>]
rem for /f [<parsingkeywords>] {%%|%}<variable> in (<literalstring>) do <command> [<commandlinepptions>]
rem for /f [<parsingkeywords>] {%%|%}<variable> in ('<command>') do <command> [<commandlinepptions>]

rem +%%~I   Expands %I which removes any surrounding quotation marks.
rem +%%~fI  Expands %I to a fully qualified path name.
rem +%%~dI  Expands %I to a drive letter only.
rem +%%~pI  Expands %I to a path only.
rem +%%~nI  Expands %I to a file name only.
rem +%%~xI  Expands %I to a file name extension only.
rem %%~sI  Expands path to contain short names only.
rem +%%~aI  Expands %I to the file attributes of file.
rem +%%~tI  Expands %I to the date and time of file.
rem +%%~zI  Expands %I to the size of the file.

rem -----------------------------------------------
rem procedure FOR_01 ()
rem -----------------------------------------------
:FOR_01
rem beginfunction
    rem FOR - цикл по всем файлам в одной директории (исключая её подкаталоги)
    for %%I in ( *.* ) do (
        echo --------------------------------
        echo filepath      : %%~fI
        echo filename+ext  : %%I
        echo filename+ext  : %%~I %%~aI %%~tI %%~zI
        echo drive letter  : %%~dI
        echo path          : %%~pI
        echo filename      : %%~nI 
        echo ext           : %%~xI
    )

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure FOR_02 ()
rem -----------------------------------------------
:FOR_02
rem beginfunction
    rem FOR /D - цикл через несколько папок
    for /D %%I in ( *.* ) do (
        echo --------------------------------
        echo Каталог: %%I
        echo --------------------------------
        echo filepath      : %%~fI
        echo filename+ext  : %%I
        echo filename+ext  : %%~I %%~aI %%~tI %%~zI
        echo drive letter  : %%~dI
        echo path          : %%~pI
        echo filename      : %%~nI 
        echo ext           : %%~xI
    )

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure FOR_03 ()
rem -----------------------------------------------
:FOR_03
rem beginfunction
    rem FOR /R - цикл по всем файлам, включая подкаталоги
    rem for /R %%I in ( *.* ) do (
    rem     echo Каталог: %%I
    rem )
    for /R /D %%I in ( *.* ) do (
        echo --------------------------------
        echo filepath      : %%~fI
        echo filename+ext  : %%I
        echo filename+ext  : %%~I %%~aI %%~tI %%~zI
        echo drive letter  : %%~dI
        echo path          : %%~pI
        echo filename      : %%~nI 
        echo ext           : %%~xI
    )

    exit /b 0
rem endfunction

rem ===================================================================
