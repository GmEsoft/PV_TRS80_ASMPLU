@echo off
set DASM80=dasm80.exe
set ZMAC=zmac\zmac
set NAME=ASMPL18S
if not exist %NAME%.SCR echo.>%NAME%.SCR
if not exist %NAME%.EQU echo.>%NAME%.EQU
set SCR=-s:%NAME%.SCR
set EQU=-e:%NAME%.EQU
set INPUT=-c:ORIG/%NAME%.CMD
set OPTS=%SCR% %EQU% --ZMAC -WW -LC

%DASM80% %INPUT% %OPTS% -o:%NAME%.dasm
if errorlevel 1 goto :eof

%DASM80% %INPUT% %OPTS% -p:%NAME%.prn
if errorlevel 1 goto :eof

%ZMAC% %NAME%.dasm --zmac --od . --oo CMD,LST,BDS,500.CAS,BDS
if errorlevel 1 goto :eof

move %NAME%.500.CAS %NAME%.CAS
