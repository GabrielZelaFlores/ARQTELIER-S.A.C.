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

-- Tabla Proveedor
CREATE TABLE Proveedor (
    codigo_proveedor INT PRIMARY KEY,
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
CREATE TABLE RecursoHumano (
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

-- Tabla Producto
CREATE TABLE Producto (
    codigo_producto INT PRIMARY KEY,
    codigo_cliente_FK INT NOT NULL,
    codigo_servicio_FK INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    tipo NVARCHAR(50),
    precio_estimated DECIMAL(10,2),
    tiempo_entrega INT,
    
    CONSTRAINT FK_Producto_Cliente FOREIGN KEY (codigo_cliente_FK)
    REFERENCES Cliente(codigo_cliente),
    
    CONSTRAINT FK_Producto_Servicio FOREIGN KEY (codigo_servicio_FK)
    REFERENCES Servicio(codigo_servicio)
);

-- Tabla de relación Producto_RecursoHumano
CREATE TABLE Producto_RecursoHumano (
    codigo_producto INT NOT NULL,
    codigo_empleado INT NOT NULL,
    
    PRIMARY KEY (codigo_producto, codigo_empleado),
    
    CONSTRAINT FK_ProductoRH_Producto FOREIGN KEY (codigo_producto)
    REFERENCES Producto(codigo_producto),
    
    CONSTRAINT FK_ProductoRH_RecursoHumano FOREIGN KEY (codigo_empleado)
    REFERENCES RecursoHumano(codigo_empleado)
);
