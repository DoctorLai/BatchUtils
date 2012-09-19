@echo off
:: reverse.bat
:: dr@zhihua-lai.com
:: http://www.zhihua-lai.com/acm

setlocal enableextensions enabledelayedexpansion 

:begin
	if "%1"=="-h" goto help
	if "%1"=="" goto readin
	goto start

:readin
	(set /p _s=) && (
		call :start !_s!
		goto readin	
	) || (
		goto end
	)

:help
	echo Usage: %0 text
	shift
	goto begin

goto end

:start
	set _len=0
	set _str=%*

	:: Get the length of the sentence
	set _subs=%_str%

:loop
	if not defined _subs goto result

	::remove the first char
	set _subs=%_subs:~1%
	set /a _len+=1
	goto loop	
      
:result
	set /a _len-=1
	for /l %%g in (0,1,%_len%) do (
		call :build %%g
	)

	echo %s%
	
	goto end

:build
	:: get the next character
	call set _digit=%%_str:~%1,1%%%
	set s=%_digit%%s%

:end
endlocal