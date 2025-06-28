USE master;
GO

-- Crear logins
CREATE LOGIN lector_clientes WITH PASSWORD = 'Lector123!';
CREATE LOGIN analista_rrhh WITH PASSWORD = 'RRHH123!';
CREATE LOGIN coordinador WITH PASSWORD = 'Coord123!';
GO

USE SACARQ;
GO

-- Crear usuarios en la base
CREATE USER lector_clientes FOR LOGIN lector_clientes;
CREATE USER analista_rrhh FOR LOGIN analista_rrhh;
CREATE USER coordinador FOR LOGIN coordinador;
GO

-- Otorgar permisos específicos

-- 1. lector_clientes
GRANT SELECT ON dbo.Cliente TO lector_clientes;

-- 2. analista_rrhh
GRANT SELECT, INSERT ON dbo.Empleado TO analista_rrhh;
GRANT SELECT, INSERT ON dbo.ServicioEmpleado TO analista_rrhh;
GRANT SELECT ON dbo.Cargo TO analista_rrhh;
GRANT SELECT ON dbo.TipoContrato TO analista_rrhh;

-- 3. coordinador
GRANT SELECT, INSERT, UPDATE ON dbo.Proceso TO coordinador;
GRANT SELECT, INSERT, UPDATE ON dbo.Recurso TO coordinador;
GRANT SELECT, INSERT, UPDATE ON dbo.OrdenServicio TO coordinador;

EXECUTE AS USER = 'lector_clientes';
SELECT * FROM dbo.Cliente;               
--SELECT * FROM dbo.Empleado;            
REVERT;

EXECUTE AS USER = 'analista_rrhh';
SELECT * FROM dbo.Empleado;             
INSERT INTO dbo.Empleado (id_empleado, nombre) VALUES (100, 'Juan Pérez'); 
--SELECT * FROM dbo.Cliente;              
REVERT;

EXECUTE AS USER = 'coordinador';
UPDATE dbo.Proceso SET area_responsable = 'Área A' WHERE id_proceso = 1; 
INSERT INTO dbo.OrdenServicio (id_orden, id_servicio, id_cliente, precio_estimated, tiempo_entrega)
VALUES (1, 1, 1, 1000, 7); 
--SELECT * FROM dbo.Servicio; 
REVERT;
SELECT * FROM Proceso

