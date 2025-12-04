    rem echo 1.app
    rem echo 2.lib
    rem echo 3.bare
    rem echo 4.script
    rem set C1_Name=C1
    rem set C1_List=1234
    rem set C1_Caption=!VarCaption!
    rem set C1_Default=1
    rem set C1_timeout=10
    rem call :Read_F C1 !C1_List! !C1_Default! !C1_Caption! !C1_timeout! || exit /b 1
    rem ------------------------------------------
    rem CASE
    rem ------------------------------------------
    rem if !C1!==1 (
    rem     set !VarName!=app
    rem )
    rem if !C1!==2 (
    rem     set !VarName!=lib
    rem )
    rem if !C1!==3 (
    rem     set !VarName!=bare
    rem )
    rem if !C1!==4 (
    rem     set !VarName!=script
    rem )
    rem if defined !VarName! (
    rem     set result=F
    rem     if !%VarName%!==app set result=T
    rem     if !%VarName%!==lib set result=T
    rem     if !%VarName%!==bare set result=T
    rem     if !%VarName%!==script set result=T
    rem     if !result!==T (
    rem         set !VarName!=!%VarName%!
    rem     ) else (
    rem         echo ERROR: !%VarName%! not defined ...
    rem         set !VarName!=
    rem         exit /b 1
    rem     )
    rem )
