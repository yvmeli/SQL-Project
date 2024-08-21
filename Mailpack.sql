CREATE TABLE Cliente (
	ID_Cliente INT PRIMARY KEY,
	Nombre VARCHAR(100),
	Apellidos VARCHAR(100)
);
INSERT INTO Cliente (ID_Cliente, Nombre, Apellidos) VALUES
(1, 'Juan', 'González'),
(2, 'María', 'Martínez'),
(3, 'Luis', 'Hernández'),
(4, 'Sebastian', 'López'),
(5, 'Pedro', 'Díaz'),
(6, 'Laura', 'García'),
(7, 'Cristal', 'Pérez');


CREATE TABLE DireccionCliente (
	ID_Direccion INT PRIMARY KEY,
	Calle VARCHAR(100),
	Ciudad VARCHAR(100),
	Estado VARCHAR(100),
	Codigo_Postal VARCHAR(10),
);
INSERT INTO DireccionCliente (ID_Direccion, Calle, Ciudad, Estado, Codigo_Postal) VALUES
(1, 'Avenida Winston Churchill', 'Santo Domingo', 'Distrito Nacional', '10101'),
(2, 'Calle Juan de Herrera', 'Santiago de los Caballeros', 'Santiago', '51000'),
(3, 'Calle Duarte', 'San Pedro de Macorís', 'San Pedro de Macorís', '21000'),
(4, 'Calle El Sol', 'La Romana', 'La Romana', '22000'),
(5, 'Avenida Las Américas', 'Puerto Plata', 'Puerto Plata', '57000'),
(6, 'Calle Padre Billini', 'Higüey', 'La Altagracia', '23000'),
(7, 'Avenida 27 de Febrero', 'Bonao', 'Monseñor Nouel', '41000');


CREATE TABLE ClienteDireccion (
	ID_Cliente INT,
	ID_Direccion INT,
	EsDireccionPrincipal BIT,
	PRIMARY KEY (ID_Cliente, ID_Direccion),
	FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
	FOREIGN KEY (ID_Direccion) REFERENCES DireccionCliente(ID_Direccion)
);
INSERT INTO ClienteDireccion (ID_Cliente, ID_Direccion, EsDireccionPrincipal) VALUES
(1, 1, 1),
(2, 2, 0),
(3, 3, 1),
(4, 4, 0),
(5, 5, 1),
(6, 6, 0),
(7, 7, 1);


CREATE TABLE TelefonoCliente (
    ID_Telefono INT PRIMARY KEY,
    Telefono_Prefijo VARCHAR(5),
    Telefono_Numero VARCHAR(15),
	TipoTelefono VARCHAR(50),
);
INSERT INTO TelefonoCliente (ID_Telefono, Telefono_Prefijo, Telefono_Numero, TipoTelefono) VALUES
(1, '809', '1234567', 'Celular'),
(2, '809', '9876543', 'Casa'),
(3, '809', '2468135', 'Oficina'),
(4, '829', '5556666', 'Celular'),
(5, '809', '7778888', 'Casa'),
(6, '829', '9876543', 'Oficina'),
(7, '849', '4445555', 'Celular');


CREATE TABLE ClienteTelefono (
    ID_Cliente INT,
    ID_Telefono INT,
    PRIMARY KEY (ID_Cliente, ID_Telefono),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Telefono) REFERENCES TelefonoCliente(ID_Telefono)
);
INSERT INTO ClienteTelefono (ID_Cliente, ID_Telefono) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);


CREATE TABLE Paquete (
    ID_Paquete INT PRIMARY KEY,
    Peso DECIMAL(10, 2)
);
INSERT INTO Paquete (ID_Paquete, Peso) VALUES
(1, 10.5),
(2, 15.3),
(3, 8.7),
(4, 20.1),
(5, 12.6),
(6, 18.9),
(7, 9.4);


CREATE TABLE Cliente_Paquete (
    ID_Paquete INT,
    ID_Cliente INT,
    PRIMARY KEY (ID_Paquete, ID_Cliente),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID_Paquete),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);
INSERT INTO Cliente_Paquete (ID_Paquete, ID_Cliente) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);


CREATE TABLE Contenido_Paquete (
    ID_Contenido_Paquete INT PRIMARY KEY,
    Descripcion VARCHAR(255),
    EstadoContenido VARCHAR(50)
);
INSERT INTO Contenido_Paquete (ID_Contenido_Paquete, Descripcion, EstadoContenido) VALUES
(1, 'Libro', 'Nuevo'),
(2, 'Ropa', 'Usado'),
(3, 'Electrónicos', 'Nuevo'),
(4, 'Juguetes', 'Usado'),
(5, 'Comestibles', 'Nuevo'),
(6, 'Artículos de hogar', 'Usado'),
(7, 'Herramientas', 'Nuevo');


CREATE TABLE Paquete_ContenidoR (
    ID_Paquete INT,
    ID_Contenido_Paquete INT,
    PRIMARY KEY (ID_Paquete, ID_Contenido_Paquete),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID_Paquete),
    FOREIGN KEY (ID_Contenido_Paquete) REFERENCES Contenido_Paquete(ID_Contenido_Paquete)
);
INSERT INTO Paquete_ContenidoR (ID_Paquete, ID_Contenido_Paquete) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);


