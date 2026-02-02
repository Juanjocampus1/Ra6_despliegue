# HERRAMIENTAS DE DOCUMENTACIÓN EN PHP
## phpDocumentor - Guía Completa

---

**Proyecto:** Gestión de Usuarios PHP  
**Autor:** Juan José Acebedo López (jjal)  
**Módulo:** 0614 - Despliegue de aplicaciones web  
**Curso:** 2025-2026  
**Centro:** Getafe  
**Fecha:** 02 de febrero de 2026

---

## ÍNDICE

1. Introducción a la Documentación de Código
2. ¿Qué es phpDocumentor?
3. Características Principales
4. Ventajas de phpDocumentor
5. Comparativa con Otras Herramientas
6. Instalación y Configuración
7. Sintaxis PHPDoc
8. Etiquetas PHPDoc Principales
9. Ejemplos Prácticos
10. Generación de Documentación
11. Formatos de Salida
12. Buenas Prácticas
13. Conclusiones
14. Referencias

---

## 1. INTRODUCCIÓN A LA DOCUMENTACIÓN DE CÓDIGO

La documentación de código es un proceso fundamental en el desarrollo de software que consiste en crear descripciones claras y precisas del funcionamiento, propósito y uso de los componentes de un programa.

### ¿Por qué es importante documentar el código?

- **Mantenibilidad:** Facilita futuras modificaciones y correcciones
- **Colaboración:** Permite que otros desarrolladores comprendan el código rápidamente
- **Reutilización:** Documenta cómo usar funciones y clases en otros proyectos
- **Profesionalismo:** Demuestra buenas prácticas de desarrollo
- **Reducción de costos:** Ahorra tiempo en formación y onboarding

---

## 2. ¿QUÉ ES PHPDOCUMENTOR?

**phpDocumentor** es la herramienta estándar de facto para generar documentación automática a partir de código fuente PHP. Es un proyecto de código abierto que analiza el código PHP y sus comentarios especiales (DocBlocks) para crear documentación completa y profesional.

### Historia

- **Creación:** 2000, por Kellin, Joshua Eichorn y Gregory Beaver
- **Versión actual:** 3.x (2026)
- **Lenguaje:** PHP
- **Licencia:** MIT
- **Repositorio:** https://github.com/phpDocumentor/phpDocumentor

### ¿Qué hace phpDocumentor?

phpDocumentor analiza el código PHP y:

1. Lee los comentarios en formato PHPDoc (DocBlocks)
2. Examina la estructura del código (clases, funciones, propiedades)
3. Genera documentación en diferentes formatos (HTML, XML, PDF)
4. Crea índices, diagramas y referencias cruzadas

---

## 3. CARACTERÍSTICAS PRINCIPALES

### 3.1 Análisis Automático de Código

phpDocumentor examina automáticamente:

- **Clases y objetos:** Jerarquías, herencias, interfaces
- **Métodos y funciones:** Parámetros, tipos de retorno, excepciones
- **Propiedades y constantes:** Tipos, valores por defecto, visibilidad
- **Archivos y espacios de nombres:** Organización del proyecto

### 3.2 Soporte de DocBlocks

DocBlocks son comentarios especiales que comienzan con `/**` y contienen información estructurada usando etiquetas como `@param`, `@return`, `@author`, etc.

### 3.3 Generación Multi-formato

- **HTML:** Sitio web navegable e interactivo
- **XML:** Datos estructurados para procesamiento adicional
- **PDF:** Documentación imprimible (mediante conversión)
- **Markdown:** Formato de texto enriquecido

### 3.4 Plantillas Personalizables

- Plantillas predefinidas profesionales
- Posibilidad de crear plantillas personalizadas
- Temas adaptables a la identidad corporativa

### 3.5 Diagramas y Gráficos

- Diagramas de clases UML
- Gráficos de dependencias
- Mapas de herencia

---

## 4. VENTAJAS DE PHPDOCUMENTOR

### 4.1 Ventajas Técnicas

✅ **Automatización completa**
   - Genera documentación sin intervención manual
   - Actualización automática al modificar el código

✅ **Estándar de la industria**
   - Usado por frameworks principales (Symfony, Laravel)
   - Compatible con herramientas de desarrollo

✅ **Integración con IDEs**
   - PhpStorm, VS Code, NetBeans reconocen DocBlocks
   - Autocompletado mejorado
   - Hints de parámetros en tiempo real

✅ **Detección de errores**
   - Identifica inconsistencias en documentación
   - Alerta sobre parámetros no documentados
   - Valida tipos de datos

