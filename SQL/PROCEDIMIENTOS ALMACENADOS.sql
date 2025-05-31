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