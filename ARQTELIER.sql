-- CREACIÓN DE LA BASE DE DATOS Y USO
CREATE DATABASE ARQTELIER;
USE ARQTELIER;

-- ========================================
-- TABLAS CON ON DELETE CASCADE
-- ========================================

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
    FOREIGN KEY (codigo_empresa_FK) REFERENCES Empresa(codigo_empresa) ON DELETE CASCADE
);

CREATE TABLE RecursoHumano (
    codigo_empleado INT PRIMARY KEY,
    codigo_empresa_FK INT,
    nombre NVARCHAR(100),
    cargo NVARCHAR(100),
    tipo_contrato NVARCHAR(50),
    especialidad NVARCHAR(100),
    FOREIGN KEY (codigo_empresa_FK) REFERENCES Empresa(codigo_empresa) ON DELETE CASCADE
);

CREATE TABLE Cliente (
    codigo_cliente INT PRIMARY KEY,
    codigo_empresa_FK INT,
    nombre NVARCHAR(100),
    tipo NVARCHAR(50),
    ruc_dni NVARCHAR(20),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),
    FOREIGN KEY (codigo_empresa_FK) REFERENCES Empresa(codigo_empresa) ON DELETE CASCADE
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
    FOREIGN KEY (codigo_servicio_FK) REFERENCES Servicio(codigo_servicio) ON DELETE CASCADE
);

CREATE TABLE Recurso (
    codigo_recurso INT PRIMARY KEY,
    codigo_proceso_FK INT,
    nombre NVARCHAR(100),
    tipo NVARCHAR(50),
    uso NVARCHAR(100),
    FOREIGN KEY (codigo_proceso_FK) REFERENCES Proceso(codigo_proceso) ON DELETE CASCADE
);

CREATE TABLE Producto (
    codigo_producto INT PRIMARY KEY,
    codigo_cliente_FK INT,
    codigo_servicio_FK INT,
    nombre NVARCHAR(100),
    tipo NVARCHAR(50),
    precio_estimated DECIMAL(10,2),
    tiempo_entrega INT,
    FOREIGN KEY (codigo_cliente_FK) REFERENCES Cliente(codigo_cliente) ON DELETE CASCADE,
    FOREIGN KEY (codigo_servicio_FK) REFERENCES Servicio(codigo_servicio) ON DELETE CASCADE
);

CREATE TABLE Producto_RecursoHumano (
    codigo_producto INT,
    codigo_empleado INT,
    PRIMARY KEY (codigo_producto, codigo_empleado),
    FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo_producto) ON DELETE CASCADE,
    FOREIGN KEY (codigo_empleado) REFERENCES RecursoHumano(codigo_empleado) ON DELETE CASCADE
);

-- ========================================
-- INSERTS
-- ========================================

-- EMPRESA
INSERT INTO Empresa VALUES
(1, 'ARQTELIER SAC', '20558648962', 'Retail especializado', 'Av. Cayma 405, Arequipa', 'Principal'),
(2, 'ARQTELIER LIMA', '20558648962', 'Retail especializado', 'Av. Larco 999, Miraflores', 'Sucursal');

-- PROVEEDOR
INSERT INTO Proveedor VALUES
(1, 1, 'Pelikano S.A.C', 'Decoración', 'contacto@pelikano.com', '123456789', '20123456789'),
(2, 1, 'San Lorenzo SRL', 'Cerámica', 'ventas@sanlorenzo.com', '987654321', '20456789123'),
(3, 2, 'Rollux Peru', 'Cortinas', 'info@rollux.pe', '999999999', '20987654321'),
(4, 2, 'Main Deco', 'Adornos', 'admin@maindeco.pe', '987321654', '20888776655'),
(5, 1, 'Trellis', 'Macetas', 'ventas@trellis.pe', '964782341', '20334455667');

-- RECURSO HUMANO (20)
INSERT INTO RecursoHumano VALUES
(1, 1, 'Andrea Torres', 'Diseñadora de interiores', 'Tiempo completo', 'Decoración'),
(2, 1, 'Luis Gómez', 'Arquitecto', 'Medio tiempo', 'Arquitectura'),
(3, 2, 'Carlos Díaz', 'Logística', 'Tiempo completo', 'Almacén'),
(4, 2, 'Jorge Mendoza', 'Ventas', 'Tiempo completo', 'Tienda'),
(5, 1, 'Karla Salas', 'Diseñadora', 'Freelance', 'Diseño gráfico'),
(6, 1, 'Julio Rivas', 'Atención al cliente', 'Tiempo completo', 'Ventas'),
(7, 2, 'Fiorella Meza', 'Marketing', 'Tiempo completo', 'Publicidad'),
(8, 1, 'Ana Soto', 'Diseño mobiliario', 'Freelance', 'Carpintería'),
(9, 2, 'Marco Vera', 'Contabilidad', 'Tiempo completo', 'Administración'),
(10, 2, 'Tatiana Ruiz', 'Diseñadora', 'Freelance', 'Iluminación'),
(11, 1, 'Roberto Chávez', 'Arquitecto', 'Tiempo completo', 'Diseño arquitectónico'),
(12, 2, 'Laura Ramos', 'Gerente', 'Tiempo completo', 'Dirección'),
(13, 2, 'Jimena Gómez', 'Diseño interior', 'Tiempo completo', 'Decoración'),
(14, 1, 'Daniel Ureta', 'Asistente', 'Medio tiempo', 'Soporte técnico'),
(15, 1, 'Patricia Quispe', 'Ventas', 'Freelance', 'Exhibición'),
(16, 2, 'Ricardo Torres', 'Supervisor', 'Tiempo completo', 'Supervisión'),
(17, 2, 'Sara Zúñiga', 'Diseñadora', 'Medio tiempo', 'Murales'),
(18, 1, 'Fernando Lagos', 'Coordinador', 'Tiempo completo', 'Obras'),
(19, 2, 'Emilia Farfán', 'Logística', 'Tiempo completo', 'Almacén'),
(20, 1, 'Víctor Vidal', 'Diseño digital', 'Freelance', '3D y renders');

