@echo off
:: http://www.zhihua-lai.com/acm
:: 12-Sept-2012

setlocal enableextensions enabledelayedexpansion 

:begin
	if "%1"=="-h" goto help
	if "%1"=="" goto readin
	goto start

:readin
	(set /p s=) && (
		call :start !s!
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

		::for /f "tokens=2" %%g in ('mode ^|find "Columns"') do set/a _window=%%g/6
		set _window=8

		:: clear
		(set _1=)
		(set _2=)
		(set _3=)
		(set _4=)
		(set _5=)
		(set _6=)
		(set _7=)

		:: digit by digit
		for /l %%g in (0,1,%_len%) do (
			set /a i=%%g%%%_window%
			if !i! equ 0 (
				if "!_1!" neq "" (
					echo !_1!
					echo !_2!
					echo !_3!
					echo !_4!
					echo !_5!
					echo !_6!
					echo !_7!
					(echo.)
				)
				(set _1=)
				(set _2=)
				(set _3=)
				(set _4=)
				(set _5=)
				(set _6=)
				(set _7=)
			) 
			call :build %%g
		)

		if "!_1!" neq "" (
			echo !_1!
			echo !_2!
			echo !_3!
			echo !_4!
			echo !_5!
			echo !_6!
			echo !_7!
		)
		goto end

	
	:build
		:: get the next character
		call set _digit=%%_str:~%1,1%%%
		
		:: Add the graphics
		if "!_digit!"==" " (
			call :s_space
		) else (
			if "!_digit!"=="," (
				call :s_c1
			) else (
				if "!_digit!"==":" (
					call :s_c2
				) else (
					if "!_digit!"=="+" (
						call :s_c3
					) else (
						if "!_digit!"=="#" (
							call :s_c4
						) else (
							call :s_!_digit!
						)
					)
				)
			)
		)

		goto end

:: Graphics

:s_c1
  (set _1=!_1!      )
  (set _2=!_2!      )
  (set _3=!_3!      )
  (set _4=!_4!      )
  (set _5=!_5!      )
  (set _6=!_6!  ¨€   )
  (set _7=!_7! ¨€    )
goto end

:s_c2
  (set _1=!_1!      )
  (set _2=!_2!      )
  (set _3=!_3!      )
  (set _4=!_4!  ¨€   )
  (set _5=!_5!      )
  (set _6=!_6!  ¨€   )
  (set _7=!_7!      )
goto end

:s_c3
  (set _1=!_1!      )
  (set _2=!_2!   ¨€  )
  (set _3=!_3!   ¨€  )
  (set _4=!_4! ¨€¨€¨€¨€¨€)
  (set _5=!_5!   ¨€  )
  (set _6=!_6!   ¨€  )
  (set _7=!_7!      )
goto end

:s_c4
  (set _1=!_1!      )
  (set _2=!_2!  ¨€ ¨€ )
  (set _3=!_3! ¨€¨€¨€¨€¨€)
  (set _4=!_4!  ¨€ ¨€ )
  (set _5=!_5! ¨€¨€¨€¨€¨€)
  (set _6=!_6!  ¨€ ¨€ )
  (set _7=!_7!      )
goto end

:s_!
  (set _1=!_1!  ¨€   )
  (set _2=!_2!  ¨€   )
  (set _3=!_3!  ¨€   )
  (set _4=!_4!  ¨€   )
  (set _5=!_5!  ¨€   )
  (set _6=!_6!      )
  (set _7=!_7!  ¨€   )
goto end

:s_0
  (set _1=!_1! ¨€¨€¨€¨€ )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€  ¨€ )
  (set _5=!_5! ¨€  ¨€ )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7! ¨€¨€¨€¨€ )
goto end

