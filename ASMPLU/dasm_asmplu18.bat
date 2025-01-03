@echo off
set DASM80=dasm80.exe
set NAME=ASMPLU18
if not exist %NAME%.SCR echo.>%NAME%.SCR
if not exist %NAME%.EQU echo.>%NAME%.EQU
set SCR=-s:%NAME%.SCR
set EQU=-e:%NAME%.EQU
set INPUT=-c:ORIG/%NAME%.CMD
set OPTS=%SCR% %EQU% --ZMAC -WW -LC
%DASM80% %INPUT% %OPTS% -o:%NAME%.dasm
%DASM80% %INPUT% %OPTS% -p:%NAME%.prn
