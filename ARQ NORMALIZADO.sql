CREATE DATABASE ARQ
USE ARQ

-- Crear base de datos
CREATE DATABASE ARQTELIER;
GO

USE ARQTELIER;
GO

-- ===================== TABLAS DE APOYO =====================

-- Tipo de empresa
CREATE TABLE TipoEmpresa (
    id_tipo_empresa INT PRIMARY KEY,
    tipo NVARCHAR(50)
);

-- Cargo
CREATE TABLE Cargo (
    id_cargo INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

-- Tipo de contrato
CREATE TABLE TipoContrato (
    id_tipo_contrato INT PRIMARY KEY,
    tipo NVARCHAR(50)
);

-- Especialidad
CREATE TABLE Especialidad (
    id_especialidad INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

-- Tipo de cliente
CREATE TABLE TipoCliente (
    id_tipo_cliente INT PRIMARY KEY,
    tipo NVARCHAR(50)
);

-- Tipo de proveedor
CREATE TABLE TipoProveedor (
    id_tipo_proveedor INT PRIMARY KEY,
    tipo NVARCHAR(50)
);

-- Tipo de recurso
CREATE TABLE TipoRecurso (
    id_tipo_recurso INT PRIMARY KEY,
    tipo NVARCHAR(50)
);

-- Tipo de producto
CREATE TABLE TipoProducto (
    id_tipo_producto INT PRIMARY KEY,
    tipo NVARCHAR(50)
);

-- ===================== TABLAS PRINCIPALES =====================

-- Empresa
CREATE TABLE Empresa (
    id_empresa INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    ruc NVARCHAR(20) NOT NULL,
    rubro NVARCHAR(100),
    direccion NVARCHAR(200),
    id_tipo_empresa INT,

    CONSTRAINT FK_Empresa_TipoEmpresa FOREIGN KEY (id_tipo_empresa)
    REFERENCES TipoEmpresa(id_tipo_empresa)
);

-- Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    id_tipo_cliente INT,
    ruc_dni NVARCHAR(20),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),

    CONSTRAINT FK_Cliente_Empresa FOREIGN KEY (id_empresa)
    REFERENCES Empresa(id_empresa),

    CONSTRAINT FK_Cliente_Tipo FOREIGN KEY (id_tipo_cliente)
    REFERENCES TipoCliente(id_tipo_cliente)
);

-- Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    id_tipo_proveedor INT,
    correo NVARCHAR(100),
    telefono NVARCHAR(20),
    ruc NVARCHAR(20),

    CONSTRAINT FK_Proveedor_Empresa FOREIGN KEY (id_empresa)
    REFERENCES Empresa(id_empresa),

    CONSTRAINT FK_Proveedor_Tipo FOREIGN KEY (id_tipo_proveedor)
    REFERENCES TipoProveedor(id_tipo_proveedor)
);

-- Empleado
CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    id_cargo INT,
    id_tipo_contrato INT,
    id_especialidad INT,

    CONSTRAINT FK_Empleado_Empresa FOREIGN KEY (id_empresa)
    REFERENCES Empresa(id_empresa),

    CONSTRAINT FK_Empleado_Cargo FOREIGN KEY (id_cargo)
    REFERENCES Cargo(id_cargo),

    CONSTRAINT FK_Empleado_Contrato FOREIGN KEY (id_tipo_contrato)
    REFERENCES TipoContrato(id_tipo_contrato),

    CONSTRAINT FK_Empleado_Especialidad FOREIGN KEY (id_especialidad)
    REFERENCES Especialidad(id_especialidad)
);

-- Servicio
CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    precio_base DECIMAL(10,2) NOT NULL
);

-- Proceso
CREATE TABLE Proceso (
    id_proceso INT PRIMARY KEY,
    id_servicio INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    area_responsable NVARCHAR(100),

    CONSTRAINT FK_Proceso_Servicio FOREIGN KEY (id_servicio)
    REFERENCES Servicio(id_servicio)
);

-- Recurso
CREATE TABLE Recurso (
    id_recurso INT PRIMARY KEY,
    id_proceso INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    id_tipo_recurso INT,
    uso NVARCHAR(100),

    CONSTRAINT FK_Recurso_Proceso FOREIGN KEY (id_proceso)
    REFERENCES Proceso(id_proceso),

    CONSTRAINT FK_Recurso_Tipo FOREIGN KEY (id_tipo_recurso)
    REFERENCES TipoRecurso(id_tipo_recurso)
);

-- Orden de Servicio
CREATE TABLE OrdenServicio (
    id_servicio INT NOT NULL,
    id_cliente INT NOT NULL,
    fecha_solicitud DATE DEFAULT GETDATE(),
    precio_estimated DECIMAL(10,2),
    tiempo_entrega INT,

    PRIMARY KEY (id_servicio, id_cliente),

    CONSTRAINT FK_OrdenServicio_Servicio FOREIGN KEY (id_servicio)
    REFERENCES Servicio(id_servicio),

    CONSTRAINT FK_OrdenServicio_Cliente FOREIGN KEY (id_cliente)
    REFERENCES Cliente(id_cliente)
);

-- ServicioEmpleado
CREATE TABLE ServicioEmpleado (
    id_servicio INT NOT NULL,
    id_empleado INT NOT NULL,

    PRIMARY KEY (id_servicio, id_empleado),

    CONSTRAINT FK_ServicioEmpleado_Servicio FOREIGN KEY (id_servicio)
    REFERENCES Servicio(id_servicio),

    CONSTRAINT FK_ServicioEmpleado_Empleado FOREIGN KEY (id_empleado)
    REFERENCES Empleado(id_empleado)
);

-- Producto
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    id_tipo_producto INT,
    stock INT DEFAULT 0,

    CONSTRAINT FK_Producto_Proveedor FOREIGN KEY (id_proveedor)
    REFERENCES Proveedor(id_proveedor),

    CONSTRAINT FK_Producto_Tipo FOREIGN KEY (id_tipo_producto)
    REFERENCES TipoProducto(id_tipo_producto)
);

-- PrecioProducto (historial de precios)
CREATE TABLE PrecioProducto (
    id_precio INT PRIMARY KEY,
    id_producto INT NOT NULL,
    precio_compra DECIMAL(10,2),
    precio_venta DECIMAL(10,2),
    fecha_actualizacion DATE DEFAULT GETDATE(),

    CONSTRAINT FK_PrecioProducto_Producto FOREIGN KEY (id_producto)
    REFERENCES Producto(id_producto)
);
