@echo off
:: strlen.bat
:: http://acm.zhihua-lai.com

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
	set _subs=%_str%

	:getlen		
		if not defined _subs goto result
		:: remove first letter until empty
		set _subs=%_subs:~1%
		set /a _len+=1
		goto getlen

	:result
		echo %_len%		
:end
endlocal