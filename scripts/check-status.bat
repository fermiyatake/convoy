@echo off
setlocal EnableDelayedExpansion

set "HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts"
set "PROJECTS_DIR=%~dp0..\projects"
set "CONF_DIR=%~dp0..\bin\nginx\conf\sites-enabled"

echo =====================================
echo         VERIFICACAO DO CONVOY
echo =====================================

REM Verifica se Nginx está rodando
tasklist | findstr /i "nginx.exe" >nul
if !errorlevel! equ 0 (
    echo [OK] Nginx esta rodando.
) else (
    echo [ERRO] Nginx nao esta rodando.
)

REM Verifica se porta 80 está escutando
netstat -ano | findstr ":80" | findstr "LISTENING" >nul
if !errorlevel! equ 0 (
    echo [OK] Porta 80 esta escutando.
) else (
    echo [ERRO] Porta 80 nao esta escutando.
)

REM Verifica arquivos .conf
if exist "%CONF_DIR%\*.conf" (
    echo [OK] Arquivos de configuracao encontrados em sites-enabled.
) else (
    echo [ERRO] Nenhum arquivo .conf encontrado em sites-enabled.
)

REM Verifica se domínios estão no hosts
for /D %%D in ("%PROJECTS_DIR%\*") do (
    set "FOLDER=%%~nxD"
    set "DOMAIN=!FOLDER!.test"
    findstr /C:"127.0.0.1 !DOMAIN!" "%HOSTS_FILE%" >nul
    if !errorlevel! equ 0 (
        echo [OK] !DOMAIN! esta no arquivo hosts.
    ) else (
        echo [ERRO] !DOMAIN! NAO encontrado no arquivo hosts.
    )
)

echo.