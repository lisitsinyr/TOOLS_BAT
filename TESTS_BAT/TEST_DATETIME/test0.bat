@echo off
set year=%date:~6,4%
set month=%date:~3,2%
set day=%date:~0,2%
set hour=%time:~0,2%
set min=%time:~3,2%
set sec=%time:~6,2%
set ms=%time:~9,2%
set datetimef=%year%%month%%day%_%hour%%min%%sec%%ms%
echo %datetimef%
