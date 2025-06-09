@echo off
setlocal EnableDelayedExpansion

set HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts
set PROJECTS_DIR=%~dp0..\projects

echo.
echo [INFO] Atualizando %HOSTS_FILE%
echo (Sera necessario permissao de administrador)

for /D %%D in ("%PROJECTS_DIR%\*") do (
    set "PROJECT=%%~nxD"
    set "DOMAIN=!PROJECT!.test"

    findstr /C:"127.0.0.1 !DOMAIN!" "%HOSTS_FILE%" >nul
    if errorlevel 1 (
        echo.>>"%HOSTS_FILE%"
        echo 127.0.0.1 !DOMAIN!>>"%HOSTS_FILE%"
        echo [INFO] Adicionado !DOMAIN!
    ) else (
        echo [INFO] !DOMAIN! ja existe no hosts.
    )
)

echo [INFO] Concluido.