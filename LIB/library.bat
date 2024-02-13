@echo off
    setlocal enableextensions
    rem Not to be directly called
    exit /b 9009

:test
    echo тест test.............. [%*]
    goto :eof

:test2
    echo тест test2............... [%*]
    goto :eof

:testErrorlevel
    echo testErrorlevel............
    exit /b 1
