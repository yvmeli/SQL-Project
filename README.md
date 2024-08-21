Spanish:

# Base de Datos de courier

Esta base de datos modela la operación de una empresa de courier creada como parte de un proyecto, incluyendo información sobre clientes, paquetes, envíos, empleados, vehículos y rutas.

## Tablas

La base de datos se compone de las siguientes tablas:

**Clientes:**

* **Cliente:** Almacena información básica del cliente (ID, Nombre, Apellidos).
* **DireccionCliente:** Almacena las direcciones de los clientes (ID, Calle, Ciudad, Estado, Codigo_Postal).
* **ClienteDireccion:** Relaciona clientes con sus direcciones y especifica si es la principal.
* **TelefonoCliente:** Almacena los números de teléfono de los clientes (ID, Prefijo, Número, Tipo).
* **ClienteTelefono:** Relaciona clientes con sus números de teléfono.

**Paquetes:**

* **Paquete:** Almacena información sobre el paquete (ID, Peso).
* **Cliente_Paquete:** Relaciona clientes con sus paquetes.
* **Contenido_Paquete:** Describe el contenido de un paquete (ID, Descripción, Estado).
* **Paquete_ContenidoR:** Relaciona paquetes con su contenido.
* **EstadoPaquete:** Almacena el estado actual de un paquete (ID, ID_Paquete, Estado).
* **HistorialEstadoPaquete:** Registra los cambios de estado de un paquete.
* **Cliente_EstadoPaquete:** Permite a los clientes ver el estado de sus paquetes.
* **DetalleEstadoPaquete:** Proporciona detalles adicionales sobre el estado de un paquete.

**Proveedores:**

* **Proveedores:** Almacena información sobre los proveedores (ID, Nombre, Telefono, CorreoElectronico, OfreceEnvio).
* **DireccionesDeProveedores:** Almacena las direcciones de los proveedores.
* **ProveedoresDireccion:** Relaciona proveedores con sus direcciones.
* **Proveedor_EstadoPaquete:** Relaciona proveedores con el estado de los paquetes.

**Empleados:**

* **Empleado:** Almacena información sobre los empleados (ID, Nombre, Apellido, Cargo, Cedula, Salario).
* **TelefonoEmpleado:** Almacena los números de teléfono de los empleados.
* **TurnosEmpleado:** Almacena los turnos de los empleados.

**Vehículos y Rutas:**

* **Marca:** Almacena información sobre las marcas de vehículos.
* **Modelo:** Almacena información sobre los modelos de vehículos.
* **MarcaModelo:** Relaciona marcas con modelos.
* **Vehiculo:** Almacena información sobre los vehículos (ID, ID_MarcaModelo, Capacidad, ID_Empleado).
* **Ruta:** Almacena información sobre las rutas (ID, Fecha_salida, Fecha_llegada, ID_Vehiculo).
* **RutaOrigen:** Almacena el origen de una ruta.
* **RutaDestino:** Almacena el destino de una ruta.
* **Ruta_Paquete:** Relaciona rutas con paquetes.

**Envíos:**

* **Envio:** Almacena información sobre los envíos (ID, FechaEnvio, EstatusEnvio, FechaEntrega, Observaciones, IdRuta, TipoEnvio).
* **CostoEnvio:** Almacena el costo de un envío.
* **EnvioPaquete:** Relaciona envíos con paquetes.
* **EnvioCliente:** Relaciona envíos con clientes.

**Servicios:**

* **Servicios:** Almacena información sobre los servicios ofrecidos (ID, Nombre_Servicio, Descripcion, Precio).
* **ClienteServicios:** Relaciona clientes con los servicios que han contratado.

**Auditoria:**

* **RegistroAuditoria:** Almacena información sobre eventos de auditoría (inserciones, actualizaciones, eliminaciones).

## Vistas

La base de datos incluye vistas para facilitar el acceso a información específica:

* **VistaEnvios:** Muestra las primeras columnas de la tabla Envios.
* **Cliente_Paquete_View:** Muestra una lista de todos los Clientes que han recibido paquetes (encriptada).
* **Vista_Clientes_Entregados:** Muestra información sobre los clientes que han recibido paquetes entregados.

## Índices

Se han creado índices para optimizar las consultas:

* **IX_Paquete_ID_Paquete:** Índice en la columna ID_Paquete de la tabla Paquete.
* **IX_Cliente_Nombre_Apellidos:** Índice único en las columnas Nombre y Apellidos de la tabla Cliente.
* **IX_Servicios_Nombre_Precio:** Índice compuesto en las columnas Nombre_Servicio y Precio de la tabla Servicios.

## Procedimientos almacenados

La base de datos incluye procedimientos almacenados para realizar tareas específicas:

* **BuscarClientePorNombre:** Busca clientes por su nombre.
* **InformacionEmpleado:** Obtiene información sobre un empleado.

## Triggers

Se han implementado triggers para auditar cambios en la base de datos:

