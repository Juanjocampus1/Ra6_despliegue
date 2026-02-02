@echo off
REM ====================================================
REM Script para generar documentación del proyecto PHP
REM Autor: Juan José Acebedo Lara (jjal)
REM ====================================================

echo.
echo ====================================================
echo   GENERADOR DE DOCUMENTACION - Proyecto PHP
echo ====================================================
echo.

REM Verificar que existe Composer
where composer >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Composer no esta instalado
    echo Por favor instala Composer desde: https://getcomposer.org/
    pause
    exit /b 1
)

REM Verificar que existe vendor/bin/phpdoc
if not exist "vendor\bin\phpdoc" (
    echo [INFO] phpDocumentor no esta instalado
    echo [INFO] Instalando phpDocumentor...
    call composer require --dev phpdocumentor/phpdocumentor
    if %errorlevel% neq 0 (
        echo [ERROR] Error al instalar phpDocumentor
        pause
        exit /b 1
    )
)

REM Crear directorio de documentación
echo [INFO] Creando directorio de documentacion...
if not exist "docs" mkdir docs
if not exist "docs\html" mkdir docs\html
if not exist "docs\pdf" mkdir docs\pdf

REM Limpiar documentación anterior
echo [INFO] Limpiando documentacion anterior...
if exist "docs\html\*" del /q docs\html\* >nul 2>&1

REM Generar documentación HTML
echo.
echo [INFO] Generando documentacion HTML...
echo [INFO] Esto puede tardar unos minutos...
echo.

call vendor\bin\phpdoc -d . -t docs\html --template clean --ignore vendor/,docs/,logs/

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
echo Para generar PDF:
echo   1. Abre docs\html\index.html en tu navegador
echo   2. Presiona Ctrl+P
echo   3. Selecciona "Guardar como PDF"
echo   4. Guarda en docs\pdf\documentacion.pdf
echo.
echo ====================================================
echo.

REM Preguntar si abrir documentación
set /p OPEN="Deseas abrir la documentacion ahora? (S/N): "
if /i "%OPEN%"=="S" (
    start docs\html\index.html
)

pause
