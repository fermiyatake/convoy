@echo off
setlocal enabledelayedexpansion

REM === Configura caminhos ===
pushd "%~dp0\.." >nul
set "CONVOY_DIR=%cd%"
popd >nul
set "VERSION_FILE=%CONVOY_DIR%\bin\shims\php-version.txt"

REM === Lê versão do PHP sem espaços ===
for /f "usebackq delims=" %%v in ("%VERSION_FILE%") do set "PHP_VERSION=%%v"
set "PHP_DIR=%CONVOY_DIR%\bin\%PHP_VERSION%"
set "PHP_CGI=%PHP_DIR%\php-cgi.exe"
set "NGINX_DIR=%CONVOY_DIR%\bin\nginx"

taskkill /F /IM php-cgi.exe >nul 2>&1

start "" "%PHP_DIR%\php-cgi.exe" -b 127.0.0.1:9000

REM === Finaliza nginx se já estiver rodando ===
taskkill /F /IM nginx.exe >nul 2>&1

REM === Gera configs ===
call "%~dp0generate-sites.bat"

REM === Inicia o NGINX ===
pushd "%NGINX_DIR%"
start "" nginx.exe
popd

echo [INFO] Servidor iniciado!