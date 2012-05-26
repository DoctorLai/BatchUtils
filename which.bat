@Echo Off
Rem http://acm.zhihua-lai.com, 25-May-2012

If [%1]==[] Goto USAGE

:LOOP
  If [%1]==[] Goto END

:CHECK
  SetLocal
    Set Paths=.;%PATH%
    For %%E In (%PATHEXT%) Do (                  
      For %%I In ("%~n1%%E") Do (
        If NOT "%%~$Paths:I"=="" Echo %%~$Paths:I
      )
    )
  EndLocal
  Shift
  Goto LOOP

:USAGE
  Echo %0 [Executable1] [Executable2] ..

:END
