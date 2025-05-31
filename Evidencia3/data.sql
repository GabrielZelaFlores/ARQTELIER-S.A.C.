-- Cargo
INSERT INTO Cargo (id_cargo, nombre) VALUES
(1, 'Dise�ador de Interiores'),
(2, 'Supervisor de Proyecto'),
(3, 'T�cnico Instalador'),
(4, 'Asesor de Cliente'),
(5, 'Gerente de Servicios');

-- TipoContrato
INSERT INTO TipoContrato (id_tipo_contrato, tipo) VALUES
(1, 'Tiempo Completo'),
(2, 'Medio Tiempo'),
(3, 'Freelancer'),
(4, 'Contrato Temporal');

-- Especialidad
INSERT INTO Especialidad (id_especialidad, nombre) VALUES
(1, 'Iluminaci�n'),
(2, 'Mobiliario'),
(3, 'Arte Mural'),
(4, 'Dise�o Espacial'),
(5, 'Restauraci�n');

-- TipoCliente
INSERT INTO TipoCliente (id_tipo_cliente, tipo) VALUES
(1, 'Particular'),
(2, 'Empresa'),
(3, 'Arquitecto Independiente');

-- TipoRecurso
INSERT INTO TipoRecurso (id_tipo_recurso, tipo) VALUES
(1, 'Herramienta'),
(2, 'Material'),
(3, 'Software'),
(4, 'Equipo');

--clientes 
INSERT INTO Cliente (id_cliente, nombre, id_tipo_cliente, ruc_dni, correo, telefono) VALUES
(1, 'Mar�a L�pez', 1, '73211456', 'mlopez@gmail.com', '987654321'),
(2, 'Decoraciones Elite SAC', 2, '20548796321', 'contacto@decorelite.pe', '012345678'),
(3, 'Juan Pérez', 1, '45678912', 'juanp@outlook.com', '956321478'),
(4, 'Estudio ArqNova', 3, '10456987123', 'info@arqnova.com', '014789654'),
(5, 'Sofía Guti�rrez', 1, '78654321', 'sofia.gutierrez@mail.com', '986321456'),
(6, 'Interiores Modernos SAC', 2, '20678912345', 'ventas@interioresmodernos.pe', '017896543'),
(7, 'Carlos Y�ñez', 1, '75214689', 'cyanez@gmail.com', '974856321'),
(8, 'ArqLine Studio', 3, '10456789234', 'proyectos@arqline.pe', '014567821'),
(9, 'Laura Torres', 1, '78541236', 'ltorres@hotmail.com', '915478632'),
(10, 'Elegancia Urbana SAC', 2, '20784512365', 'contacto@eleganciaurbana.pe', '013254687'),
(11, 'Fernando Valdez', 1, '76985214', 'fvaldez@gmail.com', '982345671'),
(12, 'Espacios Vivos', 3, '10235478965', 'espacios@vivos.com', '014523687'),
(13, 'Manuel Rojas', 1, '74185296', 'manuelr@gmail.com', '923456178'),
(14, 'DecorHaus SAC', 2, '20478596321', 'info@decorhaus.pe', '016789451');


--Empleados 
INSERT INTO Empleado (id_empleado, nombre, id_cargo, id_tipo_contrato, id_especialidad) VALUES
(1, 'Carlos Ram�rez', 1, 1, 2),
(2, 'Luc�a Fern�ndez', 2, 1, 4),
(3, 'Pedro Torres', 3, 4, 1),
(4, 'Ana Vega', 4, 2, 5),
(5, 'Luis Campos', 5, 1, 3);



-- servivios 
INSERT INTO Servicio (id_servicio, nombre, descripcion, precio_base) VALUES
(1, 'Dise�o de Interiores Premium', 'Servicio completo de ambientaci�n con asesor�a personalizada', 1500.00),
(2, 'Instalaci�n de Cuadros y Arte', 'Colocaci�n precisa y segura de obras decorativas', 400.00),
(3, 'Iluminaci�n Decorativa', 'Planeamiento e instalaci�n de soluciones de iluminaci�n elegante', 900.00),
(4, 'Consultor�a en Espacios Decorativos', 'Asesor�a remota o presencial para ambientaci�n', 600.00),
(5, 'Montaje de Muebles Premium', 'Armado e instalaci�n profesional de mobiliario', 800.00),
(6, 'Dise�o Exterior Decorativo', 'Propuestas est�ticas para fachadas y patios', 1200.00),
(7, 'Integraci�n de Tecnolog�a en el Hogar', 'Automatizaci�n de iluminaci�n y sonido', 1800.00),
(8, 'Servicio de Arte Personalizado', 'Creaci�n de cuadros �nicos por artistas locales', 2000.00),
(9, 'Restauraci�n de Piezas Antiguas', 'Reparaci�n y embellecimiento de muebles cl�sicos', 1500.00);



