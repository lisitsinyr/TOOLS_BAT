@echo off
rem -------------------------------------------------------------------
rem test2.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

echo var1  >vars
echo var2 >>vars
echo var3 >>vars

SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (vars) DO (
  SET var!count!=%%F
  SET /a count=!count!+1
)
ECHO %var1%
ECHO %var2%
ECHO %var3%

ENDLOCAL
