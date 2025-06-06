@echo off
rem -------------------------------------------------------------------
rem LYRDEPLOYTools.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem ����� �� ��������. ������ - ������ �������.
    exit /b 0
:end

rem =================================================
rem �������
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRDEPLOYTools ()
rem --------------------------------------------------------------------------------
:LYRDEPLOYTools
rem beginfunction
    set FUNCNAME=%0
    rem set FUNCNAME=LYRDEPLOYTools
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
rem procedure UPDATE_TOOLS_BAT_SCRIPTS_BAT ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_BAT_SCRIPTS_BAT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_BAT_SCRIPTS_BAT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\SCRIPTS_BAT\SRC\SCRIPTS_BAT
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\SCRIPTS_BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.*
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK!    >> %LOG_FULLFILENAME%
    ) else (                        
        mkdir "!LDIR_TO!"                   >> %LOG_FULLFILENAME% 
    )

    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\SCRIPTS_BAT\SRC\SCRIPTS_BAT
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_BAT_TOOLS_SRC_BAT ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_BAT_TOOLS_SRC_BAT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_BAT_TOOLS_SRC_BAT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC\BAT
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC\LIB
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\LIB
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK! >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem UPDATE_TOOLS_GIT_TOOLS_SRC_GIT ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_GIT_TOOLS_SRC_GIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_GIT_TOOLS_SRC_GIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS FUNCNAME:!FUNCNAME!

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\SRC\BAT
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\SRC\BAT_KIX
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT_KIX
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_JAVA_SCRIPTS_JAVA ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_JAVA_SCRIPTS_JAVA
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_JAVA_SCRIPTS_JAVA
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Java\PROJECTS_JAVA\SCRIPTS_JAVA
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\SCRIPTS_JAVA
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.*
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK!    >> %LOG_FULLFILENAME%
    ) else (                        
        mkdir "!LDIR_TO!"                   >> %LOG_FULLFILENAME% 
    )

    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Java\PROJECTS_JAVA\SCRIPTS_JAVA
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Java\PROJECTS_JAVA\TOOLS_SRC_JAVA\src\BAT
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_GROUP_ROOT!\PROJECTS_JAVA\TOOLS_SRC_JAVA\SRC\LIB
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\LIB
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.*
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK!    >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"                   >> %LOG_FULLFILENAME%
    )

    set LMASK=*.*
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_KIX_SCRIPTS_KIX ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_KIX_SCRIPTS_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_KIX_SCRIPTS_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\SCRIPTS_KIX\SRC\SCRIPTS_KIX
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\SCRIPTS_KIX
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.*
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK! >> %LOG_FULLFILENAME%
    ) else (                        
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME% 
    )

    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\SCRIPTS_KIX\SRC\SCRIPTS_KIX
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem UPDATE_TOOLS_KIX_TOOLS_SRC_KIX ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_KIX_TOOLS_SRC_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_KIX_TOOLS_SRC_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\TOOLS_SRC_KIX\SRC\BAT
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\TOOLS_SRC_KIX\SRC\LIB
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\LIB
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.kxl
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK! >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )

    set LMASK=*.kxl
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_PY_SCRIPTS_PY ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_PY_SCRIPTS_PY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_PY_SCRIPTS_PY
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\SCRIPTS_PY\SRC\SCRIPTS_PY
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\SCRIPTS_PY
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.*
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK! >> %LOG_FULLFILENAME%
    ) else (                        
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME% 
    )

    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\SCRIPTS_PY\SRC\SCRIPTS_PY
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_PY_TOOLS_SRC_PY ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_PY_TOOLS_SRC_PY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_PY_TOOLS_SRC_PY
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\TOOLS_SRC_PY\SRC\BAT
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\BAT
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\TOOLS_SRC_PY\SRC\LIB
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\LIB
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.*
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK! >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )

    set LMASK=*.*
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_SH_SCRIPTS_SH ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_SH_SCRIPTS_SH
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_SH_SCRIPTS_SH
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\OS\UNIX\PROJECTS_UNIX\SCRIPTS_SH\SRC\SCRIPTS_SH
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\SCRIPTS_SH
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.*
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK! >> %LOG_FULLFILENAME%
    ) else (                        
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME% 
    )

    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\OS\UNIX\PROJECTS_UNIX\SCRIPTS_SH\SRC\SCRIPTS_SH
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\SH
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_SH_TOOLS_SRC_SH ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_SH_TOOLS_SRC_SH
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_SH_TOOLS_SRC_SH
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\OS\UNIX\PROJECTS_UNIX\TOOLS_SRC_SH\SRC\SH
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\SH
    rem echo LDIR_TO:!LDIR_TO!

    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\OS\UNIX\PROJECTS_UNIX\TOOLS_SRC_SH\SRC\LIB
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=!DIR_PROJECT_NAME!\LIB
    rem echo LDIR_TO:!LDIR_TO!

    call :WritePROCESS ������� !LDIR_TO! ...

    set LMASK=*.*
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\!LMASK!    >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"                   >> %LOG_FULLFILENAME%
    )

    set LMASK=*.*
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_SH_TOOLS_SRC_SH ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_SH_TOOLS_SRC_GIT_SH
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UPDATE_TOOLS_SH_TOOLS_SRC_GIT_SH
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    rem --------------------------------------------------------
    rem 
    rem --------------------------------------------------------
    set LDIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\SRC\SH
    rem echo LDIR_FROM:!LDIR_FROM!
    set LDIR_TO=D:\PROJECTS_LYR\CHECK_LIST\OS\UNIX\TOOLS_SH\SH_GIT
    rem echo LDIR_TO:!LDIR_TO!

    call :WritePROCESS ������� !LDIR_TO! ...

    set LMASK=*.*
    if exist "!LDIR_TO!"\ (
        del /F /S /Q "!LDIR_TO!"\!LMASK!    >> %LOG_FULLFILENAME% 
    ) else (
        mkdir "!LDIR_TO!"                   >> %LOG_FULLFILENAME%
    )

    set LMASK=*.*
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction

rem =================================================
rem ������� LIB
rem =================================================

rem =================================================
rem LYRConsole.bat
rem =================================================
:LYRConsole
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_00
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_01
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_02
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:FormatColorStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:aListToStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:bListToStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:SetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColorCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:Write
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLOG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteNOTSET
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteINFO
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteWARNING
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteERROR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCRITICAL
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteBEGIN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteEND
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WritePROCESS
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUGTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
rem =================================================
rem LYRConst.bat
rem =================================================
:LYRConst
%LIB_BAT%\LYRConst.bat %*
exit /b 0
rem =================================================
rem LYRDateTime.bat
rem =================================================
:LYRDateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
rem =================================================
rem LYRDEPLOY.bat
rem =================================================
:LYRDEPLOY
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:CopyFilesFromPATTERN
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:CopyFilesROOT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:SetPROJECT_INI
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:SetREPO_INI
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:REPO_WORK
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:DEPLOY_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:git_pull
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:git_clone
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:PULL_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
rem =================================================
rem LYRDEPLOYTools.bat
rem =================================================
:LYRDEPLOYTools.bat
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_BAT_SCRIPTS_BAT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_BAT_TOOLS_SRC_BAT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_GIT_TOOLS_SRC_GIT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_JAVA_SCRIPTS_JAVA
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_KIX_SCRIPTS_KIX
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_PY_SCRIPTS_PY
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_PY_TOOLS_SRC_PY
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_SH_SCRIPTS_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_SH_TOOLS_SRC_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_SH_TOOLS_SRC_GIT_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
rem =================================================
rem LYRFileUtils.bat
rem =================================================
:LYRFileUtils
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
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
:COPY_FILE
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:COPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:XCOPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
rem LYRLIB.bat
rem =================================================
:LYRLIB
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_LIB
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_POETRY
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:__SET_VAR_SCRIPT
exit /b 0
:SET_LIB
:__SET_VAR_DEFAULT
exit /b 0
:SET_LIB
:__SET_VAR_PROJECTS
exit /b 0
:SET_LIB
:__SET_LOG
exit /b 0
:SET_LIB
rem =================================================
rem LYRLog.bat
rem =================================================
:LYRLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SETVarLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SHORTLevelName
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__LOG_STR
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogConsole
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
rem LYRParserINI.bat
rem =================================================
:LYRParserINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:SetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINIParametr
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetFileParser
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
rem =================================================
rem LYRPY.bat
rem =================================================
:LYRPY
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:PY_ENV_START
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:PY_ENV_STOP
%LIB_BAT%\LYRPY.bat %*
exit /b 0
rem =================================================
rem LYRStrUtils.bat
rem =================================================
:LYRStrUtils
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
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
:ListToStr
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
rem =================================================
rem LYRSupport.bat
rem =================================================
:LYRSupport
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
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
:CheckErrorlevel
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