* **trg_AuditoriaEnvioInsert:** Registra las inserciones en la tabla Envio.
* **trg_AuditoriaBorradoPaquete:** Registra las eliminaciones en la tabla Paquete.
* **tr_ServiciosAuditoria:** Registra las inserciones, actualizaciones y eliminaciones en la tabla Servicios.

## Usuarios

Se han creado usuarios con diferentes permisos:

* **Usuario1:** Con permiso db_ddladmin.
* **Usuario2:** Con permiso db_datawriter.

## Consultas de ejemplo

Se incluyen algunas consultas de ejemplo en la sección "Parte #3" del código.

## Nota

Este archivo README.md proporciona una descripción general de la base de datos. Para obtener más detalles, consulte el código SQL completo.

....................................................................................................................................................................................................

English:

# Courier Database

This database models the operation of a courier company created as part of a project, including information about customers, packages, shipments, employees, vehicles, and routes.

## Tables

The database is composed of the following tables:

**Customers:**

* **Customer:** Stores basic customer information (ID, First Name, Last Name).
* **CustomerAddress:** Stores customer addresses (ID, Street, City, State, Zip Code).
* **CustomerAddress:** Relates customers to their addresses and specifies whether it is the primary address.
* **CustomerPhone:** Stores customer phone numbers (ID, Prefix, Number, Type).
* **CustomerPhone:** Relates customers to their phone numbers.

**Packages:**

* **Package:** Stores package information (ID, Weight).
* **Package_Client:** Relates customers to their packages.
* **Package_Content:** Describes the contents of a package (ID, Description, Status).
* **Package_ContentR:** Relates packages to their contents.
* **PackageStatus:** Stores the current status of a package (ID, Package_ID, Status).
* **PackageStatusHistory:** Records status changes for a package.
* **Package_Client:** Allows customers to view the status of their packages.
* **PackageStatusDetail:** Provides additional details about the status of a package.

**Suppliers:**

* **Suppliers:** Stores information about suppliers (ID, Name, Phone, Email, ShippingOffer).
* **SuppliersAddresses:** Stores the addresses of suppliers.
* **AddressSuppliers:** Relates suppliers to their addresses.
* **Supplier_PackageStatus:** Relates suppliers to package status.

**Employees:**

* **Employee:** Stores information about employees (ID, First Name, Last Name, Position, ID, Salary).
* **EmployeePhone:** Stores employee phone numbers.
* **EmployeeShifts:** Stores employee shifts.

**Vehicles and Routes:**

* **Brand:** Stores information about vehicle brands.
* **Model:** Stores information about vehicle models.
* **BrandModel:** Relates brands to models.
* **Vehicle:** Stores information about vehicles (ID, ID_BrandModel, Capacity, ID_Employee).
* **Route:** Stores information about routes (ID, Departure_date, Arrival_date, Vehicle_ID).
* **RouteOrigin:** Stores the origin of a route.
* **RouteDestination:** Stores the destination of a route.
* **Route_Package:** Relates routes to packages.

**Shipments:**

* **Shipment:** Stores information about shipments (ID, Shipment_date, Shipment_status, Delivery_date, Observations, Route_id, Shipment_type).
* **ShipmentCost:** Stores the cost of a shipment.
* **ShipmentPackage:** Relates shipments to packages.
* **ShipmentCustomer:** Relates shipments to customers.

**Services:**

* **Services:** Stores information about the services offered (ID, Service_name, Description, Price).
* **ClientServices:** Relates clients to the services they have contracted.

**Audit:**

* **AuditLog:** Stores information about audit events (insertions, updates, deletions).

## Views

The database includes views to facilitate access to specific information:

* **ShipmentsView:** Displays the first columns of the Shipments table.
* **Client_Package_View:** Displays a list of all Clients who have received packages (encrypted).
* **Clients_Delivered_View:** Displays information about clients who have received delivered packages.

## Indexes

Indexes have been created to optimize queries:

* **IX_Package_ID_Package:** Index on the ID_Package column of the Package table.
* **IX_Client_Name_Surname:** Unique index on the Name and Surname columns of the Client table.
* **IX_Services_Name_Price:** Composite index on the Name_Service and Price columns of the Services table.

## Stored procedures

The database includes stored procedures to perform specific tasks:

* **SearchClientByName:** Search for clients by name.
* **EmployeeInformation:** Obtains information about an employee.

## Triggers

Triggers have been implemented to audit changes in the database:

* **trg_AuditoriaEnvioInsert:** Records insertions in the Envio table.
* **trg_AuditoriaBorradoPaquete:** Records deletions in the Paquete table.
* **tr_ServiciosAuditoria:** Records insertions, updates and deletions in the Servicios table.

## Users

Users have been created with different permissions:

* **User1:** With db_ddladmin permission.
* **User2:** With db_datawriter permission.

## Sample Queries

Some sample queries are included in the "Part #3" section of the code.

## Note

This README.md file provides an overview of the database. For more details, see the full SQL code.
