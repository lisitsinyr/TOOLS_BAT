@echo off
SETLOCAL
(set WF=)

:: Look for file in the current directory

  for %%a in ("" %PATHEXT:;= %) do (
     if not defined WF if exist "%~1%%~a" set WF=%CD%\%~1%%~a)

:: Look for file in the PATH

  for %%a in ("" %PATHEXT:;= %) do (
     if not defined WF for %%g in ("%~1%%~a") do (
        if exist "%%~$PATH:g" set WF=%%~$PATH:g))

:: Store the Help Error message

  if NOT "%~x1"=="" goto:END
  for /f "delims=." %%a in ('help.exe *') do set HlpErr=%%a

:: If command missing from Help, goto end

  help.exe "%~1" |find "%HlpErr%">nul && goto:END

:: Listed in help so find file in System32

  for %%a in (exe com) do (
     if /i "%WF%"=="%windir%\system32\%~1.%%a" goto:END)

:: File not in System32, so must be an internal command

  set WF="%~1" is an internal command

  :END
  if defined WF (echo.%WF%) else (
     echo The file: "%~1" was not found) 

:: Credits:
:: Clay Calvert 
:: alt.msdos.batch.nt
