@ECHO OFF
FOR /F "TOKENS=1* DELIMS= " %%A IN ('DATE/T') DO SET Today=%%B
ECHO It's %Today% today
