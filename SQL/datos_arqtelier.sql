USE ARQTELIER;

-- EMPRESA
INSERT INTO Empresa VALUES
(1, 'ARQTELIER SAC', '20558648962', 'Retail especializado', 'Av. Cayma 405, Arequipa', 'Principal'),
(2, 'ARQTELIER LIMA', '20558648962', 'Retail especializado', 'Av. Larco 999, Miraflores', 'Sucursal');

-- PROVEEDOR
INSERT INTO Proveedor VALUES
(1, 1, 'Pelikano S.A.C', 'Decoración', 'contacto@pelikano.com', '123456789', '20123456789'),
(2, 1, 'San Lorenzo SRL', 'Cerámica', 'ventas@sanlorenzo.com', '987654321', '20456789123'),
(3, 2, 'Rollux Peru', 'Cortinas', 'info@rollux.pe', '999999999', '20987654321'),
(4, 2, 'Main Deco', 'Adornos', 'admin@maindeco.pe', '987321654', '20888776655'),
(5, 1, 'Trellis', 'Macetas', 'ventas@trellis.pe', '964782341', '20334455667');

-- EMPLEADO 
INSERT INTO Empleado VALUES
(1, 1, 'Andrea Torres', 'Diseñadora de interiores', 'Tiempo completo', 'Decoración'),
(2, 1, 'Luis Gómez', 'Arquitecto', 'Medio tiempo', 'Arquitectura'),
(3, 2, 'Carlos Díaz', 'Logística', 'Tiempo completo', 'Almacén'),
(4, 2, 'Jorge Mendoza', 'Ventas', 'Tiempo completo', 'Tienda'),
(5, 1, 'Karla Salas', 'Diseñadora', 'Freelance', 'Diseño gráfico'),
(6, 1, 'Julio Rivas', 'Atención al cliente', 'Tiempo completo', 'Ventas'),
(7, 2, 'Fiorella Meza', 'Marketing', 'Tiempo completo', 'Publicidad'),
(8, 1, 'Ana Soto', 'Diseño mobiliario', 'Freelance', 'Carpintería'),
(9, 2, 'Marco Vera', 'Contabilidad', 'Tiempo completo', 'Administración'),
(10, 2, 'Tatiana Ruiz', 'Diseñadora', 'Freelance', 'Iluminación'),
(11, 1, 'Roberto Chávez', 'Arquitecto', 'Tiempo completo', 'Diseño arquitectónico'),
(12, 2, 'Laura Ramos', 'Gerente', 'Tiempo completo', 'Dirección'),
(13, 2, 'Jimena Gómez', 'Diseño interior', 'Tiempo completo', 'Decoración'),
(14, 1, 'Daniel Ureta', 'Asistente', 'Medio tiempo', 'Soporte técnico'),
(15, 1, 'Patricia Quispe', 'Ventas', 'Freelance', 'Exhibición'),
(16, 2, 'Ricardo Torres', 'Supervisor', 'Tiempo completo', 'Supervisión'),
(17, 2, 'Sara Zúñiga', 'Diseñadora', 'Medio tiempo', 'Murales'),
(18, 1, 'Fernando Lagos', 'Coordinador', 'Tiempo completo', 'Obras'),
(19, 2, 'Emilia Farfán', 'Logística', 'Tiempo completo', 'Almacén'),
(20, 1, 'Víctor Vidal', 'Diseño digital', 'Freelance', '3D y renders');

-- CLIENTE 
INSERT INTO Cliente VALUES
(1, 1, 'María García', 'Persona Natural', '45678912', 'maria@gmail.com', '958745632'),
(2, 1, 'Estudio Montes', 'Empresa', '20567891234', 'contacto@montes.pe', '989898989'),
(3, 2, 'Luz Silva', 'Persona Natural', '78945612', 'luz@gmail.com', '912345678'),
(4, 2, 'Constructora Nova', 'Empresa', '20981237654', 'info@nova.pe', '923456789'),
(5, 1, 'Roberto Paredes', 'Persona Natural', '45678931', 'roberto@gmail.com', '978321456'),
(6, 2, 'ArquiLima', 'Empresa', '20988765432', 'ventas@arquilima.pe', '963258741'),
(7, 1, 'Lucía Navarro', 'Persona Natural', '41236578', 'lucia@gmail.com', '956412378'),
(8, 2, 'Estudio Vértice', 'Empresa', '20321456789', 'estudio@vertice.pe', '999222333'),
(9, 1, 'Carmen Torres', 'Persona Natural', '42315467', 'carmen@gmail.com', '912121212'),
(10, 1, 'Eduardo Lozano', 'Persona Natural', '45678901', 'eduardo@gmail.com', '955554444');

