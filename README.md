# 🧾 Sistema de Facturación con Autenticación - Parcial Corte 2

Aplicación web empresarial desarrollada en **Spring Boot 3.4.0** con **Spring Security**, **Thymeleaf** y **MySQL/MariaDB**, correspondiente al segundo corte académico de la asignatura Programación en Java.

El proyecto implementa una arquitectura MVC (Modelo - Vista - Controlador) con **autenticación basada en roles** para gestionar Usuarios, Productos y Facturas, utilizando vistas dinámicas en HTML con navegación mediante iframe.

---

## 🎯 OBJETIVO GENERAL

Desarrollar una aplicación web empresarial que permita gestionar un sistema completo de facturación con control de acceso basado en roles, aplicando los conceptos de seguridad, programación orientada a objetos, manejo de bases de datos relacionales y desarrollo de aplicaciones con Spring Boot.

---

## 🎯 OBJETIVOS ESPECÍFICOS

- ✅ Implementar **Spring Security 6.4.1** con autenticación basada en formularios y encriptación BCrypt
- ✅ Aplicar el patrón de diseño **MVC** utilizando el framework Spring Boot 3.4.0
- ✅ Desarrollar la arquitectura de capas (modelo, repositorio, servicio, controlador, vista)
- ✅ Crear una base de datos relacional en MySQL con integridad referencial y llaves foráneas
- ✅ Implementar **CRUD completo** para Usuarios, Productos y Facturas
- ✅ Desarrollar sistema de facturación con cálculo automático de totales y gestión de detalles
- ✅ Crear formularios dinámicos con **Thymeleaf** para el registro, edición y eliminación de datos
- ✅ Utilizar **Bootstrap 5.3.0** para el diseño responsivo y visual profesional
- ✅ Implementar navegación dinámica mediante iframe para experiencia de usuario fluida

---

## 🧩 FUNCIONALIDADES PRINCIPALES

### 🔐 Sistema de Autenticación y Autorización
- ✅ Login con usuario y contraseña (encriptación BCrypt)
- ✅ Sistema de roles: `ROLE_ADMIN`, `ROLE_VENDEDOR`, `ROLE_USER`
- ✅ Protección de rutas con Spring Security
- ✅ Sesiones persistentes y control de acceso por rol
- ✅ Página de acceso denegado personalizada

### 👥 Gestión de Usuarios
- ✅ CRUD completo (crear, listar, editar, eliminar)
- ✅ Registro con validación de campos
- ✅ Asignación de roles múltiples por usuario
- ✅ Información completa: username, email, nombre, apellido, cédula

### 📦 Gestión de Productos
- ✅ CRUD completo de productos
- ✅ Control de inventario (stock)
- ✅ Precios con formato decimal
- ✅ Descripción detallada de productos
- ✅ Alertas visuales de stock bajo

### 🧾 Sistema de Facturación
- ✅ Creación de facturas con múltiples productos
- ✅ Cálculo automático de subtotales y totales
- ✅ Relación con usuario que genera la factura
- ✅ Registro de fecha y hora de emisión
- ✅ Vista detallada de facturas con desglose completo
- ✅ Actualización automática de stock al facturar

### 🎨 Interfaz de Usuario
- ✅ Navegación mediante menú principal con iframe integrado
- ✅ Diseño responsivo con Bootstrap 5.3.0
- ✅ Página de bienvenida personalizada
- ✅ Iconos de Bootstrap Icons
- ✅ Tablas interactivas con estilos hover
- ✅ Formularios con validación visual

---

## 🧱 ESTRUCTURA DEL PROYECTO

