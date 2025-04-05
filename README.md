# Modelo de Información Empresarial – ARQTELIER S.A.C.

## Integrantes del Grupo

- Huamani Vasquez Juan Jose  
- Yabar Carazas Melvin Jarred  
- Zela Flores Gabriel Frank Krisna  

## Enlace del draw.io

[Ver documento en Google Drive](https://drive.google.com/file/d/1GAcY-sdTtH5JYmulRaT7dYneu6MgKyBZ/view?usp=sharing)

## Diagrama del Proyecto

![Diagrama del Proyecto](ARQTELIER%20S.A.C..drawio.png)

## 📘 Introducción

**ARQTELIER S.A.C.** es una empresa peruana especializada en servicios de arquitectura, diseño y construcción. Fundada como microempresa bajo la figura de Sociedad Anónima Cerrada (S.A.C.), ofrece soluciones arquitectónicas personalizadas a través de:

- Diseño arquitectónico
- Remodelaciones
- Supervisión de obra
- Proyectos para licencias municipales

Con el crecimiento sostenido de sus operaciones, se ha definido la necesidad de estructurar un **Modelo Entidad-Relación Extendido (MER)** que represente, organice y sistematice la información interna de la empresa. Este modelo servirá como base para desarrollos informáticos, gestión de datos y la toma de decisiones estratégicas y operativas.

---

## 🧩 Estructura General del Modelo

El modelo está compuesto por **8 entidades principales**:

- Empresa
- Cliente
- Proveedor
- Recurso Humano
- Servicio
- Producto
- Proceso
- Recurso

Cada entidad cuenta con un identificador único (`codigo_*`) y atributos clave que definen su rol en el sistema. Las relaciones están modeladas explícitamente para facilitar la normalización de los datos y su posterior uso en sistemas relacionales.

---

## 📄 Tabla de Entidades y Atributos

| Entidad           | Atributo                       | Tipo de Dato          |
|-------------------|--------------------------------|------------------------|
| **Empresa**       | `codigo_empresa`               | `VARCHAR` <<PK>>       |
|                   | `nombre`, `ruc`, `direccion`, `tipo` | `VARCHAR`          |
|                   | `rubro`                        | `TEXT`                |
| **Cliente**       | `codigo_cliente`               | `VARCHAR` <<PK>>       |
|                   | `codigo_empresa`               | `VARCHAR` <<FK>>       |
|                   | `nombre`, `tipo`, `ruc_dni`, `correo`, `telefono` | `VARCHAR` / `ENUM` |
| **Proveedor**     | `codigo_proveedor`             | `VARCHAR` <<PK>>       |
|                   | `codigo_empresa`               | `VARCHAR` <<FK>>       |
|                   | `nombre`, `tipo`, `ruc`, `correo`, `telefono` | `VARCHAR` / `ENUM` |
| **Recurso Humano**| `codigo_empleado`              | `VARCHAR` <<PK>>       |
|                   | `codigo_empresa`               | `VARCHAR` <<FK>>       |
|                   | `nombre`, `cargo`, `especialidad` | `VARCHAR`           |
|                   | `tipo_contrato`                | `ENUM`                |
| **Servicio**      | `codigo_servicio`              | `VARCHAR` <<PK>>       |
|                   | `nombre`                       | `VARCHAR`              |
|                   | `descripcion`                  | `TEXT`                 |
|                   | `precio_base`                  | `DECIMAL`              |
| **Producto**      | `codigo_producto`              | `VARCHAR` <<PK>>       |
|                   | `codigo_cliente`               | `VARCHAR` <<FK>>       |
|                   | `codigo_servicio`              | `VARCHAR` <<FK>>       |
|                   | `nombre`, `tipo`               | `VARCHAR` / `ENUM`     |
|                   | `precio_estimado`              | `DECIMAL`              |
|                   | `tiempo_entrega`               | `VARCHAR`              |
| **Proceso**       | `codigo_proceso`               | `VARCHAR` <<PK>>       |
|                   | `codigo_servicio`              | `VARCHAR` <<FK>>       |
|                   | `nombre`                       | `VARCHAR`              |
|                   | `descripcion`                  | `TEXT`                 |
|                   | `area_responsable`             | `VARCHAR`              |
| **Recurso**       | `codigo_recurso`               | `VARCHAR` <<PK>>       |
|                   | `codigo_proceso`               | `VARCHAR` <<FK>>       |
|                   | `nombre`, `tipo`               | `VARCHAR` / `ENUM`     |
|                   | `uso`                          | `TEXT`                 |

---

## 🔗 Relaciones Entre Entidades

Las relaciones clave del modelo MER son las siguientes:

- Un **Cliente** puede realizar uno o más **Productos**.
- Un **Producto** está basado en un único **Servicio**.
- Un **Producto** puede ser ejecutado por uno o más **Recursos Humanos**. *(Esta relación está presente en el diagrama, aunque no modelada como entidad intermedia.)*
- Un **Proceso** puede utilizar uno o más **Recursos**.
- Un **Proceso** puede generar uno o más **Servicios**.
- Una **Empresa**:
  - Emplea a **Recursos Humanos**,
  - Atiende a **Clientes**,
  - Contrata a **Proveedores**.

---

## 🪪 Licencia

Este modelo es propiedad de **ARQTELIER S.A.C.** y su uso está restringido a fines internos, salvo autorización explícita por parte de la dirección de la empresa.

---

## 👤 Autoría

**Desarrollado para:**  
ARQTELIER S.A.C.  
📍 Perú

---
