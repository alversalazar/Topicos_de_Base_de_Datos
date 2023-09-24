-- Crear la base de datos ElectronicaShop
CREATE DATABASE IF NOT EXISTS ElectronicaShop;

-- Usar la base de datos ElectronicaShop
USE ElectronicaShop;

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apPaterno VARCHAR(50) NOT NULL,
    apMaterno VARCHAR(20) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    estatus BIT NOT NULL DEFAULT 1
);

-- Tabla FormaPago
CREATE TABLE FormaPago (
    idFormaPago INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estatus BIT NOT NULL DEFAULT 1
);

-- Tabla Empleado
CREATE TABLE Empleado (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apPaterno VARCHAR(50) NOT NULL,
    apMaterno VARCHAR(20) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    estatus BIT NOT NULL DEFAULT 1
);

-- Tabla Producto
CREATE TABLE Producto (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencias INT NOT NULL,
    estatus BIT NOT NULL DEFAULT 1
);

-- Tabla Pedido
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL,
    estatus BIT NOT NULL DEFAULT 1,
    idCliente INT NOT NULL
);

-- Tabla Venta
CREATE TABLE Venta (
    idVenta INT AUTO_INCREMENT PRIMARY KEY,
    total DECIMAL(10 , 2 ) NOT NULL,
    cantidad INT NOT NULL,
    detalles VARCHAR(50) NOT NULL,
    estatus BIT NOT NULL DEFAULT 1,
    idProducto INT NOT NULL,
    idEmpleado INT NOT NULL,
    idCliente INT NOT NULL,
    idFormaPago INT NOT NULL

);

-- Tabla PedidoProducto
CREATE TABLE PedidoProducto (
    idPedidoProducto INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT NOT NULL,
    idProducto INT NOT NULL,
    cantidadProducto INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estatus BIT NOT NULL DEFAULT 1
);

-- Crear índices
CREATE INDEX IX_Cliente ON Cliente(idCliente);
CREATE INDEX IX_Empleado ON Empleado(idEmpleado);
CREATE INDEX IX_FormaPago ON FormaPago(idFormaPago);
CREATE INDEX IX_Producto ON Producto(idProducto);
CREATE INDEX IX_Pedido ON Pedido(idPedido);
CREATE INDEX IX_Venta ON Venta(idVenta);

-- Índice compuesto para PedidoProducto
CREATE INDEX IX_PedidoProducto ON PedidoProducto(idPedido, idProducto);


-------------------- RELACIONES--------------------------------
ALTER TABLE Pedido
ADD CONSTRAINT FK_PedidoCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
----
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaEmpleado
FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);

ALTER TABLE Venta
ADD CONSTRAINT FK_VentaProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);

ALTER TABLE Venta
ADD CONSTRAINT FK_VentaCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);

ALTER TABLE Venta
ADD CONSTRAINT FK_VentaFormaPago
FOREIGN KEY (idFormaPago) REFERENCES FormaPago(idFormaPago);


ALTER TABLE PedidoProducto
ADD CONSTRAINT FK_PedidoProductoPedido
FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido);

ALTER TABLE PedidoProducto
ADD CONSTRAINT FK_PedidoProductoProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);

-- Insertar registros en la tabla FormaPago
INSERT INTO FormaPago(nombre)
VALUES
    ('Tarjeta de crédito'),
    ('Transferencia electrónica'),
    ('Pago en línea'),
    ('Cheque'),
    ('Efectivo');

-- Insertar registros en la tabla Empleado
INSERT INTO Empleado(nombre, apPaterno, apMaterno, direccion, correo, telefono)
VALUES
    ('Alberto', 'Salazar', 'Zuñiga', 'Cd. Deportiva, Cd Deportiva, 25750 Monclova, Coah.', 'albert6@gmail.com', '+866-168-16-56'),
    ('Jose Luis', 'Hernandez', 'Garza', 'Av. Huemac, Brasil Esq, Anáhuac, 25750 Monclova, Coah.', 'joseluis@gmail.com', '+866-198-11-56'),
    ('Flor Elizabeth', 'Flores', 'Perez', 'Brasil #201, Guadalupe, 25750 Monclova, Coah.', 'florperez@gmail.com', '+844-188-56-34'),
    ('Marcos', 'Mireles', 'Tovar', 'Valparaíso 212, Guadalupe, 25750 Monclova, Coah.', 'mirelestovar@gmail.com', '+866-111-13-59'),
    ('Nataly', 'Meza', 'Rodriguez', 'Calle Guatemala S/N, Guadalupe, 25750 Monclova, Coah.', 'nataly13@gmail.com', '+866-677-23-12'),
    ('Samuel Israel', 'Vazquez', 'Villarial', 'Blvd Harold R. Pape 6201, Guadalupe, 25750 Monclova, Coah.', 'samyisra@gmail.com', '+844-190-23-45'),
    ('Juan de dios', 'Del Bosque', 'Saldua', 'Carretera 30, Magisterio, 25716 Frontera, Coah.', 'juan@gmail.com', '+866-166-78-01');

