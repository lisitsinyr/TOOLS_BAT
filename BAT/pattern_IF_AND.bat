    rem AND
    if not defined O5 (
        if not defined O6 (
            echo AND ...
            set OPTION=!OPTION! ...
        )
    )

    rem OR
    set res=F
    if defined O5 set res=T
    if defined O6 set res=T
    if "%res%"=="T" (
        set state=T
        echo OR ...
    )    
