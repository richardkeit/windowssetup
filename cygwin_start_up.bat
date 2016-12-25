@ECHO OFF
REM -- Modifies the /etc/nsswitch.conf to enable rsync between guest + host
SETLOCAL


REM -- Change to the directory of the executing batch file
CD %~dp0
echo 

REM -- Configure our paths
SET ROOTDIR="C:\tools\cygwin"


ECHO *** Running the requiredcommands CYGWIN NOW--ENTRING NESTED SCRIPT
set PATH=C:\tools\cygwin\bin;%PATH%
%ROOTDIR%\bin\bash.exe ".\start_up.bsh"

ECHO.
ECHO *** CONFIG HAS COMPLETED!! 


ENDLOCAL