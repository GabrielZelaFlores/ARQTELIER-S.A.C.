--consultas 
-- 1. Listar todas las órdenes con cliente y servicio asignado
SELECT 
    o.id_orden,
    c.nombre AS cliente,
    s.nombre AS servicio,
    o.estado,
    o.precio_estimated,
    o.fecha_solicitud
FROM OrdenServicio o
JOIN Cliente c ON o.id_cliente = c.id_cliente
JOIN Servicio s ON o.id_servicio = s.id_servicio;

-- 2. Ver todas las órdenes que están pendientes y tienen más de 7 días de entrega
SELECT 
    o.id_orden,
    c.nombre AS cliente,
    s.nombre AS servicio,
    o.tiempo_entrega
FROM OrdenServicio o
JOIN Cliente c ON o.id_cliente = c.id_cliente
JOIN Servicio s ON o.id_servicio = s.id_servicio
WHERE o.estado = 'Pendiente' AND o.tiempo_entrega > 7;

-- 3. Contar cuántas órdenes ha hecho cada cliente
SELECT 
    c.nombre AS cliente,
    COUNT(*) AS total_ordenes
FROM OrdenServicio o
JOIN Cliente c ON o.id_cliente = c.id_cliente
GROUP BY c.nombre;

-- 4. Mostrar los recursos usados en cada proceso con nombre del tipo
SELECT 
    r.nombre AS recurso,
    p.nombre AS proceso,
    tr.tipo AS tipo_recurso,
    r.uso
FROM Recurso r
JOIN Proceso p ON r.id_proceso = p.id_proceso
JOIN TipoRecurso tr ON r.id_tipo_recurso = tr.id_tipo_recurso;

-- 5. Empleados asignados a servicios, mostrando sus nombres y especialidad
SELECT 
    e.nombre AS empleado,
    es.nombre AS especialidad,
    s.nombre AS servicio
FROM ServicioEmpleado se
JOIN Empleado e ON se.id_empleado = e.id_empleado
JOIN Especialidad es ON e.id_especialidad = es.id_especialidad
JOIN Servicio s ON se.id_servicio = s.id_servicio;

-- 6. Total estimado por cliente (suma de precios)
SELECT 
    c.nombre AS cliente,
    SUM(o.precio_estimated) AS total_estimado
FROM OrdenServicio o
JOIN Cliente c ON o.id_cliente = c.id_cliente
GROUP BY c.nombre;

-- 7. Servicios más solicitados (top 5)
SELECT 
    s.nombre AS servicio,
    COUNT(o.id_orden) AS veces_solicitado
FROM OrdenServicio o
JOIN Servicio s ON o.id_servicio = s.id_servicio
GROUP BY s.nombre
ORDER BY veces_solicitado DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 8. Empleados con contrato de tipo 'Tiempo Completo'
SELECT 
    e.nombre,
    c.nombre AS cargo,
    tc.tipo AS tipo_contrato
FROM Empleado e
JOIN Cargo c ON e.id_cargo = c.id_cargo
JOIN TipoContrato tc ON e.id_tipo_contrato = tc.id_tipo_contrato
WHERE tc.tipo = 'Tiempo Completo';