-- Insertar registros en la tabla Producto
INSERT INTO Producto(nombre, precio, existencias)
VALUES
    ('Laptop HP 2023', 8937.89, 13),
    ('Celular Galaxy S23', 18899.99, 34),
    ('Computadora Gamer 2024', 8937.89, 22),
    ('Tablet Mac 2018', 8937.89, 11),
    ('Computadora HP 2021', 8937.89, 1),
    ('Laptop HP 2021', 8937.89, 13),
    ('iPhone XR 2022', 18899.99, 34),
    ('Celular Galaxy A01', 8937.89, 22),
    ('Celular Galaxy A22', 8937.89, 11),
    ('Laptop DELL 2021', 8937.89, 1);

-- Insertar registros en la tabla Cliente
INSERT INTO Cliente(nombre, apPaterno, apMaterno, direccion, correo, telefono)
VALUES
    ('Alberto', 'Salazar', 'Zuñiga', 'Cd. Deportiva, Cd Deportiva, 25750 Monclova, Coah.', 'albert6@gmail.com', '+866-168-16-56'),
    ('Jose Luis', 'Hernandez', 'Garza', 'Av. Huemac, Brasil Esq, Anáhuac, 25750 Monclova, Coah.', 'joseluis@gmail.com', '+866-198-11-56'),
    ('Flor Elizabeth', 'Flores', 'Perez', 'Brasil #201, Guadalupe, 25750 Monclova, Coah.', 'florperez@gmail.com', '+844-188-56-34'),
    ('Marcos', 'Mireles', 'Tovar', 'Valparaíso 212, Guadalupe, 25750 Monclova, Coah.', 'mirelestovar@gmail.com', '+866-111-13-59'),
    ('Nataly', 'Meza', 'Rodriguez', 'Calle Guatemala S/N, Guadalupe, 25750 Monclova, Coah.', 'nataly13@gmail.com', '+866-677-23-12'),
    ('Samuel Israel', 'Vazquez', 'Villarial', 'Blvd Harold R. Pape 6201, Guadalupe, 25750 Monclova, Coah.', 'samyisra@gmail.com', '+844-190-23-45'),
    ('Juan de dios', 'Del Bosque', 'Saldua', 'Carretera 30, Magisterio, 25716 Frontera, Coah.', 'juan@gmail.com', '+866-166-78-01');

-- Insertar registros en la tabla Venta
INSERT INTO Venta(total, cantidad, detalles, idProducto, idEmpleado, idCliente, idFormaPago)
VALUES
    (234, 1, 'Computadora Gamer 2024 color negra', 5, 3, 3, 2),
    (123, 2, 'Celular Galaxy S23 2023 color aqua', 4, 6, 5, 4),
    (433, 2, 'Tablet Mac 2018 color negro', 3, 2, 1, 2),
    (67, 1, 'Computadora HP 2021 color gris carbon', 3, 4, 2, 1),
    (256, 1, 'iPhone XR 2022 color blanco', 2, 1, 4, 3),
    (785, 2, 'Laptop DELL 2021 color negro', 1, 3, 5, 5);

-- Insertar registros en la tabla Pedido
INSERT INTO Pedido(descripcion, idCliente)
VALUES
    ('Computadora HP', 1),
    ('Celular Galaxy', 3),
    ('Tablet Mac', 5),
    ('iPhone X5', 7),
    ('Laptop Dell', 2),
    ('Computadora Gamer', 4);

-- Insertar registros en la tabla PedidoProducto
INSERT INTO PedidoProducto(idProducto, idPedido, cantidadProducto, total)
VALUES
    (1, 2, 3, 436),
    (2, 4, 2, 785),
    (3, 4, 1, 67),
    (3, 1, 2, 165),
    (2, 1, 1, 234),
    (2, 5, 1, 56),
    (1, 3, 2, 433),
    (5, 3, 1, 32),
    (5, 2, 1, 123);

-- Consultas SELECT
SELECT * FROM Cliente;
SELECT * FROM FormaPago;
SELECT * FROM Empleado;
SELECT * FROM Producto;
SELECT * FROM Pedido;
SELECT * FROM Venta;
SELECT * FROM pedidoproducto;