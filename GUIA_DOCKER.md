# 🐳 GUÍA RÁPIDA - Docker para phpDocumentor

**Proyecto:** Aplicación PHP Documentada  
**Autor:** Juan José Acebedo López (jjal)  
**Contenedor:** phpdocumentor-jjal

---

## ⚡ INICIO RÁPIDO

### 1. Generar Documentación (Forma más fácil)

```bash
# Windows
.\generar-docs-docker.bat

# Linux/Mac
chmod +x generar-docs-docker.sh
./generar-docs-docker.sh
```

### 2. Ver Documentación

Abrir en navegador: `docs/html/index.html`

---

## 🐳 COMANDOS DOCKER

### Usando Docker Compose (Recomendado)

```bash
# Generar documentación
docker-compose up phpdocumentor-jjal

# Solo ejecutar (si ya está construido)
docker-compose run --rm phpdocumentor-jjal
```

### Usando Docker Manual

```bash
# 1. Construir imagen
docker build -t phpdocumentor-jjal .

# 2. Generar documentación
docker run --rm -v ${PWD}:/app phpdocumentor-jjal

# Windows PowerShell
docker run --rm -v ${PWD}:/app phpdocumentor-jjal

# Windows CMD
docker run --rm -v %CD%:/app phpdocumentor-jjal
```

---

## 📁 ARCHIVOS DOCKER DEL PROYECTO

### Dockerfile

```dockerfile
FROM php:8.1-cli
WORKDIR /app
# Instalar dependencias
RUN apt-get update && apt-get install -y git unzip curl graphviz
# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# Copiar proyecto
COPY . /app
# Instalar phpDocumentor
RUN composer require --dev phpdocumentor/phpdocumentor
# Crear directorio docs
RUN mkdir -p /app/docs/html
# Comando por defecto
CMD ["./vendor/bin/phpdoc", "-d", ".", "-t", "docs/html", "--template", "clean", "--ignore", "vendor/,docs/"]
```

### docker-compose.yml

```yaml
version: '3.8'
services:
  phpdocumentor-jjal:
    container_name: phpdocumentor-jjal
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - .:/app
      - ./docs:/app/docs
    command: ./vendor/bin/phpdoc -d . -t docs/html --template clean --ignore vendor/,docs/
```

---

## 🔧 CONFIGURACIÓN

