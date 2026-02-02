# 📋 GUÍA DE INSTALACIÓN Y USO
## Proyecto PHP - Gestión de Usuarios

**Autor:** Juan José Acebedo López (jjal)  
**Fecha:** 02/02/2026

---

## 📑 ÍNDICE

1. [Instalación del Proyecto](#instalación-del-proyecto)
2. [Configuración de la Base de Datos](#configuración-de-la-base-de-datos)
3. [Uso de la Aplicación](#uso-de-la-aplicación)
4. [Generación de Documentación](#generación-de-documentación)
5. [Control de Versiones con Git](#control-de-versiones-con-git)
6. [Integración Continua](#integración-continua)
7. [Solución de Problemas](#solución-de-problemas)

---

## 1. INSTALACIÓN DEL PROYECTO

### 1.1 Requisitos Previos

Asegúrate de tener instalado:

- ✅ **PHP** >= 7.4 (se recomienda PHP 8.0 o superior)
- ✅ **MySQL** >= 5.7 o **MariaDB** >= 10.3
- ✅ **Servidor Web** (Apache, Nginx, o PHP built-in server)
- ✅ **Git** (para control de versiones)
- ✅ **Composer** (opcional, para phpDocumentor)

### 1.2 Verificar Instalaciones

```powershell
# Verificar PHP
php -v

# Verificar MySQL
mysql --version

# Verificar Git
git --version

# Verificar Composer (opcional)
composer --version
```

### 1.3 Clonar el Repositorio

```powershell
# Navegar a la carpeta donde quieres el proyecto
cd C:\xampp\htdocs

# Clonar desde GitHub
git clone https://github.com/TU_USUARIO/proyecto-php-jjal.git

# Entrar al directorio
cd proyecto-php-jjal
```

**O si estás trabajando localmente:**

```powershell
# Copiar la carpeta del proyecto a htdocs
Copy-Item -Path "C:\Users\jjace\Desktop\dev\Ra6_depliegue" -Destination "C:\xampp\htdocs\proyecto-php-jjal" -Recurse
```

### 1.4 Estructura de Archivos

Verifica que tengas esta estructura:

```
proyecto-php-jjal/
├── src/
│   ├── usuario.php
│   └── utilidades.php
├── .github/
│   └── workflows/
│       └── ci.yml
├── index.php
├── phpdoc.xml
├── composer.json
├── .gitignore
├── DATABASE.sql
├── README.md
└── DOCUMENTACION_PHPDOCUMENTOR.md
```

---

## 2. CONFIGURACIÓN DE LA BASE DE DATOS

### 2.1 Iniciar Servicios

**Con XAMPP:**

1. Abrir XAMPP Control Panel
2. Iniciar **Apache**
3. Iniciar **MySQL**

**Con servicios de Windows:**

```powershell
# Iniciar MySQL
net start mysql

# Iniciar Apache (si usas Apache)
net start apache2.4
```

### 2.2 Crear la Base de Datos

**Opción A: Usando MySQL Command Line**

```powershell
# Conectar a MySQL
mysql -u root -p

# Ejecutar el script SQL
source C:\xampp\htdocs\proyecto-php-jjal\DATABASE.sql
```

**Opción B: Usando phpMyAdmin**

1. Abrir navegador: `http://localhost/phpmyadmin`
2. Ir a pestaña **SQL**
3. Copiar el contenido de `DATABASE.sql`
4. Pegar y hacer clic en **Continuar**

**Opción C: Ejecución directa del script**

```powershell
# Ejecutar script SQL
mysql -u root -p < C:\xampp\htdocs\proyecto-php-jjal\DATABASE.sql
```

### 2.3 Verificar Creación

```sql
-- Conectar a MySQL
mysql -u root -p

-- Verificar base de datos
SHOW DATABASES;

-- Usar la base de datos
USE proyecto_php_jjal;

-- Ver tablas
SHOW TABLES;

-- Ver estructura de usuarios
DESCRIBE usuarios;

-- Ver datos de ejemplo
SELECT * FROM usuarios;
```

### 2.4 Configurar Credenciales (si es necesario)

Si tu MySQL tiene contraseña o usa configuración diferente, edita `src/utilidades.php`:

```php
// Línea ~40
function conectarBaseDatos(
    $host = "localhost",
    $usuario = "root",
    $password = "",           // <-- CAMBIAR AQUÍ si tienes contraseña
    $baseDatos = "proyecto_php_jjal"
)
```

**⚠️ IMPORTANTE:** No subas contraseñas a GitHub. Usa variables de entorno en producción.

---

## 3. USO DE LA APLICACIÓN

### 3.1 Iniciar el Servidor

**Opción A: Con XAMPP/WAMP**

1. Asegurar que Apache está corriendo
2. Acceder a: `http://localhost/proyecto-php-jjal/`

**Opción B: Servidor PHP Integrado**

```powershell
# Desde la raíz del proyecto
cd C:\xampp\htdocs\proyecto-php-jjal

# Iniciar servidor en puerto 8000
php -S localhost:8000

# Abrir navegador en:
# http://localhost:8000
```

### 3.2 Funcionalidades

#### 3.2.1 Registrar Usuario

1. Abrir `http://localhost:8000` o `http://localhost/proyecto-php-jjal/`
2. Rellenar formulario:
   - **Nombre completo:** Ej. "Juan José Acebedo López"
   - **Email:** Ej. "jjal@ejemplo.com"
3. Hacer clic en **Registrar Usuario**
4. Ver mensaje de confirmación

#### 3.2.2 Ver Usuarios Registrados

- Los usuarios se muestran automáticamente en la página
- Información mostrada:
  - Nombre completo
  - Email
  - ID
  - Fecha de registro

#### 3.2.3 Validaciones

La aplicación valida:
- ✅ Campos no vacíos
- ✅ Formato de email correcto
- ✅ Email único (no duplicados)
- ✅ Protección contra XSS (sanitización de inputs)

### 3.3 Probar la Aplicación

```powershell
# Test 1: Crear usuario válido
# - Nombre: "Juan José Acebedo López"
# - Email: "jjal@ejemplo.com"
# - Resultado esperado: ✅ Usuario registrado correctamente

# Test 2: Crear usuario con email duplicado
# - Usar mismo email que Test 1
# - Resultado esperado: ❌ Error: email ya registrado

# Test 3: Email inválido
# - Email: "email_invalido"
# - Resultado esperado: ❌ Error: email no válido

# Test 4: Campo vacío
# - Dejar nombre vacío
# - Resultado esperado: ❌ Error: campo obligatorio
```

---

## 4. GENERACIÓN DE DOCUMENTACIÓN

### 4.1 Instalar phpDocumentor

**Opción A: Con Composer (Recomendado)**

```powershell
# Desde la raíz del proyecto
cd C:\xampp\htdocs\proyecto-php-jjal

# Instalar phpDocumentor
composer require --dev phpdocumentor/phpdocumentor

# Verificar instalación
.\vendor\bin\phpdoc --version
```

**Opción B: Descargar PHAR**

```powershell
# Descargar phpDocumentor.phar
# Desde: https://phpdoc.org/phpDocumentor.phar

# Guardar en la raíz del proyecto
# Dar permisos (en Linux/Mac)
chmod +x phpDocumentor.phar
```

### 4.2 Generar Documentación HTML

```powershell
# Con Composer
.\vendor\bin\phpdoc -d . -t docs/html --template clean

# Con PHAR
php phpDocumentor.phar -d . -t docs/html --template clean

# Usando configuración XML
.\vendor\bin\phpdoc -c phpdoc.xml
```

### 4.3 Ver Documentación HTML

```powershell
# Abrir en navegador
start docs/html/index.html

# O navegar a:
# http://localhost/proyecto-php-jjal/docs/html/index.html
```

### 4.4 Generar Documentación PDF

**Método 1: Imprimir desde el navegador**

1. Abrir `docs/html/index.html` en Chrome/Edge
2. Presionar `Ctrl + P` (Imprimir)
3. Seleccionar **Guardar como PDF**
4. Guardar en `docs/pdf/documentacion.pdf`

**Método 2: Con wkhtmltopdf**

```powershell
# Instalar wkhtmltopdf desde:
# https://wkhtmltopdf.org/downloads.html

# Convertir a PDF
wkhtmltopdf docs/html/index.html docs/pdf/documentacion.pdf
```

### 4.5 Verificar Documentación

Comprueba que la documentación incluye:

- ✅ Todas las clases (Usuario)
- ✅ Todos los métodos públicos
- ✅ Todas las funciones (utilidades.php)
- ✅ Descripciones completas
- ✅ Parámetros y tipos de retorno
- ✅ Ejemplos de uso

---

## 5. CONTROL DE VERSIONES CON GIT

### 5.1 Configurar Git (Primera vez)

```powershell
# Configurar nombre de usuario
git config --global user.name "Juan José Acebedo López"

# Configurar email
git config --global user.email "jjal@ejemplo.com"

# Verificar configuración
git config --list
```

### 5.2 Inicializar Repositorio

```powershell
# Desde la raíz del proyecto
cd C:\xampp\htdocs\proyecto-php-jjal

# Inicializar repositorio Git
git init

# Verificar estado
git status
```

### 5.3 Crear Commits (Mínimo 3)

#### **Commit 1: Estructura inicial**

```powershell
# Añadir archivos básicos
git add src/usuario.php src/utilidades.php index.php
git add README.md .gitignore

# Crear commit
git commit -m "feat: Estructura inicial del proyecto con clases Usuario y utilidades"
```

#### **Commit 2: Configuración y documentación**

```powershell
# Añadir configuración
git add phpdoc.xml composer.json DATABASE.sql
git add DOCUMENTACION_PHPDOCUMENTOR.md

# Crear commit
git commit -m "docs: Añadir configuración phpDocumentor y documentación del proyecto"
```

#### **Commit 3: Integración continua**

```powershell
# Añadir GitHub Actions
git add .github/workflows/ci.yml
git add INSTALACION_Y_USO.md

# Crear commit
git commit -m "ci: Configurar GitHub Actions para verificación PHP y generación de docs"
```

### 5.4 Crear Repositorio en GitHub

1. Ir a [GitHub](https://github.com)
2. Hacer clic en **New repository**
3. Configurar:
   - **Nombre:** `proyecto-php-jjal`
   - **Descripción:** "Proyecto PHP con documentación para DAW - RA6"
   - **Visibilidad:** Privado (recomendado) o Público
   - **NO** inicializar con README (ya lo tenemos)
4. Hacer clic en **Create repository**

### 5.5 Subir a GitHub

```powershell
# Añadir repositorio remoto (cambiar TU_USUARIO)
git remote add origin https://github.com/TU_USUARIO/proyecto-php-jjal.git

# Renombrar rama a main
git branch -M main

# Subir código
git push -u origin main

# Verificar en GitHub que se subió correctamente
```

### 5.6 Verificar Historial

```powershell
# Ver historial de commits
git log --oneline

# Ver cambios de un commit específico
git show <commit-hash>

# Ver gráfico de ramas
git log --oneline --graph --all
```

---

## 6. INTEGRACIÓN CONTINUA

### 6.1 Configurar GitHub Actions

El archivo `.github/workflows/ci.yml` ya está creado. Verifica que contiene:

- ✅ Verificación de sintaxis PHP
- ✅ Generación automática de documentación
- ✅ Tests básicos
- ✅ Reporte final

### 6.2 Activar GitHub Actions

1. Ve a tu repositorio en GitHub
2. Hacer clic en pestaña **Actions**
3. Si está desactivado, hacer clic en **I understand my workflows, go ahead and enable them**

### 6.3 Ejecutar Workflow

**Automático:** Se ejecuta al hacer `git push`

**Manual:**

1. Ir a **Actions** en GitHub
2. Seleccionar workflow **CI/CD - Verificación PHP y Documentación**
3. Hacer clic en **Run workflow**
4. Seleccionar rama `main`
5. Hacer clic en **Run workflow**

### 6.4 Ver Resultados

1. En pestaña **Actions**, ver ejecución en progreso
2. Hacer clic en la ejecución para ver detalles
3. Ver logs de cada job:
   - ✅ Verificación de Sintaxis PHP
   - ✅ Generar Documentación
   - ✅ Calidad de Código
   - ✅ Reporte Final

### 6.5 Descargar Documentación Generada

1. En la ejecución del workflow
2. Scroll hasta **Artifacts**
3. Descargar **documentacion-html**
4. Descomprimir y abrir `index.html`

---

## 7. SOLUCIÓN DE PROBLEMAS

### 7.1 Error: "No se puede conectar a la base de datos"

**Causa:** MySQL no está corriendo o credenciales incorrectas

**Solución:**

```powershell
# Verificar que MySQL está corriendo
net start | findstr mysql

# Si no está corriendo, iniciarlo
net start mysql

# O desde XAMPP Control Panel
# Hacer clic en Start en MySQL
```

### 7.2 Error: "Email ya registrado"

**Causa:** Estás intentando registrar un email que ya existe

**Solución:**

```sql
-- Ver usuarios existentes
mysql -u root -p -e "SELECT * FROM proyecto_php_jjal.usuarios"

-- Eliminar usuario duplicado (opcional)
mysql -u root -p -e "DELETE FROM proyecto_php_jjal.usuarios WHERE email='email@ejemplo.com'"
```

### 7.3 Error: "Call to undefined function mysqli_connect()"

**Causa:** Extensión mysqli no está habilitada

**Solución:**

```powershell
# Editar php.ini
# Buscar: ;extension=mysqli
# Cambiar a: extension=mysqli

# Reiniciar Apache
net stop apache2.4
net start apache2.4
```

### 7.4 Error al generar documentación: "No parsable files"

**Causa:** phpDocumentor no encuentra archivos PHP

**Solución:**

```powershell
# Verificar que estás en la raíz del proyecto
pwd

# Listar archivos PHP
Get-ChildItem -Recurse -Filter *.php

# Generar especificando directorios
.\vendor\bin\phpdoc -d src,. -t docs/html --ignore vendor/
```

### 7.5 Error: "Permission denied" al crear logs

**Causa:** Falta crear carpeta de logs o permisos incorrectos

**Solución:**

```powershell
# Crear carpeta logs
New-Item -ItemType Directory -Path logs -Force

# En Linux/Mac, dar permisos
chmod 755 logs
```

### 7.6 Página en blanco al acceder a index.php

**Causa:** Error de PHP no mostrado

**Solución:**

```powershell
# Activar mostrar errores temporalmente
# Editar index.php y añadir al inicio:
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>

# Ver logs de error de Apache
Get-Content C:\xampp\apache\logs\error.log -Tail 20
```

---

## 8. CHECKLIST DE ENTREGA

Antes de entregar, verifica:

### 8.1 Proyecto Funcionando

- [ ] La aplicación carga sin errores
- [ ] Se pueden registrar usuarios
- [ ] Los usuarios se muestran correctamente
- [ ] Las validaciones funcionan

### 8.2 Documentación

- [ ] Código documentado con PHPDoc
- [ ] Documentación HTML generada
- [ ] Documentación PDF generada
- [ ] README.md completo

### 8.3 Git y GitHub

- [ ] Repositorio creado en GitHub
- [ ] Mínimo 3 commits descriptivos
- [ ] .gitignore configurado
- [ ] No hay contraseñas en el código

### 8.4 Integración Continua

- [ ] GitHub Actions configurado
- [ ] Workflow ejecutándose correctamente
- [ ] Sintaxis PHP verificada automáticamente

### 8.5 Entregables

- [ ] Enlace al repositorio de GitHub
- [ ] Documentación generada (HTML y PDF)
- [ ] README.md completo
- [ ] Archivo .github/workflows/ci.yml

---

## 9. PASOS PARA LA ENTREGA

1. **Verificar que todo funciona:**
   ```powershell
   # Probar aplicación
   php -S localhost:8000
   # Abrir http://localhost:8000
   ```

2. **Generar documentación final:**
   ```powershell
   .\vendor\bin\phpdoc -c phpdoc.xml
   ```

3. **Crear commits finales:**
   ```powershell
   git add .
   git commit -m "docs: Documentación final del proyecto"
   git push origin main
   ```

4. **Verificar en GitHub:**
   - [ ] Todos los archivos están subidos
   - [ ] GitHub Actions pasó exitosamente
   - [ ] README se ve correctamente

5. **Preparar entrega:**
   - Copiar enlace del repositorio
   - Descargar documentación HTML (comprimida)
   - Convertir documentación a PDF
   - Completar formulario de entrega

6. **Enlace de ejemplo para entregar:**
   ```
   https://github.com/TU_USUARIO/proyecto-php-jjal
   ```

---

## 10. RECURSOS ADICIONALES

### 10.1 Documentación

- PHP Manual: https://www.php.net/manual/es/
- MySQL Documentation: https://dev.mysql.com/doc/
- phpDocumentor: https://phpdoc.org/
- GitHub Actions: https://docs.github.com/actions

### 10.2 Tutoriales

- Git Basics: https://git-scm.com/book/es/v2
- PHP The Right Way: https://phptherightway.com/
- Markdown Guide: https://www.markdownguide.org/

### 10.3 Herramientas

- XAMPP: https://www.apachefriends.org/
- Composer: https://getcomposer.org/
- Git for Windows: https://git-scm.com/download/win
- Visual Studio Code: https://code.visualstudio.com/

---

## 📞 SOPORTE

Si tienes problemas:

1. **Revisar logs:**
   ```powershell
   # Logs de la aplicación
   Get-Content logs/app.log

   # Logs de Apache
   Get-Content C:\xampp\apache\logs\error.log -Tail 50

   # Logs de MySQL
   Get-Content C:\xampp\mysql\data\*.err -Tail 50
   ```

2. **Verificar sintaxis:**
   ```powershell
   php -l index.php
   php -l src/usuario.php
   php -l src/utilidades.php
   ```

3. **Consultar documentación generada**

4. **Revisar este archivo de instalación**

---

**¡Éxito con el proyecto! 🚀**

---

© 2026 Juan José Acebedo López (jjal)  
Módulo 0614 - Despliegue de aplicaciones web  
Centro: Getafe
