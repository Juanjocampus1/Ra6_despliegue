# 📋 Proyecto PHP - Aplicación Documentada con Docker

![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

**Autor:** Juan José Acebedo López (jjal)  
**Módulo:** 0614 - Despliegue de aplicaciones web  
**Curso:** 2025-2026 | **Centro:** Getafe

---

## 📖 Descripción

Aplicación web en PHP con documentación automática usando phpDocumentor en Docker. Demuestra:

✅ Documentación PHPDoc  
✅ phpDocumentor con Docker  
✅ Control de versiones (Git/GitHub)  
✅ Integración continua (GitHub Actions)

---

## 🗂️ Estructura

```
proyecto-php/
├── src/
│   ├── Usuario.php        # Clase Usuario documentada
│   └── utilidades.php     # Funciones auxiliares
├── docs/html/            # Documentación generada
├── .github/workflows/    # GitHub Actions CI/CD
├── index.php             # Aplicación principal
├── Dockerfile            # Docker para phpDocumentor
├── docker-compose.yml    # Docker Compose config
└── README.md
```

---

## 🚀 Instalación y Uso

### Ejecutar Aplicación

```bash
# Clonar repositorio
git clone https://github.com/TU_USUARIO/proyecto-php-jjal.git
cd proyecto-php-jjal

# Iniciar servidor PHP
php -S localhost:8000

# O usar script (Windows)
.\iniciar-servidor.bat
```

Abrir: `http://localhost:8000`

---

## 📚 Generar Documentación con Docker

### ¿Por qué Docker?

Docker proporciona un entorno aislado que evita problemas de dependencias de phpDocumentor.

### Método 1: Script Automatizado ⭐

```bash
# Windows
.\generar-docs-docker.bat

# Linux/Mac  
chmod +x generar-docs-docker.sh
./generar-docs-docker.sh
```

### Método 2: Docker Compose

```bash
docker-compose up phpdocumentor-jjal
```

### Método 3: Docker Manual

```bash
# Construir imagen
docker build -t phpdocumentor-jjal .

# Generar docs
docker run --rm -v ${PWD}:/app phpdocumentor-jjal
```

### Ver Documentación

Abrir: `docs/html/index.html`

---

## 🐳 Configuración Docker

### Contenedor: `phpdocumentor-jjal`

- **Imagen base:** php:8.1-cli
- **Incluye:** Composer, phpDocumentor, GraphViz
- **Volumen:** Sincroniza código y docs
- **Comando:** Genera documentación HTML

### Dockerfile

```dockerfile
FROM php:8.1-cli
WORKDIR /app
RUN apt-get update && apt-get install -y git unzip curl graphviz
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY . /app
RUN composer require --dev phpdocumentor/phpdocumentor
CMD ["./vendor/bin/phpdoc", "-d", ".", "-t", "docs/html", "--template", "clean"]
```

---

## 📖 Documentación del Código

### Clase Usuario

```php
/**
 * Clase Usuario
 * @package App
 * @author Juan José Acebedo López (jjal)
 */
class Usuario {
    /**
     * Constructor
     * @param string $nombre
     * @param string $apellidos
     * @param int $edad
     */
    public function __construct(string $nombre, string $apellidos, int $edad)
    
    /**
     * Devuelve el nombre completo
     * @return string
     */
    public function getNombreCompleto(): string
    
    /**
     * Devuelve la edad
     * @return int
     */
    public function getEdad(): int
}
```

Toda la documentación está en formato PHPDoc estándar.

---

## 🔐 Git y GitHub

### Inicializar Repositorio

```bash
git init
git config user.name "Juan José Acebedo López"
git config user.email "jjal@ejemplo.com"
```

### Commits Requeridos (Mínimo 3)

```bash
# Commit 1
git add src/ index.php
git commit -m "feat: Estructura inicial con clases documentadas PHPDoc"

# Commit 2
git add Dockerfile docker-compose.yml
git commit -m "feat: Configurar Docker para phpDocumentor"

# Commit 3
git add .github/workflows/
git commit -m "ci: Añadir GitHub Actions para CI/CD"

# Subir a GitHub
git remote add origin https://github.com/TU_USUARIO/proyecto-php-jjal.git
git branch -M main
git push -u origin main
```

### .gitignore

```gitignore
/vendor/
/docs/
*.log
.env
.DS_Store
```

---

## ⚙️ GitHub Actions (CI/CD)

Ver: `.github/workflows/ci.yml`

**Automatiza:**
1. ✅ Verificación sintaxis PHP
2. ✅ Generación documentación
3. ✅ Validación código
4. ✅ Publicación artefactos

**Trigger:** Push a `main` o Pull Requests

---

## 🧪 Testing

```bash
# Verificar sintaxis
php -l index.php
php -l src/Usuario.php
php -l src/utilidades.php

# Probar aplicación
php -S localhost:8000
```

---

## 🎯 Criterios de Evaluación Cumplidos

| Criterio | Descripción | Estado |
|----------|-------------|---------|
| CE 6a | Identificar herramientas documentación | ✅ phpDocumentor + Docker |
| CE 6b | Documentar componentes con PHPDoc | ✅ Completo |
| CE 6c | Usar diferentes formatos | ✅ HTML + PDF |
| CE 6d | Herramientas colaborativas | ✅ GitHub |
| CE 6e | Sistema control versiones | ✅ Git |
| CE 6f | Seguridad y accesibilidad | ✅ .gitignore |
| CE 6g | Documentar uso Git | ✅ README completo |
| CE 6h | Integración continua | ✅ GitHub Actions |

---

## 📦 Entregables

- [x] Enlace repositorio GitHub
- [x] Documentación HTML generada
- [x] Documentación PDF
- [x] README.md completo
- [x] Workflow GitHub Actions
- [x] Configuración Docker
- [x] Mínimo 3 commits

---

## 💡 Ventajas de Docker

✅ **Sin conflictos de dependencias**  
✅ **Entorno reproducible**  
✅ **Fácil de usar (un comando)**  
✅ **Funciona en cualquier OS**  
✅ **Aísla herramientas de desarrollo**

---

## 📝 Notas

### Solución de Problemas Docker

**Error: Docker no encontrado**
```bash
# Instalar Docker Desktop
# https://www.docker.com/products/docker-desktop
```

**Reconstruir imagen**
```bash
docker-compose build --no-cache
```

**Limpiar contenedores**
```bash
docker rm phpdocumentor-jjal
docker rmi phpdocumentor-jjal
```

---

## 👨‍💻 Autor

**Juan José Acebedo López (jjal)**  
GitHub: [@TU_USUARIO](https://github.com/TU_USUARIO)

---

## 📄 Licencia

MIT License - Ver archivo `LICENSE`

---

**Última actualización:** 02/02/2026  
**Estado:** ✅ Completo con Docker
