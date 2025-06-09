@echo off
setlocal enabledelayedexpansion

REM Move para a pasta pai de /shims (que é /bin)
cd /d "%~dp0\.."
set "CONVOY_BIN=%CD%"

REM Lê e limpa a versão ativa
set /p PHP_VERSION=<"%CONVOY_BIN%\shims\php-version.txt"
set "PHP_VERSION=%PHP_VERSION: =%"
set "PHP_VERSION=%PHP_VERSION:"=%"

REM Monta o caminho completo para o php.exe da versão ativa
set "PHP_PATH=%CONVOY_BIN%\%PHP_VERSION%\php.exe"

if not exist "%PHP_PATH%" (
    echo [ERROR] PHP nao encontrado em %PHP_PATH%
    exit /b 1
)

REM Executa o PHP com todos os argumentos
"%PHP_PATH%" %*