@echo off
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.0" echo Windows Vista.
if "%version%" == "6.1" echo Windows 7
if "%version%" == "6.2" echo Windows 8
if "%version%" == "6.3" echo Windows 8.1
if "%version%" == "10.0" echo Windows 10.
