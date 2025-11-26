-- Script de datos de prueba para proyecto_facturacion_db
-- Ejecutar después de que Hibernate haya creado las tablas

USE proyecto_facturacion_db;

-- Insertar productos de ejemplo
INSERT INTO productos (codigo, nombre, precio, stock) VALUES
('PROD001', 'Laptop Dell Inspiron 15', 1200.00, 15),
('PROD002', 'Mouse Logitech MX Master', 89.99, 50),
('PROD003', 'Teclado Mecánico Corsair', 149.99, 30),
('PROD004', 'Monitor LG 27 pulgadas', 299.99, 20),
('PROD005', 'Auriculares Sony WH-1000XM4', 349.99, 8),
('PROD006', 'Webcam Logitech C920', 79.99, 25),
('PROD007', 'Disco Duro Externo 2TB', 89.99, 40),
('PROD008', 'Memoria RAM DDR4 16GB', 129.99, 60),
('PROD009', 'SSD Samsung 1TB', 169.99, 35),
('PROD010', 'Impresora HP LaserJet', 299.99, 12);

-- Insertar facturas de ejemplo
INSERT INTO facturas (numero, cliente, fecha, total) VALUES
('FAC-2024-001', 'Juan Pérez', '2024-01-15', 1289.99),
('FAC-2024-002', 'María García', '2024-01-20', 579.97),
('FAC-2024-003', 'Carlos López', '2024-02-05', 299.99),
('FAC-2024-004', 'Ana Martínez', '2024-02-10', 1549.98),
('FAC-2024-005', 'Luis Rodríguez', '2024-03-01', 349.99);

-- Insertar detalles de facturas
-- Factura 1: Laptop + Mouse
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precioUnitario, subtotal) VALUES
(1, 1, 1, 1200.00, 1200.00),
(1, 2, 1, 89.99, 89.99);

-- Factura 2: Teclado + Webcam + Disco Duro
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precioUnitario, subtotal) VALUES
(2, 3, 1, 149.99, 149.99),
(2, 6, 1, 79.99, 79.99),
(2, 7, 4, 89.99, 359.96);

-- Factura 3: Monitor
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precioUnitario, subtotal) VALUES
(3, 4, 1, 299.99, 299.99);

-- Factura 4: Laptop + Auriculares
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precioUnitario, subtotal) VALUES
(4, 1, 1, 1200.00, 1200.00),
(4, 5, 1, 349.99, 349.99);

-- Factura 5: Auriculares
INSERT INTO facturas_detalle (factura_id, producto_id, cantidad, precioUnitario, subtotal) VALUES
(5, 5, 1, 349.99, 349.99);

-- Verificar datos insertados
SELECT 'Productos insertados:' AS Resultado, COUNT(*) AS Cantidad FROM productos
UNION ALL
SELECT 'Facturas insertadas:', COUNT(*) FROM facturas
UNION ALL
SELECT 'Detalles de facturas:', COUNT(*) FROM facturas_detalle;
