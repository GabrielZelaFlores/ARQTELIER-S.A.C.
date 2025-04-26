-- Crear base de datos
CREATE DATABASE ARQTELIER;

USE ARQTELIER;

-- Tabla Empresa
CREATE TABLE Empresa (
    id_empresa INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    ruc NVARCHAR(20) NOT NULL,
    rubro NVARCHAR(100),
    direccion NVARCHAR(200),
    tipo NVARCHAR(50)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    tipo NVARCHAR(50),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),
    ruc NVARCHAR(20),

    CONSTRAINT FK_Proveedor_Empresa FOREIGN KEY (id_empresa)
    REFERENCES Empresa(id_empresa)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    cargo NVARCHAR(100),
    tipo_contrato NVARCHAR(50),
    especialidad NVARCHAR(100),

    CONSTRAINT FK_Empleado_Empresa FOREIGN KEY (id_empresa)
    REFERENCES Empresa(id_empresa)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    tipo NVARCHAR(50),
    ruc_dni NVARCHAR(20),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),

    CONSTRAINT FK_Cliente_Empresa FOREIGN KEY (id_empresa)
    REFERENCES Empresa(id_empresa)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    precio_base DECIMAL(10,2) NOT NULL
);

-- Tabla Proceso
CREATE TABLE Proceso (
    id_proceso INT PRIMARY KEY,
    id_servicio INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    area_responsable NVARCHAR(100),

    CONSTRAINT FK_Proceso_Servicio FOREIGN KEY (id_servicio)
    REFERENCES Servicio(id_servicio)
);

-- Tabla Recurso
CREATE TABLE Recurso (
    id_recurso INT PRIMARY KEY,
    id_proceso INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    tipo NVARCHAR(50),
    uso NVARCHAR(100),

    CONSTRAINT FK_Recurso_Proceso FOREIGN KEY (id_proceso)
    REFERENCES Proceso(id_proceso)
);

-- Tabla OrdenServicio (relación Servicio - Cliente)
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

-- Tabla Servicio_Empleado (relación Servicio - Empleado)
CREATE TABLE Servicio_Empleado (
    id_servicio INT NOT NULL,
    id_empleado INT NOT NULL,

    PRIMARY KEY (id_servicio, id_empleado),

    CONSTRAINT FK_Servicio_Empleado_Servicio FOREIGN KEY (id_servicio)
    REFERENCES Servicio(id_servicio),

    CONSTRAINT FK_Servicio_Empleado_Empleado FOREIGN KEY (id_empleado)
    REFERENCES Empleado(id_empleado)
);

-- Tabla Producto (asociada a Proveedor)
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY IDENTITY(1,1),
    id_proveedor INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    tipo NVARCHAR(50),
    precio_compra DECIMAL(10,2) NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,

    CONSTRAINT FK_Producto_Proveedor FOREIGN KEY (id_proveedor)
    REFERENCES Proveedor(id_proveedor)
);
