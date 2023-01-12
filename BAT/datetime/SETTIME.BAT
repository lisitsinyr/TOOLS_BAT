@ECHO OFF
FOR /F "TOKENS=*" %%A IN ('TIME/T') DO SET Now=%%A
ECHO It's %Now% now
