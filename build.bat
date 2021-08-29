@echo off
title Building...
nasm boot.asm -f bin -o boot.img
if %errorlevel%==0 title Building success!
if %errorlevel%==0 echo Building success!
if %errorlevel% NEQ 0 title Building failed!
if %errorlevel% NEQ 0 echo Sad sus
pause