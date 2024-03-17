@echo off
rem -------------------------------------------------------------------
rem lyrrar.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB

    rem set PN_CAPTION=¬‚Ó‰ ÁÌ‡˜ÂÌËˇ
    set RARName=RARName_default
    set RARName=
    rem echo RARName: %RARName%    

    call :Check_P RARName %1 || exit /b 1
    echo RARName: %RARName%    
    rem call :Check_P RARName "ssss ffff" || exit /b 1
    rem echo RARName: %RARName%    

    call :Check_P P2 %2 || exit /b 1
    echo P2: %P2%    

    call :ExtractFileName "%RARName%" || exit /b 1
    echo ExtractFileName: %ExtractFileName%

    call :ExtractFileNameWithoutExt "%RARName%" || exit /b 1
    echo ExtractFileNameWithoutExt: %ExtractFileNameWithoutExt%

    call :FullFileName "%ExtractFileName%" || exit /b 1
    echo FullFileName: %FullFileName%

    call :FileAttr "%FullFileName%" || exit /b 1
    echo FileAttr: %FileAttr%

:Exit
exit /b 0

rem =================================================
rem ‘”Õ ÷»» LIB
rem =================================================
:Check_P
%LIB_BAT%\LYRSupport.bat %*
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