:s_1
  (set _1=!_1!  ¨€¨€  )
  (set _2=!_2!   ¨€  )
  (set _3=!_3!   ¨€  )
  (set _4=!_4!   ¨€  )
  (set _5=!_5!   ¨€  )
  (set _6=!_6!   ¨€  )
  (set _7=!_7! ¨€¨€¨€¨€ )
goto end

:s_2
  (set _1=!_1! ¨€¨€¨€¨€ )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3!    ¨€ )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5! ¨€    )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7! ¨€¨€¨€¨€ )
goto end

:s_3
  (set _1=!_1! ¨€¨€¨€¨€ )
  (set _2=!_2!    ¨€ )
  (set _3=!_3!    ¨€ )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5!    ¨€ )
  (set _6=!_6!    ¨€ )
  (set _7=!_7! ¨€¨€¨€¨€ )
goto end

:s_4
  (set _1=!_1! ¨€  ¨€ )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5!    ¨€ )
  (set _6=!_6!    ¨€ )
  (set _7=!_7!    ¨€ )
goto end

:s_5
  (set _1=!_1! ¨€¨€¨€¨€ )
  (set _2=!_2! ¨€    )
  (set _3=!_3! ¨€    )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5!    ¨€ )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7! ¨€¨€¨€¨€ )
goto end

:s_6
  (set _1=!_1! ¨€¨€¨€  )
  (set _2=!_2! ¨€    )
  (set _3=!_3! ¨€    )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5! ¨€  ¨€ )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7! ¨€¨€¨€¨€ )
goto end

:s_7
  (set _1=!_1! ¨€¨€¨€¨€ )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3!    ¨€ )
  (set _4=!_4!   ¨€¨€ )
  (set _5=!_5!   ¨€  )
  (set _6=!_6!   ¨€  )
  (set _7=!_7!   ¨€  )
goto end

:s_8
  (set _1=!_1! ¨€¨€¨€¨€ )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5! ¨€  ¨€ )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7! ¨€¨€¨€¨€ )
goto end

:s_9
  (set _1=!_1! ¨€¨€¨€¨€ )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5!    ¨€ )
  (set _6=!_6!    ¨€ )
  (set _7=!_7!    ¨€ )
goto end

:s_-
  (set _1=!_1!      )
  (set _2=!_2!      )
  (set _3=!_3!      )
  (set _4=!_4! ¨€¨€¨€¨€¨€)
  (set _5=!_5!      )
  (set _6=!_6!      )
  (set _7=!_7!      )
goto end

:s_.
  (set _1=!_1!      )
  (set _2=!_2!      )
  (set _3=!_3!      )
  (set _4=!_4!      )
  (set _5=!_5!      )
  (set _6=!_6!      )
  (set _7=!_7!  ¨€   )
goto end

:s_a
  (set _1=!_1!  ¨€¨€  )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5! ¨€  ¨€ )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7! ¨€  ¨€ )
goto end

:s_b
  (set _1=!_1! ¨€¨€¨€  )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5! ¨€  ¨€ )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7! ¨€¨€¨€  )
goto end

:s_c
  (set _1=!_1!  ¨€¨€  )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€    )
  (set _4=!_4! ¨€    )
  (set _5=!_5! ¨€    )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7!  ¨€¨€  )
goto end

:s_d
  (set _1=!_1! ¨€¨€¨€  )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€  ¨€ )
  (set _5=!_5! ¨€  ¨€ )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7! ¨€¨€¨€  )
goto end

:s_e
  (set _1=!_1! ¨€¨€¨€¨€¨€)
  (set _2=!_2! ¨€    )
  (set _3=!_3! ¨€    )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5! ¨€    )
  (set _6=!_6! ¨€    )
  (set _7=!_7! ¨€¨€¨€¨€¨€)
goto end

:s_f
  (set _1=!_1! ¨€¨€¨€¨€¨€)
  (set _2=!_2! ¨€    )
  (set _3=!_3! ¨€    )
  (set _4=!_4! ¨€¨€¨€¨€ )
  (set _5=!_5! ¨€    )
  (set _6=!_6! ¨€    )
  (set _7=!_7! ¨€    )
