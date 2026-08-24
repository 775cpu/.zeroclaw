@echo off
setlocal

set "ZEROCLAW=C:\Users\Administrator\.zeroclaw\zeroclaw.exe"

if not exist ""%ZEROCLAW%"" (
    echo [ERROR] ZeroClaw not found: %ZEROCLAW%
    pause
    exit /b 1
)

echo ============================================
echo   ZeroClaw Agent - ????
echo   ??: sensenova-6.8-flash-lite
echo ============================================
echo.

if ""%~1""=="" (
    set /p ""MSG=: ""
) else (
    set ""MSG=%*""
)

""%ZEROCLAW%"" agent --agent default --message ""%MSG%""
echo.
pause