CREATE TABLE EstadoPaquete (
    ID_EstadoPaquete INT PRIMARY KEY,
    ID_Paquete INT,
    Estado VARCHAR(50),
    FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID_Paquete)
);
INSERT INTO EstadoPaquete (ID_EstadoPaquete, ID_Paquete, Estado) VALUES
(1, 1, 'Entregado'),
(2, 2, 'En almacén'),
(3, 3, 'Entregado'),
(4, 4, 'En proceso de clasificación'),
(5, 5, 'En espera'),
(6, 6, 'En ruta de distribución'),
(7, 7, 'Entregado');


CREATE TABLE HistorialEstadoPaquete (
	ID_Historial INT PRIMARY KEY,
	ID_Paquete INT,
	ID_EstadoPaquete INT,
	Fecha_Cambio DATETIME,
	FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID_Paquete),
	FOREIGN KEY (ID_EstadoPaquete) REFERENCES EstadoPaquete(ID_EstadoPaquete)
);
INSERT INTO HistorialEstadoPaquete (ID_Historial, ID_Paquete, ID_EstadoPaquete, Fecha_Cambio) VALUES
(1, 1, 1, '2024-04-10 08:00:00'),
(2, 2, 2, '2024-04-10 09:30:00'),
(3, 3, 3, '2024-04-10 10:45:00'),
(4, 4, 4, '2024-04-10 11:20:00'),
(5, 5, 5, '2024-04-10 12:15:00'),
(6, 6, 6, '2024-04-10 13:40:00'),
(7, 7, 7, '2024-04-10 14:55:00');


CREATE TABLE Cliente_EstadoPaquete (
    ID_EstadoPaquete INT,
    ID_Cliente INT,
	Fecha_Visto DATETIME,
    FOREIGN KEY (ID_EstadoPaquete) REFERENCES EstadoPaquete(ID_EstadoPaquete),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);
INSERT INTO Cliente_EstadoPaquete (ID_EstadoPaquete, ID_Cliente, Fecha_Visto) VALUES
(1, 1, '2024-04-10 08:00:00'),
(2, 2, '2024-04-10 09:30:00'),
(3, 3, '2024-04-10 10:45:00'),
(4, 4, '2024-04-10 11:20:00'),
(5, 5, '2024-04-10 12:15:00'),
(6, 6, '2024-04-10 13:40:00'),
(7, 7, '2024-04-10 14:55:00');


CREATE TABLE DetalleEstadoPaquete (
    ID_DetalleEstadoPaquete INT PRIMARY KEY,
    ID_EstadoPaquete INT,
    Descripcion VARCHAR(100),
    UbicacionDelEstado VARCHAR(100),
    FechaDeActualizacionDelEstado DATETIME,
    FOREIGN KEY (ID_EstadoPaquete) REFERENCES EstadoPaquete(ID_EstadoPaquete)
);
INSERT INTO DetalleEstadoPaquete (ID_DetalleEstadoPaquete, ID_EstadoPaquete, Descripcion, UbicacionDelEstado, FechaDeActualizacionDelEstado) VALUES
(1, 1, 'En proceso de clasificación', 'Centro de distribución', '2024-04-09 10:00:00'),
(2, 2, 'En tránsito hacia el destino', 'Camión de entrega', '2024-04-09 11:00:00'),
(3, 3, 'Entregado al destinatario', 'Domicilio del cliente', '2024-04-09 12:00:00'),
(4, 4, 'En espera de instrucciones adicionales', 'Oficina central', '2024-04-09 13:00:00'),
(5, 5, 'Listo para ser recolectado por el cliente', 'Sucursal local', '2024-04-09 14:00:00'),
(6, 6, 'En proceso de revisión aduanal', 'Aeropuerto Internacional', '2024-04-09 15:00:00'),
(7, 7, 'En tránsito hacia la oficina de destino', 'Transporte terrestre', '2024-04-09 16:00:00');


CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
	OfreceEnvio BIT
);
INSERT INTO Proveedores (ID_Proveedor, Nombre, Telefono, CorreoElectronico, OfreceEnvio) VALUES
(1, 'Amazon', '1234567890', 'amazon@example.com', 1),
(2, 'Shein', '2345678901', 'shein@example.com', 0),
(3, 'eBay', '3456789012', 'ebay@example.com', 1),
(4, 'Sephora', '4567890123', 'sephora@example.com', 0),
(5, 'Walmart', '5678901234', 'walmart@example.com', 1),
(6, 'Target', '6789012345', 'target@example.com', 0),
(7, 'Fahion Nova', '7890123456', 'fashionnova@example.com', 1);


CREATE TABLE DireccionesDeProveedores (
    ID_Direccion INT PRIMARY KEY,
    Direccion VARCHAR(255),
    Ciudad VARCHAR(100),
    Estado VARCHAR(100),
    Codigo_Postal VARCHAR(10)
);
INSERT INTO DireccionesDeProveedores (ID_Direccion, Direccion, Ciudad, Estado, Codigo_Postal) VALUES
(1, '123 Main Street', 'Seattle', 'Washington', '98001'),
(2, '456 Elm Street', 'Los Angeles', 'California', '90001'),
(3, '789 Oak Street', 'New York', 'New York', '10001'),
(4, '321 Pine Street', 'Chicago', 'Illinois', '60601'),
(5, '654 Maple Street', 'Houston', 'Texas', '77001'),
(6, '987 Cedar Street', 'Miami', 'Florida', '33101'),
(7, '210 Walnut Street', 'Boston', 'Massachusetts', '02101');


