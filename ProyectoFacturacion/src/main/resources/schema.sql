-- Script SQL para inicializar la base de datos del sistema de login
-- Base de datos: proyecto_facturacion_db

-- Crear tabla de roles
CREATE TABLE IF NOT EXISTS roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    INDEX idx_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cedula VARCHAR(20),
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    INDEX idx_username (username),
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla intermedia usuarios_roles
CREATE TABLE IF NOT EXISTS usuarios_roles (
    usuario_id BIGINT NOT NULL,
    rol_id BIGINT NOT NULL,
    PRIMARY KEY (usuario_id, rol_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertar roles por defecto
INSERT INTO roles (nombre) VALUES ('ROLE_USER') ON DUPLICATE KEY UPDATE nombre=nombre;
INSERT INTO roles (nombre) VALUES ('ROLE_ADMIN') ON DUPLICATE KEY UPDATE nombre=nombre;

-- Insertar usuario administrador por defecto
-- Usuario: admin, Contraseña: admin123 (cifrada con BCrypt)
INSERT INTO usuarios (username, password, email, nombre, apellido, enabled) 
VALUES ('admin', '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQubh4a', 'admin@facturacion.com', 'Administrador', 'Sistema', true)
ON DUPLICATE KEY UPDATE username=username;

-- Asignar rol ADMIN al usuario admin
INSERT INTO usuarios_roles (usuario_id, rol_id)
SELECT u.id, r.id FROM usuarios u, roles r 
WHERE u.username = 'admin' AND r.nombre = 'ROLE_ADMIN'
ON DUPLICATE KEY UPDATE usuario_id=usuario_id;

-- Insertar usuario normal de prueba
-- Usuario: user, Contraseña: user123 (cifrada con BCrypt)
INSERT INTO usuarios (username, password, email, nombre, apellido, enabled) 
VALUES ('user', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'user@facturacion.com', 'Usuario', 'Prueba', true)
ON DUPLICATE KEY UPDATE username=username;

-- Asignar rol USER al usuario user
INSERT INTO usuarios_roles (usuario_id, rol_id)
SELECT u.id, r.id FROM usuarios u, roles r 
WHERE u.username = 'user' AND r.nombre = 'ROLE_USER'
ON DUPLICATE KEY UPDATE usuario_id=usuario_id;
