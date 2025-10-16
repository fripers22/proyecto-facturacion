# 🧾 Proyecto Corte 2 - Sistema de Gestión de Proveedores y Usuarios

Aplicación web desarrollada en **Spring Boot** con **Thymeleaf** y **MySQL**, correspondiente al segundo corte académico de la asignatura **Programación en Java**.  
El proyecto implementa una arquitectura MVC (Modelo - Vista - Controlador) para gestionar **Usuarios**, **Proveedores** y **Productos**, utilizando vistas dinámicas en HTML con integración a base de datos.

---

## 🎯 OBJETIVO GENERAL
Desarrollar una aplicación web funcional que permita gestionar la información de **proveedores**, **usuarios** y **productos**, aplicando los conceptos de programación orientada a objetos, manejo de bases de datos y desarrollo de aplicaciones con Spring Boot.

---

## 🎯 OBJETIVOS ESPECÍFICOS
- Implementar el patrón de diseño **MVC** utilizando el framework **Spring Boot**.  
- Aplicar la arquitectura de capas (modelo, servicio, repositorio, controlador, vista).  
- Crear una base de datos relacional en **MySQL** con las entidades del sistema.  
- Desarrollar formularios dinámicos con **Thymeleaf** para el registro, edición y eliminación de datos.  
- Utilizar **Bootstrap 5** para el diseño responsivo y visual atractivo de las vistas.  

---

## 🧩 FUNCIONALIDADES PRINCIPALES
✅ CRUD de **Usuarios** (crear, listar, editar, eliminar)   
✅ Navegación mediante menú principal e integración con `iframe`  
✅ Validación de formularios y redirección con Thymeleaf  
✅ Conexión a base de datos MySQL  

---

## 🧱 ESTRUCTURA DEL PROYECTO

```ProyectoCorte2/
├─ src/
│ ├─ main/
│ │ ├─ java/uts/edu/java/corte2/
│ │ │ ├─ controlador/ # Controladores del sistema
│ │ │ ├─ modelo/ # Entidades JPA
│ │ │ ├─ repositorio/ # Repositorios que extienden JpaRepository
│ │ │ └─ servicio/ # Lógica de negocio y métodos CRUD
│ │ └─ resources/
│ │ ├─ static/ # Archivos estáticos (CSS, JS, imágenes)
│ │ └─ templates/ # Vistas HTML con Thymeleaf
│ └─ test/
├─ pom.xml # Dependencias del proyecto
├─ README.md
└─ .gitignore
```



## 🗄️ MODELO DE BASE DE DATOS
La base de datos se implementó en **MySQL**, con las siguientes tablas:

- `usuarios`
- `proveedores`
- `productos`

> 📈 **DER - Diagrama Entidad Relación**
>
> ![Diagrama DER](img/diagrama_der.png)

---

## ⚙️ HERRAMIENTAS Y TECNOLOGÍAS
| Herramienta | Descripción |
|--------------|-------------|
| **Java 17** | Lenguaje de programación principal |
| **Spring Boot 3.x** | Framework para desarrollo backend |
| **Thymeleaf** | Motor de plantillas para las vistas |
| **MySQL / HeidiSQL** | Base de datos relacional |
| **Bootstrap 5.1** | Diseño responsivo y componentes visuales |
| **Maven** | Gestión de dependencias |
| **VS Code / IntelliJ IDEA** | Entorno de desarrollo integrado |


## 📂  CAPAS DEL PROYECTO

| Capa                            | Descripción                                                                       |
| ------------------------------- | --------------------------------------------------------------------------------- |
| **Modelo (`modelo`)**           | Contiene las clases entidad que representan las tablas de la base de datos.       |
| **Repositorio (`repositorio`)** | Interfaces que heredan de `JpaRepository` para las operaciones CRUD.              |
| **Servicio (`servicio`)**       | Contiene la lógica de negocio que conecta los repositorios con los controladores. |
| **Controlador (`controlador`)** | Gestiona las peticiones HTTP y comunica las vistas con el backend.                |
| **Vista (`templates`)**         | Archivos HTML con etiquetas Thymeleaf para mostrar y editar la información.       |

🧑‍💻 AUTOR

Nombre: Cristian David Cardenas Garcia
Programa: Tecnología en Desarrollo de Sistemas Informáticos
Institución: Unidades Tecnológicas de Santander – UTS
Docente: Carlos Adolfo Beltrán Castro
Fecha: 15 de Octubre 2025