CREATE TABLE ProveedoresDireccion (
    ID_Proveedor INT,
    ID_Direccion INT,
    PRIMARY KEY (ID_Proveedor),
    FOREIGN KEY (ID_Direccion) REFERENCES DireccionesDeProveedores(ID_Direccion),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);
INSERT INTO ProveedoresDireccion (ID_Proveedor, ID_Direccion) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);


CREATE TABLE Proveedor_EstadoPaquete (
    ID_EstadoPaquete INT,
    ID_Proveedor INT,
	Fecha_Actualizacion DATETIME,
    PRIMARY KEY (ID_EstadoPaquete, ID_Proveedor),
    FOREIGN KEY (ID_EstadoPaquete) REFERENCES EstadoPaquete(ID_EstadoPaquete),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);
INSERT INTO Proveedor_EstadoPaquete (ID_EstadoPaquete, ID_Proveedor, Fecha_Actualizacion) VALUES
(1, 1, '2024-04-09 08:00:00'),
(2, 2, '2024-04-09 09:00:00'),
(3, 3, '2024-04-09 10:00:00'),
(4, 4, '2024-04-09 11:00:00'),
(5, 5, '2024-04-09 12:00:00'),
(6, 6, '2024-04-09 13:00:00'),
(7, 7, '2024-04-09 14:00:00');


CREATE TABLE Empleado (
    ID_Empleado INT PRIMARY KEY,
    Nombre VARCHAR(100),
	Apellido VARCHAR(100),
    Cargo VARCHAR(50),
	Cedula VARCHAR(15),
	Salario DECIMAL(10, 2)
);
INSERT INTO Empleado (ID_Empleado, Nombre, Apellido, Cargo, Cedula, Salario) VALUES
(1, 'Juan', 'Pérez', 'Gerente', '001-1234567-8', 25000.00),
(2, 'María', 'González', 'Asistente', '002-2345678-9', 18000.00),
(3, 'Carlos', 'Díaz', 'Contador', '003-3456789-0', 22000.00),
(4, 'Esteban', 'López', 'Analista', '004-4567890-1', 20000.00),
(5, 'Pedro', 'Martínez', 'Conductor', '005-5678901-2', 21000.00),
(6, 'Laura', 'Sánchez', 'Diseñadora', '006-6789012-3', 19000.00),
(7, 'Sofía', 'Ramírez', 'Secretaria', '007-7890123-4', 17000.00);


CREATE TABLE TelefonoEmpleado (
    ID_Telefono INT PRIMARY KEY,
    ID_Empleado INT,
	Telefono_Prefijo VARCHAR(5),
    Telefono_Numero VARCHAR(10),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);
INSERT INTO TelefonoEmpleado (ID_Telefono, ID_Empleado, Telefono_Prefijo, Telefono_Numero) VALUES
(1, 1, '809', '1234567'),
(2, 2, '809', '2345678'),
(3, 3, '809', '3456789'),
(4, 4, '809', '4567890'),
(5, 5, '809', '5678901'),
(6, 6, '809', '6789012'),
(7, 7, '809', '7890123');


CREATE TABLE TurnosEmpleado (
    ID_Turno INT PRIMARY KEY,
    ID_Empleado INT,
    Dia DATE,
    Hora TIME,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);
INSERT INTO TurnosEmpleado (ID_Turno, ID_Empleado, Dia, Hora) VALUES
(1, 1, '2024-04-10', '08:00:00'),
(2, 2, '2024-04-11', '09:00:00'),
(3, 3, '2024-04-12', '10:00:00'),
(4, 4, '2024-04-13', '11:00:00'),
(5, 5, '2024-04-14', '12:00:00'),
(6, 6, '2024-04-15', '13:00:00'),
(7, 7, '2024-04-16', '14:00:00');


CREATE TABLE Marca (
	ID_Marca INT PRIMARY KEY,
	PaisdeOrigen VARCHAR(100),
	Nombre VARCHAR(50),
	AñoDeFundacion VARCHAR(50)
);
INSERT INTO Marca (ID_Marca, PaisdeOrigen, Nombre, AñoDeFundacion) VALUES
(1, 'Italia', 'Ferrari', '1939'),
(2, 'Alemania', 'Mercedes-Benz', '1926'),
(3, 'Estados Unidos', 'Ford', '1903'),
(4, 'Japón', 'Toyota', '1937'),
(5, 'Francia', 'Renault', '1899'),
(6, 'Reino Unido', 'Rolls-Royce', '1906'),
(7, 'Suecia', 'Volvo', '1927');


CREATE TABLE Modelo (
	ID_Modelo INT PRIMARY KEY,
	Nombre VARCHAR(50),
	AñoDeModelo VARCHAR(50),
	ClasificacionDelModelo VARCHAR(50),
	Edicion VARCHAR(50)
);
INSERT INTO Modelo (ID_Modelo, Nombre, AñoDeModelo, ClasificacionDelModelo, Edicion) VALUES
(1, 'Civic', '2023', 'Sedán', 'Deportiva'),
(2, 'Golf', '2022', 'Compacto', 'GTI'),
(3, 'F-150', '2024', 'Camioneta', 'Raptor'),
(4, 'A4', '2023', 'Sedán', 'Sport'),
(5, 'Wrangler', '2023', 'SUV', 'Rubicon'),
(6, '911', '2024', 'Camioneta', 'Turbo'),
(7, 'Camaro', '2022', 'Coupé', 'SS');


