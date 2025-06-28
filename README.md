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

![Diagrama ER de la Base de Datos](SQL/SACARQ%20DIAGRAMA.png)

---

# 🗂️ Modelo Entidad-Relación - Sistema de Gestión de Servicios

Este proyecto representa un modelo entidad-relación (MER) para un sistema de gestión de servicios. A continuación se detallan las entidades principales y sus relaciones.

---

## 🧾 1. Cliente
Un **cliente** solicita uno o más servicios.

**Atributos:**
- `nombre`
- `ruc_dni`
- `correo`
- `teléfono`
- `id_tipo_cliente` (como empresa, particular, etc.)

✅ **Relación:**  
Un cliente puede generar muchas órdenes de servicio.

---

## 📦 2. OrdenServicio
Representa una **solicitud concreta** realizada por un cliente.

**Atributos:**
- `fecha_solicitud`
- `precio_estimado`
- `tiempo_entrega`
- `estado`
- `id_cliente`
- `id_servicio`

✅ Una orden de servicio representa qué cliente pidió qué servicio y cuándo.

---

## 🛠️ 3. Servicio
Es lo que ofrece la empresa: diseño, instalación, reparación, etc.

**Atributos:**
- `nombre`
- `descripción`
- `precio_base`

✅ **Relaciones:**
- Puede estar compuesto de varios **procesos**
- Puede ser ejecutado por varios **empleados** (a través de `ServicioEmpleado`)

---

## 🔁 4. Proceso
Etapas o actividades que conforman un servicio.

**Atributos:**
- `nombre`
- `descripción`
- `área_responsable`
- `id_servicio`

✅ Cada proceso puede requerir **recursos** para su ejecución.

---

## ⚙️ 5. Recurso
Materiales o herramientas necesarias para llevar a cabo un proceso.

**Atributos:**
- `nombre`
- `uso`
- `id_tipo_recurso`
- `id_proceso`

✅ Ejemplos: pintura, herramientas, maquinaria.

---

## 🏷️ 6. TipoRecurso
Clasifica los recursos según su naturaleza.

**Atributos:**
- `tipo`

✅ Ejemplos: materiales, herramientas, insumos.

---

## 👷 7. Empleado
Personal que labora en la empresa.

**Atributos:**
- `nombre`
- `id_cargo`
- `id_tipo_contrato`
- `id_especialidad`

✅ Un empleado puede trabajar en varios servicios (vía tabla `ServicioEmpleado`).

---

## 🧩 8. ServicioEmpleado
Tabla intermedia que **relaciona servicios con empleados**.

**Atributos:**
- `id_servicio`
- `id_empleado`

✅ Permite saber quién trabaja en qué servicio.

---

## 🏢 9. Cargo
Define el **rol o posición** del empleado en la empresa.

**Atributos:**
- `nombre` (ej: técnico, supervisor)

---

## 📄 10. TipoContrato
Define el tipo de contrato del empleado.

**Atributos:**
- `tipo` (ej: indefinido, temporal, por obra)

---

## 🎓 11. Especialidad
Área de conocimiento o formación del empleado.

**Atributos:**
- `nombre` (ej: electricidad, carpintería, diseño)

---

## 🧍‍♂️ 12. TipoCliente
Clasifica a los clientes.

**Atributos:**
- `tipo` (ej: empresa, persona natural)

---

📌 **Resumen de relaciones principales:**

- Cliente ➝ TipoCliente  
- Cliente ➝ OrdenServicio  
- OrdenServicio ➝ Servicio  
- Servicio ➝ Proceso  
- Proceso ➝ Recurso  
- Recurso ➝ TipoRecurso  
- Servicio ➝ ServicioEmpleado ⇆ Empleado  
- Empleado ➝ Cargo, TipoContrato, Especialidad

---

✍️ *Este modelo facilita una gestión integral de los servicios, desde el cliente hasta la ejecución del trabajo por parte de los empleados, detallando recursos, procesos y roles involucrados.*


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
