-- Crear base de datos
CREATE DATABASE ARQTELIER2;

USE ARQTELIER2;


-- Tabla Empresa
CREATE TABLE Empresa (
    codigo_empresa INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    ruc NVARCHAR(20) NOT NULL,
    rubro NVARCHAR(100),
    direccion NVARCHAR(200),
    tipo NVARCHAR(50)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY,
    codigo_empresa_FK INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    tipo NVARCHAR(50),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),
    ruc NVARCHAR(20),

    CONSTRAINT FK_Proveedor_Empresa FOREIGN KEY (codigo_empresa_FK)
    REFERENCES Empresa(codigo_empresa)
);

-- Tabla RecursoHumano
CREATE TABLE Empleado (
    codigo_empleado INT PRIMARY KEY,
    codigo_empresa_FK INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    cargo NVARCHAR(100),
    tipo_contrato NVARCHAR(50),
    especialidad NVARCHAR(100),

    CONSTRAINT FK_RecursoHumano_Empresa FOREIGN KEY (codigo_empresa_FK)
    REFERENCES Empresa(codigo_empresa)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    codigo_cliente INT PRIMARY KEY,
    codigo_empresa_FK INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    tipo NVARCHAR(50),
    ruc_dni NVARCHAR(20),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),

    CONSTRAINT FK_Cliente_Empresa FOREIGN KEY (codigo_empresa_FK)
    REFERENCES Empresa(codigo_empresa)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    codigo_servicio INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    precio_base DECIMAL(10,2) NOT NULL
);

-- Tabla Proceso
CREATE TABLE Proceso (
    codigo_proceso INT PRIMARY KEY,
    codigo_servicio_FK INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    area_responsable NVARCHAR(100),

    CONSTRAINT FK_Proceso_Servicio FOREIGN KEY (codigo_servicio_FK)
    REFERENCES Servicio(codigo_servicio)
);

-- Tabla Recurso
CREATE TABLE Recurso (
    codigo_recurso INT PRIMARY KEY,
    codigo_proceso_FK INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    tipo NVARCHAR(50),
    uso NVARCHAR(100),

    CONSTRAINT FK_Recurso_Proceso FOREIGN KEY (codigo_proceso_FK)
    REFERENCES Proceso(codigo_proceso)
);

-- Tabla OrdenServicio (relación Servicio - Cliente)
CREATE TABLE OrdenServicio (
    codigo_servicio INT NOT NULL,
    codigo_cliente INT NOT NULL,
    fecha_solicitud DATE DEFAULT GETDATE(),
    precio_estimated DECIMAL(10,2),
    tiempo_entrega INT,

    PRIMARY KEY (codigo_servicio, codigo_cliente),

    CONSTRAINT FK_OrdenServicio_Servicio FOREIGN KEY (codigo_servicio)
    REFERENCES Servicio(codigo_servicio),

    CONSTRAINT FK_OrdenServicio_Cliente FOREIGN KEY (codigo_cliente)
    REFERENCES Cliente(codigo_cliente)
);

-- Tabla Servicio_Empleado (relación Servicio - RecursoHumano)
CREATE TABLE Servicio_Empleado (
    codigo_servicio INT NOT NULL,
    codigo_empleado INT NOT NULL,

    PRIMARY KEY (codigo_servicio, codigo_empleado),

    CONSTRAINT FK_Servicio_Empleado_Servicio FOREIGN KEY (codigo_servicio)
    REFERENCES Servicio(codigo_servicio),

    CONSTRAINT FK_Servicio_Empleado_RecursoHumano FOREIGN KEY (codigo_empleado)
    REFERENCES Empleado(codigo_empleado)
);

-- Nueva tabla Producto asociada a Proveedor
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
