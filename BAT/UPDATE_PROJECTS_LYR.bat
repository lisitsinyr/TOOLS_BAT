@echo off
rem -------------------------------------------------------------------
rem UPDATE_PROJECTS_LYR.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    call :MAIN %* || exit /b 1
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

    set PROJECTS_LYR_ROOT=D:
    echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - ������� ��������
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    )
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem -------------------------------------------------------------------
    rem LIB_BAT - ������� ���������� ��������
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
        rem echo LIB_BAT: !LIB_BAT!
    )
    if not exist !LIB_BAT!\ (
        echo ERROR: ������� ���������� LYR !LIB_BAT! �� ����������...
        exit /b 0
    )
    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_KIX - ������� �������� KIX
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR_KIX (
        set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_SRC_KIX
    )
    rem echo SCRIPTS_DIR_KIX: !SCRIPTS_DIR_KIX!

    exit /b 0
rem endfunction

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

    set /a LOG_FILE_ADD=1

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

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem �������� �� ������������ ���������
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

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_DESKTOP_01_Pascal_Delphi ()
rem --------------------------------------------------------------------------------
:MAIN_05_DESKTOP_01_Pascal_Delphi
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DELPHI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_DELPHI7=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\01_Pascal_Delphi\02_Delphi_7\PROJECTS_D7
    set DIR_DELPHI11=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\01_Pascal_Delphi\03_Delphi_11\PROJECTS_D11

    set DIR_LUIS_D7=!DIR_DELPHI7!\LUIS_D7
    set DIR_TOOLS_D7=!DIR_DELPHI7!\TOOLS_D7
    set DIR_LUIS_D11=!DIR_DELPHI11!\LUIS_D11
    set DIR_TOOLS_D11=!DIR_DELPHI11!\TOOLS_D11

    call :REPO_WORK !DIR_LUIS_D7! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_D7! 0 || exit /b 1
    call :REPO_WORK !DIR_LUIS_D11! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_D11! 0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_DESKTOP_02_Python ()
rem --------------------------------------------------------------------------------
:MAIN_05_DESKTOP_02_Python
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DELPHI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_PYTHON=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY

    set DIR_EXAMPLES_PY=!DIR_PYTHON!\EXAMPLES_PY
    set DIR_MobileAPP_PY=!DIR_PYTHON!\MobileAPP_PY
    set DIR_PATTERN_PY=!DIR_PYTHON!\PATTERN_PY
    set DIR_TEST_PY=!DIR_PYTHON!\TEST_PY
    set DIR_YOUTUBE_PY=!DIR_PYTHON!\YOUTUBE_PY
    set DIR_TESTS_PY=!DIR_PYTHON!\TESTS_PY
    set DIR_TOOLS_SRC_PY=!DIR_PYTHON!\TOOLS_SRC_PY

    set DIR_TOOLS_PY=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\TOOLS_PY
    set DIR_TOOLS_PY_=D:\TOOLS\TOOLS_PY

    call :REPO_WORK !DIR_EXAMPLES_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_MobileAPP_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_PATTERN_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_TEST_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_YOUTUBE_PY! 1 || exit /b 1
    call :REPO_WORK !DIR_TESTS_PY! 1 || exit /b 1

    call :REPO_WORK !DIR_TOOLS_SRC_PY! 1 || exit /b 1
    call :UPDATE_TOOLS_PY || exit /b 1
    call :REPO_WORK !DIR_TOOLS_PY! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_PY_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_DESKTOP_03_Java ()
rem --------------------------------------------------------------------------------
:MAIN_05_DESKTOP_03_Java
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DELPHI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_JAVA=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA
    set DIR_TESTS_JAVA=!DIR_JAVA!\TESTS_JAVA
    set DIR_TOOLS_SRC_JAVA=!DIR_JAVA!\TOOLS_SRC_JAVA

    set DIR_TOOLS_JAVA= D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\TOOLS_JAVA

    call :REPO_WORK !DIR_TESTS_JAVA! 0 || exit /b 1

    call :REPO_WORK !DIR_TOOLS_SRC_JAVA! 0 || exit /b 1
    call :UPDATE_TOOLS_JAVA || exit /b 1
    call :REPO_WORK !DIR_TOOLS_JAVA! 0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_03_SCRIPT_01_KIX ()
rem --------------------------------------------------------------------------------
:MAIN_03_SCRIPT_01_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DELPHI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_TOOLS_SRC_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_SRC_KIX
    set DIR_TOOLS_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
    set DIR_TOOLS_KIX_=D:\TOOLS\TOOLS_KIX

    call :REPO_WORK !DIR_TOOLS_SRC_KIX! 0 || exit /b 1
    call :UPDATE_TOOLS_KIX || exit /b 1
    call :REPO_WORK !DIR_TOOLS_KIX! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_KIX_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_03_SCRIPT_04_BAT ()
rem --------------------------------------------------------------------------------
:MAIN_03_SCRIPT_04_BAT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DELPHI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_TOOLS_BAT=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
    set DIR_TOOLS_SRC_BAT=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    set DIR_TOOLS_BAT_=D:\TOOLS\TOOLS_BAT

    call :REPO_WORK !DIR_TOOLS_SRC_BAT! 0 || exit /b 1
    call :UPDATE_TOOLS_BAT || exit /b 1
    call :REPO_WORK !DIR_TOOLS_BAT! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_BAT_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_07_GIT ()