goto end

:s_g
  (set _1=!_1!  ¨€¨€  )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€    )
  (set _4=!_4! ¨€    )
  (set _5=!_5! ¨€ ¨€¨€ )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7!  ¨€¨€  )
goto end

:s_h
  (set _1=!_1! ¨€   ¨€)
  (set _2=!_2! ¨€   ¨€)
  (set _3=!_3! ¨€   ¨€)
  (set _4=!_4! ¨€¨€¨€¨€¨€)
  (set _5=!_5! ¨€   ¨€)
  (set _6=!_6! ¨€   ¨€)
  (set _7=!_7! ¨€   ¨€)
goto end

:s_i
  (set _1=!_1!   ¨€  )
  (set _2=!_2!   ¨€  )
  (set _3=!_3!   ¨€  )
  (set _4=!_4!   ¨€  )
  (set _5=!_5!   ¨€  )
  (set _6=!_6!   ¨€  )
  (set _7=!_7!   ¨€  )
goto end

:s_j
  (set _1=!_1! ¨€¨€¨€¨€¨€)
  (set _2=!_2!   ¨€  )
  (set _3=!_3!   ¨€  )
  (set _4=!_4!   ¨€  )
  (set _5=!_5!   ¨€  )
  (set _6=!_6!   ¨€  )
  (set _7=!_7! ¨€¨€   )
goto end

:s_k
  (set _1=!_1! ¨€   ¨€)
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€ ¨€  )
  (set _4=!_4! ¨€¨€   )
  (set _5=!_5! ¨€¨€   )
  (set _6=!_6! ¨€ ¨€  )
  (set _7=!_7! ¨€  ¨€¨€)
goto end

:s_l
  (set _1=!_1! ¨€    )
  (set _2=!_2! ¨€    )
  (set _3=!_3! ¨€    )
  (set _4=!_4! ¨€    )
  (set _5=!_5! ¨€    )
  (set _6=!_6! ¨€    )
  (set _7=!_7! ¨€¨€¨€¨€¨€)
goto end

:s_m
  (set _1=!_1! ¨€   ¨€)
  (set _2=!_2! ¨€¨€ ¨€¨€)
  (set _3=!_3! ¨€ ¨€ ¨€)
  (set _4=!_4! ¨€ ¨€ ¨€)
  (set _5=!_5! ¨€   ¨€)
  (set _6=!_6! ¨€   ¨€)
  (set _7=!_7! ¨€   ¨€)
goto end

:s_n
  (set _1=!_1! ¨€   ¨€)
  (set _2=!_2! ¨€¨€  ¨€)
  (set _3=!_3! ¨€¨€  ¨€)
  (set _4=!_4! ¨€ ¨€ ¨€)
  (set _5=!_5! ¨€  ¨€¨€)
  (set _6=!_6! ¨€  ¨€¨€)
  (set _7=!_7! ¨€   ¨€)
goto end

:s_o
  (set _1=!_1!  ¨€¨€¨€ )
  (set _2=!_2! ¨€   ¨€)
  (set _3=!_3! ¨€   ¨€)
  (set _4=!_4! ¨€   ¨€)
  (set _5=!_5! ¨€   ¨€)
  (set _6=!_6! ¨€   ¨€)
  (set _7=!_7!  ¨€¨€¨€ )
goto end

:s_p
  (set _1=!_1! ¨€¨€¨€  )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€¨€¨€  )
  (set _5=!_5! ¨€    )
  (set _6=!_6! ¨€    )
  (set _7=!_7! ¨€    )
goto end

:s_q
  (set _1=!_1!  ¨€¨€  )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€  ¨€ )
  (set _5=!_5! ¨€  ¨€ )
  (set _6=!_6! ¨€ ¨€¨€ )
  (set _7=!_7!  ¨€  ¨€)
