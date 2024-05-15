@echo off
rem -------------------------------------------------------------------
rem LYRFileUtils.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRFileUtils
rem     :ExtractFileDir
rem     :ExtractFileName
rem     :ExtractFileNameWithoutExt
rem     :ExtractFileExt
rem     :FileAttr
rem     :CurrentDir
rem -------------------------------------------------------------------
rem d -- drive
rem p -- path
rem n -- file name
rem x -- extension
rem f -- full path
rem -------------------------------------------------------------------
rem Use the special %0 variable to get the path to the current file.
rem в двойных кавычках
rem BATFilename1="D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\BAT\test.bat"
rem set BATFilename1=%0
rem echo BATFilename1=%BATFilename1%

rem Use the special %0 variable to get the path to the current file.
rem без кавычек
rem f -- full path
rem BATFilename2=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\BAT\test.bat
rem set BATFilename2=%~f0
rem echo BATFilename2=%BATFilename2%

rem Use the special %0 variable to get the path to the current file.
rem p -- path
rem Pathname=\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\BAT\
rem set Pathname=%~p0
rem echo Pathname=%Pathname%

rem Use the special %0 variable to get the path to the current file.
rem d -- drive
rem Drive=D:
rem set Drive=%~d0
rem echo Drive=%Drive%

rem Use the special %0 variable to get the path to the current file.
rem n -- file name
rem FilenameWithoutExt=test
rem set FilenameWithoutExt=%~n0
rem echo FilenameWithoutExt=%FilenameWithoutExt%

rem Use the special %0 variable to get the path to the current file.
rem x -- extension
rem FileExt=.bat
rem set FileExt=%~x0
rem echo FileExt=%FileExt%

rem Write %~n0%~x0 to get the filename and extension.
rem %~n0%~x0
rem FilenameWithExt1=test.bat
rem set FilenameWithExt1=%~n0%~x0
rem echo FilenameWithExt1=%FilenameWithExt1%

rem Also possible to write %~nx0 to get the filename and extension.
rem %~nx0
rem FilenameWithExt2=test.bat
rem set FilenameWithExt2=%~nx0
rem echo FilenameWithExt2=%FilenameWithExt2%

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRFileUtils ()
rem --------------------------------------------------------------------------------
:LYRFileUtils
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRFileUtils
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ExtractFileDir (FullFilename)
rem --------------------------------------------------------------------------------
:ExtractFileDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ExtractFileDir=%~d1%~p1
    set !FUNCNAME!=%~d1%~p1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FullFileName (Filename)
rem --------------------------------------------------------------------------------
:FullFileName
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FullFileName
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set FullFileName=%~f1
    set !FUNCNAME!=%~f1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction
  
rem --------------------------------------------------------------------------------
rem procedure ExtractFileName (Filename)
rem --------------------------------------------------------------------------------
:ExtractFileName
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileName
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ExtractFileName=%~nx1
    set !FUNCNAME!=%~nx1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ExtractFileNameWithoutExt (FileName)
rem --------------------------------------------------------------------------------
:ExtractFileNameWithoutExt
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileNameWithoutExt
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ExtractFileNameWithoutExt=%~n1
    set !FUNCNAME!=%~n1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ExtractFileExt (FileName)
rem --------------------------------------------------------------------------------
:ExtractFileExt
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileExt
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ExtractFileExt=%~x1
    set !FUNCNAME!=%~x1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FileAttr (FileName)
rem --------------------------------------------------------------------------------
:FileAttr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FileAttr
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set FILENAME=%~1
    rem echo FILENAME: !FILENAME!

    set FOLDER=
    if exist "!FILENAME!" (
        set FileAttr=%~a1
        set !FUNCNAME!=%~a1
        if defined FUNCNAME (
            if /i "!FUNCNAME:~0,1!"=="d" (
                set FOLDER=D
            ) else (
                set FOLDER=F
            )
        )
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!
    rem echo FOLDER: !FOLDER!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FileSize (FileName)
rem --------------------------------------------------------------------------------
:FileSize
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FileSize
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set FILENAME=%~1
    rem echo FILENAME: !FILENAME!

    set /a !FUNCNAME!=0
    if defined FILENAME (
        if exist "!FILENAME!" (
            set /a !FUNCNAME!=%~z1
        )
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CreateDir (DIRECTORY)
rem --------------------------------------------------------------------------------
:CreateDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CreateDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set DIRECTORY=%~1
    rem echo DIRECTORYE: !DIRECTORY!

    if defined DIRECTORY (
        if not exist "!DIRECTORY!\" (
            mkdir "!DIRECTORY!"
            if not "!ERRORLEVEL!"=="0" (
                echo ERROR: Dir !DIRECTORY! not created...
                exit /b 1
            )
        )
        set CreateDir=!DIRECTORY!
        set !FUNCNAME!=!DIRECTORY!
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CreateFile (FILENAME)
rem --------------------------------------------------------------------------------
:CreateFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CreateFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set FILENAME=%~1
    rem echo FILENAME: !FILENAME!

    if defined FILENAME (
        if not exist "!FILENAME!" (
            rem set touchRUN=touch -f "!FILENAME!"
            rem set touchRUN=D:\TOOLS\EXE\touch.exe "!FILENAME!"
            rem echo !touchRUN!
            rem %touchRUN%
            D:\TOOLS\EXE\touch.exe "!FILENAME!"
        )
        set CreateFile="!FILENAME!"
        set !FUNCNAME!="!FILENAME!"
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CheckFile (FILENAME)
rem --------------------------------------------------------------------------------
:CheckFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CheckFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set FILENAME=%~1
    rem echo FILENAME: !FILENAME!

    if defined FILENAME (
        if exist "!FILENAME!" (
            set CheckFile="!FILENAME!"
            set !FUNCNAME!="!FILENAME!"
        )
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CurrentDir ()
rem --------------------------------------------------------------------------------
:CurrentDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CurrentDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem set CurrentDir=!cd!
    set !FUNCNAME!=!cd!
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem ===================================================================