CREATE TABLE MarcaModelo (
	ID_MarcaModelo INT PRIMARY KEY,
    ID_Marca INT,
    ID_Modelo INT,
    FOREIGN KEY (ID_Marca) REFERENCES Marca(ID_Marca),
    FOREIGN KEY (ID_Modelo) REFERENCES Modelo(ID_Modelo)
);
INSERT INTO MarcaModelo (ID_MarcaModelo, ID_Marca, ID_Modelo) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7);


CREATE TABLE Vehiculo (
    ID_Vehiculo INT PRIMARY KEY,
    ID_MarcaModelo INT,
    Capacidad DECIMAL(8, 2),
    ID_Empleado INT,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_MarcaModelo) REFERENCES MarcaModelo(ID_MarcaModelo)
);
INSERT INTO Vehiculo (ID_Vehiculo, ID_MarcaModelo, Capacidad, ID_Empleado) VALUES
(1, 1, 100.00, 1),
(2, 2, 120.50, 2),
(3, 3, 110.25, 3),
(4, 4, 95.75, 4),
(5, 5, 105.00, 5),
(6, 6, 115.80, 6),
(7, 7, 125.40, 7);


CREATE TABLE Ruta (
    ID_Ruta INT PRIMARY KEY,
    Fecha_salida DATETIME,
    Fecha_llegada DATETIME,
    ID_Vehiculo INT,
    FOREIGN KEY (ID_Vehiculo) REFERENCES Vehiculo(ID_Vehiculo)
);
INSERT INTO Ruta (ID_Ruta, Fecha_salida, Fecha_llegada, ID_Vehiculo) VALUES
(1, '2024-04-10 08:00:00', '2024-04-10 15:00:00', 1),
(2, '2024-04-11 10:00:00', '2024-04-11 18:00:00', 2),
(3, '2024-04-12 09:00:00', '2024-04-12 16:30:00', 3),
(4, '2024-04-13 07:30:00', '2024-04-13 14:45:00', 4),
(5, '2024-04-14 08:45:00', '2024-04-14 16:20:00', 5),
(6, '2024-04-15 11:30:00', '2024-04-15 19:00:00', 6),
(7, '2024-04-16 10:15:00', '2024-04-16 17:30:00', 7);


CREATE TABLE RutaOrigen (
    ID_Ruta INT,
    Origen_Pais VARCHAR(100),
    Origen_Calle VARCHAR(100),
    Origen_Ciudad VARCHAR(100),
    Origen_Estado VARCHAR(100),
    PRIMARY KEY (ID_Ruta),
    FOREIGN KEY (ID_Ruta) REFERENCES Ruta(ID_Ruta)
);
INSERT INTO RutaOrigen (ID_Ruta, Origen_Pais, Origen_Calle, Origen_Ciudad, Origen_Estado)
VALUES
(1, 'USA', 'Main St', 'New York', 'NY'),
(2, 'Canada', 'Queen St', 'Toronto', 'ON'),
(3, 'Mexico', 'Paseo de la Reforma', 'Mexico City', 'CDMX'),
(4, 'Brazil', 'Avenida Paulista', 'Sao Paulo', 'SP'),
(5, 'Argentina', 'Avenida 9 de Julio', 'Buenos Aires', 'CABA'),
(6, 'Chile', 'Alameda', 'Santiago', 'RM'),
(7, 'Colombia', 'Carrera 7', 'Bogota', 'DC');


CREATE TABLE RutaDestino (
    ID_Ruta INT,
    Destino_Pais VARCHAR(100),
    Destino_Calle VARCHAR(100),
    Destino_Ciudad VARCHAR(100),
    Destino_Estado VARCHAR(100),
    PRIMARY KEY (ID_Ruta),
    FOREIGN KEY (ID_Ruta) REFERENCES Ruta(ID_Ruta)
);
INSERT INTO RutaDestino (ID_Ruta, Destino_Pais, Destino_Calle, Destino_Ciudad, Destino_Estado) VALUES
(1, 'República Dominicana', 'Avenida 1', 'Santo Domingo', 'Distrito Nacional'),
(2, 'República Dominicana', 'Calle 2', 'Santiago', 'Santiago'),
(3, 'República Dominicana', 'Avenida 3', 'La Romana', 'La Romana'),
(4, 'República Dominicana', 'Calle 4', 'San Pedro de Macorís', 'San Pedro de Macorís'),
(5, 'República Dominicana', 'Avenida 5', 'Puerto Plata', 'Puerto Plata'),
(6, 'República Dominicana', 'Calle 6', 'Higüey', 'La Altagracia'),
(7, 'República Dominicana', 'Avenida 7', 'Barahona', 'Barahona');


CREATE TABLE Ruta_Paquete (
	ID_Paquete INT,
	ID_Ruta INT,
	PRIMARY KEY (ID_Paquete, ID_Ruta),
	FOREIGN KEY (ID_Paquete) REFERENCES Paquete(ID_Paquete),
	FOREIGN KEY (ID_Ruta) REFERENCES Ruta(ID_Ruta)
);
INSERT INTO Ruta_Paquete (ID_Paquete, ID_Ruta) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);


