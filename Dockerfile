# Usar imagen base de PHP 8.1
FROM php:8.1-cli

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    graphviz \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Descargar phpDocumentor PHAR (versión estable oficial)
RUN wget https://phpdoc.org/phpDocumentor.phar -O /usr/local/bin/phpdoc \
    && chmod +x /usr/local/bin/phpdoc

# Comando por defecto: bash shell
CMD ["/bin/bash"]
