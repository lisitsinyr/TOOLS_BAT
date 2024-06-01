@echo off

set day=%DATE:~0,2%
set month=%DATE:~3,2%
set year=%DATE:~6,4%

set hour=%TIME:~0,2%
set minute=%TIME:~3,2%
set second=%TIME:~6,2%

echo %day%
echo %month%
echo %year%

echo %hour%
echo %minute%
echo %second%

set YYYYMMDD=%year%%month%%day%

echo %YYYYMMDD%
