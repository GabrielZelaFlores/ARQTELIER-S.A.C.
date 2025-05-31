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

SELECT dbo.fn_PrecioFinalConIGV(5000.00) AS PrecioConIGV;


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

SELECT * FROM dbo.fn_ServiciosPorEmpleado(1);

--4. Lista de órdenes por cliente con estado 'Pendiente'
CREATE FUNCTION fn_OrdenesPendientesCliente (@id_cliente INT)
RETURNS TABLE
AS
RETURN (
SELECT id_orden, fecha_solicitud, precio_estimated, estado
FROM OrdenServicio
WHERE id_cliente = @id_cliente AND estado = 'Pendiente'
);

SELECT * FROM dbo.fn_OrdenesPendientesCliente(1);