-- CLIENTE (10)
INSERT INTO Cliente VALUES
(1, 1, 'María García', 'Persona Natural', '45678912', 'maria@gmail.com', '958745632'),
(2, 1, 'Estudio Montes', 'Empresa', '20567891234', 'contacto@montes.pe', '989898989'),
(3, 2, 'Luz Silva', 'Persona Natural', '78945612', 'luz@gmail.com', '912345678'),
(4, 2, 'Constructora Nova', 'Empresa', '20981237654', 'info@nova.pe', '923456789'),
(5, 1, 'Roberto Paredes', 'Persona Natural', '45678931', 'roberto@gmail.com', '978321456'),
(6, 2, 'ArquiLima', 'Empresa', '20988765432', 'ventas@arquilima.pe', '963258741'),
(7, 1, 'Lucía Navarro', 'Persona Natural', '41236578', 'lucia@gmail.com', '956412378'),
(8, 2, 'Estudio Vértice', 'Empresa', '20321456789', 'estudio@vertice.pe', '999222333'),
(9, 1, 'Carmen Torres', 'Persona Natural', '42315467', 'carmen@gmail.com', '912121212'),
(10, 1, 'Eduardo Lozano', 'Persona Natural', '45678901', 'eduardo@gmail.com', '955554444');

-- SERVICIO (5)
INSERT INTO Servicio VALUES
(1, 'Diseño de Interiores', 'Asesoramiento personalizado para el hogar', 1200.00),
(2, 'Diseño Arquitectónico', 'Planificación de espacios y estructuras', 2200.00),
(3, 'Decoración de Oficinas', 'Mobiliario y ambientación para oficinas', 1600.00),
(4, 'Venta de productos', 'Artículos de decoración y mobiliario', 500.00),
(5, 'Talleres Creativos', 'Capacitación en decoración y diseño', 300.00);

-- PROCESO (5)
INSERT INTO Proceso VALUES
(1, 1, 'Análisis del espacio', 'Evaluación del espacio y necesidades', 'Diseño'),
(2, 2, 'Dibujo de planos', 'Generación de planos técnicos', 'Arquitectura'),
(3, 3, 'Selección de productos', 'Elección de mobiliario y accesorios', 'Ventas'),
(4, 4, 'Inventario', 'Gestión de stock de productos', 'Logística'),
(5, 5, 'Organización del taller', 'Coordinación del evento', 'Eventos');

-- RECURSO (5)
INSERT INTO Recurso VALUES
(1, 1, 'Cinta métrica', 'Herramienta', 'Medición de espacios'),
(2, 2, 'AutoCAD', 'Software', 'Diseño de planos'),
(3, 3, 'Catálogo de productos', 'Documento', 'Selección de artículos'),
(4, 4, 'Sistema TISI360', 'Software', 'Control de inventario'),
(5, 5, 'Materiales para taller', 'Material', 'Realización de actividades');

-- PRODUCTO (10)
INSERT INTO Producto VALUES
(1, 1, 1, 'Proyecto Sala Moderna', 'Interior', 4500.00, 15),
(2, 2, 2, 'Diseño Casa Minimalista', 'Arquitectura', 8000.00, 30),
(3, 3, 3, 'Oficina Open Space', 'Decoración', 3200.00, 12),
(4, 4, 4, 'Compra de Adornos', 'Producto', 850.00, 5),
(5, 5, 5, 'Taller de Diseño', 'Capacitación', 300.00, 2),
(6, 6, 1, 'Proyecto Cocina', 'Interior', 5000.00, 20),
(7, 7, 2, 'Remodelación Loft', 'Arquitectura', 9200.00, 40),
(8, 8, 3, 'Deco Estilo Nórdico', 'Decoración', 2700.00, 10),
(9, 9, 4, 'Set de Velas y Adornos', 'Producto', 400.00, 3),
(10, 10, 5, 'Workshop Express', 'Capacitación', 200.00, 1);

-- PRODUCTO_RECURSOHUMANO (relación muchos a muchos)
INSERT INTO Producto_RecursoHumano VALUES
(1, 1), (1, 5), (2, 2), (3, 4), (4, 6),
(5, 14), (6, 7), (7, 11), (8, 13), (9, 20),
(10, 8), (2, 9), (3, 3), (4, 15), (5, 18);

-- ========================================
-- ALTER TABLE (ejemplo de modificación)
-- ========================================
ALTER TABLE Servicio ADD duracion_estimada INT;

-- ========================================
-- UPDATE Y SET (cambio de datos)
-- ========================================
UPDATE Servicio SET duracion_estimada = 30 WHERE codigo_servicio = 1;
UPDATE Cliente SET correo = 'nuevo_correo@gmail.com' WHERE codigo_cliente = 5;

-- ========================================
-- CONSULTAS (ORDER BY, WHERE, AS)
-- ========================================
SELECT nombre AS NombreServicio, precio_base FROM Servicio ORDER BY precio_base DESC;
SELECT nombre AS Cliente, correo FROM Cliente WHERE tipo = 'Persona Natural';
SELECT nombre AS Producto, precio_estimated FROM Producto WHERE precio_estimated > 3000 ORDER BY precio_estimated;
