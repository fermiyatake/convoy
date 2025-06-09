@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

title Convoy Launcher

:menu
cls
echo ======================================
echo        Convoy Launcher
echo ======================================
echo.
echo 1 - Update hosts HOSTS
echo 2 - Switch PHP version
echo 3 - Start server
echo 4 - Server status
echo 0 - Exit
echo.
set /p option="Choose an option: "

if "!option!"=="1" (
    call scripts\hosts-config.bat
    pause
    goto menu
)
if "!option!"=="2" (
    echo.
    echo Available PHPs:
    dir /b bin\php*
    echo.
    set /p ver="Type the desired version (ex: php82): "
    call scripts\switch-php.bat !ver!
    pause
    goto menu
)
if "!option!"=="3" (
    call scripts\start-server.bat
    pause
    goto menu
)
if "!option!"=="4" (
    call scripts\check-status.bat
    pause
    goto menu
)
if "!option!"=="0" (
    exit
)
goto menu