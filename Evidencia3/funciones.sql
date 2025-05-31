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

SELECT dbo.fn_ObtenerNombreCliente(1) AS NombreCliente;


--2. Calcular el precio final estimado con un 18% de IGV
CREATE FUNCTION fn_PrecioFinalConIGV (@precio_base DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
RETURN @precio_base * 1.18
END;

SELECT 
    id_orden,
    precio_estimated,
    dbo.fn_PrecioFinalConIGV(precio_estimated) AS precio_con_igv
FROM OrdenServicio;



--3. Obtener todos los servicios asignados a un empleado espec�fico
CREATE FUNCTION fn_ServiciosPorEmpleado (@id_empleado INT)
RETURNS TABLE
AS
RETURN (
SELECT s.id_servicio, s.nombre, s.descripcion
FROM ServicioEmpleado se
JOIN Servicio s ON se.id_servicio = s.id_servicio
WHERE se.id_empleado = @id_empleado
);

SELECT * FROM dbo.fn_ServiciosPorEmpleado(1);

--4. FUNCIÓN DE TABLA → Órdenes por estado
CREATE FUNCTION dbo.OrdenesPorEstado (
    @estado NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
    SELECT 
        o.id_orden,
        c.nombre AS cliente,
        s.nombre AS servicio,
        o.precio_estimated,
        o.fecha_solicitud
    FROM OrdenServicio o
    JOIN Cliente c ON o.id_cliente = c.id_cliente
    JOIN Servicio s ON o.id_servicio = s.id_servicio
    WHERE o.estado = @estado
);

SELECT * FROM dbo.OrdenesPorEstado('Completado');