### 4.2 Ventajas de Desarrollo

✅ **Mejora la calidad del código**
   - Obliga a pensar en la interfaz pública
   - Fomenta la claridad y simplicidad

✅ **Facilita el trabajo en equipo**
   - Documentación estandarizada
   - Comprensión rápida del código ajeno

✅ **Reduce el tiempo de desarrollo**
   - Menos tiempo en explicaciones
   - Onboarding más rápido de nuevos desarrolladores

### 4.3 Ventajas de Negocio

✅ **Profesionalismo**
   - Demuestra madurez en el proceso de desarrollo
   - Cumple con estándares de calidad

✅ **Mantenimiento económico**
   - Reduce costos de mantenimiento a largo plazo
   - Facilita la transferencia de proyectos

---

## 5. COMPARATIVA CON OTRAS HERRAMIENTAS

### 5.1 phpDocumentor vs Doxygen

| Característica | phpDocumentor | Doxygen |
|---------------|---------------|---------|
| Especialización | Solo PHP | Multi-lenguaje |
| Facilidad de uso | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| Calidad HTML | Excelente | Buena |
| Diagramas UML | Sí | Sí (más completos) |
| Comunidad PHP | Muy activa | Moderada |

### 5.2 phpDocumentor vs ApiGen

| Característica | phpDocumentor | ApiGen |
|---------------|---------------|--------|
| Mantenimiento | Activo | Abandonado |
| Velocidad | Media | Rápida |
| Características | Completas | Básicas |
| Recomendación | ⭐⭐⭐⭐⭐ | ⭐⭐ |

### 5.3 phpDocumentor vs Sami

| Característica | phpDocumentor | Sami |
|---------------|---------------|------|
| Desarrollo | Activo | Discontinuado |
| Plantillas | Múltiples | Limitadas |
| PHP moderno | Sí (8.x) | Solo hasta 7.x |
| Mejor opción | ✅ phpDocumentor | ❌ |

**Conclusión:** phpDocumentor es la mejor opción actual para proyectos PHP.

---

## 6. INSTALACIÓN Y CONFIGURACIÓN

### 6.1 Requisitos del Sistema

- PHP >= 7.4 (recomendado 8.0+)
- Extensiones: json, iconv, mbstring, intl
- Composer (recomendado)
- 512 MB RAM mínimo

### 6.2 Instalación con Composer (Recomendado)

```bash
# Instalación como dependencia de desarrollo
composer require --dev phpdocumentor/phpdocumentor

# Verificar instalación
./vendor/bin/phpdoc --version
```

### 6.3 Instalación con PHAR

```bash
# Descargar PHAR
wget https://phpdoc.org/phpDocumentor.phar

# Dar permisos de ejecución
chmod +x phpDocumentor.phar

# Mover a directorio global (opcional)
sudo mv phpDocumentor.phar /usr/local/bin/phpdoc

# Verificar
phpdoc --version
```

### 6.4 Configuración Básica

Crear archivo `phpdoc.xml`:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<phpdocumentor>
    <title>Mi Proyecto PHP</title>
    <parser>
        <target>docs/api</target>
    </parser>
    <transformer>
        <target>docs/api</target>
    </transformer>
    <files>
        <directory>src</directory>
        <ignore>vendor/*</ignore>
    </files>
</phpdocumentor>
```

---

## 7. SINTAXIS PHPDOC

### 7.1 Estructura de un DocBlock

```php
/**
 * Descripción breve de una línea
 *
 * Descripción larga y detallada que puede
 * ocupar múltiples líneas y proporcionar
 * información adicional sobre el elemento.
 *
 * @etiqueta valor
 * @otraEtiqueta valor
 */
```

### 7.2 Componentes de un DocBlock

1. **Apertura:** `/**` (tres caracteres)
2. **Descripción breve:** Primera línea, resumen conciso
3. **Descripción larga:** Párrafos adicionales (opcional)
4. **Etiquetas:** Metadatos estructurados con `@`
5. **Cierre:** `*/`

### 7.3 Reglas de Formato

- Usar `/**` para inicio (no `/*`)
- Cada línea debe comenzar con `*`
- Dejar línea en blanco entre descripción y etiquetas
- Ordenar etiquetas lógicamente

---

## 8. ETIQUETAS PHPDOC PRINCIPALES

### 8.1 Etiquetas de Documentación

#### @param - Parámetros de función

```php
/**
 * @param string $nombre Nombre del usuario
 * @param int $edad Edad del usuario
 * @param bool $activo Si el usuario está activo
 */
