@echo off
setlocal EnableDelayedExpansion

REM Caminhos
set "PROJECTS_DIR=%~dp0..\projects"
set "OUTPUT_DIR=%~dp0..\bin\nginx\conf\sites-enabled"

REM Cria pasta se não existir
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo [INFO] Gerando arquivos .conf para os projetos em %PROJECTS_DIR%

for /D %%D in ("%PROJECTS_DIR%\*") do (
    set "FOLDER=%%~nxD"
    set "FULL_PATH=%%~fD"
    set "DOMAIN=!FOLDER!.test"
    set "CONF_FILE=%OUTPUT_DIR%\!DOMAIN!.conf"

    REM Converte \ para / no caminho do Windows
    set "ROOT_PATH=!FULL_PATH:\=/!/public"

    if exist "!FULL_PATH!\public\index.php" (
        echo [INFO] Criando arquivo para !DOMAIN!

        (
        echo server {
        echo     listen 80;
        echo     server_name !DOMAIN!;
        echo     root "!ROOT_PATH!";
        echo     index index.php index.html;
        echo.
        echo     location / {
        echo         try_files $uri $uri/ /index.php?$query_string;
        echo     }
        echo.
        echo     location ~ \.php$ {
        echo         include fastcgi_params;
        echo         fastcgi_pass 127.0.0.1:9000;
        echo         fastcgi_index index.php;
        echo         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        echo     }
        echo }
        ) > "!CONF_FILE!"
    ) else (
        echo [WARN] Ignorando !FOLDER!: index.php não encontrado em public\
    )
)

echo [INFO] Finalizado.