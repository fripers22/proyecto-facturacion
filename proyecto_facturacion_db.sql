-- =================================================================
-- Título: Script Completo para Proyecto de Facturación con Autenticación
-- Base de Datos: MySQL / MariaDB
-- Semestre: II Semestre 2025
-- Java: 21 LTS
-- Spring Boot: 3.4.0
-- Descripción: Creación de la estructura completa de la base de datos
-- con sistema de login (Spring Security) y módulo de facturación.
-- =================================================================

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- -----------------------------------------------------
-- Creación y Selección de la Base de Datos
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `proyecto_facturacion_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `proyecto_facturacion_db`;

-- -----------------------------------------------------
-- Eliminación de tablas en orden correcto (respetando FK)
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facturas_detalle`;
DROP TABLE IF EXISTS `facturas`;
DROP TABLE IF EXISTS `productos`;
DROP TABLE IF EXISTS `usuarios_roles`;
DROP TABLE IF EXISTS `usuarios`;
DROP TABLE IF EXISTS `roles`;

-- =================================================================
-- MÓDULO DE AUTENTICACIÓN (Spring Security)
-- =================================================================

-- -----------------------------------------------------
-- Tabla: roles
-- Descripción: Roles del sistema para control de acceso
-- -----------------------------------------------------
CREATE TABLE `roles` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (`id`),
    INDEX `idx_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Tabla: usuarios
-- Descripción: Usuarios del sistema con autenticación Spring Security
-- -----------------------------------------------------
CREATE TABLE `usuarios` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `nombre` VARCHAR(100) NOT NULL,
    `apellido` VARCHAR(100) NOT NULL,
    `cedula` VARCHAR(20) DEFAULT NULL,
    `enabled` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`),
    INDEX `idx_username` (`username`),
    INDEX `idx_email` (`email`),
    INDEX `idx_cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Tabla: usuarios_roles
-- Descripción: Tabla intermedia para relación muchos a muchos
-- -----------------------------------------------------
CREATE TABLE `usuarios_roles` (
    `usuario_id` BIGINT NOT NULL,
    `rol_id` BIGINT NOT NULL,
    PRIMARY KEY (`usuario_id`, `rol_id`),
    CONSTRAINT `fk_usuarios_roles_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_usuarios_roles_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =================================================================
-- MÓDULO DE FACTURACIÓN
-- =================================================================

-- -----------------------------------------------------
-- Tabla: productos
-- Descripción: Almacena los productos disponibles para la venta
-- -----------------------------------------------------
CREATE TABLE `productos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(150) NOT NULL,
    `descripcion` TEXT,
    `precio` DECIMAL(10, 2) NOT NULL,
    `stock` INT NOT NULL,
    INDEX `idx_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Tabla: facturas
-- Descripción: Almacena el encabezado de cada transacción de venta
-- -----------------------------------------------------
CREATE TABLE `facturas` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `usuario_id` BIGINT,
    `fecha_emision` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `total` DECIMAL(12, 2) NOT NULL,
    CONSTRAINT `fk_facturas_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
    INDEX `idx_usuario_id` (`usuario_id`),
    INDEX `idx_fecha_emision` (`fecha_emision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Tabla: facturas_detalle
-- Descripción: Almacena los ítems (productos) de cada factura
-- -----------------------------------------------------
CREATE TABLE `facturas_detalle` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `factura_id` INT,
    `producto_id` INT,
    `cantidad` INT NOT NULL,
    `precio_unitario` DECIMAL(10, 2) NOT NULL,
    `subtotal` DECIMAL(12, 2) NOT NULL,
    CONSTRAINT `fk_facturas_detalle_factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_facturas_detalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE SET NULL,
    INDEX `idx_factura_id` (`factura_id`),
    INDEX `idx_producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =================================================================
-- INSERCIÓN DE DATOS INICIALES
-- =================================================================

-- -----------------------------------------------------
-- Datos para la tabla: roles
-- -----------------------------------------------------
INSERT INTO `roles` (`nombre`) VALUES 
('ROLE_ADMIN'),
('ROLE_VENDEDOR'),
('ROLE_USER');

-- -----------------------------------------------------
-- Datos para la tabla: usuarios
-- Nota: Contraseñas encriptadas con BCrypt
-- admin / admin123
-- user / user123
-- Resto: password es igual al username
-- -----------------------------------------------------
INSERT INTO `usuarios` (`username`, `password`, `email`, `nombre`, `apellido`, `cedula`, `enabled`) VALUES 
('admin', '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQubh4a', 'admin@proyecto.com', 'Administrador', 'Principal', '123456789', 1),
('maria.r', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'maria.r@example.com', 'Maria', 'Rojas', '987654321', 1),
('carlos.p', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'carlos.p@example.com', 'Carlos', 'Perez', '112233445', 1),
('ana.g', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'ana.g@example.com', 'Ana', 'Gomez', '556677889', 1),
('luis.f', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'luis.f@example.com', 'Luis', 'Fernandez', '998877665', 1),
('sofia.d', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'sofia.d@example.com', 'Sofia', 'Diaz', '443322110', 1),
('jorge.m', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'jorge.m@example.com', 'Jorge', 'Mora', '667788990', 1);

