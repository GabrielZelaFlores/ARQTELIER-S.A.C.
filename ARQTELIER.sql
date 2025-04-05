CREATE DATABASE ARQTELIER
USE ARQTELIER

CREATE TABLE Empresa (
    codigo_empresa INT PRIMARY KEY,
    nombre NVARCHAR(100),
    ruc NVARCHAR(20),
    rubro NVARCHAR(100),
    direccion NVARCHAR(200),
    tipo NVARCHAR(50)
);

CREATE TABLE Proveedor (
    codigo_proveedor INT PRIMARY KEY,
    codigo_empresa_FK INT,
    nombre NVARCHAR(100),
    tipo NVARCHAR(50),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),
    ruc NVARCHAR(20),
    FOREIGN KEY (codigo_empresa_FK) REFERENCES Empresa(codigo_empresa)
);

CREATE TABLE RecursoHumano (
    codigo_empleado INT PRIMARY KEY,
    codigo_empresa_FK INT,
    nombre NVARCHAR(100),
    cargo NVARCHAR(100),
    tipo_contrato NVARCHAR(50),
    especialidad NVARCHAR(100),
    FOREIGN KEY (codigo_empresa_FK) REFERENCES Empresa(codigo_empresa)
);

CREATE TABLE Cliente (
    codigo_cliente INT PRIMARY KEY,
    codigo_empresa_FK INT,
    nombre NVARCHAR(100),
    tipo NVARCHAR(50),
    ruc_dni NVARCHAR(20),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),
    FOREIGN KEY (codigo_empresa_FK) REFERENCES Empresa(codigo_empresa)
);

CREATE TABLE Servicio (
    codigo_servicio INT PRIMARY KEY,
    nombre NVARCHAR(100),
    descripcion NVARCHAR(200),
    precio_base DECIMAL(10,2)
);

CREATE TABLE Proceso (
    codigo_proceso INT PRIMARY KEY,
    codigo_servicio_FK INT,
    nombre NVARCHAR(100),
    descripcion NVARCHAR(200),
    area_responsable NVARCHAR(100),
    FOREIGN KEY (codigo_servicio_FK) REFERENCES Servicio(codigo_servicio)
);

CREATE TABLE Recurso (
    codigo_recurso INT PRIMARY KEY,
    codigo_proceso_FK INT,
    nombre NVARCHAR(100),
    tipo NVARCHAR(50),
    uso NVARCHAR(100),
    FOREIGN KEY (codigo_proceso_FK) REFERENCES Proceso(codigo_proceso)
);

CREATE TABLE Producto (
    codigo_producto INT PRIMARY KEY,
    codigo_cliente_FK INT,
    codigo_servicio_FK INT,
    nombre NVARCHAR(100),
    tipo NVARCHAR(50),
    precio_estimated DECIMAL(10,2),
    tiempo_entrega INT,
    FOREIGN KEY (codigo_cliente_FK) REFERENCES Cliente(codigo_cliente),
    FOREIGN KEY (codigo_servicio_FK) REFERENCES Servicio(codigo_servicio)
);

-- Relación N:M entre Producto y RecursoHumano (Ejecutado_por)
CREATE TABLE Producto_RecursoHumano (
    codigo_producto INT,
    codigo_empleado INT,
    PRIMARY KEY (codigo_producto, codigo_empleado),
    FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo_producto),
    FOREIGN KEY (codigo_empleado) REFERENCES RecursoHumano(codigo_empleado)
);
