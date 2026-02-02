@echo off
REM ====================================================
REM Script para generar documentación usando Docker
REM Autor: Juan José Acebedo López (jjal)
REM ====================================================

echo.
echo ====================================================
echo   GENERADOR DE DOCUMENTACION CON DOCKER
echo   Contenedor: phpdocumentor-jjal
echo ====================================================
echo.

REM Verificar que existe Docker
where docker >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker no esta instalado
    echo Por favor instala Docker Desktop desde: https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)

REM Crear directorio de documentación
echo [INFO] Creando directorios...
if not exist "docs" mkdir docs
if not exist "docs\html" mkdir docs\html

REM Construir imagen Docker
echo.
echo [INFO] Construyendo imagen Docker...
docker build -t phpdocumentor-jjal .

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Error al construir la imagen Docker
    pause
    exit /b 1
)

REM Generar documentación usando Docker
echo.
echo [INFO] Generando documentacion con phpDocumentor...
echo [INFO] Esto puede tardar unos minutos...
echo.

docker run --rm -v "%CD%:/app" phpdocumentor-jjal

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Error al generar documentacion
    pause
    exit /b 1
)

echo.
echo ====================================================
echo   DOCUMENTACION GENERADA EXITOSAMENTE
echo ====================================================
echo.
echo La documentacion HTML esta disponible en:
echo   docs\html\index.html
echo.
echo ====================================================
echo.

REM Preguntar si abrir documentación
set /p OPEN="Deseas abrir la documentacion ahora? (S/N): "
if /i "%OPEN%"=="S" (
    start docs\html\index.html
)

pause
