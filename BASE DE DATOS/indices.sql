--indices 
-- Índice para buscar órdenes por cliente
CREATE NONCLUSTERED INDEX IX_OrdenServicio_id_cliente
ON OrdenServicio(id_cliente);

-- Índice para filtrar órdenes por estado
CREATE NONCLUSTERED INDEX IX_OrdenServicio_estado
ON OrdenServicio(estado);

-- Índice para buscar empleados por especialidad
CREATE NONCLUSTERED INDEX IX_Empleado_id_especialidad
ON Empleado(id_especialidad);

-- Índice para filtrar recursos por tipo
CREATE NONCLUSTERED INDEX IX_Recurso_id_tipo_recurso
ON Recurso(id_tipo_recurso);

-- Índice compuesto para saber qué empleados trabajan en qué servicio
CREATE NONCLUSTERED INDEX IX_ServicioEmpleado_id_servicio_empleado
ON ServicioEmpleado(id_servicio, id_empleado);

-- Índice para buscar clientes por RUC o DNI
CREATE NONCLUSTERED INDEX IX_Cliente_ruc_dni
ON Cliente(ruc_dni);
