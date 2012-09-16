@echo off
:: rot13.bat
:: dr@zhihua-lai.com
:: http://www.zhihua-lai.com/acm
:: 16-Sept-2012

setlocal enableextensions enabledelayedexpansion 
if [%1] neq [] goto start

echo Rot13 ^& Rot5
echo Usage: %0 text

goto :end

:start
	set _len=0
	set _str=%*

	:: Get the length of the sentence
	set _subs=%_str%

:loop
	if not defined _subs goto :result

	::remove the first char
	set _subs=%_subs:~1%
	set /a _len+=1
	goto loop	
      
:result
	set /a _len-=1
	(set s=)
	for /l %%g in (0,1,%_len%) do (
		call :build %%g
	)

	echo %s%
	
	goto :end

:build
	:: get the next character
	call set _digit=%%_str:~%1,1%%%
	:: rot13 ^& rot5
	if "!_digit!"=="a" (
		(set s=!s!n)
	) else if "!_digit!"=="b" (
		(set s=!s!o)
	) else if "!_digit!"=="c" (
		(set s=!s!p)
	) else if "!_digit!"=="d" (
		(set s=!s!q)
	) else if "!_digit!"=="e" (
		(set s=!s!r)
	) else if "!_digit!"=="f" (
		(set s=!s!s)
	) else if "!_digit!"=="g" (
		(set s=!s!t)
	) else if "!_digit!"=="h" (
		(set s=!s!u)
	) else if "!_digit!"=="i" (
		(set s=!s!v)
	) else if "!_digit!"=="j" (
		(set s=!s!w)
	) else if "!_digit!"=="k" (
		(set s=!s!x)
	) else if "!_digit!"=="l" (
		(set s=!s!y)
	) else if "!_digit!"=="m" (
		(set s=!s!z)
	) else if "!_digit!"=="n" (
		(set s=!s!a)
	) else if "!_digit!"=="o" (
		(set s=!s!b)
	) else if "!_digit!"=="p" (
		(set s=!s!c)
	) else if "!_digit!"=="q" (
		(set s=!s!d)
	) else if "!_digit!"=="r" (
		(set s=!s!e)
	) else if "!_digit!"=="s" (
		(set s=!s!f)
	) else if "!_digit!"=="t" (
		(set s=!s!g)
	) else if "!_digit!"=="u" (
		(set s=!s!h)
	) else if "!_digit!"=="v" (
		(set s=!s!i)
	) else if "!_digit!"=="w" (
		(set s=!s!j)
	) else if "!_digit!"=="x" (
		(set s=!s!k)
	) else if "!_digit!"=="y" (
		(set s=!s!l)
	) else if "!_digit!"=="z" (
		(set s=!s!m)
	) else if "!_digit!"=="A" (
		(set s=!s!N)
	) else if "!_digit!"=="B" (
		(set s=!s!O)
	) else if "!_digit!"=="C" (
		(set s=!s!P)
	) else if "!_digit!"=="D" (
		(set s=!s!Q)
	) else if "!_digit!"=="E" (
		(set s=!s!R)
	) else if "!_digit!"=="F" (
		(set s=!s!S)
	) else if "!_digit!"=="G" (
		(set s=!s!T)
	) else if "!_digit!"=="H" (
		(set s=!s!U)
	) else if "!_digit!"=="I" (
		(set s=!s!V)
	) else if "!_digit!"=="J" (
		(set s=!s!W)
	) else if "!_digit!"=="K" (
		(set s=!s!X)
	) else if "!_digit!"=="L" (
		(set s=!s!U)
	) else if "!_digit!"=="M" (
		(set s=!s!Z)
	) else if "!_digit!"=="N" (
		(set s=!s!A)
	) else if "!_digit!"=="O" (
		(set s=!s!B)
	) else if "!_digit!"=="P" (
		(set s=!s!C)
	) else if "!_digit!"=="Q" (
		(set s=!s!D)
	) else if "!_digit!"=="R" (
		(set s=!s!E)
	) else if "!_digit!"=="S" (
		(set s=!s!F)
	) else if "!_digit!"=="T" (
		(set s=!s!G)
	) else if "!_digit!"=="U" (
		(set s=!s!H)
	) else if "!_digit!"=="V" (
		(set s=!s!I)
	) else if "!_digit!"=="W" (
		(set s=!s!J)
	) else if "!_digit!"=="X" (
		(set s=!s!K)
	) else if "!_digit!"=="Y" (
		(set s=!s!L)
	) else if "!_digit!"=="Z" (
		(set s=!s!M)
	) else if "!_digit!"=="0" (
		(set s=!s!5)
	) else if "!_digit!"=="1" (
		(set s=!s!6)
	) else if "!_digit!"=="2" (
		(set s=!s!7)
	) else if "!_digit!"=="3" (
		(set s=!s!8)
	) else if "!_digit!"=="4" (
		(set s=!s!9)
	) else if "!_digit!"=="5" (
		(set s=!s!0)
	) else if "!_digit!"=="6" (
		(set s=!s!1)
	) else if "!_digit!"=="7" (
		(set s=!s!2)
	) else if "!_digit!"=="8" (
		(set s=!s!3)
	) else if "!_digit!"=="9" (
		(set s=!s!4)
	) else (
		(set s=!s!!_digit!)
	) 
:end
endlocal