--funciones 
-- FUNCIÓN ESCALAR → Calcular precio con IGV (18%)
CREATE FUNCTION dbo.CalcularPrecioConIGV (
    @precio DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @precio * 1.18;
END;
  
  -- Ejemplo de uso
  SELECT 
    id_orden,
    precio_estimated,
    dbo.CalcularPrecioConIGV(precio_estimated) AS precio_con_igv
FROM OrdenServicio;




--FUNCIÓN DE TABLA → Empleados por especialidad
CREATE FUNCTION dbo.EmpleadosPorEspecialidad (
    @id_especialidad INT
)
RETURNS TABLE
AS
RETURN (
    SELECT 
        e.id_empleado,
        e.nombre AS empleado,
        c.nombre AS cargo
    FROM Empleado e
    JOIN Cargo c ON e.id_cargo = c.id_cargo
    WHERE e.id_especialidad = @id_especialidad
);

-- USO
SELECT * FROM dbo.EmpleadosPorEspecialidad(2);




-- FUNCIÓN DE TABLA → Órdenes por estado
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

--Ejemplo de uso 
SELECT * FROM dbo.OrdenesPorEstado('Pendiente');