rem --------------------------------------------------------------------------------
:MAIN_07_GIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DELPHI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_TOOLS_SRC_GIT=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_SRC_GIT
    set DIR_TOOLS_GIT=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT
    set DIR_TOOLS_GIT_=D:\TOOLS\TOOLS_GIT

    call :REPO_WORK !DIR_TOOLS_SRC_GIT! 0 || exit /b 1
    call :UPDATE_TOOLS_GIT || exit /b 1
    call :REPO_WORK !DIR_TOOLS_GIT! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_GIT_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_01_OS_03_UNIX ()
rem --------------------------------------------------------------------------------
:MAIN_01_OS_03_UNIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DELPHI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set DIR_TOOLS_SRC_SH=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TOOLS_SRC_SH
    set DIR_TOOLS_SH=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH

    call :REPO_WORK !DIR_TOOLS_SRC_SH! 0 || exit /b 1
    call :UPDATE_TOOLS_SH || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SH! 0 || exit /b 1

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

    rem call :MAIN_05_DESKTOP_01_Pascal_Delphi %* || exit /b 1
    call :MAIN_05_DESKTOP_02_Python %* || exit /b 1
    rem call :MAIN_05_DESKTOP_03_Java %* || exit /b 1
    
    rem call :MAIN_03_SCRIPT_01_KIX %* || exit /b 1
    call :MAIN_03_SCRIPT_04_BAT %* || exit /b 1

    rem call :MAIN_07_GIT %* || exit /b 1

    call :MAIN_01_OS_03_UNIX %* || exit /b 1

    rem call :PressAnyKey || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure REPO_WORK (ADirectory, APYTHON)
rem --------------------------------------------------------------------------------
:REPO_WORK
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set ADirectory=%~1
    echo ADirectory:!ADirectory!
    cd /D "!ADirectory!"

    set APYTHON=%2
    rem echo APYTHON:!APYTHON!

    call :GetINIParametr REPO.ini general REPO_NAME || exit /b 1
    rem echo REPO_NAME:!REPO_NAME!

    del *.bat > NUL

    set LFileName=!DIR_TOOLS_SRC_GIT!\BAT\A.WORK\lyrgit_push_main.bat
    rem echo LFileName: !LFileName!
    if exist !LFileName! (
        rem echo COPY: !LFileName!
        copy !LFileName! > NUL
    )

    if !APYTHON!==1 (
        set LFileName=!DIR_TOOLS_SRC_PY!\SRC\BAT\PROJECT_PYupdate.bat
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName!
            copy !LFileName! > NUL
        )
        set LFileName=!DIR_PYTHON!\PATTERN_PY\pyproject.toml
        rem echo LFileName: !LFileName!
        if exist !LFileName! (
            rem echo COPY: !LFileName!
            copy !LFileName! > NUL
        )
    )
   
    call lyrgit_push_main.bat

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_BAT ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_BAT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_BAT!\BAT
    set LMASK=*.bat

    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )

    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\BAT
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\BAT\99.[lyr]LYR
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_BAT!\LIB
    set LMASK=*.bat

    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )

    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\LIB
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_SH (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_SH
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_SH!\SH
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_SH!\SH
    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    set LDIR_TO=!DIR_TOOLS_SH!\LIB
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_SH!\LIB
    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_SH!\SH_GIT
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\SH
    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_KIX (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_KIX
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_KIX!\BAT
    set LMASK=*.bat

    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )

    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\BAT
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_KIX!\LIB
    set LMASK=*.*

    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\LIB
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_KIX!\SCRIPTS
    set LMASK=*.*

    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SCRIPTS
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_GIT (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_GIT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_GIT!\BAT
    set LMASK=*.bat

    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )

    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\BAT
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    set LDIR_TO=!DIR_TOOLS_GIT!\BAT_KIX
    set LMASK=*.bat

    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\BAT_KIX
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_PY (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_PY
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=!DIR_TOOLS_PY!\BAT
    set LMASK=*.bat

    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )

    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\BAT
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_TO=!DIR_TOOLS_PY!\SCRIPTS
    set LMASK=*.*

    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_JAVA (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_JAVA
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    exit /b 0
rem endfunction

rem =================================================
rem procedure git_pull (ADirectory)
rem =================================================
:git_pull
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LOG_FILE_ADD=1
    set ADirectory=%~1
    echo ADirectory:!ADirectory!
    cd /D "!ADirectory!"

    rem call lyrgit_pull_main.bat
    git pull    
    
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

    call :MAIN_INIT || exit /b 1

    rem ���������� ����������
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

rem =================================================
rem ������� LIB
rem =================================================

rem =================================================
rem LYRConst.bat
rem =================================================
:SET_LIB
%LIB_BAT%\LYRConst.bat %*
exit /b 0
:SET_POETRY
%LIB_BAT%\LYRConst.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRConst.bat %*
exit /b 0
rem =================================================
rem LYRDateTime.bat
rem =================================================
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
rem =================================================
rem LYRFileUtils.bat
rem =================================================
:ExtractFileDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FullFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileNameWithoutExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileAttr
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileSize
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:COPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:XCOPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
rem LYRLog.bat
rem =================================================
:FormatStr
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
rem =================================================
rem LYRStrUtils.bat
rem =================================================
:TrimLeft
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimRight
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Trim
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Left
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Mid
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimQuotes
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
rem =================================================
rem LYRSupport.bat
rem =================================================
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetINI
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:SetINI
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetINIParametr
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetFileParser
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetDir
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetFile
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:FORCicle
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetSET
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetCMD
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