CREATE TABLE Envio (
    IdEnvio INT PRIMARY KEY,
    FechaEnvio DATETIME NOT NULL,
    EstatusEnvio VARCHAR(50) NOT NULL,
    FechaEntrega DATETIME,
    Observaciones VARCHAR(255),
    IdRuta INT,
	TipoEnvio VARCHAR(50),
    FOREIGN KEY (IdRuta) REFERENCES Ruta(ID_Ruta)
);
INSERT INTO Envio (IdEnvio, FechaEnvio, EstatusEnvio, FechaEntrega, Observaciones, IdRuta, TipoEnvio) VALUES
(1, '2024-04-10 08:00:00', 'En ruta', '2024-04-12 10:00:00', 'Entrega programada', 1, 'Express'),
(2, '2024-04-11 10:00:00', 'En ruta', '2024-04-13 12:00:00', 'Entrega rápida', 2, 'Express'),
(3, '2024-04-12 12:00:00', 'En ruta', '2024-04-14 14:00:00', 'Entrega urgente', 3, 'Urgente'),
(4, '2024-04-13 14:00:00', 'En ruta', '2024-04-15 16:00:00', 'Entrega regular', 4, 'Regular'),
(5, '2024-04-14 16:00:00', 'En ruta', '2024-04-16 18:00:00', 'Entrega rápida', 5, 'Express'),
(6, '2024-04-15 18:00:00', 'En ruta', '2024-04-17 20:00:00', 'Entrega urgente', 6, 'Urgente'),
(7, '2024-04-16 20:00:00', 'En ruta', '2024-04-18 22:00:00', 'Entrega programada', 7, 'Regular');


CREATE TABLE CostoEnvio (
	IdCostoEnvio INT PRIMARY KEY,
	Costo DECIMAL(10,2),
	IdEnvio INT,
	FOREIGN KEY (IdEnvio) REFERENCES Envio(IdEnvio)
);
INSERT INTO CostoEnvio (IdCostoEnvio, Costo, IdEnvio) VALUES
(1, 10.50, 1),
(2, 8.75, 2),
(3, 15.20, 3),
(4, 12.00, 4),
(5, 9.99, 5),
(6, 14.75, 6),
(7, 11.30, 7);


CREATE TABLE EnvioPaquete (
    IdEnvio INT,
    IdPaquete INT,
    PRIMARY KEY (IdEnvio, IdPaquete),
    FOREIGN KEY (IdEnvio) REFERENCES Envio(IdEnvio),
    FOREIGN KEY (IdPaquete) REFERENCES Paquete(ID_Paquete)
);
INSERT INTO EnvioPaquete (IdEnvio, IdPaquete) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);


CREATE TABLE EnvioCliente (
    IdEnvio INT,
    IdCliente INT,
    PRIMARY KEY (IdEnvio, IdCliente),
    FOREIGN KEY (IdEnvio) REFERENCES Envio(IdEnvio),
    FOREIGN KEY (IdCliente) REFERENCES Cliente(ID_Cliente)
);
INSERT INTO EnvioCliente (IdEnvio, IdCliente) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);


CREATE TABLE Servicios (
    ID_Servicio INT PRIMARY KEY,
    Nombre_Servicio VARCHAR(100),
	Descripcion VARCHAR(255),
    Precio DECIMAL(10, 2)
);
INSERT INTO Servicios (ID_Servicio, Nombre_Servicio, Descripcion, Precio)
VALUES
    (1, 'Servicio estándar nacional', 'Envío estándar dentro del país', 15.99),
    (2, 'Servicio express nacional', 'Envío rápido dentro del país', 25.99),
    (3, 'Servicio estándar internacional', 'Envío estándar fuera del país', 29.99),
    (4, 'Servicio express internacional', 'Envío rápido fuera del país', 39.99),
    (5, 'Seguro de envío', 'Seguro para proteger el envío', 5.99),
    (6, 'Embalaje especial', 'Embalaje especial para objetos frágiles', 7.99),
    (7, 'Servicio de almacenamiento', 'Almacenamiento seguro por día', 2.99);


CREATE TABLE ClienteServicios (
    ID_Cliente INT,
    ID_Servicio INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Servicio) REFERENCES Servicios(ID_Servicio),
    PRIMARY KEY (ID_Cliente, ID_Servicio)
);
INSERT INTO ClienteServicios (ID_Cliente, ID_Servicio) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7);


-- Parte #3

-- 1. Muestra sólo el cliente y el codigo
SELECT ID_Cliente, Nombre
FROM Cliente;

-- 2. Muestra todos los clientes que su nombre iniciencon las letras C y S.
SELECT *
FROM Cliente
WHERE Nombre LIKE 'C%' OR Nombre LIKE 'S%';


-- 3. Muestra todos los clientes que su codigo tengan el número 3 y el 5. 
SELECT *
FROM Cliente
WHERE ID_Cliente LIKE '%3%' OR ID_Cliente LIKE '%5%';


-- 4. Mostrar cuantos tipos de envios tiene registrado en la base de datos. 
SELECT COUNT(DISTINCT Nombre_Servicio) AS Tipos_de_Envios_Registrados
FROM Servicios;


-- 5. De cada tipo de servicios necesitamos saber el nombre de servicio y codigo, agrupar por tipo de tipos de servicios.
SELECT Nombre_Servicio, ID_Servicio
FROM Servicios
GROUP BY Nombre_Servicio, ID_Servicio;


-- 6. Se necesita conocer el salario maximo y minimo de los empleados del courier.
SELECT MAX(Salario) AS Salario_Maximo, MIN(Salario) AS Salario_Minimo
FROM Empleado;


-- 7. Se necesita conocer el valor maximo y minimo a pagar por los servicios agrupado por nombre del servicio.  
SELECT Nombre_Servicio, MAX(Precio) AS Precio_Maximo, MIN(Precio) AS Precio_Minimo
FROM Servicios
GROUP BY Nombre_Servicio;


