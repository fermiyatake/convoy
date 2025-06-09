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
echo 1 - Atualizar arquivo HOSTS
echo 2 - Versao PHP
echo 3 - Iniciar Nginx
echo 4 - Status Nginx
echo 0 - Sair
echo.
set /p opcao="Escolha uma opcao: "

if "!opcao!"=="1" (
    call scripts\hosts-config.bat
    pause
    goto menu
)
if "!opcao!"=="2" (
    echo.
    echo PHPs disponiveis:
    dir /b bin\php*
    echo.
    set /p ver="Digite a versao (ex: php82): "
    call scripts\switch-php.bat !ver!
    pause
    goto menu
)
if "!opcao!"=="3" (
    call scripts\start-server.bat
    pause
    goto menu
)
if "!opcao!"=="4" (
    call scripts\check-status.bat
    pause
    goto menu
)
if "!opcao!"=="0" (
    exit
)
goto menu