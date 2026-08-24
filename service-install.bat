@echo off
setlocal

set "ZEROCLAW=C:\Users\Administrator\.zeroclaw\zeroclaw.exe"

if not exist ""%ZEROCLAW%"" (
    echo [ERROR] ZeroClaw not found: %ZEROCLAW%
    pause
    exit /b 1
)

echo ============================================
echo   ZeroClaw - ?? Windows ????
echo   (?)
echo ============================================
echo.

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] ??
    echo ???? -^> ???
    pause
    exit /b 1
)

""%ZEROCLAW%"" service install
echo.
echo ??? service-start.bat ??
pause