### phpdoc.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<phpdocumentor>
    <title>Proyecto PHP - Documentación JJAL</title>
    <files>
        <directory>src</directory>
        <file>index.php</file>
        <ignore>vendor/*</ignore>
        <ignore>docs/*</ignore>
    </files>
    <transformations>
        <template name="clean"/>
    </transformations>
</phpdocumentor>
```

---

## 🎯 ¿POR QUÉ DOCKER?

### Problemas sin Docker

❌ **Errores de dependencias** de phpDocumentor  
❌ **Versiones incompatibles** de PHP  
❌ **Conflictos con extensiones**  
❌ **Diferente comportamiento** en cada máquina

### Solución con Docker

✅ **Entorno aislado** - No afecta tu sistema  
✅ **Siempre funciona** - Mismo resultado en cualquier PC  
✅ **Sin instalaciones complejas** - Todo en el contenedor  
✅ **Reproducible** - Mismo setup para todos

---

## 🚀 FLUJO DE TRABAJO

```
1. Modificar código PHP
   ↓
2. Ejecutar: generar-docs-docker.bat
   ↓
3. Docker construye imagen (solo primera vez)
   ↓
4. Docker ejecuta phpDocumentor
   ↓
5. Documentación generada en docs/html/
   ↓
6. Abrir docs/html/index.html
```

---

## 🛠️ SOLUCIÓN DE PROBLEMAS

### Error: "Docker no encontrado"

```bash
# Instalar Docker Desktop
# https://www.docker.com/products/docker-desktop

# Verificar instalación
docker --version
docker-compose --version
```

### Error: "Permisos denegados"

```bash
# Windows: Compartir unidad en Docker Desktop
# Settings → Resources → File Sharing → Añadir C:\

# Linux: Añadir usuario a grupo docker
sudo usermod -aG docker $USER
# Reiniciar sesión
```

### Error: "No such file or directory"

```bash
# Verificar que estás en la carpeta del proyecto
pwd  # o cd en Windows

# Debe mostrar:
# C:\Users\jjace\Desktop\dev\Ra6_depliegue
```

### Reconstruir imagen (si algo falla)

```bash
# Eliminar imagen antigua
docker rmi phpdocumentor-jjal

# Reconstruir sin caché
docker build --no-cache -t phpdocumentor-jjal .

# O con docker-compose
docker-compose build --no-cache
```

### Limpiar todo Docker

```bash
# Detener todos los contenedores
docker stop $(docker ps -a -q)

# Eliminar contenedores
docker rm phpdocumentor-jjal

# Eliminar imagen
docker rmi phpdocumentor-jjal

# Limpiar sistema Docker
docker system prune -a
```

---

## 📊 VERIFICACIONES

### Verificar que Docker funciona

```bash
# Test básico
docker run hello-world

# Listar imágenes
docker images

# Listar contenedores
docker ps -a
```

### Verificar documentación generada

```bash
# Windows
dir docs\html

# Linux/Mac
ls -la docs/html

# Debe contener:
# - index.html
# - css/
# - js/
# - files/
# - classes/
```

---

## 💾 COMANDOS ÚTILES

```bash
# Ver logs del contenedor
docker logs phpdocumentor-jjal

# Entrar al contenedor (debug)
docker run -it --rm phpdocumentor-jjal /bin/bash

# Ver contenido del contenedor
docker exec -it phpdocumentor-jjal ls -la /app

# Copiar archivos desde contenedor
docker cp phpdocumentor-jjal:/app/docs ./docs-backup
```

---

## 📝 CHECKLIST PRE-ENTREGA

Antes de entregar, verificar:

- [ ] Docker Desktop instalado y corriendo
- [ ] Imagen `phpdocumentor-jjal` construida
- [ ] Documentación generada en `docs/html/`
- [ ] `docs/html/index.html` se abre correctamente
- [ ] Dockerfile presente en el proyecto
- [ ] docker-compose.yml presente
- [ ] README.md menciona uso de Docker
- [ ] .gitignore excluye `docs/` y `vendor/`

---

## 🎓 PARA EL PROFESOR

### Cómo evaluar este proyecto

```bash
# 1. Clonar repositorio
git clone https://github.com/USUARIO/proyecto-php-jjal.git
cd proyecto-php-jjal

# 2. Generar documentación con Docker
docker-compose up phpdocumentor-jjal
# O
.\generar-docs-docker.bat

# 3. Ver documentación
# Abrir docs/html/index.html

# 4. Verificar código
# Ver src/Usuario.php y src/utilidades.php
# Comprobar PHPDoc en todas las clases y funciones
```

### Qué evaluar

✅ **Dockerfile presente y funcional**  
✅ **docker-compose.yml configurado**  
✅ **Script de generación incluido**  
✅ **Documentación HTML generada correctamente**  
✅ **PHPDoc completo en todo el código**  
✅ **README documenta uso de Docker**

---

## 📖 RECURSOS

- **Docker Documentation:** https://docs.docker.com/
- **Docker Desktop:** https://www.docker.com/products/docker-desktop
- **phpDocumentor:** https://phpdoc.org/
- **Docker Hub PHP:** https://hub.docker.com/_/php

---

## 🎯 RESUMEN

**Contenedor:** `phpdocumentor-jjal`  
**Imagen base:** `php:8.1-cli`  
**Herramienta:** `phpDocumentor 3.4+`  
**Comando rápido:** `.\generar-docs-docker.bat`  
**Salida:** `docs/html/index.html`

---

© 2026 Juan José Acebedo López (jjal)  
Proyecto DAW - Módulo 0614
