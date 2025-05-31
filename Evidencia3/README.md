# Modelo de Información Empresarial – ARQTELIER S.A.C.

## Integrantes del Grupo

- Huamani Vasquez Juan Jose  
- Yabar Carazas Melvin Jarred  
- Zela Flores Gabriel Frank Krisna  


# 📘 **README - Proyecto Base de Datos SACARQ**

## 🏗️ Descripción General

**SACARQ** es un sistema de base de datos diseñado para gestionar los procesos operativos de una empresa del sector arquitectura e ingeniería. Su propósito principal es registrar y controlar:

* Clientes (personas o empresas).
* Servicios ofrecidos (como diseño arquitectónico, instalaciones eléctricas, supervisión).
* Empleados y sus especialidades.
* Recursos usados en cada proceso de servicio.
* Órdenes de servicio emitidas por los clientes.

Con esta base de datos se busca automatizar la gestión administrativa y operativa de la empresa, brindando una estructura clara para consultas, reportes y seguimiento.

---

## 🧱 Estructura de la Base de Datos

![Diagrama ER de la Base de Datos](SACARQ%20DIAGRAMA.png)

---
### 🔹 Tablas de Apoyo

* **Cargo**: Define los roles de los empleados (Ej. Arquitecto, Ingeniero).
* **TipoContrato**: Registra el tipo de contrato laboral (Tiempo completo, Por proyecto).
* **Especialidad**: Define áreas técnicas de los empleados (Estructuras, Eléctrico, Diseño).
* **TipoCliente**: Clasifica si el cliente es una empresa o una persona natural.
* **TipoRecurso**: Clasifica los recursos en materiales, herramientas o software.

### 🔹 Tablas Principales

* **Cliente**: Registra a los clientes, incluyendo RUC/DNI, correo y teléfono.
* **Empleado**: Guarda los datos del personal técnico con su especialidad y contrato.
* **Servicio**: Contiene los servicios ofertados por la empresa y su precio base.
* **Proceso**: Subdivisión de un servicio; cada uno tiene una descripción y un área responsable.
* **Recurso**: Recursos necesarios por cada proceso (ej. materiales, software).
* **OrdenServicio**: Registra las órdenes de trabajo hechas por los clientes.
* **ServicioEmpleado**: Relación muchos a muchos entre servicios y empleados asignados.

---

## ⚙️ Funcionalidades Implementadas

### 📌 Inserción de Datos

Se ingresaron datos de ejemplo para todas las tablas, representando casos reales del rubro arquitectura e ingeniería.

### 📌 Índices

Se crearon índices en claves foráneas y campos frecuentes en búsquedas (como nombre, correo, estado) para optimizar el rendimiento.

### 📌 Consultas SQL

Incluyen:

* Listado de empleados con especialidades.
* Servicios por empleado.
* Órdenes activas por cliente.
* Cantidad de órdenes por estado.

### 📌 Funciones

* **Escalares**: Obtener nombre de cliente por ID, calcular precio con IGV.
* **Con valores de tabla**: Servicios de un empleado, órdenes pendientes por cliente.

### 📌 Procedimientos Almacenados

* Registrar clientes.
* Asignar empleados a servicios.
* Cambiar el estado de una orden.
* Generar reportes por fechas.
* Buscar empleados por especialidad.

---

## 🧪 Ejecución de Procedimientos

```sql
EXEC sp_RegistrarCliente 'María López', 2, '87654321', 'mlopez@gmail.com', '999888777';

EXEC sp_AsignarEmpleadoAServicio 3, 1;

EXEC sp_ActualizarEstadoOrden 1, 'En Proceso';

EXEC sp_ReporteOrdenesPorFecha '2025-05-01', '2025-05-31';

EXEC sp_EmpleadosPorEspecialidad 3;
```

Para verificar resultados, se pueden usar `SELECT` directamente sobre las tablas correspondientes.

---

## 📈 Conclusión

Este sistema permite a la empresa **SACARQ** llevar un control ordenado, escalable y optimizado de todos los aspectos operativos relacionados con sus servicios técnicos. Está diseñado para facilitar reportes rápidos, asignación de personal, análisis de clientes y supervisión de procesos técnicos.

---
