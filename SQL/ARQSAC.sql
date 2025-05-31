CREATE DATABASE SACARQ

USE SACARQ


-- ===================== TABLAS DE APOYO =====================

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

-- Tipo de recurso
CREATE TABLE TipoRecurso (
    id_tipo_recurso INT PRIMARY KEY,
    tipo NVARCHAR(50)
);


-- ===================== TABLAS PRINCIPALES =====================

-- Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    id_tipo_cliente INT,
    ruc_dni NVARCHAR(20),
    correo NVARCHAR(100),
    telefono NVARCHAR(20),

    CONSTRAINT FK_Cliente_Tipo FOREIGN KEY (id_tipo_cliente)
    REFERENCES TipoCliente(id_tipo_cliente)
);



-- Empleado
CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    id_cargo INT,
    id_tipo_contrato INT,
    id_especialidad INT,

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
    id_orden INT PRIMARY KEY,
	id_servicio INT NOT NULL,
    id_cliente INT NOT NULL,
    fecha_solicitud DATE DEFAULT GETDATE(),
    precio_estimated DECIMAL(10,2),
    tiempo_entrega INT,
	estado NVARCHAR(50) DEFAULT 'Pendiente'

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



--DATOS PARA LAS TABLAS

-- Cargo
INSERT INTO Cargo (id_cargo, nombre) VALUES
(1, 'Arquitecto'),
(2, 'Ingeniero Civil'),
(3, 'Dibujante'),
(4, 'Supervisor');

-- TipoContrato
INSERT INTO TipoContrato (id_tipo_contrato, tipo) VALUES
(1, 'Tiempo Completo'),
(2, 'Medio Tiempo'),
(3, 'Por Proyecto');

-- Especialidad
INSERT INTO Especialidad (id_especialidad, nombre) VALUES
(1, 'Estructuras'),
(2, 'Instalaciones Eléctricas'),
(3, 'Diseño Arquitectónico'),
(4, 'Supervisión de Obras');

-- TipoCliente
INSERT INTO TipoCliente (id_tipo_cliente, tipo) VALUES
(1, 'Empresa'),
(2, 'Persona Natural');

-- TipoRecurso
INSERT INTO TipoRecurso (id_tipo_recurso, tipo) VALUES
(1, 'Material'),
(2, 'Herramienta'),
(3, 'Software');

-- Cliente
INSERT INTO Cliente (id_cliente, nombre, id_tipo_cliente, ruc_dni, correo, telefono) VALUES
(1, 'Constructora Andina SAC', 1, '20548712345', 'contacto@andina.com', '987654321'),
(2, 'Juan Pérez', 2, '12345678', 'jperez@gmail.com', '912345678'),
(3, 'Innovatech SRL', 1, '20654871236', 'info@innovatech.pe', '998877665');

-- Empleado
INSERT INTO Empleado (id_empleado, nombre, id_cargo, id_tipo_contrato, id_especialidad) VALUES
(1, 'Carlos Rodríguez', 1, 1, 3),
(2, 'Lucía Torres', 2, 2, 1),
(3, 'Ana Mejía', 3, 3, 2),
(4, 'Fernando Salazar', 4, 1, 4);

-- Servicio
INSERT INTO Servicio (id_servicio, nombre, descripcion, precio_base) VALUES
(1, 'Diseño Arquitectónico', 'Servicio de diseño de planos arquitectónicos', 5000.00),
(2, 'Supervisión de Obra', 'Supervisión técnica de obras civiles', 3000.00),
(3, 'Instalaciones Eléctricas', 'Diseño y ejecución de instalaciones eléctricas', 4000.00);

-- Proceso
INSERT INTO Proceso (id_proceso, id_servicio, nombre, descripcion, area_responsable) VALUES
(1, 1, 'Levantamiento de Requisitos', 'Recolección de necesidades del cliente', 'Diseño'),
(2, 1, 'Modelado 3D', 'Creación de modelos 3D en software CAD', 'Diseño'),
(3, 2, 'Inspección de Materiales', 'Verificación de calidad de materiales', 'Supervisión'),
(4, 3, 'Instalación de Tableros', 'Montaje y conexión de tableros eléctricos', 'Electricidad');

-- Recurso
INSERT INTO Recurso (id_recurso, id_proceso, nombre, id_tipo_recurso, uso) VALUES
(1, 1, 'Cuaderno de Requisitos', 1, 'Documentar requerimientos'),
(2, 2, 'AutoCAD', 3, 'Modelado arquitectónico'),
(3, 3, 'Medidor de Humedad', 2, 'Verificación de materiales'),
(4, 4, 'Tablero Eléctrico', 1, 'Instalación en obra');

-- Orden de Servicio
INSERT INTO OrdenServicio (id_orden, id_servicio, id_cliente, fecha_solicitud, precio_estimated, tiempo_entrega, estado) VALUES
(1, 1, 1, '2025-05-01', 5200.00, 15, 'Pendiente'),
(2, 2, 2, '2025-05-10', 3100.00, 10, 'En Proceso'),
(3, 3, 3, '2025-05-15', 4000.00, 12, 'Completado');