function crearUsuario($nombre, $edad, $activo = true) { }
```

#### @return - Valor de retorno

```php
/**
 * @return bool True si tuvo éxito, false en caso contrario
 */
function guardar() { }
```

#### @var - Tipo de variable

```php
/**
 * @var string $nombre Nombre del usuario
 */
private $nombre;
```

#### @throws - Excepciones lanzadas

```php
/**
 * @throws InvalidArgumentException Si el email es inválido
 * @throws DatabaseException Si falla la conexión
 */
function validarEmail($email) { }
```

### 8.2 Etiquetas de Información

#### @author - Autor del código

```php
/**
 * @author Juan José Acebedo López <jjal@ejemplo.com>
 */
```

#### @version - Versión del componente

```php
/**
 * @version 1.0.0
 */
```

#### @since - Versión desde la que existe

```php
/**
 * @since 1.2.0
 */
```

#### @deprecated - Marca como obsoleto

```php
/**
 * @deprecated Usar nuevaFuncion() en su lugar
 */
function funcionAntigua() { }
```

### 8.3 Etiquetas de Relaciones

#### @see - Referencias relacionadas

```php
/**
 * @see Usuario::guardar() Para guardar el usuario
 */
```

#### @link - Enlaces externos

```php
/**
 * @link https://www.php.net/manual/es/
 */
```

#### @uses - Dependencias

```php
/**
 * @uses Database::connect()
 */
```

### 8.4 Etiquetas de Clasificación

#### @package - Paquete o módulo

```php
/**
 * @package ProyectoPHP\Usuarios
 */
```

#### @category - Categoría

```php
/**
 * @category Database
 */
```

---

## 9. EJEMPLOS PRÁCTICOS

### 9.1 Documentar una Función

```php
/**
 * Valida un correo electrónico
 *
 * Comprueba si una cadena de texto tiene un formato válido
 * de correo electrónico usando filter_var y FILTER_VALIDATE_EMAIL.
 *
 * @param string $email Dirección de correo electrónico a validar
 * @return bool True si el email es válido, false en caso contrario
 *
 * @example
 * if (validarEmail("usuario@ejemplo.com")) {
 *     echo "Email válido";
 * }
 *
 * @since 1.0.0
 * @author Juan José Acebedo López
 */
function validarEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}
```

### 9.2 Documentar una Clase

```php
/**
 * Clase Usuario
 *
 * Gestiona las operaciones CRUD relacionadas con usuarios
 * en la base de datos MySQL.
 *
 * Esta clase proporciona métodos para crear, leer, actualizar
 * y eliminar usuarios, así como validaciones y sanitización.
 *
 * @package ProyectoPHP
 * @author Juan José Acebedo López (jjal)
 * @version 1.0.0
 * @since 2026-02-02
 *
 * @property int $id Identificador único del usuario
 * @property string $nombre Nombre completo del usuario
 * @property string $email Correo electrónico del usuario
 */
class Usuario {
    // ... código de la clase
}
```

### 9.3 Documentar un Método

```php
/**
 * Guarda el usuario en la base de datos
 *
 * Inserta un nuevo registro de usuario en la tabla 'usuarios'
 * utilizando prepared statements para prevenir SQL injection.
 *
 * @return bool True si se guardó correctamente, false en caso contrario
 * @throws DatabaseException Si hay un error en la consulta SQL
 * @throws ValidationException Si los datos no son válidos
 *
 * @uses mysqli::prepare()
 * @uses mysqli::execute()
 *
 * @example
 * $usuario = new Usuario("Juan", "juan@ejemplo.com");
 * if ($usuario->guardar()) {
 *     echo "Usuario guardado con ID: " . $usuario->getId();
 * }
 */
public function guardar() {
    // ... código del método
}
```

### 9.4 Documentar un Archivo

```php
<?php
/**
 * Archivo de funciones de utilidad
 *
 * Este archivo contiene funciones auxiliares y de utilidad
 * para la aplicación web PHP, incluyendo validaciones,
 * sanitización, conexión a base de datos y formateo.
 *
 * @author Juan José Acebedo López (jjal)
 * @version 1.0.0
 * @package ProyectoPHP
 * @since 2026-02-02
 * @license MIT
 * @copyright 2026 Juan José Acebedo López
 */