-- 8. Muestra la cantidad de paquetes que hayan sido entregados en el courier desde amazon
SELECT COUNT(*) AS Cantidad_Paquetes_Entregados_Desde_Amazon
FROM Cliente_EstadoPaquete cep
JOIN EstadoPaquete ep ON cep.ID_EstadoPaquete = ep.ID_EstadoPaquete
JOIN Proveedor_EstadoPaquete pep ON ep.ID_EstadoPaquete = pep.ID_EstadoPaquete
JOIN Proveedores pv ON pep.ID_Proveedor = pv.ID_Proveedor
WHERE pv.Nombre = 'Amazon' AND ep.Estado = 'Entregado';


-- 9. Determine el total pagado por paquetes ordenados por proveedor (amazon, ebay, shein, sefora, fashion nova, etc).
SELECT pr.Nombre AS Proveedor, SUM(ce.Costo) AS Total_Pagado
FROM CostoEnvio ce
JOIN Envio e ON ce.IdEnvio = e.IdEnvio
JOIN EnvioPaquete ep ON e.IdEnvio = ep.IdEnvio
JOIN Proveedores pr ON ep.IdPaquete = pr.ID_Proveedor
GROUP BY pr.Nombre;


-- σ nombre_proveedor = ‘fashion nova’ (Proveedor)
SELECT *
FROM Proveedores
WHERE Nombre = 'Fahion Nova';


-- π Nombre, Apellido, Cedula (σ empleado = Esteban (Empleados))
SELECT Nombre, Apellido, Cedula
FROM Empleado
WHERE Nombre = 'Esteban';


--Parte #4

-- 1.	Crear una vista que muestre las  primeras columnas de tu tabla Envios 
CREATE VIEW VistaEnvios AS
SELECT IdEnvio, FechaEnvio, EstatusEnvio, FechaEntrega, Observaciones
FROM Envio;

SELECT *
FROM VistaEnvios;


-- 2.	Crear una vista que muestre una lista de todos los Clientes que han recibido paquetes ordenar de la A a la Z. 
-- Debes encriptar esa vista para que no se conozca el origen de los datos 
CREATE VIEW Cliente_Paquete_View 
WITH ENCRYPTION 
AS
SELECT TOP 100 PERCENT C.ID_Cliente, C.Nombre, C.Apellidos
FROM Cliente C
JOIN Cliente_Paquete CP ON C.ID_Cliente = CP.ID_Cliente
ORDER BY C.Nombre, C.Apellidos ASC;

SELECT ID_Cliente, Nombre, Apellidos
FROM Cliente_Paquete_View
ORDER BY Nombre ASC;


-- Parte #5

-- 1.	Crear una vista basada en una instrucción SELECT personalizada que abarque varias tablas de tu base de datos. (a elección de ustedes)
CREATE VIEW Vista_Clientes_Entregados AS
SELECT c.ID_Cliente, c.Nombre, dc.Calle + ', ' + dc.Ciudad + ', ' + dc.Estado + ', ' + dc.Codigo_Postal AS Direccion, ep.Estado AS Estado
FROM Cliente c
JOIN Cliente_EstadoPaquete cep ON c.ID_Cliente = cep.ID_Cliente
JOIN EstadoPaquete ep ON cep.ID_EstadoPaquete = ep.ID_EstadoPaquete
JOIN DireccionCliente dc ON c.ID_Cliente = dc.ID_Direccion
WHERE ep.Estado = 'Entregado';

SELECT *
FROM Vista_Clientes_Entregados;


-- Triggers
CREATE TABLE RegistroAuditoria (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Evento VARCHAR(100) NOT NULL,
    FechaHora DATETIME NOT NULL,
    DetallesAdicionales VARCHAR(MAX)
);

-- b)	Crea un trigger para evento insert en la tabla considerada la principal de tu base de datos
CREATE TRIGGER trg_AuditoriaEnvioInsert
ON Envio
AFTER INSERT
AS
BEGIN
    INSERT INTO RegistroAuditoria (Evento, FechaHora, DetallesAdicionales)
    SELECT 
        'INSERT',
        GETDATE(),
        'IdEnvio: ' + CAST(IdEnvio AS VARCHAR) +
        ', FechaEnvio: ' + CONVERT(VARCHAR, FechaEnvio, 120) +
        ', EstatusEnvio: ' + EstatusEnvio +
        ', FechaEntrega: ' + CONVERT(VARCHAR, FechaEntrega, 120) +
        ', Observaciones: ' + Observaciones +
        ', IdRuta: ' + CAST(IdRuta AS VARCHAR) +
        ', TipoEnvio: ' + TipoEnvio
    FROM INSERTED;
END;

INSERT INTO Envio (IdEnvio, FechaEnvio, EstatusEnvio, Observaciones) 
VALUES (8, '2024-04-04', 'En tránsito', 'Entrega urgente');

SELECT * FROM RegistroAuditoria;


-- c)	Crea un trigger para evento delete en la tabla PAQUETES.
CREATE TRIGGER trg_AuditoriaBorradoPaquete
ON Paquete
AFTER DELETE
AS
BEGIN
    INSERT INTO RegistroAuditoria (Evento, FechaHora, DetallesAdicionales)
    SELECT 
        'Borrado de Paquete',
        GETDATE(),
        'ID_Paquete: ' + CAST(d.ID_Paquete AS VARCHAR) + ', Peso: ' + CAST(d.Peso AS VARCHAR)
    FROM DELETED d;
