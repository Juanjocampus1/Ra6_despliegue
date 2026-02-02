@echo off
REM ====================================================
REM Script de verificación del proyecto
REM Autor: Juan José Acebedo López (jjal)
REM ====================================================

echo.
echo ====================================================
echo   VERIFICACION DEL PROYECTO
echo ====================================================
echo.

set ERROR=0

echo [INFO] Verificando archivos requeridos...
echo.

REM Verificar archivos principales
if not exist "index.php" (
    echo [ERROR] Falta: index.php
    set ERROR=1
) else (
    echo [OK] index.php
)

if not exist "src\Usuario.php" (
    echo [ERROR] Falta: src\Usuario.php
    set ERROR=1
) else (
    echo [OK] src\Usuario.php
)

if not exist "src\utilidades.php" (
    echo [ERROR] Falta: src\utilidades.php
    set ERROR=1
) else (
    echo [OK] src\utilidades.php
)

REM Verificar archivos Docker
if not exist "Dockerfile" (
    echo [ERROR] Falta: Dockerfile
    set ERROR=1
) else (
    echo [OK] Dockerfile
)

if not exist "docker-compose.yml" (
    echo [ERROR] Falta: docker-compose.yml
    set ERROR=1
) else (
    echo [OK] docker-compose.yml
)

REM Verificar configuración
if not exist "phpdoc.xml" (
    echo [ERROR] Falta: phpdoc.xml
    set ERROR=1
) else (
    echo [OK] phpdoc.xml
)

if not exist ".gitignore" (
    echo [ERROR] Falta: .gitignore
    set ERROR=1
) else (
    echo [OK] .gitignore
)

REM Verificar documentación
if not exist "README.md" (
    echo [ERROR] Falta: README.md
    set ERROR=1
) else (
    echo [OK] README.md
)

if not exist "GUIA_DOCKER.md" (
    echo [ERROR] Falta: GUIA_DOCKER.md
    set ERROR=1
) else (
    echo [OK] GUIA_DOCKER.md
)

REM Verificar GitHub Actions
if not exist ".github\workflows\ci.yml" (
    echo [ERROR] Falta: .github\workflows\ci.yml
    set ERROR=1
) else (
    echo [OK] .github\workflows\ci.yml
)

echo.
echo [INFO] Verificando sintaxis PHP...
echo.

php -l index.php
if %errorlevel% neq 0 (
    echo [ERROR] Errores de sintaxis en index.php
    set ERROR=1
) else (
    echo [OK] Sintaxis correcta: index.php
)

php -l src\Usuario.php
if %errorlevel% neq 0 (
    echo [ERROR] Errores de sintaxis en src\Usuario.php
    set ERROR=1
) else (
    echo [OK] Sintaxis correcta: src\Usuario.php
)

php -l src\utilidades.php
if %errorlevel% neq 0 (
    echo [ERROR] Errores de sintaxis en src\utilidades.php
    set ERROR=1
) else (
    echo [OK] Sintaxis correcta: src\utilidades.php
)

echo.
echo [INFO] Verificando Docker...
echo.

where docker >nul 2>&1
if %errorlevel% neq 0 (
    echo [ADVERTENCIA] Docker no esta instalado
    echo [INFO] Instalar desde: https://www.docker.com/products/docker-desktop
) else (
    echo [OK] Docker instalado
    docker --version
)

echo.
echo [INFO] Verificando Git...
echo.

where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [ADVERTENCIA] Git no esta instalado
    echo [INFO] Instalar desde: https://git-scm.com/
) else (
    echo [OK] Git instalado
    git --version
    
    if exist ".git" (
        echo [OK] Repositorio Git inicializado
        echo.
        echo [INFO] Historial de commits:
        git log --oneline -3
    ) else (
        echo [ADVERTENCIA] Git no inicializado
        echo [INFO] Ejecutar: git init
    )
)

echo.
echo ====================================================
if %ERROR%==0 (
    echo   RESULTADO: TODO CORRECTO ✓
    echo   El proyecto esta listo para entregar
) else (
    echo   RESULTADO: HAY ERRORES ✗
    echo   Revisar los mensajes anteriores
)
echo ====================================================
echo.

pause
