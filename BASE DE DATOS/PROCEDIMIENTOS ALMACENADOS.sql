--PROCEDIMIENTOS ALMACENADOS


--1. Insertar una nueva orden de servicio
CREATE PROCEDURE InsertarOrdenServicio
    @id_servicio INT,
    @id_cliente INT,
    @precio_estimated DECIMAL(10,2),
    @tiempo_entrega INT,
    @estado NVARCHAR(50) = 'Pendiente'
AS
BEGIN
    INSERT INTO OrdenServicio (id_servicio, id_cliente, precio_estimated, tiempo_entrega, estado)
    VALUES (@id_servicio, @id_cliente, @precio_estimated, @tiempo_entrega, @estado);
END;

--Uso 
EXEC InsertarOrdenServicio 3, 6, 980.00, 5, 'Pendiente';



--2 Consultar detalle completo de una orden
CREATE PROCEDURE ObtenerDetalleOrden
    @id_orden INT
AS
BEGIN
    SELECT 
        o.id_orden,
        c.nombre AS cliente,
        s.nombre AS servicio,
        o.estado,
        o.precio_estimated,
        o.fecha_solicitud,
        o.tiempo_entrega
    FROM OrdenServicio o
    JOIN Cliente c ON o.id_cliente = c.id_cliente
    JOIN Servicio s ON o.id_servicio = s.id_servicio
    WHERE o.id_orden = @id_orden;
END;

--uso 
EXEC ObtenerDetalleOrden @id_orden = 1;
 



 --3 Buscar empleados por contrato y especialidad 
 CREATE PROCEDURE BuscarEmpleados
    @id_tipo_contrato INT,
    @id_especialidad INT
AS
BEGIN
    SELECT 
        e.id_empleado,
        e.nombre,
        c.nombre AS cargo,
        es.nombre AS especialidad,
        tc.tipo AS tipo_contrato
    FROM Empleado e
    JOIN Cargo c ON e.id_cargo = c.id_cargo
    JOIN Especialidad es ON e.id_especialidad = es.id_especialidad
    JOIN TipoContrato tc ON e.id_tipo_contrato = tc.id_tipo_contrato
    WHERE e.id_tipo_contrato = @id_tipo_contrato
      AND e.id_especialidad = @id_especialidad;
END;
-- Uso 
EXEC BuscarEmpleados @id_tipo_contrato = 1, @id_especialidad = 3;



--4 Listar servicios con sus procesos y área responsable
CREATE PROCEDURE VerServiciosConProcesos
AS
BEGIN
    SELECT 
        s.nombre AS servicio,
        p.nombre AS proceso,
        p.area_responsable
    FROM Servicio s
    JOIN Proceso p ON s.id_servicio = p.id_servicio
    ORDER BY s.nombre;
END;

--uso 
EXEC VerServiciosConProcesos;