-- ServicioEmpleado
INSERT INTO ServicioEmpleado (id_servicio, id_empleado) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 2);



--INDICES 

-- Índices para tablas de apoyo
CREATE INDEX idx_Cargo_nombre ON Cargo(nombre);
CREATE INDEX idx_TipoContrato_tipo ON TipoContrato(tipo);
CREATE INDEX idx_Especialidad_nombre ON Especialidad(nombre);
CREATE INDEX idx_TipoCliente_tipo ON TipoCliente(tipo);
CREATE INDEX idx_TipoRecurso_tipo ON TipoRecurso(tipo);

-- Índices en Cliente
CREATE INDEX idx_Cliente_nombre ON Cliente(nombre);
CREATE INDEX idx_Cliente_correo ON Cliente(correo);
CREATE INDEX idx_Cliente_id_tipo_cliente ON Cliente(id_tipo_cliente);

-- Índices en Empleado
CREATE INDEX idx_Empleado_nombre ON Empleado(nombre);
CREATE INDEX idx_Empleado_id_cargo ON Empleado(id_cargo);
CREATE INDEX idx_Empleado_id_especialidad ON Empleado(id_especialidad);

-- Índices en Servicio
CREATE INDEX idx_Servicio_nombre ON Servicio(nombre);

-- Índices en Proceso
CREATE INDEX idx_Proceso_id_servicio ON Proceso(id_servicio);

-- Índices en Recurso
CREATE INDEX idx_Recurso_id_proceso ON Recurso(id_proceso);
CREATE INDEX idx_Recurso_id_tipo_recurso ON Recurso(id_tipo_recurso);

-- Índices en OrdenServicio
CREATE INDEX idx_OrdenServicio_id_cliente ON OrdenServicio(id_cliente);
CREATE INDEX idx_OrdenServicio_estado ON OrdenServicio(estado);
CREATE INDEX idx_OrdenServicio_fecha_solicitud ON OrdenServicio(fecha_solicitud);

-- Índices en ServicioEmpleado
CREATE INDEX idx_ServicioEmpleado_id_empleado ON ServicioEmpleado(id_empleado);



--CONSULTAS 

--1. Listar todos los clientes con su tipo
SELECT c.id_cliente, c.nombre, tc.tipo AS tipo_cliente
FROM Cliente c
JOIN TipoCliente tc ON c.id_tipo_cliente = tc.id_tipo_cliente;

--2. Ver empleados con su cargo, tipo de contrato y especialidad
SELECT e.id_empleado, e.nombre, ca.nombre AS cargo, tc.tipo AS tipo_contrato, es.nombre AS especialidad
FROM Empleado e
JOIN Cargo ca ON e.id_cargo = ca.id_cargo
JOIN TipoContrato tc ON e.id_tipo_contrato = tc.id_tipo_contrato
JOIN Especialidad es ON e.id_especialidad = es.id_especialidad;

--3. Mostrar los servicios ofrecidos con su precio base
SELECT id_servicio, nombre, descripcion, precio_base
FROM Servicio;

--4. Ver todos los procesos por servicio
SELECT s.nombre AS servicio, p.nombre AS proceso, p.descripcion, p.area_responsable
FROM Proceso p
JOIN Servicio s ON p.id_servicio = s.id_servicio
ORDER BY s.nombre, p.nombre;

--5. Obtener órdenes de servicio activas (estado ≠ 'Completado')
SELECT os.id_orden, c.nombre AS cliente, s.nombre AS servicio, os.fecha_solicitud, os.estado
FROM OrdenServicio os
JOIN Cliente c ON os.id_cliente = c.id_cliente
JOIN Servicio s ON os.id_servicio = s.id_servicio
WHERE os.estado <> 'Completado';

--6. Servicios y empleados asignados
SELECT s.nombre AS servicio, e.nombre AS empleado
FROM ServicioEmpleado se
JOIN Servicio s ON se.id_servicio = s.id_servicio
JOIN Empleado e ON se.id_empleado = e.id_empleado
ORDER BY s.nombre;

--7. Órdenes de servicio entre fechas
SELECT id_orden, fecha_solicitud, estado
FROM OrdenServicio
WHERE fecha_solicitud BETWEEN '2025-05-01' AND '2025-05-31';

--8. Cantidad de órdenes por estado
SELECT estado, COUNT(*) AS total
FROM OrdenServicio
GROUP BY estado;

--9. Total de órdenes por cliente
SELECT c.nombre, COUNT(*) AS total_ordenes
FROM OrdenServicio os
JOIN Cliente c ON os.id_cliente = c.id_cliente
GROUP BY c.nombre;


--FUNCIONES ESCALARES
--1. Obtener el nombre completo del cliente a partir de su ID
CREATE FUNCTION fn_ObtenerNombreCliente (@id_cliente INT)
RETURNS NVARCHAR(100)
AS
BEGIN
DECLARE @nombre NVARCHAR(100)
SELECT @nombre = nombre
FROM Cliente
WHERE id_cliente = @id_cliente
RETURN @nombre
END;

