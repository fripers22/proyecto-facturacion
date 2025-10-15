-- =================================================================
-- Título: Script para Proyecto de Facturación
-- Base de Datos: MySQL / MariaDB
-- Semestre: II Semestre 2025
-- Descripción: Creación de la estructura de la base de datos
-- y carga de datos inicial para el taller de panel administrativo.
-- =================================================================

-- -----------------------------------------------------
-- Creación y Selección de la Base de Datos
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS proyecto_facturacion_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE proyecto_facturacion_db;

-- -----------------------------------------------------
-- Tabla: usuarios
-- Descripción: Gestiona los usuarios del sistema (administradores, vendedores, clientes).
-- -----------------------------------------------------
DROP TABLE IF EXISTS facturas_detalle;
DROP TABLE IF EXISTS facturas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- En un proyecto real, la contraseña debería estar encriptada (hashed).
    rol VARCHAR(50) DEFAULT 'USUARIO'
);

-- -----------------------------------------------------
-- Tabla: productos
-- Descripción: Almacena los productos disponibles para la venta.
-- -----------------------------------------------------
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- -----------------------------------------------------
-- Tabla: facturas
-- Descripción: Almacena el encabezado de cada transacción de venta.
-- -----------------------------------------------------
CREATE TABLE facturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    fecha_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL -- Si se elimina un usuario, la factura no se pierde.
);

-- -----------------------------------------------------
-- Tabla: facturas_detalle
-- Descripción: Almacena los ítems (productos) de cada factura.
-- -----------------------------------------------------
CREATE TABLE facturas_detalle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    factura_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (factura_id) REFERENCES facturas(id) ON DELETE CASCADE, -- Si se borra una factura, se borran sus detalles.
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE SET NULL -- Si se borra un producto, el detalle no se pierde, pero pierde la referencia.
);

-- =================================================================
-- Inserción de Datos de Ejemplo
-- =================================================================

-- -----------------------------------------------------
-- Datos para la tabla: usuarios
-- -----------------------------------------------------
INSERT INTO usuarios (nombre, cedula, email, password, rol)
VALUES 
('Administrador Principal', '123456789', 'admin@proyecto.com', 'admin123', 'ADMIN'),
('Maria Rojas', '987654321', 'maria.r@example.com', 'pass123', 'USUARIO'),
('Carlos Perez', '112233445', 'carlos.p@example.com', 'pass456', 'USUARIO'),
('Ana Gomez', '556677889', 'ana.g@example.com', 'pass789', 'VENDEDOR'),
('Luis Fernandez', '998877665', 'luis.f@example.com', 'pass101', 'USUARIO'),
('Sofia Diaz', '443322110', 'sofia.d@example.com', 'pass112', 'VENDEDOR'),
('Jorge Mora', '667788990', 'jorge.m@example.com', 'pass131', 'USUARIO');

-- -----------------------------------------------------
-- Datos para la tabla: productos
-- -----------------------------------------------------
INSERT INTO productos (nombre, descripcion, precio, stock)
VALUES
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
INSERT INTO facturas (usuario_id, total) VALUES (2, 1651.98);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (1, 1, 1, 1500.00, 1500.00);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (1, 4, 2, 75.99, 151.98);

-- Factura 2 (Cliente: Carlos Perez)
INSERT INTO facturas (usuario_id, total) VALUES (3, 901.00);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (2, 2, 2, 450.50, 901.00);

-- Factura 3 (Vendedor: Ana Gomez)
INSERT INTO facturas (usuario_id, total) VALUES (4, 979.95);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (3, 3, 5, 120.00, 600.00);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (3, 4, 5, 75.99, 379.95);

-- Factura 4 (Cliente: Luis Fernandez)
INSERT INTO facturas (usuario_id, total) VALUES (5, 99.90);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (4, 5, 1, 99.90, 99.90);

-- Factura 5 (Vendedor: Sofia Diaz)
INSERT INTO facturas (usuario_id, total) VALUES (6, 1100.00);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (5, 6, 10, 110.00, 1100.00);

-- Factura 6 (Cliente: Jorge Mora)
INSERT INTO facturas (usuario_id, total) VALUES (7, 2070.50);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (6, 1, 1, 1500.00, 1500.00);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (6, 2, 1, 450.50, 450.50);
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (6, 3, 1, 120.00, 120.00);


-- Fin del Script
