@echo 0ff

set str="cmd politic"
echo %str%

rem for /f "useback tokens=*" %%a in ('%str%') do set str=%%~a

echo %str%
