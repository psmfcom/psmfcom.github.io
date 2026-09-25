@ECHO OFF
SetLocal EnableExtensions EnableDelayedExpansion

for %%I in (.) do set CurrDirName=%%~nxI
SET folder=C:\DATA\%CurrDirName%\

ECHO %folder%

robocopy.exe . %folder% /MIR /S /E /R:1 /W:1 /XF %0 /XF .*.* *.md /XD .git "System Volume Information" "$Recycle.Bin"
@REM attrib -R -H -S %folder%

@ECHO OFF
SetLocal EnableExtensions EnableDelayedExpansion
FOR /F %%a IN ('COPY /Z "%~f0" NUL') DO (SET "CR=%%a")
SET WaitTime=21
ECHO.
FOR /L %%x IN (%WaitTime%, -1, 0) DO (
TIMEOUT /T 1 /NOBREAK > NUL
< NUL SET /P "=Waiting... %%x !CR!"
)
ECHO.

@REM echo for /?
@REM echo %0
@REM echo %~dp0
@REM echo %~f0
@REM echo %~nx0
