@echo off
:: strlen.bat
:: http://acm.zhihua-lai.com

if [%1] EQU [] goto :eof

:loop
	if [%1] EQU [] goto :eof
	set _len=0
	set _str=%1
	set _subs=%_str%

	:getlen		
		if not defined _subs goto :result
		:: remove first letter until empty
		set _subs=%_subs:~1%
		set /a _len+=1
		goto getlen

	:result
		echo strlen("%1")=%_len%		
		shift
		goto loop
:eof
