@echo off
setlocal enabledelayedexpansion

REM Caminho raiz do Convoy
for %%I in ("%~dp0..") do set "CONVOY_DIR=%%~fI"

REM Limpa espaços à direita da versão (caso o usuário digite "php82 ")
set "PHP_VERSION=%~1"

REM Caminho para a pasta da versão do PHP
set "PHP_DIR=%CONVOY_DIR%\bin\%PHP_VERSION%"
set "VERSION_FILE=%CONVOY_DIR%\bin\shims\php-version.txt"

REM Verifica se a versão existe
if not exist "%PHP_DIR%\php.exe" (
    echo [ERRO] Versao %PHP_VERSION% nao encontrada em %PHP_DIR%
    exit /b 1
)

REM Atualiza o arquivo com a versão ativa (sem espaços, sem nova linha extra)
> "%VERSION_FILE%" (echo %PHP_VERSION%)

echo [INFO] PHP atualizado para %PHP_VERSION%

exit /b 0