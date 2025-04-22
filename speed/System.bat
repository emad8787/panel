@echo off
setlocal

:: Set file paths
set "profileFile=System.ppx"
set "profilePath=C:\Windows\System.ppx"
set "proxifierPath=C:\Program Files (x86)\Proxifier\Proxifier.exe"
set "defaultProfilePath=%appdata%\Proxifier4\Profiles\%profileFile%"
set "thisScript=%~f0"

:: Launch Proxifier
echo Launching Proxifier with profile...
start "" "%proxifierPath%" "%profilePath%"

:: Wait 2 seconds, then delete the default profile (if it exists)
timeout /t 2 >nul
if exist "%defaultProfilePath%" (
    del /f /q "%defaultProfilePath%" "%profilePath%"
    echo Profile deleted from default location.
)

:: Wait for Proxifier to close (loop check)
:waitForClose
tasklist | find /i "Proxifier.exe" >nul
if %errorlevel%==0 (
    timeout /t 1 >nul
    goto waitForClose
)

:: Self-delete
start "" cmd /c del /f /q "%thisScript%"

endlocal
exit
