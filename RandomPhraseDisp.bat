@echo off

set file=list.ini
set /a cnt=0

:SORTRANDOM

for /f %%a in ('type "%file%"^|find "" /v /c') do set /a cnt=%%a
set /a cnt-=1
set /a randomnum=%random% %% %cnt%
CALL:READINI "list.ini" %randomnum% randomph
echo.
echo %randomph%
echo.
PAUSE 
GOTO SORTRANDOM

:READINI    
FOR /f "tokens=2 delims==" %%a in ('find "%~2 =" "%~1"') do SET %~3=%%a    
GOTO:eof