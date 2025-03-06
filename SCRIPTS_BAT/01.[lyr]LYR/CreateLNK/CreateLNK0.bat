@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_empty.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    set ShortcutName="Google Chrome"
    set TargetPath="C:\Program Files\Google\Chrome\Application\chrome.exe"
    set Arguments="--incognito"  :: Аргументы для запуска
    set IconLocation="C:\Program Files\Google\Chrome\Application\chrome.exe,0"  :: Путь к иконке
    set ShortcutLocation="%USERPROFILE%\Desktop\Google Chrome.lnk"

    :: Создаем ярлык
    powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%ShortcutLocation%'); $s.TargetPath = '%TargetPath%'; $s.Arguments = '%Arguments%'; $s.IconLocation = '%IconLocation%'; $s.Description = 'Запуск Google Chrome в режиме инкогнито'; $s.Save()"

    exit /b 0
:end

rem ===================================================================
