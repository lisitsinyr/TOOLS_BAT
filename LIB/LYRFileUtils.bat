@echo off
rem -------------------------------------------------------------------
rem LYRFileUtils.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     LYRFileUtils
rem     ExtractFileDir
rem     ExtractFileName
rem     ExtractFileNameWithoutExt
rem     ExtractFileExt
rem     FileAttr
rem     CurrentDir
rem     FileSize (AFileName)
rem     CreateDir (ADIRECTORY)
rem     CreateFile (AFILENAME)
rem     CheckFile (AFILENAME)
rem     COPY_FILES (DIR_FROM, DIR_TO, MASK, ARG)
rem     XCOPY_FILES (DIR_FROM, DIR_TO, MASK, ARG)

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
rem procedure ExtractFileDir (AFullFilename)
rem --------------------------------------------------------------------------------
:ExtractFileDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFullFilename=%1

    set ExtractFileDir=%~d1%~p1
    set !FUNCNAME!=%~d1%~p1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FullFileName (AFilename)
rem --------------------------------------------------------------------------------
:FullFileName
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FullFileName
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set FullFileName=%~f1
    set !FUNCNAME!=%~f1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction
  
rem --------------------------------------------------------------------------------
rem procedure ExtractFileName (AFilename)
rem --------------------------------------------------------------------------------
:ExtractFileName
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileName
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set ExtractFileName=%~nx1
    set !FUNCNAME!=%~nx1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ExtractFileNameWithoutExt (AFileName)
rem --------------------------------------------------------------------------------
:ExtractFileNameWithoutExt
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileNameWithoutExt
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set ExtractFileNameWithoutExt=%~n1
    set !FUNCNAME!=%~n1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ExtractFileExt (AFileName)
rem --------------------------------------------------------------------------------
:ExtractFileExt
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileExt
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set ExtractFileExt=%~x1
    set !FUNCNAME!=%~x1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FileAttr (AFileName)
rem --------------------------------------------------------------------------------
:FileAttr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FileAttr
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

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
rem procedure FileSize (AFileName)
rem --------------------------------------------------------------------------------
:FileSize
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FileSize
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

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
rem procedure CreateDir (ADIRECTORY)
rem --------------------------------------------------------------------------------
:CreateDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CreateDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ADIRECTORY=%~1
    rem echo ADIRECTORY: !ADIRECTORY!

    if defined ADIRECTORY (
        if not exist "!ADIRECTORY!\" (
            mkdir "!ADIRECTORY!"
            if not !ERRORLEVEL! EQU 0 (
                echo ERROR: Directory !ADIRECTORY! not created...
                exit /b 1
            )
        )
        set CreateDir=!ADIRECTORY!
        set !FUNCNAME!=!ADIRECTORY!
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CreateFile (AFILENAME)
rem --------------------------------------------------------------------------------
:CreateFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CreateFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFILENAME=%~1
    rem echo AFILENAME: !AFILENAME!

    if defined AFILENAME (
        if not exist "!AFILENAME!" (
            rem set touchRUN=touch -f "!AFILENAME!"
            rem set touchRUN=D:\TOOLS\EXE\touch.exe "!AFILENAME!"
            rem echo !touchRUN!
            rem %touchRUN%
            D:\TOOLS\EXE\touch.exe "!AFILENAME!"
        )
        set CreateFile="!AFILENAME!"
        set !FUNCNAME!="!AFILENAME!"
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
    rem echo !FUNCNAME!: !%FUNCNAME%!

    set AFILENAME=%~1
    rem echo AFILENAME: !AFILENAME!

    if defined AFILENAME (
        if exist "!AFILENAME!" (
            set CheckFile="!AFILENAME!"
            set !FUNCNAME!="!AFILENAME!"
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

    rem set CurrentDir="!cd!"
    rem echo CurrentDir: !CurrentDir!

    set !FUNCNAME!="!cd!"
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem procedure COPY_FILES (DIR_FROM, DIR_TO, MASK, ARG)
rem --------------------------------------------------------------------------------
:COPY_FILES
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=COPY_FILES
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ADIR_FROM=%~1
    rem echo ADIR_FROM:!ADIR_FROM!
    set ADIR_TO=%~2
    rem echo ADIR_TO:!ADIR_TO!
    set AMASK=%~3
    rem echo AMASK:!AMASK!
    set AARG=%~4
    rem echo AARG:!AARG!

    call :CurrentDir || exit /b 1

    if defined AARG if "!AARG!"=="/R" (
        set AARG=/R !ADIR_FROM!
    ) else (
        set AARG=
    )
    rem echo AARG:!AARG!

    echo --------------------------->> %LOG_FULLFILENAME%
    echo COPY_FILES:                >> %LOG_FULLFILENAME%
    echo     !ADIR_FROM!            >> %LOG_FULLFILENAME%
    echo     !ADIR_TO!              >> %LOG_FULLFILENAME%
    echo     !AMASK!                >> %LOG_FULLFILENAME%
    echo --------------------------->> %LOG_FULLFILENAME%

    if exist "!ADIR_TO!" (
        del /F /S /Q "!ADIR_TO!"\*.*   >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!ADIR_TO!"              >> %LOG_FULLFILENAME%
    )

    cd /D "!ADIR_FROM!"
    
    for %AARG% %%f in (!AMASK!) do (
        rem echo %%~nf%%~xf
        copy "%%f" !ADIR_TO!\        >  NUL
        echo File %%f copied ...     >> %LOG_FULLFILENAME%
    )

    cd /D "!CurrentDir!"

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure XCOPY_FILES (DIR_FROM, DIR_TO, MASK, ARG)
rem --------------------------------------------------------------------------------
:XCOPY_FILES
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=XCOPY_FILES
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ADIR_FROM=%~1
    rem echo ADIR_FROM:!ADIR_FROM!
    set ADIR_TO=%~2
    rem echo ADIR_TO:!ADIR_TO!
    set AMASK=%~3
    rem echo AMASK:!AMASK!
    set AARG=%~4
    rem echo AARG:!AARG!
    if not defined AARG (
        set AARG=/D /E /V /F /H /R /K /O /Y
    )

    echo ---------------------------   >> %LOG_FULLFILENAME%
    echo XCOPY_FILES:                  >> %LOG_FULLFILENAME%
    echo     !ADIR_FROM!               >> %LOG_FULLFILENAME%
    echo     !ADIR_TO!                 >> %LOG_FULLFILENAME%
    echo     !AMASK!                   >> %LOG_FULLFILENAME%
    echo ---------------------------   >> %LOG_FULLFILENAME%

    if exist "!ADIR_TO!" (
        del /F /S /Q "!ADIR_TO!"\*.*   >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!ADIR_TO!"              >> %LOG_FULLFILENAME%
    )

    xcopy !ADIR_FROM! !ADIR_TO! !AARG! >> %LOG_FULLFILENAME%

    exit /b 0
rem endfunction

rem ===================================================================

