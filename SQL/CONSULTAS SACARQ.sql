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