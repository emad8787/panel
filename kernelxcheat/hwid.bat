@echo off

:: Auto-elevate to admin if needed
net session >nul 2>&1
if %errorLevel% == 0 (
    goto admin
) else (
    echo Not running as admin, attempting to elevate...
    goto UACPrompt
)

:admin
color 0C
title EMAD - USER SID TOOL



echo User SID information:
whoami /user

echo.
echo =============================================
echo        Press any key to exit...
echo =============================================
pause >nul
exit /b

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /b