// ... funciones
```

---

## 10. GENERACIÓN DE DOCUMENTACIÓN

### 10.1 Comando Básico

```bash
# Generar documentación del directorio actual
phpdoc -d . -t docs/html
```

### 10.2 Opciones de Línea de Comandos

```bash
# -d: directorio fuente
# -t: directorio destino
# --template: plantilla a usar
# --title: título de la documentación
# --ignore: archivos/carpetas a ignorar

phpdoc -d src/ \
       -t docs/api \
       --template clean \
       --title "Mi Proyecto" \
       --ignore vendor/,tests/
```

### 10.3 Usando Archivo de Configuración

```bash
# Usar phpdoc.xml
phpdoc -c phpdoc.xml

# Usar configuración custom
phpdoc -c mi-config.xml
```

### 10.4 Automatización

**Script Bash:**

```bash
#!/bin/bash
# generar-docs.sh

echo "Generando documentación PHP..."

# Limpiar documentación anterior
rm -rf docs/html

# Generar nueva documentación
phpdoc -d . -t docs/html --template clean --ignore vendor/

echo "✅ Documentación generada en docs/html/"
```

**Automatización con Composer:**

```json
{
  "scripts": {
    "docs": "phpdoc -c phpdoc.xml",
    "docs:clean": "rm -rf docs && phpdoc -c phpdoc.xml"
  }
}
```

Ejecutar:
```bash
composer docs
```

---

## 11. FORMATOS DE SALIDA

### 11.1 Formato HTML

**Ventajas:**
- Navegación interactiva
- Búsqueda integrada
- Enlaces entre elementos
- Responsive design

**Plantillas disponibles:**
- `clean` - Moderna y minimalista
- `default` - Clásica de phpDocumentor
- `responsive` - Adaptable a móviles

**Uso:**
```bash
phpdoc -d . -t docs/html --template clean
```

### 11.2 Formato XML

**Ventajas:**
- Procesamiento programático
- Integración con otras herramientas
- Datos estructurados

**Uso:**
```bash
phpdoc -d . -t docs/xml --template xml
```

### 11.3 Generación de PDF

phpDocumentor no genera PDF directamente. Proceso:

1. Generar HTML
2. Convertir a PDF con herramienta externa

**Método 1: wkhtmltopdf**

```bash
# Instalar wkhtmltopdf
sudo apt-get install wkhtmltopdf

# Generar HTML
phpdoc -d . -t docs/html --template clean

# Convertir a PDF
wkhtmltopdf docs/html/index.html docs/pdf/documentacion.pdf
```

**Método 2: Navegador (Chrome/Firefox)**

1. Abrir `docs/html/index.html`
2. Imprimir (Ctrl+P)
3. Seleccionar "Guardar como PDF"

### 11.4 Formato Markdown

Usando conversores como pandoc:

```bash
# Generar HTML primero
phpdoc -d . -t docs/html

# Convertir a Markdown
pandoc docs/html/index.html -o docs/DOCUMENTACION.md
```

---

## 12. BUENAS PRÁCTICAS

### 12.1 Documentación Efectiva

✅ **Ser Conciso pero Completo**
- Descripción breve clara y directa
- Descripción larga solo cuando añade valor

✅ **Usar Ejemplos**
- Incluir `@example` en funciones complejas
- Mostrar casos de uso reales

✅ **Mantener Actualizada**
- Actualizar DocBlocks al modificar código
- Revisar documentación en code reviews

✅ **Documentar lo Público**
- Priorizar métodos y propiedades públicas
- Clases e interfaces siempre documentadas

### 12.2 Convenciones de Escritura

✅ **Describir QUÉ hace, no CÓMO**
```php
// ❌ Malo
/** Usa filter_var para validar */

// ✅ Bueno
/** Valida que un email tenga formato correcto */
```

✅ **Usar Tercera Persona**
```php
// ❌ Malo
/** Guardo el usuario en la BD */

// ✅ Bueno
/** Guarda el usuario en la base de datos */
```

✅ **Ser Específico con Tipos**
```php
// ❌ Malo
/** @param mixed $data */

// ✅ Bueno
/** @param array<string, int> $data Array asociativo de nombres a IDs */
```

### 12.3 Organización del Proyecto

```
proyecto-php/
├── src/                # Código fuente
├── docs/               # Documentación generada
│   ├── html/          # Documentación HTML
│   └── pdf/           # Documentación PDF
├── phpdoc.xml         # Configuración phpDocumentor
└── README.md          # Guía del proyecto
```

### 12.4 Integración con CI/CD

Incluir generación de docs en pipeline:

```yaml
# .github/workflows/docs.yml
name: Generate Documentation

on: [push]

jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup PHP
        uses: shivammathur/setup-php@v2
      - name: Install phpDocumentor
        run: composer require --dev phpdocumentor/phpdocumentor
      - name: Generate docs
        run: ./vendor/bin/phpdoc -c phpdoc.xml
      - name: Upload docs
        uses: actions/upload-artifact@v2
        with:
          name: documentation
          path: docs/
```

---

## 13. CONCLUSIONES

### 13.1 Justificación del Uso de phpDocumentor

phpDocumentor es la herramienta elegida para este proyecto por las siguientes razones:

1. **Estándar de la Industria**
   - Ampliamente adoptado en la comunidad PHP
   - Compatible con PSR (PHP Standard Recommendations)
   - Reconocido por IDEs y herramientas de desarrollo

2. **Documentación Profesional**
   - Genera documentación de alta calidad
   - Múltiples formatos de salida (HTML, XML, PDF)
   - Plantillas modernas y personalizables

3. **Automatización Completa**
   - Integración fácil con flujos de CI/CD
   - Actualización automática de documentación
   - Detección de errores en documentación

4. **Mejora del Desarrollo**
   - Fomenta buenas prácticas de código
   - Facilita el trabajo en equipo
   - Reduce tiempo de onboarding

5. **Integración con Ecosistema PHP**
   - Compatible con Composer
   - Funciona con frameworks modernos
   - Soporte activo y comunidad grande

### 13.2 Beneficios para el Proyecto

En este proyecto específico, phpDocumentor aporta:

✅ **Claridad:** Documentación clara de la clase Usuario y funciones de utilidad
✅ **Mantenibilidad:** Fácil comprensión para futuro mantenimiento
✅ **Profesionalismo:** Cumple con estándares educativos y profesionales
✅ **Aprendizaje:** Demuestra competencias en documentación técnica
✅ **Evaluación:** Cumple todos los criterios de la rúbrica (CE 6a, 6b, 6c)

---

## 14. REFERENCIAS

### 14.1 Documentación Oficial

- **phpDocumentor:** https://phpdoc.org/
- **Guía de Documentación:** https://docs.phpdoc.org/
- **GitHub Repository:** https://github.com/phpDocumentor/phpDocumentor

### 14.2 Estándares PHP

- **PSR-5 (PHPDoc Standard):** https://github.com/php-fig/fig-standards/blob/master/proposed/phpdoc.md
- **PSR-12 (Coding Style):** https://www.php-fig.org/psr/psr-12/
- **PHP The Right Way:** https://phptherightway.com/

### 14.3 Herramientas Complementarias

- **Composer:** https://getcomposer.org/
- **PHP-FIG:** https://www.php-fig.org/
- **Packagist:** https://packagist.org/

### 14.4 Recursos Educativos

- **PHP Manual:** https://www.php.net/manual/es/
- **Laravel Documentation:** https://laravel.com/docs
- **Symfony Documentation:** https://symfony.com/doc

---

## APÉNDICES

### Apéndice A: Checklist de Documentación

- [ ] Todos los archivos PHP tienen DocBlock de archivo
- [ ] Todas las clases están documentadas
- [ ] Todos los métodos públicos tienen @param y @return
- [ ] Se incluyen @throws para excepciones
- [ ] Hay @example en funciones complejas
- [ ] Se especifican @author y @version
- [ ] No hay errores al generar documentación

### Apéndice B: Comandos Útiles

```bash
# Verificar sintaxis antes de documentar
find . -name "*.php" -exec php -l {} \;

# Generar documentación con verbose
phpdoc -d . -t docs -v

# Listar plantillas disponibles
phpdoc --list-templates

# Generar solo para archivos modificados
git diff --name-only | grep .php | xargs phpdoc -f
```

### Apéndice C: Solución de Problemas

**Error: "Fatal error: Out of memory"**
```bash
php -d memory_limit=512M vendor/bin/phpdoc -c phpdoc.xml
```

**Error: "No parsable files"**
- Verificar que hay archivos .php en el directorio
- Revisar configuración de rutas en phpdoc.xml
- Comprobar permisos de lectura

**Documentación vacía**
- Asegurar que existen DocBlocks
- Verificar sintaxis de DocBlocks
- Comprobar que no se ignoran archivos importantes

---

**FIN DEL DOCUMENTO**

---

© 2026 Juan José Acebedo López (jjal)  
Proyecto elaborado para el módulo 0614 - Despliegue de aplicaciones web  
Ciclo: Desarrollo de Aplicaciones Web (DAW)  
Centro: Getafe
