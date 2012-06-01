@echo off
rem a very simple number guessing game
rem to demonstrate some usage of windows batch programming
rem http://acm.zhihua-lai.com
rem 1-June-2012

setlocal
set /a curbest=99999

:newgame
  set /a cur=0  
  set /a num=%RANDOM%%%100+1
  set left=1
  set right=100
  
  :repeat
    set /p guess=Please guess[%left%,%right%]:
    set /a cur=cur+1
    if %guess% EQU %num% (
      echo You have guessed %cur% times to get it right!
      if %cur% LSS %curbest% (
        set /a curbest=cur
      )
      goto ask          
    )
    if %guess% LSS %num% (
      echo It is a bigger number!
      set /a left=%guess%+1
      goto repeat 
    )
    echo It is a smaller number!
    set /a right=%guess%-1    
    goto repeat
    
:ask
  choice /c:yn /n /m "Do you want to play again?"
  if %errorlevel% EQU 1 goto newgame

:bye
  echo Thank you! Bye!
  if not %curbest% EQU 99999 echo Best Guess = %curbest%

endlocal
  

