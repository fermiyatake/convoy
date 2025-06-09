@echo off
setlocal enabledelayedexpansion

:: Caminho para a pasta bin
set "BIN_DIR=%~dp0\.."

:: Lê a versão do PHP, removendo espaços extras
for /f "usebackq delims=" %%v in ("%BIN_DIR%\shims\php-version.txt") do set "PHP_VERSION=%%v"

:: Caminho para o executável do PHP
set "PHP_EXE=%BIN_DIR%\%PHP_VERSION%\php.exe"

:: Caminho para o composer.phar
set "COMPOSER_PHAR=%BIN_DIR%\composer\composer.phar"

:: Verifica se PHP existe
if not exist "%PHP_EXE%" (
    echo [ERRO] PHP nao encontrado em %PHP_EXE%
    exit /b 1
)

:: Executa o composer.phar com os argumentos do usuário
"%PHP_EXE%" "%COMPOSER_PHAR%" %*