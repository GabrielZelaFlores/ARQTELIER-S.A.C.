--indices 
-- �ndice para buscar �rdenes por cliente
CREATE NONCLUSTERED INDEX IX_OrdenServicio_id_cliente
ON OrdenServicio(id_cliente);

-- �ndice para filtrar �rdenes por estado
CREATE NONCLUSTERED INDEX IX_OrdenServicio_estado
ON OrdenServicio(estado);

-- �ndice para buscar empleados por especialidad
CREATE NONCLUSTERED INDEX IX_Empleado_id_especialidad
ON Empleado(id_especialidad);

-- �ndice para filtrar recursos por tipo
CREATE NONCLUSTERED INDEX IX_Recurso_id_tipo_recurso
ON Recurso(id_tipo_recurso);

-- �ndice compuesto para saber qu� empleados trabajan en qu� servicio
CREATE NONCLUSTERED INDEX IX_ServicioEmpleado_id_servicio_empleado
ON ServicioEmpleado(id_servicio, id_empleado);

-- �ndice para buscar clientes por RUC o DNI
CREATE NONCLUSTERED INDEX IX_Cliente_ruc_dni
ON Cliente(ruc_dni);