```
ProyectoFacturacion/
├─ src/
│  ├─ main/
│  │  ├─ java/uts/edu/java/facturacion/
│  │  │  ├─ config/
│  │  │  │  └─ SecurityConfig.java              # Configuración de Spring Security
│  │  │  ├─ controlador/
│  │  │  │  ├─ AppController.java               # Controlador principal
│  │  │  │  ├─ AuthControlador.java             # Controlador de autenticación
│  │  │  │  ├─ HomeControlador.java             # Controlador del home con iframe
│  │  │  │  ├─ UsuarioControlador.java          # CRUD de usuarios
│  │  │  │  ├─ ProductoControlador.java         # CRUD de productos
│  │  │  │  └─ FacturaControlador.java          # CRUD de facturas
│  │  │  ├─ dto/
│  │  │  │  └─ UsuarioRegistroDTO.java          # DTO para registro de usuarios
│  │  │  ├─ modelo/
│  │  │  │  ├─ Rol.java                         # Entidad Rol
│  │  │  │  ├─ Usuario.java                     # Entidad Usuario
│  │  │  │  ├─ Producto.java                    # Entidad Producto
│  │  │  │  ├─ Factura.java                     # Entidad Factura
│  │  │  │  └─ FacturaDetalle.java              # Entidad Detalle de Factura
│  │  │  ├─ repositorio/
│  │  │  │  ├─ RolRepositorio.java              # Repositorio JPA de Roles
│  │  │  │  ├─ UsuarioRepositorio.java          # Repositorio JPA de Usuarios
│  │  │  │  ├─ ProductoRepositorio.java         # Repositorio JPA de Productos
│  │  │  │  ├─ FacturaRepositorio.java          # Repositorio JPA de Facturas
│  │  │  │  └─ FacturaDetalleRepositorio.java   # Repositorio JPA de Detalles
│  │  │  ├─ servicio/
│  │  │  │  ├─ CustomUserDetailsService.java    # Servicio de autenticación
│  │  │  │  ├─ IUsuarioServicio.java            # Interfaz del servicio
│  │  │  │  ├─ ProductoServicio.java            # Lógica de negocio de productos
│  │  │  │  └─ FacturaServicio.java             # Lógica de negocio de facturas
│  │  │  └─ ProyectoFacturacionApplication.java # Clase principal
│  │  └─ resources/
│  │     ├─ static/
│  │     │  └─ img/                             # Imágenes estáticas
│  │     ├─ templates/
│  │     │  ├─ acceso-denegado.html             # Página de acceso denegado
│  │     │  ├─ bienvenida.html                  # Página de bienvenida
│  │     │  ├─ home.html                        # Página principal con iframe
│  │     │  ├─ login.html                       # Formulario de login
│  │     │  ├─ registro.html                    # Formulario de registro
│  │     │  └─ views/
│  │     │     ├─ usuario/
│  │     │     │  ├─ usuario.html               # Lista de usuarios
│  │     │     │  ├─ nuevo_usuario.html         # Crear usuario
│  │     │     │  └─ editar_usuario.html        # Editar usuario
│  │     │     ├─ producto/
│  │     │     │  ├─ producto.html              # Lista de productos
│  │     │     │  ├─ nuevo_producto.html        # Crear producto
│  │     │     │  └─ editar_producto.html       # Editar producto
│  │     │     └─ factura/
│  │     │        ├─ factura.html               # Lista de facturas
│  │     │        ├─ nueva_factura.html         # Crear factura
│  │     │        └─ detalle_factura.html       # Ver detalle de factura
│  │     ├─ application.properties              # Configuración de la aplicación
│  │     └─ schema.sql                          # Script de base de datos
│  └─ test/
│     └─ java/uts/edu/java/facturacion/
│        └─ ProyectoFacturacionApplicationTests.java
├─ pom.xml                                      # Dependencias Maven
├─ datos_prueba.sql                             # Script con datos de prueba
└─ README.md
```

---

## 🗄️ MODELO DE BASE DE DATOS

La base de datos **proyecto_facturacion_db** se implementó en MySQL/MariaDB con las siguientes tablas:

### Tablas del Sistema de Autenticación
- **roles**: Roles del sistema (ADMIN, VENDEDOR, USER)
- **usuarios**: Información completa de usuarios con credenciales encriptadas
- **usuarios_roles**: Tabla intermedia para la relación muchos a muchos

### Tablas del Sistema de Facturación
- **productos**: Catálogo de productos con stock y precios
- **facturas**: Encabezado de facturas con relación a usuarios
- **facturas_detalle**: Detalles de cada factura (productos, cantidades, subtotales)

### Relaciones Principales
```
usuarios (1) ──< (N) usuarios_roles (N) >── (1) roles
usuarios (1) ──< (N) facturas
productos (1) ──< (N) facturas_detalle (N) >── (1) facturas
```

### Características de la BD
- ✅ Llaves primarias auto-incrementales
- ✅ Llaves foráneas con integridad referencial
- ✅ Cascada en eliminaciones (CASCADE)
- ✅ Valores NULL permitidos estratégicamente (SET NULL)
- ✅ Índices para optimización de consultas
- ✅ Charset UTF8MB4 para soporte completo de caracteres

---

## ⚙️ TECNOLOGÍAS Y HERRAMIENTAS

