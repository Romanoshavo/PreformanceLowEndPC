@echo off
echo Optimizing Windows for performance...
echo.

REM Disable Windows visual effects for performance
echo Disabling visual effects...
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo Visual effects disabled for prefomance.

REM Set power plan to High Performance
echo Setting power plan to High Performance...
echo.
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo Power plan set to High Performance.

REM Disable unnecessary startup programs
echo Disabling startup programs...
echo.
for /f "tokens=*" %%a in ('wmic startup get caption /all ^| find /v ""') do (
    if not "%%a"=="Caption" (
        wmic startup where caption="%%a" call disable
    )
)
echo Startup programs disabled.

echo.
echo Windows optimized for performance. Enjoy By RasingDead
pause
