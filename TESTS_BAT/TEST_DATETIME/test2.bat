Этот ответ бесполезен
@ECHO OFF
: Sets the proper date and time stamp with 24Hr Time for log file naming
: convention ('YYYYMMDD_HHMMSS')

: Scrapes the characters out of their expected permissions in the date/time
: environment variables.

: Expects a date format of '____MM_DD_YYYY'
: Expects a time format of 'HH:MM:SS' or ' H:MM:SS'

SET HOUR=%time:~0,2%
SET dtStamp9=%date:~-4%%date:~4,2%%date:~7,2%_0%time:~1,1%%time:~3,2%%time:~6,2% 
SET dtStamp24=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)

ECHO %dtStamp%

PAUSE
