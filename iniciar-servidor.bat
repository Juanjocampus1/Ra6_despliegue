@echo off
REM ====================================================
REM Script para iniciar el proyecto PHP
REM Autor: Juan José Acebedo Lara (jjal)
REM ====================================================

echo.
echo ====================================================
echo   PROYECTO PHP - Gestion de Usuarios
echo   Autor: Juan Jose Acebedo Lopez (jjal)
echo ====================================================
echo.

REM Verificar PHP
where php >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] PHP no esta instalado o no esta en el PATH
    echo Por favor instala PHP o XAMPP
    pause
    exit /b 1
)

REM Verificar MySQL
echo [INFO] Verificando MySQL...
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if %errorlevel% neq 0 (
    echo [ADVERTENCIA] MySQL no parece estar corriendo
    echo Por favor inicia MySQL desde XAMPP Control Panel
    echo.
    set /p CONTINUE="Continuar de todos modos? (S/N): "
    if /i not "%CONTINUE%"=="S" exit /b 1
)

REM Crear carpeta de logs si no existe
if not exist "logs" (
    echo [INFO] Creando carpeta de logs...
    mkdir logs
)

REM Mostrar información
echo.
echo [INFO] Iniciando servidor PHP integrado...
echo.
echo Servidor corriendo en: http://localhost:8000
echo.
echo Presiona Ctrl+C para detener el servidor
echo.
echo ====================================================
echo.

REM Preguntar si abrir navegador
set /p OPEN="Abrir navegador automaticamente? (S/N): "
if /i "%OPEN%"=="S" (
    timeout /t 2 >nul
    start http://localhost:8000
)

REM Iniciar servidor PHP
php -S localhost:8000

pause
