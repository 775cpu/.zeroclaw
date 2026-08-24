@echo off
setlocal

set "ZEROCLAW=C:\Users\Administrator\.zeroclaw\zeroclaw.exe"

if not exist ""%ZEROCLAW%"" (
    echo [ERROR] ZeroClaw not found: %ZEROCLAW%
    pause
    exit /b 1
)

""%ZEROCLAW%"" agent --agent default
pause