goto end

:s_r
  (set _1=!_1! ¨€¨€¨€  )
  (set _2=!_2! ¨€  ¨€ )
  (set _3=!_3! ¨€  ¨€ )
  (set _4=!_4! ¨€¨€¨€  )
  (set _5=!_5! ¨€ ¨€  )
  (set _6=!_6! ¨€  ¨€ )
  (set _7=!_7! ¨€  ¨€ )
goto end

:s_s
  (set _1=!_1!  ¨€¨€¨€ )
  (set _2=!_2! ¨€    )
  (set _3=!_3! ¨€    )
  (set _4=!_4!  ¨€¨€  )
  (set _5=!_5!    ¨€ )
  (set _6=!_6!    ¨€ )
  (set _7=!_7! ¨€¨€¨€  )
goto end

:s_t
  (set _1=!_1! ¨€¨€¨€¨€¨€)
  (set _2=!_2!   ¨€  )
  (set _3=!_3!   ¨€  )
  (set _4=!_4!   ¨€  )
  (set _5=!_5!   ¨€  )
  (set _6=!_6!   ¨€  )
  (set _7=!_7!   ¨€  )
goto end

:s_u
  (set _1=!_1! ¨€   ¨€)
  (set _2=!_2! ¨€   ¨€)
  (set _3=!_3! ¨€   ¨€)
  (set _4=!_4! ¨€   ¨€)
  (set _5=!_5! ¨€   ¨€)
  (set _6=!_6! ¨€   ¨€)
  (set _7=!_7!  ¨€¨€¨€ )
goto end

:s_v
  (set _1=!_1! ¨€   ¨€)
  (set _2=!_2! ¨€   ¨€)
  (set _3=!_3! ¨€   ¨€)
  (set _4=!_4! ¨€   ¨€)
  (set _5=!_5! ¨€   ¨€)
  (set _6=!_6!  ¨€ ¨€ )
  (set _7=!_7!   ¨€  )
goto end

:s_w
  (set _1=!_1! ¨€ ¨€ ¨€)
  (set _2=!_2! ¨€ ¨€ ¨€)
  (set _3=!_3! ¨€ ¨€ ¨€)
  (set _4=!_4! ¨€ ¨€ ¨€)
  (set _5=!_5! ¨€ ¨€ ¨€)
  (set _6=!_6! ¨€ ¨€ ¨€)
  (set _7=!_7!  ¨€¨€¨€ )
goto end

:s_x
  (set _1=!_1! ¨€   ¨€)
  (set _2=!_2! ¨€   ¨€)
  (set _3=!_3!  ¨€ ¨€ )
  (set _4=!_4!   ¨€  )
  (set _5=!_5!   ¨€  )
  (set _6=!_6!  ¨€ ¨€ )
  (set _7=!_7! ¨€   ¨€)
goto end

:s_y
  (set _1=!_1! ¨€   ¨€)
  (set _2=!_2!  ¨€ ¨€ )
  (set _3=!_3!   ¨€  )
  (set _4=!_4!   ¨€  )
  (set _5=!_5!   ¨€  )
  (set _6=!_6!   ¨€  )
  (set _7=!_7!   ¨€  )
goto end

:s_z
  (set _1=!_1! ¨€¨€¨€¨€¨€)
  (set _2=!_2!     ¨€)
  (set _3=!_3!    ¨€ )
  (set _4=!_4!   ¨€  )
  (set _5=!_5!  ¨€   )
  (set _6=!_6! ¨€    )
  (set _7=!_7! ¨€¨€¨€¨€¨€)
goto end

:s_space
  (set _1=!_1!      )
  (set _2=!_2!      )
  (set _3=!_3!      )
  (set _4=!_4!      )
  (set _5=!_5!      )
  (set _6=!_6!      )
  (set _7=!_7!      )
goto end

:end
endlocal