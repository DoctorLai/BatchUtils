@echo off
REM Calculate Total Memory Consumption for a Process

setlocal enabledelayedexpansion
set prog=%1

if [%1]==[] (
  echo Usage: %0 Process
  goto end
)
set sum=0
@for /F "tokens=5" %%i in ('tasklist ^| grep !prog!') do (
	set mem=%%i
	set mem=!mem:,=!
	set /a sum=sum+!mem!
)

echo Total Memory for !prog! is !sum! K
set /a sum=sum/1024
echo Total Memory for !prog! is !sum! MB
set /a sum=sum/1024
echo Total Memory for !prog! is !sum! GB

:end
