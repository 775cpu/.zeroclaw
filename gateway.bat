@echo off
setlocal

set "ZEROCLAW=C:\Users\Administrator\.zeroclaw\zeroclaw.exe"

if not exist ""%ZEROCLAW%"" (
    echo [ERROR] ZeroClaw not found: %ZEROCLAW%
    pause
    exit /b 1
)

echo ============================================
echo   ZeroClaw Gateway - Web ???
echo   ??: http://localhost:42617
echo ============================================
echo.
echo ? Ctrl+C ????
echo.

""%ZEROCLAW%"" gateway
pause