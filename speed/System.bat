@echo off
setlocal

:: Set file paths
set "profileFile=System.ppx"
set "profilePath=C:\Users\Administrator\AppData\Roaming\System.ppx"
set "proxifierPath=C:\Program Files (x86)\Proxifier\Proxifier.exe"
set "defaultProfilePath=C:\Users\Administrator\AppData\Roaming\Proxifier4\Profiles\%profileFile%"

:: Launch Proxifier
echo Launching Proxifier with profile...
start "" "%proxifierPath%" "%profilePath%"

:: Wait 3 seconds, then hide the profile as a system file
timeout /t 2 >nul
if exist "%defaultProfilePath%" (
    attrib +h +s "%defaultProfilePath%"
    echo Profile hidden as a system file.
) else (
    echo Warning: Profile not found to hide.
)









:: Wait for Proxifier to close (loop check)
:waitForClose
tasklist | find /i "Proxifier.exe" >nul
if %errorlevel%==0 (
    timeout /t 1 >nul
    goto waitForClose
)

 

:: Remove attributes and delete the profile
if exist "%defaultProfilePath%" (
    attrib -h -s "%defaultProfilePath%" 2>nul
    del /f /q "%defaultProfilePath%"
    echo Hidden system profile deleted.
) else (
    echo No profile found to delete.
)

echo Done. Exiting...

endlocal
exit
