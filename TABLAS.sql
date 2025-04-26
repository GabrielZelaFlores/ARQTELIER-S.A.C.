
CREATE DATABASE ARQTELIER;
USE ARQTELIER;

-- Tabla Empresa
CREATE TABLE Empresa (
    codigo_empresa INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    ruc NVARCHAR(20) NOT NULL,
    rubro NVARCHAR(100),
    direccion NVARCHAR(200),
    tipo NVARCHAR(50)
);

-- Tipos de Cliente, Proveedor y Producto
CREATE TABLE TipoCliente (
    codigo_tipo_cliente INT PRIMARY KEY,
    descripcion NVARCHAR(50) NOT NULL
);

CREATE TABLE TipoProveedor (
    codigo_tipo_proveedor INT PRIMARY KEY,
    descripcion NVARCHAR(50) NOT NULL
);

CREATE TABLE TipoProducto (
    codigo_tipo_producto INT PRIMARY KEY,
    descripcion NVARCHAR(50) NOT NULL
);

-- Cliente
CREATE TABLE Cliente (
    codigo_cliente INT PRIMARY KEY,
    codigo_empresa_FK INT NOT NULL,
    codigo_tipo_cliente_FK INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    ruc_dni NVARCHAR(20),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),
    CONSTRAINT FK_Cliente_Empresa FOREIGN KEY (codigo_empresa_FK)
        REFERENCES Empresa(codigo_empresa),
    CONSTRAINT FK_Cliente_Tipo FOREIGN KEY (codigo_tipo_cliente_FK)
        REFERENCES TipoCliente(codigo_tipo_cliente)
);

-- Proveedor
CREATE TABLE Proveedor (
    codigo_proveedor INT PRIMARY KEY,
    codigo_empresa_FK INT NOT NULL,
    codigo_tipo_proveedor_FK INT,
    nombre NVARCHAR(100) NOT NULL,
    correo NVARCHAR(100),
    telefono NVARCHAR(20),
    ruc NVARCHAR(20),
    CONSTRAINT FK_Proveedor_Empresa FOREIGN KEY (codigo_empresa_FK)
        REFERENCES Empresa(codigo_empresa),
    CONSTRAINT FK_Proveedor_Tipo FOREIGN KEY (codigo_tipo_proveedor_FK)
        REFERENCES TipoProveedor(codigo_tipo_proveedor)
);

-- Cargo, TipoContrato, Especialidad
CREATE TABLE Cargo (
    codigo_cargo INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE TipoContrato (
    codigo_tipo_contrato INT PRIMARY KEY,
    descripcion NVARCHAR(50) NOT NULL
);

CREATE TABLE Especialidad (
    codigo_especialidad INT PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);

-- Recurso Humano
CREATE TABLE RecursoHumano (
    codigo_empleado INT PRIMARY KEY,
    codigo_empresa_FK INT NOT NULL,
    codigo_cargo_FK INT,
    codigo_tipo_contrato_FK INT,
    codigo_especialidad_FK INT,
    nombre NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_RH_Empresa FOREIGN KEY (codigo_empresa_FK)
        REFERENCES Empresa(codigo_empresa),
    CONSTRAINT FK_RH_Cargo FOREIGN KEY (codigo_cargo_FK)
        REFERENCES Cargo(codigo_cargo),
    CONSTRAINT FK_RH_Contrato FOREIGN KEY (codigo_tipo_contrato_FK)
        REFERENCES TipoContrato(codigo_tipo_contrato),
    CONSTRAINT FK_RH_Especialidad FOREIGN KEY (codigo_especialidad_FK)
        REFERENCES Especialidad(codigo_especialidad)
);

-- Servicio
CREATE TABLE Servicio (
    codigo_servicio INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    precio_base DECIMAL(10,2) NOT NULL
);

-- Area Responsable
CREATE TABLE AreaResponsable (
    codigo_area INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL
);

-- Proceso
CREATE TABLE Proceso (
    codigo_proceso INT PRIMARY KEY,
    codigo_servicio_FK INT NOT NULL,
    codigo_area_FK INT,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    CONSTRAINT FK_Proceso_Servicio FOREIGN KEY (codigo_servicio_FK)
        REFERENCES Servicio(codigo_servicio),
    CONSTRAINT FK_Proceso_Area FOREIGN KEY (codigo_area_FK)
        REFERENCES AreaResponsable(codigo_area)
);

-- Tipo y Uso de Recurso
CREATE TABLE TipoRecurso (
    codigo_tipo_recurso INT PRIMARY KEY,
    descripcion NVARCHAR(50) NOT NULL
);

CREATE TABLE UsoRecurso (
    codigo_uso_recurso INT PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);

-- Recurso
CREATE TABLE Recurso (
    codigo_recurso INT PRIMARY KEY,
    codigo_proceso_FK INT NOT NULL,
    codigo_tipo_recurso_FK INT,
    codigo_uso_recurso_FK INT,
    nombre NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_Recurso_Proceso FOREIGN KEY (codigo_proceso_FK)
        REFERENCES Proceso(codigo_proceso),
    CONSTRAINT FK_Recurso_Tipo FOREIGN KEY (codigo_tipo_recurso_FK)
        REFERENCES TipoRecurso(codigo_tipo_recurso),
    CONSTRAINT FK_Recurso_Uso FOREIGN KEY (codigo_uso_recurso_FK)
        REFERENCES UsoRecurso(codigo_uso_recurso)
);

-- Producto
CREATE TABLE Producto (
    codigo_producto INT PRIMARY KEY,
    codigo_cliente_FK INT NOT NULL,
    codigo_servicio_FK INT NOT NULL,
    codigo_tipo_producto_FK INT,
    nombre NVARCHAR(100) NOT NULL,
    precio_estimated DECIMAL(10,2),
    tiempo_entrega INT,
    CONSTRAINT FK_Producto_Cliente FOREIGN KEY (codigo_cliente_FK)
        REFERENCES Cliente(codigo_cliente),
    CONSTRAINT FK_Producto_Servicio FOREIGN KEY (codigo_servicio_FK)
        REFERENCES Servicio(codigo_servicio),
    CONSTRAINT FK_Producto_Tipo FOREIGN KEY (codigo_tipo_producto_FK)
        REFERENCES TipoProducto(codigo_tipo_producto)
);

-- Relación Producto - Recurso Humano
CREATE TABLE Producto_RecursoHumano (
    codigo_producto INT NOT NULL,
    codigo_empleado INT NOT NULL,
    PRIMARY KEY (codigo_producto, codigo_empleado),
    CONSTRAINT FK_ProductoRH_Producto FOREIGN KEY (codigo_producto)
        REFERENCES Producto(codigo_producto),
    CONSTRAINT FK_ProductoRH_RecursoHumano FOREIGN KEY (codigo_empleado)
        REFERENCES RecursoHumano(codigo_empleado)
);
