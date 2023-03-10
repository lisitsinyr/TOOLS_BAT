@ECHO OFF
:: SortDate, Version 2.00 for Windows NT
:: Save date and "sorted" date in environment variables.
::
:: This batch file will always display the same results,
:: independent of "International" settings.
:: This batch file uses REG.EXE from the NT Resource Kit
:: to read the "International" settings from the registry.
::
:: Written by Rob van der Woude
:: http://www.robvanderwoude.com

FOR /F "TOKENS=1* DELIMS= " %%A IN ('DATE/T') DO SET DATE=%%B
:: Delims is a TAB followed by a space
FOR /F "TOKENS=2* DELIMS=	 " %%A IN ('REG QUERY "HKEY_CURRENT_USER\Control Panel\International\iDate"') DO SET iDate=%%B
FOR /F "TOKENS=2* DELIMS=	 " %%A IN ('REG QUERY "HKEY_CURRENT_USER\Control Panel\International\sDate"') DO SET sDate=%%B
IF %iDate%==0 FOR /F "TOKENS=1-4* DELIMS=%sDate% " %%A IN ('DATE/T') DO SET SortDate=%%D%%B%%C
IF %iDate%==1 FOR /F "TOKENS=1-4* DELIMS=%sDate% " %%A IN ('DATE/T') DO SET SortDate=%%D%%C%%B
IF %iDate%==2 FOR /F "TOKENS=1-4* DELIMS=%sDate% " %%A IN ('DATE/T') DO SET SortDate=%%B%%C%%D
ECHO It's %DATE% today
ECHO For sorting purposes: %SortDate%
