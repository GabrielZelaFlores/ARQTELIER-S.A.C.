--PROCEDIMIENTOS ALMACENADOS

--1. Registrar un nuevo cliente
CREATE OR ALTER PROCEDURE usp_RegistrarCliente
    @nombre NVARCHAR(100),
    @id_tipo_cliente INT,
    @ruc_dni NVARCHAR(20),
    @correo NVARCHAR(100),
    @telefono NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validación de tipo de cliente
        IF NOT EXISTS (SELECT 1 FROM TipoCliente WHERE id_tipo_cliente = @id_tipo_cliente)
        BEGIN
            RAISERROR('Error: Tipo de cliente no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Validación de unicidad de RUC/DNI
        IF EXISTS (SELECT 1 FROM Cliente WHERE ruc_dni = @ruc_dni)
        BEGIN
            RAISERROR('Error: Ya existe un cliente con el mismo RUC/DNI.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Inserción del nuevo cliente
        DECLARE @NuevoID INT = (SELECT ISNULL(MAX(id_cliente), 0) + 1 FROM Cliente);

        INSERT INTO Cliente (
            id_cliente, nombre, id_tipo_cliente, ruc_dni, correo, telefono
        )
        VALUES (
            @NuevoID, @nombre, @id_tipo_cliente, @ruc_dni, @correo, @telefono
        );

        COMMIT TRANSACTION;
        PRINT 'Éxito: Cliente registrado correctamente.';
		SELECT * FROM Cliente
		ORDER BY id_cliente DESC

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error al registrar cliente: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO


EXEC usp_RegistrarCliente 
@nombre = 'Maria Lopez', 
@id_tipo_cliente = 2, 
@ruc_dni = '77154321', 
@correo = 'mlopez@gmail.com', 
@telefono = '999888777';



--2. Asignar empleado a un servicio
CREATE OR ALTER PROCEDURE usp_AsignarEmpleadoAServicio
    @id_servicio INT,
    @id_empleado INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validación de existencia del servicio
        IF NOT EXISTS (SELECT 1 FROM Servicio WHERE id_servicio = @id_servicio)
        BEGIN
            RAISERROR('Error: El servicio especificado no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Validación de existencia del empleado
        IF NOT EXISTS (SELECT 1 FROM Empleado WHERE id_empleado = @id_empleado)
        BEGIN
            RAISERROR('Error: El empleado especificado no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Validación de asignación existente
        IF EXISTS (
            SELECT 1 FROM ServicioEmpleado
            WHERE id_servicio = @id_servicio AND id_empleado = @id_empleado
        )
        BEGIN
            RAISERROR('Error: El empleado ya está asignado a este servicio.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Inserción de la asignación
        INSERT INTO ServicioEmpleado (id_servicio, id_empleado)
        VALUES (@id_servicio, @id_empleado);

        COMMIT TRANSACTION;
        PRINT 'Éxito: Empleado asignado al servicio correctamente.';
		
		-- Mostrar la asignación
		SELECT s.id_servicio,e.id_empleado,e.nombre,s.nombre,s.descripcion,s.precio_base
		FROM ServicioEmpleado se
		JOIN Empleado e  ON e.id_empleado = se.id_empleado
		JOIN Servicio s  ON s.id_servicio = se.id_servicio
		WHERE e.id_empleado = @id_empleado
		ORDER BY e.id_empleado
    
	END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error al asignar empleado a servicio: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO


EXEC usp_AsignarEmpleadoAServicio 
@id_servicio = 2, 
@id_empleado = 1;



--3. Cambiar el estado de una orden de servicio
CREATE OR ALTER PROCEDURE usp_ActualizarEstadoOrden
    @id_orden INT,
    @nuevo_estado NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validación de existencia de la orden
        IF NOT EXISTS (SELECT 1 FROM OrdenServicio WHERE id_orden = @id_orden)
        BEGIN
            RAISERROR('Error: La orden de servicio no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Validación de estado permitido 
         IF @nuevo_estado NOT IN ('Pendiente', 'En Proceso', 'Finalizado', 'Cancelado')
         BEGIN
             RAISERROR('Error: Estado no permitido.', 16, 1);
             ROLLBACK TRANSACTION;
             RETURN;
         END

        -- Actualización del estado
        UPDATE OrdenServicio
        SET estado = @nuevo_estado
        WHERE id_orden = @id_orden;
		
		SELECT * FROM OrdenServicio
		WHERE estado = @nuevo_estado
		ORDER BY id_orden 

        COMMIT TRANSACTION;
        PRINT 'Éxito: Estado de la orden actualizado correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error al actualizar el estado de la orden: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO

EXEC usp_ActualizarEstadoOrden 
@id_orden = 1, 
@nuevo_estado = 'En Proceso';


--4. Reporte de Ordenes por rango de fechas
CREATE PROCEDURE usp_ReporteOrdenesPorFecha
    @fecha_inicio DATE,
    @fecha_fin DATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validación de rango de fechas
        IF @fecha_inicio IS NULL OR @fecha_fin IS NULL
        BEGIN
            RAISERROR('Error: Las fechas no pueden ser nulas.', 16, 1);
            RETURN;
        END

        IF @fecha_inicio > @fecha_fin
        BEGIN
            RAISERROR('Error: La fecha de inicio no puede ser mayor que la fecha de fin.', 16, 1);
            RETURN;
        END

        -- Consulta del reporte
        SELECT 
            os.id_orden, 
            c.nombre AS cliente, 
            s.nombre AS servicio, 
            os.fecha_solicitud, 
            os.estado
        FROM OrdenServicio os
        JOIN Cliente c ON os.id_cliente = c.id_cliente
        JOIN Servicio s ON os.id_servicio = s.id_servicio
        WHERE os.fecha_solicitud BETWEEN @fecha_inicio AND @fecha_fin
        ORDER BY os.fecha_solicitud;

        PRINT 'Éxito: Reporte generado correctamente.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error al generar el reporte: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO

EXEC usp_ReporteOrdenesPorFecha 
@fecha_inicio = '2025-05-01', 
@fecha_fin = '2025-07-31';



--5. Obtener lista de empleados por especialidad
CREATE OR ALTER PROCEDURE usp_EmpleadosPorEspecialidad
    @id_especialidad INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validación de existencia de la especialidad
        IF NOT EXISTS (SELECT 1 FROM Especialidad WHERE id_especialidad = @id_especialidad)
        BEGIN
            RAISERROR('Error: La especialidad especificada no existe.', 16, 1);
            RETURN;
        END

        -- Consulta de empleados por especialidad
        SELECT *
        FROM Empleado
        WHERE id_especialidad = @id_especialidad;

        PRINT 'Éxito: Lista de empleados obtenida correctamente.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error al obtener empleados por especialidad: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO

EXEC usp_EmpleadosPorEspecialidad 
@id_especialidad = 3;


