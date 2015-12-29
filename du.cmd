@echo off
:: A simple du implementation using Windows Batch
:: supports -h -c switches only
:: https://helloacm.com

setlocal enabledelayedexpansion
set switch_c=False
set switch_h=False
set anyfiles=False
set /a total=0
set /a totalK=0
set /a totalG=0
set /a totalM=0
set sep=%TAB% %TAB% %TAB% %TAB% %TAB% %TAB%

:start
	if %1.==. goto :end
	if "%1"=="-c" (
		set switch_c=True
		shift 
		goto :start
	)
	if "%1"=="-h" (
		set switch_h=True
		shift
		goto :start
	)
	if "%1"=="-ch" (
		set switch_h=True
		set switch_c=True
		shift
		goto :start
	)
	if "%1"=="-hc" (
		set switch_h=True
		set switch_c=True
		shift
		goto :start
	)
	set anyfiles=True
	if not exist "%1" (
		echo %0: cannot access ‘%1’: No such file or directory
		shift
		goto :start
	)
	:: check each given input files
	for %%i in (%1) do ( 
		set /a total=!total!+%%~zi
		if %switch_h%==True (
			call :H %%~zi %%i
		) else (
			echo %%~zi %sep% %%i
		)
	)
	shift
	goto :start
:end

:: if no filesnames are given, use all files in the current directory
if %anyfiles%==False (
	for /f %%i in ('dir * /b') do (
		set /a total=!total!+%%~zi
		if %switch_h%==True (
			call :H %%~zi %%i
		) else (
			echo %%~zi %sep% %%i		
		)
	)
)

:: switch -c - total size (human friendly)
if %switch_c%%switch_h%==TrueTrue (
	call :H !total! total
)

:: switch -c - total size
if %switch_c%%switch_h%==TrueFalse (
	echo !total! %sep% total
)

goto :eof

:H
:: this subroutine prints the human-friendly size (-h)
setlocal enabledelayedexpansion
	set /a totalK=%1/1024
	set /a totalM=%1/1024/1024
	set /a totalG=%1/1024/1024/1024
	if !totalG! gtr 0 (
		echo !totalG!G %sep% %2
	) else (
		if !totalM! gtr 0 (
			echo !totalM!M %sep% %2
		) else (
			if !totalK! gtr 0 (
				echo !totalK!K %sep% %2
			) else (
				echo %1 %sep% %2
			)
		)
	)
endlocal

goto :eof

endlocal
