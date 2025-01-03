@echo off
set ZMAC=zmac\zmac
set NAME=ASMPL18S
%ZMAC% %NAME%.asm --zmac --od . --oo CMD,LST,BDS,500.CAS,BDS
move %NAME%.500.CAS %NAME%.CAS

