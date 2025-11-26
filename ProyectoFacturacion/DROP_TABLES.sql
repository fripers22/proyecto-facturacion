-- Script para eliminar todas las tablas y dejar que Hibernate las cree correctamente
-- Ejecutar en HeidiSQL en la base de datos proyecto_facturacion_db

USE proyecto_facturacion_db;

-- Deshabilitar verificación de claves foráneas temporalmente
SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar todas las tablas
DROP TABLE IF EXISTS facturas_detalle;
DROP TABLE IF EXISTS facturas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS usuarios_roles;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS roles;

-- Habilitar verificación de claves foráneas nuevamente
SET FOREIGN_KEY_CHECKS = 1;

-- Verificar que todas las tablas fueron eliminadas
SHOW TABLES;