| Herramienta | Versión | Descripción |
|------------|---------|-------------|
| **Java** | 21 LTS | Lenguaje de programación principal |
| **Spring Boot** | 3.4.0 | Framework para desarrollo backend |
| **Spring Security** | 6.4.1 | Autenticación y autorización |
| **Spring Data JPA** | 3.4.0 | Persistencia de datos con Hibernate |
| **Hibernate** | 6.6.2.Final | ORM para mapeo objeto-relacional |
| **Thymeleaf** | 3.1.2 | Motor de plantillas para las vistas |
| **MySQL Connector** | 9.1.0 | Driver JDBC para MySQL/MariaDB |
| **MySQL / MariaDB** | 5.5.5+ | Base de datos relacional |
| **Bootstrap** | 5.3.0 | Framework CSS para diseño responsivo |
| **Bootstrap Icons** | 1.7.2 | Biblioteca de iconos |
| **Maven** | 3.x | Gestión de dependencias |
| **Tomcat** | 10.1.33 (embebido) | Servidor de aplicaciones |
| **HikariCP** | 5.1.0 | Pool de conexiones de alto rendimiento |
| **HeidiSQL** | - | Cliente de base de datos |
| **VS Code** | - | Entorno de desarrollo |

---

## 📂 ARQUITECTURA DE CAPAS

| Capa | Paquete | Descripción |
|------|---------|-------------|
| **Configuración** | `config` | Configuración de Spring Security, CORS, headers, frameOptions |
| **Modelo** | `modelo` | Entidades JPA que representan las tablas de la BD con anotaciones Jakarta |
| **Repositorio** | `repositorio` | Interfaces que extienden `JpaRepository<T, ID>` para operaciones CRUD automáticas |
| **Servicio** | `servicio` | Lógica de negocio, validaciones, cálculos y transacciones con `@Transactional` |
| **Controlador** | `controlador` | Gestiona peticiones HTTP, valida datos y comunica vistas con backend |
| **DTO** | `dto` | Objetos de transferencia de datos para formularios complejos |
| **Vista** | `templates` | Archivos HTML con Thymeleaf para renderizado dinámico del lado del servidor |

---

## 🚀 CONFIGURACIÓN E INSTALACIÓN

### Prerrequisitos
```bash
- Java JDK 21 LTS instalado
- MySQL/MariaDB servidor en ejecución (puerto 3310)
- Maven 3.x (incluido como wrapper)
- Git (opcional)
```

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone <url-del-repositorio>
cd ProyectoFacturacion
```

2. **Configurar la base de datos**
   - Ejecutar el script SQL completo incluido en el proyecto
   - Verificar conexión en `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3310/proyecto_facturacion_db