--2. Calcular el precio final estimado con un 18% de IGV
CREATE FUNCTION fn_PrecioFinalConIGV (@precio_base DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
RETURN @precio_base * 1.18
END;

--3. Obtener todos los servicios asignados a un empleado específico
CREATE FUNCTION fn_ServiciosPorEmpleado (@id_empleado INT)
RETURNS TABLE
AS
RETURN (
SELECT s.id_servicio, s.nombre, s.descripcion
FROM ServicioEmpleado se
JOIN Servicio s ON se.id_servicio = s.id_servicio
WHERE se.id_empleado = @id_empleado
);

--4. Lista de órdenes por cliente con estado 'Pendiente'
CREATE FUNCTION fn_OrdenesPendientesCliente (@id_cliente INT)
RETURNS TABLE
AS
RETURN (
SELECT id_orden, fecha_solicitud, precio_estimated, estado
FROM OrdenServicio
WHERE id_cliente = @id_cliente AND estado = 'Pendiente'
);



--PROCEDIMIENTOS ALMACENADOS

--1. Registrar un nuevo cliente
CREATE PROCEDURE sp_RegistrarCliente
@nombre NVARCHAR(100),
@id_tipo_cliente INT,
@ruc_dni NVARCHAR(20),
@correo NVARCHAR(100),
@telefono NVARCHAR(20)
AS
BEGIN
INSERT INTO Cliente (id_cliente, nombre, id_tipo_cliente, ruc_dni, correo, telefono)
VALUES ((SELECT ISNULL(MAX(id_cliente), 0) + 1 FROM Cliente), @nombre, @id_tipo_cliente, @ruc_dni, @correo, @telefono);
END;

EXEC sp_RegistrarCliente 
@nombre = 'María López', 
@id_tipo_cliente = 2, 
@ruc_dni = '87654321', 
@correo = 'mlopez@gmail.com', 
@telefono = '999888777';

SELECT * FROM Cliente

--2. Asignar empleado a un servicio
CREATE PROCEDURE sp_AsignarEmpleadoAServicio
@id_servicio INT,
@id_empleado INT
AS
BEGIN
IF NOT EXISTS (
SELECT 1 FROM ServicioEmpleado
WHERE id_servicio = @id_servicio AND id_empleado = @id_empleado
)
BEGIN
INSERT INTO ServicioEmpleado (id_servicio, id_empleado)
VALUES (@id_servicio, @id_empleado);
END
END;

EXEC sp_AsignarEmpleadoAServicio 
@id_servicio = 3, 
@id_empleado = 1;

SELECT * FROM ServicioEmpleado
WHERE id_servicio = 3 AND id_empleado = 1;

--3. Cambiar el estado de una orden de servicio
CREATE PROCEDURE sp_ActualizarEstadoOrden
@id_orden INT,
@nuevo_estado NVARCHAR(50)
AS
BEGIN
UPDATE OrdenServicio
SET estado = @nuevo_estado
WHERE id_orden = @id_orden;
END;

EXEC sp_ActualizarEstadoOrden 
@id_orden = 1, 
@nuevo_estado = 'En Proceso';

SELECT id_orden, estado FROM OrdenServicio
WHERE id_orden = 1;

--4. Reporte de órdenes por rango de fechas
CREATE PROCEDURE sp_ReporteOrdenesPorFecha
@fecha_inicio DATE,
@fecha_fin DATE
AS
BEGIN
SELECT os.id_orden, c.nombre AS cliente, s.nombre AS servicio, os.fecha_solicitud, os.estado
FROM OrdenServicio os
JOIN Cliente c ON os.id_cliente = c.id_cliente
JOIN Servicio s ON os.id_servicio = s.id_servicio
WHERE os.fecha_solicitud BETWEEN @fecha_inicio AND @fecha_fin;
END;

EXEC sp_ReporteOrdenesPorFecha 
@fecha_inicio = '2025-05-01', 
@fecha_fin = '2025-05-31';

SELECT os.id_orden, c.nombre AS cliente, s.nombre AS servicio, os.fecha_solicitud, os.estado
FROM OrdenServicio os
JOIN Cliente c ON os.id_cliente = c.id_cliente
JOIN Servicio s ON os.id_servicio = s.id_servicio
WHERE os.fecha_solicitud BETWEEN '2025-05-01' AND '2025-05-31';

--5. Obtener lista de empleados por especialidad
CREATE PROCEDURE sp_EmpleadosPorEspecialidad
@id_especialidad INT
AS
BEGIN
SELECT id_empleado, nombre
FROM Empleado
WHERE id_especialidad = @id_especialidad;
END;

EXEC sp_EmpleadosPorEspecialidad 
@id_especialidad = 3;

SELECT id_empleado, nombre FROM Empleado
WHERE id_especialidad = 3;