END;

INSERT INTO Paquete (ID_Paquete, Peso)
VALUES (8, 5.25),
       (9, 8.50);

DELETE FROM Paquete WHERE ID_Paquete = 8;

SELECT * FROM RegistroAuditoria;


-- d)	Crea un trigger para 3 eventos: insert, update y delete para una tabla diferente a las usadas anteriormente, luego pruébelo.
CREATE TRIGGER tr_ServiciosAuditoria
ON Servicios
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Registrar inserciones
    INSERT INTO RegistroAuditoria (Evento, FechaHora, DetallesAdicionales)
    SELECT 'Inserción de servicio', GETDATE(), 'ID_Servicio: ' 
	+ CAST(i.ID_Servicio AS VARCHAR(10)) + 
	', Nombre_Servicio: ' + i.Nombre_Servicio + ', Precio: ' + CAST(i.Precio AS VARCHAR(20))
    FROM inserted i;

    -- Registrar actualizaciones
    INSERT INTO RegistroAuditoria (Evento, FechaHora, DetallesAdicionales)
    SELECT 'Actualización de servicio', GETDATE(), 'ID_Servicio: ' 
	+ CAST(i.ID_Servicio AS VARCHAR(10)) + 
	', Nombre_Servicio: ' + i.Nombre_Servicio + ', Precio: ' + CAST(i.Precio AS VARCHAR(20))
    FROM inserted i;

    -- Registrar eliminaciones
    INSERT INTO RegistroAuditoria (Evento, FechaHora, DetallesAdicionales)
    SELECT 'Eliminación de servicio', GETDATE(), 'ID_Servicio: ' 
	+ CAST(d.ID_Servicio AS VARCHAR(10)) + 
	', Nombre_Servicio: ' + d.Nombre_Servicio + ', Precio: ' + CAST(d.Precio AS VARCHAR(20))
    FROM deleted d;
END;

INSERT INTO Servicios (ID_Servicio, Nombre_Servicio, Precio)
VALUES (11, 'Servicio de Entrega Urgente', 250.00);

UPDATE Servicios
SET Nombre_Servicio = 'Servicio de Entrega Urgente Premium', Precio = 300.00
WHERE ID_Servicio = 11;

DELETE FROM Servicios
WHERE ID_Servicio = 11;

SELECT * FROM RegistroAuditoria;


-- f)	Inhabilite los 2 primeros triggers.
DISABLE TRIGGER trg_AuditoriaBorradoPaquete ON Paquete;

DISABLE TRIGGER trg_AuditoriaEnvioInsert ON Envio;


-- Parte #6

-- b)	Crear una tabla temporal local y una tabla temporal global en tu base de datos. (a eleccion de ustedes).

-- c)	En las tablas temporales creadas en el punto anterior, inserta a menos 5 registros en cada una y luego muestra el contenido de ambas en una consulta general.

-- Tablas temporales globales
CREATE TABLE ##TrackingNumber (
    ID INT PRIMARY KEY,
    Descripcion VARCHAR(100)
);
INSERT INTO ##TrackingNumber (ID, Descripcion) VALUES
(1, 'Tracking Number 1'),
(2, 'Tracking Number 2'),
(3, 'Tracking Number 3'),
(4, 'Tracking Number 4'),
(5, 'Tracking Number 5');


-- Tablas temporales locales
CREATE TABLE #Destinatarios (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);
INSERT INTO #Destinatarios (ID, Nombre) VALUES
(1, 'Destinatario 1'),
(2, 'Destinatario 2'),
(3, 'Destinatario 3'),
(4, 'Destinatario 4'),
(5, 'Destinatario 5');


-- Muestra el contenido de ambas en una consulta general.
SELECT 'TrackingNumber', ID, Descripcion FROM ##TrackingNumber
UNION ALL
SELECT 'Destinatarios', ID, Nombre FROM #Destinatarios;


-- e)	Crear un índice en la tabla que consideres la principal de tu base de datos
CREATE INDEX IX_Paquete_ID_Paquete ON Paquete(ID_Paquete);


-- f)	Crear un índice único en una tabla de tu elección
CREATE UNIQUE INDEX IX_Cliente_Nombre_Apellidos ON Cliente(Nombre, Apellidos);


-- g)	Crear un índice compuesto de múltiples columnas en una tabla de tu elección
CREATE INDEX IX_Servicios_Nombre_Precio ON Servicios(Nombre_Servicio, Precio);


-- h)	Escribir una consulta SQL que involucre las columnas indexadas del punto anterior (Pto. G)
SELECT *
FROM Servicios
WHERE Nombre_Servicio LIKE 'Servicio%'
AND Precio BETWEEN 20.00 AND 30.00;


-- b)	Crea un procedimiento almacenado con 2 parámetros de entrada (parámetros a elección de ustedes), 
-- ejecútelo para ver los resultados.
CREATE PROCEDURE BuscarClientePorNombre
    @NombreCliente VARCHAR(100),
    @ApellidosCliente VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM Cliente
    WHERE Nombre = @NombreCliente AND Apellidos = @ApellidosCliente;
END;

EXEC BuscarClientePorNombre 'Laura', 'García';

