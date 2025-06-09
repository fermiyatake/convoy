@echo off
setlocal enabledelayedexpansion

:: Caminho para o diretório bin
set "BIN_DIR=%~dp0\.."

:: Lê a versão do PHP do arquivo (sem espaços extras)
for /f "usebackq delims=" %%v in ("%BIN_DIR%\shims\php-version.txt") do set "PHP_VERSION=%%v"

:: Caminho do executável PHP
set "PHP_EXE=%BIN_DIR%\%PHP_VERSION%\php.exe"

:: Verifica se o php.exe existe
if not exist "%PHP_EXE%" (
    echo [ERRO] php.exe nao encontrado em: %PHP_EXE%
    exit /b 1
)

:: Executa o PHP com os argumentos passados
"%PHP_EXE%" %*