-- SERVICIO 
INSERT INTO Servicio VALUES
(1, 'Diseño de Interiores', 'Asesoramiento personalizado para el hogar', 1200.00),
(2, 'Diseño Arquitectónico', 'Planificación de espacios y estructuras', 2200.00),
(3, 'Decoración de Oficinas', 'Mobiliario y ambientación para oficinas', 1600.00),
(4, 'Venta de productos', 'Artículos de decoración y mobiliario', 500.00),
(5, 'Talleres Creativos', 'Capacitación en decoración y diseño', 300.00);

-- PROCESO 
INSERT INTO Proceso VALUES
(1, 1, 'Análisis del espacio', 'Evaluación del espacio y necesidades', 'Diseño'),
(2, 2, 'Dibujo de planos', 'Generación de planos técnicos', 'Arquitectura'),
(3, 3, 'Selección de productos', 'Elección de mobiliario y accesorios', 'Ventas'),
(4, 4, 'Inventario', 'Gestión de stock de productos', 'Logística'),
(5, 5, 'Organización del taller', 'Coordinación del evento', 'Eventos');

-- RECURSO
INSERT INTO Recurso VALUES
(1, 1, 'Cinta métrica', 'Herramienta', 'Medición de espacios'),
(2, 2, 'AutoCAD', 'Software', 'Diseño de planos'),
(3, 3, 'Catálogo de productos', 'Documento', 'Selección de artículos'),
(4, 4, 'Sistema TISI360', 'Software', 'Control de inventario'),
(5, 5, 'Materiales para taller', 'Material', 'Realización de actividades');

-- PRODUCTO 
INSERT INTO Producto (id_proveedor, nombre, tipo, precio_compra, precio_venta, stock) VALUES
(1, 'Escultura Moderna de Bronce', 'Escultura', 850.00, 1500.00, 8),
(1, 'Espejo Ovalado con Marco Dorado', 'Espejo', 320.00, 650.00, 15),
(1, 'Cuadro Abstracto Grande', 'Cuadro', 280.00, 550.00, 12),
(2, 'Jarrón Cerámico Artesanal', 'Decoración', 180.00, 350.00, 20),
(2, 'Set de 3 Figuras Geométricas', 'Escultura', 220.00, 450.00, 10),
(2, 'Espejo Circular con Mosaico', 'Espejo', 190.00, 380.00, 8),
(3, 'Lámpara Colgante Moderna', 'Iluminación', 420.00, 850.00, 6),
(3, 'Candelabro de Cristal', 'Iluminación', 380.00, 750.00, 5),
(3, 'Alfombra Persa 2x3m', 'Textil', 550.00, 1200.00, 4),
(4, 'Mesa Auxiliar de Mármol', 'Mueble', 680.00, 1400.00, 7),
(4, 'Set de 4 Cojines Decorativos', 'Textil', 120.00, 280.00, 25),
(4, 'Portavelas de Metal', 'Decoración', 65.00, 150.00, 30),
(5, 'Macetero Colgante Cerámico', 'Jardín', 95.00, 220.00, 18),
(5, 'Espejo de Pared con Macetero', 'Espejo', 210.00, 450.00, 9),
(5, 'Cuadro Botánico Vintage', 'Cuadro', 175.00, 350.00, 14);

-- SERVICIO_EMPLEADO 
INSERT INTO ServicioEmpleado VALUES
(1, 1), (1, 5), (2, 2), (3, 4), (4, 6),
(5, 14), (1, 7), (2, 11), (3, 13), (4, 20),
(5, 8), (2, 9), (3, 3), (4, 15), (5, 18);

-- ORDEN_SERVICIO
INSERT INTO OrdenServicio VALUES
(1, 1, '2023-01-15', 1200.00, 15),
(2, 2, '2023-02-20', 2200.00, 30),
(3, 3, '2023-03-10', 1600.00, 12),
(4, 4, '2023-04-05', 500.00, 5),
(5, 5, '2023-05-12', 300.00, 2);