spring.datasource.username=root
spring.datasource.password=
```

3. **Compilar el proyecto**
```bash
mvnw.cmd clean install
```

4. **Ejecutar la aplicación**
```bash
mvnw.cmd spring-boot:run
```

5. **Acceder a la aplicación**
   - URL: http://localhost:8092
   - Redirige automáticamente a: http://localhost:8092/login

---

## 👤 CREDENCIALES DE ACCESO

### Usuarios Pre-configurados

| Usuario | Contraseña | Rol | Descripción |
|---------|-----------|-----|-------------|
| `admin` | `admin123` | ROLE_ADMIN | Administrador del sistema |
| `ana.g` | `ana.g` | ROLE_VENDEDOR | Vendedor |
| `sofia.d` | `sofia.d` | ROLE_VENDEDOR | Vendedor |
| `maria.r` | `maria.r` | ROLE_USER | Usuario normal |
| `carlos.p` | `carlos.p` | ROLE_USER | Usuario normal |
| `luis.f` | `luis.f` | ROLE_USER | Usuario normal |
| `jorge.m` | `jorge.m` | ROLE_USER | Usuario normal |

**Nota**: Todas las contraseñas están encriptadas con BCrypt en la base de datos.

---

## 🔒 SEGURIDAD IMPLEMENTADA

### Spring Security Configuration
```java
- Autenticación basada en formularios personalizados
- Encriptación de contraseñas con BCryptPasswordEncoder (strength 10)
- Protección CSRF habilitada
- Control de acceso basado en roles (hasRole, hasAnyRole)
- Gestión de sesiones con HttpSession
- Configuración de headers para iframe (X-Frame-Options: SAMEORIGIN)
- Página de login personalizada en /login
- Página de error de acceso en /acceso-denegado
- Logout con redirección a /login?logout
```

### Rutas Protegidas
```
/views/usuario/**  → Requiere autenticación
/views/producto/** → Requiere autenticación
/views/factura/**  → Requiere autenticación
/home              → Requiere autenticación
```

---

## 📊 DATOS DE PRUEBA

El sistema incluye datos precargados:

- **7 usuarios** con diferentes roles
- **7 productos** de tecnología con stock y precios
- **6 facturas** con detalles completos
- **3 roles** del sistema

---

## 🎨 CARACTERÍSTICAS DE LA INTERFAZ

### Diseño
- ✅ **Responsivo**: Adaptable a móviles, tablets y escritorio
- ✅ **Bootstrap 5.3.0**: Componentes modernos y profesionales
- ✅ **Paleta de colores**: Azul corporativo con acentos de éxito/advertencia/peligro
- ✅ **Iconos**: Bootstrap Icons para mejor experiencia visual
- ✅ **Tipografía**: Fuentes legibles y jerarquía visual clara

### Navegación
- ✅ **Iframe integrado**: Carga de contenido sin recargar página completa
- ✅ **Menú lateral**: Acceso rápido a todos los módulos
- ✅ **Breadcrumbs**: Indicador de ubicación actual
- ✅ **Botones de acción**: Crear, Editar, Eliminar con confirmaciones

### Tablas
- ✅ **Hover effects**: Resaltado de filas al pasar el mouse
- ✅ **Striped rows**: Filas alternas para mejor lectura
- ✅ **Badges**: Indicadores de estado (stock bajo, roles)
- ✅ **Formato de moneda**: Precios con símbolo $ y 2 decimales
- ✅ **Formato de fecha**: dd/MM/yyyy HH:mm

---

## 🧪 TESTING

El proyecto incluye la estructura base para pruebas unitarias con JUnit 5 y Spring Boot Test.

---

## 📝 NOTAS TÉCNICAS

### Configuración JPA
```properties
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
```

### Pool de Conexiones HikariCP
- Configuración automática optimizada
- Gestión eficiente de conexiones a la BD
- Timeout y validación de conexiones

### DevTools
- Hot reload habilitado para desarrollo
- Recarga automática de plantillas Thymeleaf
- Cache deshabilitado en desarrollo

---

## 🐛 SOLUCIÓN DE PROBLEMAS COMUNES

### Error: "Unknown column in field list"
- **Causa**: Desincronización entre entidades JPA y esquema de BD
- **Solución**: Ejecutar el script SQL completo para recrear tablas

### Error: "Access Denied"
- **Causa**: Credenciales incorrectas o falta de permisos en MySQL
- **Solución**: Verificar usuario/contraseña en application.properties

### Error: "Port 8092 already in use"
- **Causa**: Otra instancia de la aplicación en ejecución
- **Solución**: Detener procesos en puerto 8092 o cambiar puerto

### Error: "chrome-error://chromewebdata/"
- **Causa**: X-Frame-Options bloqueando iframe
- **Solución**: Ya configurado con `.frameOptions().sameOrigin()`

---

## 📚 CONCEPTOS APLICADOS

### Programación Orientada a Objetos
- ✅ Encapsulamiento (getters/setters)
- ✅ Herencia (JpaRepository)
- ✅ Polimorfismo (interfaces de servicio)
- ✅ Abstracción (DTOs, entidades)

### Patrones de Diseño
- ✅ **MVC**: Separación de responsabilidades
- ✅ **Repository**: Abstracción de acceso a datos
- ✅ **Service**: Lógica de negocio centralizada
- ✅ **DTO**: Transferencia de datos entre capas
- ✅ **Dependency Injection**: Inyección de dependencias con @Autowired

### Bases de Datos
- ✅ Modelo relacional normalizado
- ✅ Integridad referencial
- ✅ Transacciones ACID
- ✅ Índices para optimización
- ✅ ORM con Hibernate

---

## 👨‍💻 AUTOR

**Nombre**: Cristian David Cardenas Garcia  
**Programa**: Tecnología en Desarrollo de Sistemas Informáticos  
**Institución**: Unidades Tecnológicas de Santander – UTS  
**Docente**: Carlos Adolfo Beltrán Castro  
**Fecha**: 26 de Noviembre 2025  
**Versión**: 2.0 - Sistema de Facturación Integrado

---

## 📄 LICENCIA

Este proyecto es de carácter académico y se desarrolló con fines educativos.

---

## 🙏 AGRADECIMIENTOS

- **Spring Boot Team** por el excelente framework
- **Thymeleaf Team** por el motor de plantillas
- **Bootstrap Team** por los componentes UI
- **Profesor Carlos Beltrán** por la guía académica
- **Comunidad UTS** por el apoyo constante

---

## 📞 CONTACTO

Para consultas sobre el proyecto:
- **Email**: fripers22@gmail.com
- **Institución**: UTS - Unidades Tecnológicas de Santander

---

**Desarrollado con ❤️ para el aprendizaje de Java y Spring Boot**