-- -----------------------------------------------------
-- Datos para la tabla: usuarios_roles
-- -----------------------------------------------------
-- Asignar rol ADMIN al administrador
INSERT INTO `usuarios_roles` (`usuario_id`, `rol_id`) 
SELECT u.id, r.id FROM usuarios u, roles r 
WHERE u.username = 'admin' AND r.nombre = 'ROLE_ADMIN';

-- Asignar rol VENDEDOR a vendedores
INSERT INTO `usuarios_roles` (`usuario_id`, `rol_id`) 
SELECT u.id, r.id FROM usuarios u, roles r 
WHERE u.username IN ('ana.g', 'sofia.d') AND r.nombre = 'ROLE_VENDEDOR';

-- Asignar rol USER a usuarios normales
INSERT INTO `usuarios_roles` (`usuario_id`, `rol_id`) 
SELECT u.id, r.id FROM usuarios u, roles r 
WHERE u.username IN ('maria.r', 'carlos.p', 'luis.f', 'jorge.m') AND r.nombre = 'ROLE_USER';

-- -----------------------------------------------------
-- Datos para la tabla: productos
-- -----------------------------------------------------
INSERT INTO `productos` (`nombre`, `descripcion`, `precio`, `stock`) VALUES
('Laptop Pro 15"', 'Laptop de alto rendimiento con 16GB RAM y 512GB SSD.', 1500.00, 50),
('Monitor UltraWide 29"', 'Monitor curvo para una experiencia inmersiva.', 450.50, 120),
('Teclado Mecánico RGB', 'Teclado con switches mecánicos y retroiluminación RGB personalizable.', 120.00, 200),
('Mouse Inalámbrico Ergonómico', 'Mouse diseñado para la comodidad durante largas horas de uso.', 75.99, 300),
('Webcam HD 1080p', 'Cámara web de alta definición con micrófono incorporado.', 99.90, 150),
('Disco Duro SSD Externo 1TB', 'Unidad de estado sólido externa para almacenamiento rápido y portátil.', 110.00, 250),
('Impresora Multifuncional Wifi', 'Imprime, escanea y copia de forma inalámbrica.', 180.75, 80);

-- -----------------------------------------------------
-- Datos para la tabla: facturas y facturas_detalle
-- -----------------------------------------------------

-- Factura 1 (Cliente: Maria Rojas)
INSERT INTO `facturas` (`usuario_id`, `total`) VALUES (2, 1651.98);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (1, 1, 1, 1500.00, 1500.00);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (1, 4, 2, 75.99, 151.98);

-- Factura 2 (Cliente: Carlos Perez)
INSERT INTO `facturas` (`usuario_id`, `total`) VALUES (3, 901.00);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (2, 2, 2, 450.50, 901.00);

-- Factura 3 (Vendedor: Ana Gomez)
INSERT INTO `facturas` (`usuario_id`, `total`) VALUES (4, 979.95);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (3, 3, 5, 120.00, 600.00);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (3, 4, 5, 75.99, 379.95);

-- Factura 4 (Cliente: Luis Fernandez)
INSERT INTO `facturas` (`usuario_id`, `total`) VALUES (5, 99.90);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (4, 5, 1, 99.90, 99.90);

-- Factura 5 (Vendedor: Sofia Diaz)
INSERT INTO `facturas` (`usuario_id`, `total`) VALUES (6, 1100.00);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (5, 6, 10, 110.00, 1100.00);

-- Factura 6 (Cliente: Jorge Mora)
INSERT INTO `facturas` (`usuario_id`, `total`) VALUES (7, 2070.50);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (6, 1, 1, 1500.00, 1500.00);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (6, 2, 1, 450.50, 450.50);
INSERT INTO `facturas_detalle` (`factura_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (6, 3, 1, 120.00, 120.00);

-- =================================================================
-- Restaurar configuraciones
-- =================================================================
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- =================================================================
-- FIN DEL SCRIPT
-- =================================================================
-- Credenciales de prueba:
-- Admin:    admin / admin123
-- Usuario:  user / user123 (si se agregó)
-- Otros:    username igual a password (ejemplo: maria.r / maria.r)
-- =================================================================
