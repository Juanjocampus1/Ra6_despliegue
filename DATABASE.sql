-- ====================================================
-- Script de Creación de Base de Datos
-- Proyecto: Gestión de Usuarios PHP
-- Autor: Juan José Acebedo Lara (jjal)
-- Fecha: 02/02/2026
-- ====================================================

-- Crear base de datos si no existe
CREATE DATABASE IF NOT EXISTS proyecto_php_jjal
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Usar la base de datos
USE proyecto_php_jjal;

-- ====================================================
-- Tabla: usuarios
-- Descripción: Almacena la información de los usuarios
-- ====================================================

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del usuario',
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre completo del usuario',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Correo electrónico (único)',
    fecha_registro DATETIME NOT NULL COMMENT 'Fecha y hora de registro',
    INDEX idx_email (email) COMMENT 'Índice para búsquedas por email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Tabla de usuarios del sistema';

-- ====================================================
-- Datos de ejemplo (opcional)
-- ====================================================

-- Insertar usuarios de ejemplo para testing
INSERT INTO usuarios (nombre, email, fecha_registro) VALUES
    ('Juan José Acebedo Lara', 'jjal@ejemplo.com', NOW()),
    ('María García Fernández', 'maria.garcia@ejemplo.com', NOW()),
    ('Carlos Rodríguez Pérez', 'carlos.rodriguez@ejemplo.com', NOW())
ON DUPLICATE KEY UPDATE nombre=nombre; -- Evitar duplicados si ya existen

-- ====================================================
-- Verificación
-- ====================================================

-- Mostrar las tablas creadas
SHOW TABLES;

-- Describir la estructura de la tabla usuarios
DESCRIBE usuarios;

-- Mostrar los usuarios insertados
SELECT * FROM usuarios;

-- ====================================================
-- Información del script
-- ====================================================
SELECT 
    'Base de datos creada correctamente' AS Estado,
    DATABASE() AS BaseDatos,
    COUNT(*) AS UsuariosEjemplo
FROM usuarios;