-- Procesos 
INSERT INTO Proceso (id_proceso, id_servicio, nombre, descripcion, area_responsable) VALUES

(1, 1, 'Visita T�cnica', 'Evaluaci�n del espacio del cliente', 'Dise�o'),
(2, 1, 'Propuesta de Dise�o', 'Entrega de boceto personalizado', 'Dise�o'),
(3, 2, 'Montaje', 'Instalaci�n en pared con nivelado', 'Instalaci�n'),
(4, 3, 'Cableado y Fijaci�n', 'Integraci�n de luces al sistema el�ctrico', 'T�cnico'),
(5, 4, 'Sesi�n de Consultor�a', 'Reuni�n inicial para conocer necesidades', 'Atenci�n al Cliente'),
(6, 4, 'An�lisis de Espacio', 'Evaluaci�n del entorno f�sico o virtual', 'Dise�o'),
(7, 5, 'Revisi�n de Piezas', 'Verificaci�n de componentes de mobiliario', 'Log�stica'),
(8, 5, 'Montaje', 'Armado y ubicaci�n final del mueble', 'Instalaci�n'),
(9, 6, 'Evaluaci�n Exterior', 'Inspecci�n de fachada y entorno', 'Dise�o'),
(10, 7, 'Integraci�n de Sistemas', 'Conexi�n de dispositivos inteligentes', 'Tecnolog�a'),
(11, 8, 'Dise�o Art�stico Personalizado', 'Boceto inicial con preferencias del cliente', 'Arte'),
(12, 8, 'Entrega y Montaje de Obra', 'Colocaci�n profesional del arte', 'Instalaci�n'),
(13, 9, 'Evaluaci�n de Da�os', 'Diagn�stico del estado de la pieza antigua', 'Restauraci�n'),
(14, 9, 'Proceso de Restauraci�n', 'Reparaci�n con t�cnicas especializadas', 'Restauraci�n');



--Recursos 
INSERT INTO Recurso (id_recurso, id_proceso, nombre, id_tipo_recurso, uso) VALUES
(1, 1, 'Medidor L�ser', 1, 'Medici�n de espacios'),
(2, 2, 'AutoCAD', 3, 'Dise�o de plano decorativo'),
(3, 3, 'Taladro Industrial', 1, 'Perforaci�n para anclaje'),
(4, 4, 'Kit de iluminaci�n LED', 2, 'Material para instalaci�n'),
(5, 5, 'Tablet con cat�logo digital', 3, 'Visualizaci�n de opciones en consultor�a'),
(6, 6, 'Plano del cliente', 3, 'Referencia del espacio en an�lisis'),
(7, 7, 'Checklist de componentes', 3, 'Validaci�n del mobiliario a ensamblar'),
(8, 8, 'Juego de herramientas manuales', 1, 'Montaje de muebles premium'),
(9, 9, 'Cinta m�trica', 1, 'Toma de medidas exteriores'),
(10, 10, 'Kit dom�tico', 2, 'Automatizaci�n de funciones del hogar'),
(11, 11, 'Lienzo y acr�licos', 2, 'Creaci�n de obra personalizada'),
(12, 12, 'Nivelador y tornillos', 2, 'Instalaci�n de obra de arte'),
(13, 13, 'Lupa t�cnica', 1, 'Revisi�n detallada de deterioros'),
(14, 14, 'Barniz restaurador', 2, 'Aplicaci�n en muebles antiguos');






--Ordenes de servicio 
INSERT INTO OrdenServicio (id_orden, id_servicio, id_cliente, precio_estimated, tiempo_entrega, estado) VALUES
(1, 1, 1, 1600.00, 10, 'En Proceso'),
(2, 3, 2, 950.00, 5, 'Pendiente'),
(3, 2, 3, 420.00, 3, 'Completado'),
(4, 1, 4, 1520.00, 9, 'Pendiente'),
(5, 2, 5, 380.00, 2, 'Completado'),
(6, 3, 6, 920.00, 6, 'En Proceso'),
(7, 1, 7, 1580.00, 10, 'En Proceso'),
(8, 2, 8, 450.00, 4, 'Pendiente'),
(9, 3, 9, 890.00, 5, 'Completado'),
(10, 1, 10, 1600.00, 8, 'Pendiente'),
(11, 2, 11, 410.00, 3, 'En Proceso'),
(12, 3, 12, 940.00, 7, 'Completado'),
(13, 1, 13, 1550.00, 10, 'Pendiente'),
(14, 2, 14, 395.00, 2, 'Pendiente');

-- ServicioEmpleado
INSERT INTO ServicioEmpleado (id_servicio, id_empleado) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5);