-- c)	Modifica el procedimiento almacenado creado (modificación a elección de ustedes)
ALTER PROCEDURE BuscarClientePorNombre
    @NombreCliente VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM Cliente
    WHERE Nombre LIKE '%' + @NombreCliente + '%';
END;

EXEC BuscarClientePorNombre 'Sebastian';


-- e)	Crea un procedimiento almacenado con 2 parámetros de salida (parámetros a elección de ustedes), 
-- ejecútelo para ver los resultados.
CREATE PROCEDURE InformacionEmpleado
    @ID_Empleado INT,
    @NombreEmpleado VARCHAR(100) OUTPUT,
    @CargoEmpleado VARCHAR(50) OUTPUT
AS
BEGIN
    DECLARE @Nombre VARCHAR(100);
    DECLARE @Cargo VARCHAR(50);
    
    SELECT @Nombre = Nombre, @Cargo = Cargo
    FROM Empleado
    WHERE ID_Empleado = @ID_Empleado;
    
    SET @NombreEmpleado = @Nombre;
    SET @CargoEmpleado = @Cargo;
END;

DECLARE @NombreEmpleadoResult VARCHAR(100);
DECLARE @CargoEmpleadoResult VARCHAR(50);

EXEC InformacionEmpleado @ID_Empleado = 1, @NombreEmpleado = @NombreEmpleadoResult OUTPUT, 
@CargoEmpleado = @CargoEmpleadoResult OUTPUT;

PRINT 'Nombre del empleado: ' + @NombreEmpleadoResult;
PRINT 'Cargo del empleado: ' + @CargoEmpleadoResult;


-- f)	Modifica el procedimiento almacenado creado (modificación a elección de ustedes)
ALTER PROCEDURE InformacionEmpleado
    @ID_Empleado INT,
    @NombreEmpleado VARCHAR(100) OUTPUT,
    @CargoEmpleado VARCHAR(50) OUTPUT,
    @SalarioEmpleado DECIMAL(10, 2) OUTPUT
AS
BEGIN
    DECLARE @Nombre VARCHAR(100);
    DECLARE @Cargo VARCHAR(50);
    DECLARE @Salario DECIMAL(10, 2);
    
    SELECT @Nombre = Nombre, @Cargo = Cargo
    FROM Empleado
    WHERE ID_Empleado = @ID_Empleado;
    
    IF @Cargo = 'Gerente'
        SET @Salario = 25000.00;
    ELSE IF @Cargo = 'Asistente'
        SET @Salario = 18000.00;
    ELSE
        SET @Salario = 17000.00;
    
    SET @NombreEmpleado = @Nombre;
    SET @CargoEmpleado = @Cargo;
    SET @SalarioEmpleado = @Salario;
END;

DECLARE @ID_Empleado INT = 1;
DECLARE @NombreEmpleado VARCHAR(100);
DECLARE @CargoEmpleado VARCHAR(50);
DECLARE @SalarioEmpleado DECIMAL(10, 2);

EXEC InformacionEmpleado 
    @ID_Empleado = @ID_Empleado,
    @NombreEmpleado = @NombreEmpleado OUTPUT,
    @CargoEmpleado = @CargoEmpleado OUTPUT,
    @SalarioEmpleado = @SalarioEmpleado OUTPUT;

PRINT 'Nombre del empleado: ' + @NombreEmpleado;
PRINT 'Cargo del empleado: ' + @CargoEmpleado;
PRINT 'Salario del empleado: ' + CAST(@SalarioEmpleado AS VARCHAR(20));


-- h)	Crea un usuario nuevo en tu base de datos con el permiso de db_ddladmin
USE Mailpack;
CREATE LOGIN Usuario1
	WITH PASSWORD = '123';

USE Mailpack;
CREATE USER Usuario1 
	FOR LOGIN Usuario1;

USE Mailpack;
ALTER ROLE db_ddladmin ADD MEMBER Usuario1;


-- i)	Crea un usuario nuevo en tu base de datos con el permiso de db_datawriter
USE Mailpack;
CREATE LOGIN Usuario2 
	WITH PASSWORD = '456';

USE Mailpack;
CREATE USER Usuario2 
	FOR LOGIN Usuario2;

USE Mailpack;
ALTER ROLE db_datawriter ADD MEMBER Usuario2;


-- j)	Compruebe que los usuarios creados solo pueden realizar las actividades que le permiten sus privilegios
USE Mailpack;
SELECT 
    dp.name AS UserName,
    dp.type_desc AS UserType,
    rp.name AS RoleName
FROM sys.database_principals AS dp
LEFT JOIN sys.database_role_members AS drm ON dp.principal_id = drm.member_principal_id
LEFT JOIN sys.database_principals AS rp ON drm.role_principal_id = rp.principal_id
WHERE dp.type IN ('S', 'U', 'G') -- S = SQL user, U = Windows user, G = Windows group
ORDER BY dp.name, rp.name;


-- j)	Compruebe que los usuarios creados solo pueden realizar las actividades que le permiten sus privilegios. (Pt. 2)
USE Mailpack;
SELECT 
    dp.principal_id,
    dp.name AS UserName,
    dp.type_desc AS UserType,
    perm.permission_name AS Permission,
    perm.state_desc AS PermissionState,
    OBJECT_NAME(perm.major_id) AS ObjectName
FROM sys.database_permissions AS perm
INNER JOIN sys.database_principals AS dp ON perm.grantee_principal_id = dp.principal_id
WHERE dp.type IN ('S', 'U', 'G')
ORDER BY dp.name, perm.permission_name;