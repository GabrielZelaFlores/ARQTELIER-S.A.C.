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
