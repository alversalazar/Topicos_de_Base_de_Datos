
/* 1 Consulta seleccionar los nombres de los empleados y su descripcion de territorio en la que se asignaron*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Territories.TerritoryDescription as 'Descripcion de Territorio'
FROM Employees
INNER JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID;

/* 2 Consulta seleccionar los nombres de los empleados y su descripcion de territorio en la que se asigna where especifica el terrirtorio*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Territories.TerritoryDescription as 'Descripcion de Territorio'
FROM Employees
INNER JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
 WHERE Territories.TerritoryDescription = 'Boston ';              

 /* 3 consulta: Seleccionar los detalles de pedidos y ordenarlos por el nombre de cliente */
SELECT  Orders.OrderID AS 'idPedido',   Customers.ContactName AS 'Nombre de Cliente'
FROM  Orders
INNER JOIN  Customers ON Orders.CustomerID = Customers.CustomerID
ORDER BY   Customers.ContactName;


/* 4 Consulta: Seleccionar los detalles de pedidos y convertir el nombre de cliente a minúsculas */
SELECT   Orders.OrderID AS 'idPedido',   LOWER(Customers.ContactName) AS 'Nombre de Cliente en Minúsculas'
FROM   Orders
INNER JOIN   Customers ON Orders.CustomerID = Customers.CustomerID;

/* 5 Consulta: Seleccionar los productos y ordenarlos por el nombre del proveedor */
SELECT   Products.ProductName AS 'Nombre de Producto',     Suppliers.CompanyName AS 'Nombre de Proveedor'
FROM    Products
INNER JOIN    Suppliers ON Products.SupplierID = Suppliers.SupplierID
ORDER BY     Suppliers.CompanyName;

/* 6 Consulta: Obtener el pedido con la fecha de entrega máxima */
SELECT   Orders.OrderID AS 'ID de Pedido',   MAX(Orders.RequiredDate) AS 'Fecha de Entrega Máxima'
FROM    Orders
INNER JOIN    [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY  Orders.OrderID;

/* 7 Consulta: Obtener el producto con la cantidad mínima en detalles de pedidos */
SELECT   Products.ProductName AS 'Nombre de Producto',   MIN([Order Details].Quantity) AS 'Cantidad Mínima'
FROM    Products
INNER JOIN    [Order Details] ON Products.ProductID = [Order Details].ProductID
GROUP BY    Products.ProductName;

/* 8 Consulta: Obtener el nombre de categoría en mayúsculas */
SELECT  UPPER(Categories.CategoryName) AS 'Nombre de Categoría en Mayúsculas'
FROM    Categories
INNER JOIN    Products ON Categories.CategoryID = Products.CategoryID;

/* 9 Consulta: Obtener los apellidos de empleados en minúsculas */
SELECT    Employees.LastName AS 'Apellido en Minúsculas'
FROM    Employees
INNER JOIN    Orders ON Employees.EmployeeID = Orders.EmployeeID;

/* 10 Consulta: Obtener el pedido con la cantidad mínima en detalles de pedidos */
SELECT     Orders.OrderID AS 'idPedido',     MIN([Order Details].Quantity) AS 'Cantidad Mínima'
FROM     Orders
INNER JOIN     [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY    Orders.OrderID;

/* 11 Consulta: Obtener el pedido con la cantidad maxima en detalles de pedidos */
SELECT     Orders.OrderID AS 'idPedido',     MAX([Order Details].Quantity) AS 'Cantidad Mínima'
FROM     Orders
INNER JOIN     [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY    Orders.OrderID;


/* 12 Consulta: Seleccionar productos y ordenarlos por el nombre de categoría */
SELECT   Products.ProductName AS 'Nombre de Producto', 
    Categories.CategoryName AS 'Nombre de Categoría'
FROM   Products
INNER JOIN   Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY   Categories.CategoryName;

/* 13 Consulta: Seleccionar empleados y ordenarlos por apellido */
SELECT   Employees.LastName AS 'Apellido de Empleado',   Employees.FirstName AS 'Nombre de Empleado'
FROM   Employees
INNER JOIN     Orders ON Employees.EmployeeID = Orders.EmployeeID
ORDER BY   Employees.LastName;

/* 14 Consulta: Seleccionar productos y ordenarlos por cantidad en detalles de pedidos */
SELECT     Products.ProductName AS 'Nombre de Producto',     SUM([Order Details].Quantity) AS 'Cantidad Total'
FROM    Products
INNER JOIN    [Order Details] ON Products.ProductID = [Order Details].ProductID
GROUP BY    Products.ProductName
ORDER BY    SUM([Order Details].Quantity) DESC;



/* 15 consulta obtiene el nombre de la categoría, el nombre del producto y el nombre del proveedor 
espesificando la categoria */
SELECT Categories.CategoryName as 'Nombre de Categoria', Products.ProductName as 'Nombre de Producto', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Dairy Products';


/* 16 consulta obtiene el nombre de la categoría  y el nombre del proveedor  y 
cuenta la cantidad de productos (TotalProducts) en cada combinación de categoría y proveedor.
Luego, agrupa los resultados por CategoryName y CompanyName utilizando GROUP BY.*/
SELECT Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia', COUNT(Products.ProductID) AS 'Total de Productos'
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY Categories.CategoryName, Suppliers.CompanyName;


/**/
/* 17 consulta obtiene el nombre de la categoría  y el nombre del proveedor  y 
cuenta la cantidad de productos (TotalProducts) en cada combinación de categoría y proveedor.
Luego, agrupa los resultados por CategoryName y CompanyName utilizando GROUP BY Y WHERE*/
SELECT Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia', COUNT(Products.ProductID) AS 'Total de Productos'
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Beverages'
GROUP BY Categories.CategoryName, Suppliers.CompanyName;
/**/



/* 18 consulta obtiene el nombre de la categoría  y el nombre del proveedor  y 
cuenta la cantidad de productos (TotalProducts) en cada combinación de categoría y proveedor.
Luego, agrupa los resultados por CategoryName y CompanyName utilizando GROUP BY Y WHERE.*/
SELECT Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia', COUNT(Products.ProductID) AS 'Total de Productos' 
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Meat/Poultry'
GROUP BY Categories.CategoryName, Suppliers.CompanyName;

/**/
/* 19 consulta obtiene el nombre de la categoría  y el nombre del proveedor  y 
cuenta la cantidad de productos (TotalProducts) en cada combinación de categoría y proveedor.
Luego, agrupa los resultados por CategoryName y CompanyName utilizando GROUP BY Y WHERE.*/
SELECT Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia', COUNT(Products.ProductID) AS 'Total de Productos'
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.CompanyName = 'Tokyo Traders'
GROUP BY Categories.CategoryName, Suppliers.CompanyName;
/**/

/* 20 consulta obtiene el nombre de la categoría  y el nombre del proveedor  y 
cuenta la cantidad de productos (TotalProducts) en cada combinación de categoría y proveedor.
Luego, agrupa los resultados por CategoryName y CompanyName utilizando GROUP BY Y WHERE.*/
SELECT Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia', COUNT(Products.ProductID) AS 'Total de Productos'
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.CompanyName = 'New England Seafood Cannery'
GROUP BY Categories.CategoryName, Suppliers.CompanyName;


/* 21 consulta obtiene el ID del pedido  y el nombre de la compañia */

SELECT Orders.OrderID as 'Nombre de Categoria', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID;


/* 22 consulta obtiene el ID del pedido  y el nombre de la compañia y where para buscar especificamente la compañia*/
SELECT Orders.OrderID as 'Nombre de Categoria', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Shippers.CompanyName = 'Federal Shipping';

/* 23 consulta obtiene el ID del pedido  y el nombre de la compañia y where para buscar especificamente la compañia*/
SELECT Orders.OrderID as 'Nombre de Categoria', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Shippers.CompanyName = 'United Package';
/**/
/* 24 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente la compañia y nombre del transportista*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipName = 'Ernst Handel' and Shippers.CompanyName= 'United Package';

/* 25 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente la compañia y nombre del transportista*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipName = 'Hanari Carnes' and Shippers.CompanyName= 'Federal Shipping';

/**/
/* 26 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '10265';
/**/

/* 27 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '11061';
/**/

/* 28 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '10269';



/*
 29 consulta obtiene el nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden  */
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;

/*
 30 consulta obtiene el nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca la fecha */
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.OrderDate = '1996-07-08 00:00:00.000';


/*
 31 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca la fecha */
SELECT Employees.EmployeeID as 'Id de Empleado',Orders.OrderID as 'Id de Ordenamiento',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerimiento'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;


/*
 32 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  de la orden */
SELECT Employees.EmployeeID as 'Id de Empleado',Orders.OrderID as 'Id de Ordenamiento',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerimiento'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.OrderID = '10253';


/*
 33 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  de la orden */
SELECT Employees.EmployeeID as 'Id de Empleado',Orders.OrderID as 'Id de Ordenamiento',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerimiento'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.OrderID = '11073';


/* 34 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  de la orden */
SELECT Employees.EmployeeID as 'Id de Empleado',Orders.OrderID as 'Id de Ordenamiento',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerimiento'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.OrderID = '10250';
/**/

/*
 35 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  del empleado */
SELECT Employees.EmployeeID as 'Id de Empleado',Orders.OrderID as 'Id de Ordenamiento',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden' , Orders.RequiredDate as 'Fecha de Requerimiento'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID = '3';


/*
 36 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  del empleado */
SELECT Employees.EmployeeID as 'Id de Empleado',Orders.OrderID as 'Id de Ordenamiento',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerimiento'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID = '8';
 

/* 37 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  del empleado */
SELECT Employees.EmployeeID as 'Id de Empleado',Orders.OrderID as 'Id de Ordenamiento',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerimiento'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID = '1';
/**/



/* 38 consulta obtiene el nombre completo del empleado (concatenando FirstName y LastName) , 
, el nombre del producto  y la cantidad de productos */
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Customers.ContactName as 'Nombre de Contacto',
       Products.ProductName as 'Nombre de Producto',
       [Order Details].Quantity  as 'Cantidad'
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID;

/* 39 consulta obtiene el nombre del cliente  y el nombre del producto */
SELECT Customers.CompanyName as 'Nombre de Compañia', Products.ProductName as 'Nombre de Producto'
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID;
/**/


/* 40 consulta obtiene el nombre de la compañia  y el nombre del producto Y WHERE espesifica la compañia*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Products.ProductName as 'Nombre de Producto'
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
 WHERE Customers.CompanyName = 'Queen Cozinha';
/**/


/* 41 consulta obtiene el nombre de la compañia  y el nombre del producto Y WHERE espesifica la compañia*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Products.ProductName as 'Nombre de Producto'
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
 WHERE Customers.CompanyName = 'Great Lakes Food Market';
/**/

/* 42 consulta obtiene el nombre de la compañia  y el nombre del producto Y WHERE espesifica la compañia*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Products.ProductName as 'Nombre de producto'
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
 WHERE Customers.CompanyName = 'Rattlesnake Canyon Grocery';
/**/
/**/

/* 43 Consulta obtiene el nombre de la categoria y nombre de su descripcion, nombre de producto y su precio*/
select A.CategoryName as 'Nombre de categoria',A.Description as 'Nombre de descripcion de la categoria',B.ProductName as 'Nombre del producto',B.UnitPrice as 'Precio de producto' 
From Categories A														  
inner join Products B												 
on (B.ProductID = A.CategoryID)


/* 44 Consulta obtiene las dos tablas juntas de Categories y Products*/
select *                                                             
From Categories A														  
inner join Products B												 
on (B.CategoryID = A.CategoryID)


/* 45 Consulta obtiene los primeros 8 de cada tabla de category y Product */
select *                                                             
From Categories A														  
inner join Products B												 
on (B.ProductID = A.CategoryID)

/* 46 Consulta obtiene el nombre de la categoria las unidades disponibles y el where espesifica el valor de 10:00 por unidad */
select A.CategoryName as 'Nombre de categoria',B.UnitsInStock as 'Unidades en Stock',B.UnitPrice as 'Precio por unidad' 
From Categories A														  
inner join Products B												  
on (B.CategoryID = A.CategoryID)											  
where B.UnitPrice IN ('10.00')		


/* 47 Consulta obtiene el nombre de la categoria las unidades que quedan y el where espesifica las que ya estan descontinuadas */
select A.CategoryName as 'Nombre de categoria',B.UnitsInStock as 'Unidades en Stock',B.Discontinued as 'Descontinuadas' 
From Categories A														  
inner join Products B												  
on (B.CategoryID = A.CategoryID)											  
where B.Discontinued IN ('0')		


/* 48 Consulta obtiene el nombre de la categoria las unidades que quedan y el where espesifica las que ya estan descontinuadas */
select A.CategoryName as 'Nombre de categoria',B.UnitsInStock as 'Unidades en Stock',B.Discontinued as 'Descontinuadas' 
From Categories A														  
inner join Products B												  
on (B.CategoryID = A.CategoryID)											  
where B.Discontinued IN ('1')		


/* 49 Consulta obtiene el nombre del producto de que compañia viene y donde esta su direccion */
select A.ProductName as 'Nombre de producto',B.CompanyName as 'Nombre de compañia',B.Address as 'Direccion de compañia' 
From Products A														  
inner join Suppliers B												  
on (B.SupplierID = A.ProductID)											  

/**/
/* 50 Consulta obtiene el nombre del producto su precio la compañia que lo hace su direccion codigo postal y el where espesifica que solo de usa */
select A.ProductName as 'Nombre de producto',A.UnitPrice as 'Precio de producto',B.CompanyName as 'Nombre de compañia',B.Address as 'Direccion de compañia',B.PostalCode as 'Codigo postal',B.Country as 'Pais'  
From Products A														  
inner join Suppliers B												  
on (B.SupplierID = A.ProductID)		
where B.Country IN ('USA')


/**/
/**/
/**/
/**/

/* 51. Consulta que combina información de productos y detalles de pedidos utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 5 caracteres del nombre del producto. */
SELECT Producto.ProductID AS 'ID de Producto',
  SUBSTRING(Producto.ProductName, 1, 5) AS 'Primeros 5 Caracteres Nombre Producto'
FROM   PRODUCTS AS Producto
INNER JOIN   [Order Details] AS Detalle ON  Producto.ProductID = Detalle.ProductID;

/* 52. Consulta que combina información de pedidos y transportistas utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 4 caracteres del nombre del transportista. */
SELECT Pedido.OrderID AS 'NúmeroPedido', SUBSTRING(Transportista.CompanyName, 1, 4) AS 'Primeros4CaracteresNombreTransportista'
FROM  ORDERS AS Pedido
INNER JOIN  SHIPPERS AS Transportista ON  Pedido.ShipVia = Transportista.ShipperID;

/* 53. Consulta que combina información de detalles de pedidos y pedidos utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 5 caracteres del nombre del producto. */
SELECT Detalle.OrderID AS 'Número de Pedido',SUBSTRING(Producto.ProductName, 1, 14) AS 'Primeros 14 Caracteres Nombre Producto'
FROM [Order Details] AS Detalle
INNER JOIN   ORDERS AS Pedido ON  Detalle.OrderID = Pedido.OrderID
INNER JOIN PRODUCTS AS Producto ON  Detalle.ProductID = Producto.ProductID
WHERE Producto.ProductName = 'Queso Manchego La Pastora';

/* 54. Consulta que combina información de productos y proveedores utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 8 caracteres del nombre del proveedor. */
SELECT Producto.ProductID AS 'ID de Producto',
       SUBSTRING(Proveedor.CompanyName, 1, 11) AS 'Primeros 10 Caracteres Compañia Proveedor'
FROM   PRODUCTS AS Producto
INNER JOIN  SUPPLIERS AS Proveedor
ON  Producto.SupplierID = Proveedor.SupplierID
WHERE Proveedor.CompanyName = 'New Orleans Cajun Delights';

/* 55. Consulta que combina información de pedidos, clientes y empleados utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 5 caracteres del nombre del cliente. */
SELECT  Pedido.OrderID AS 'Número de Pedido',
        SUBSTRING(Cliente.ContactName, 1, 5) AS 'Primeros 5 Caracteres Contacto Cliente',
        SUBSTRING(Empleado.LastName, 1, 5) AS 'Primeros 5 Caracteres Nombre Empleado'
FROM ORDERS AS Pedido
INNER JOIN  CUSTOMERS AS Cliente ON Pedido.CustomerID = Cliente.CustomerID
INNER JOIN EMPLOYEES AS Empleado ON  Pedido.EmployeeID = Empleado.EmployeeID
WHERE Cliente.ContactName = 'Jaime Yorres';

/* 56. Consulta que combina información de asignaciones de empleados a territorios, territorios y empleados utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 7 caracteres del nombre del territorio. */
SELECT  Asignacion.EmployeeID AS 'ID de Empleado',SUBSTRING(Territorio.TerritoryDescription, 1, 7) AS 'Primeros 5 Caracteres Descripcion Territorio',
  SUBSTRING(Empleado.LastName, 1, 5) AS 'Primeros 5 Caracteres Apellido Empleado'
FROM  EMPLOYEETERRITORIES AS Asignacion
INNER JOIN TERRITORIES AS Territorio ON  Asignacion.TerritoryID = Territorio.TerritoryID
INNER JOIN EMPLOYEES AS Empleado ON  Asignacion.EmployeeID = Empleado.EmployeeID ;

/* 57. Consulta que combina información de proveedores, productos y categorías utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 10 caracteres del nombre del producto. */
SELECT 
  Proveedor.CompanyName AS 'Nombre de Proveedor',
  SUBSTRING(Producto.ProductName, 1, 10) AS 'Primeros 10 Caracteres Nombre Producto',
  Categoria.CategoryName AS 'Nombre Categoria'
FROM  PRODUCTS AS Producto
INNER JOIN  SUPPLIERS AS Proveedor ON Producto.SupplierID = Proveedor.SupplierID
INNER JOIN CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID;

/* 58. Consulta que utiliza HAVING para encontrar clientes que han realizado más de 3 pedidos en la base de datos NORTHWIND. */
SELECT  Cliente.CustomerID, COUNT(Pedido.OrderID) AS 'Total Pedidos'
FROM  CUSTOMERS AS Cliente
INNER JOIN  ORDERS AS Pedido ON   Cliente.CustomerID = Pedido.CustomerID
GROUP BY  Cliente.CustomerID
HAVING  COUNT(Pedido.OrderID) > 3;

/* 59. Consulta que utiliza HAVING para encontrar empleados que hayan gestionado más de 10 pedidos en la base de datos NORTHWIND. */
SELECT  Empleado.EmployeeID, COUNT(Pedido.OrderID) AS 'TotalPedidosGestionados'
FROM  EMPLOYEES AS Empleado
INNER JOIN ORDERS AS Pedido ON  Empleado.EmployeeID = Pedido.EmployeeID
GROUP BY  Empleado.EmployeeID
HAVING COUNT(Pedido.OrderID) > 10;

/* 60. Consulta que utiliza HAVING para encontrar categorías de productos con más de 5 productos en la base de datos NORTHWIND. */
SELECT   Categoria.CategoryName AS 'Nombre Categoria',  COUNT(Producto.ProductID) AS 'Total Productos'
FROM   CATEGORIES AS Categoria
INNER JOIN  PRODUCTS AS Producto ON   Categoria.CategoryID = Producto.CategoryID
GROUP BY   Categoria.CategoryName
HAVING  COUNT(Producto.ProductID) > 5;

/* 61. Consulta que utiliza HAVING para encontrar productos con más de 100 unidades vendidas en detalles de pedidos en la base de datos NORTHWIND. */
SELECT Producto.ProductName AS 'Nombre Producto', SUM(Detalle.Quantity) AS 'Total Unidades Vendidas'
FROM  PRODUCTS AS Producto
INNER JOIN  [Order Details] AS Detalle
ON  Producto.ProductID = Detalle.ProductID
GROUP BY   Producto.ProductName
HAVING  SUM(Detalle.Quantity) > 100;

/* 62. Consulta que utiliza HAVING para encontrar transportistas que han entregado más de 50 pedidos en la base de datos NORTHWIND. */
SELECT  Transportista.CompanyName AS 'Nombre Transportista',COUNT(Pedido.OrderID) AS 'Total Pedidos Entregados'
FROM  SHIPPERS AS Transportista
INNER JOIN  ORDERS AS Pedido ON  Transportista.ShipperID = Pedido.ShipVia
GROUP BY  Transportista.CompanyName
HAVING   COUNT(Pedido.OrderID) > 50;

/* 63. Consulta que utiliza una filtración por fecha para encontrar detalles de pedidos de productos vendidos después de una fecha específica en la base de datos NORTHWIND. */
SELECT  Detalle.OrderID AS 'Numero Pedido',  Detalle.ProductID AS 'idProducto',  Detalle.Quantity AS 'Cantidad', Pedido.OrderDate AS 'Fecha Buscada'
FROM [Order Details] AS Detalle
INNER JOIN ORDERS AS Pedido ON  Detalle.OrderID = Pedido.OrderID
WHERE  Pedido.OrderDate > '1998-05-05 00:00:00.000';

/* 64. Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos en la base de datos NORTHWIND. */
SELECT  Producto.ProductName AS 'Nombre Producto', Categoria.CategoryName AS 'Tipo Producto',  Proveedor.CompanyName AS 'Nombre Compañia'
FROM   PRODUCTS AS Producto
INNER JOIN  SUPPLIERS AS Proveedor ON  Producto.SupplierID = Proveedor.SupplierID
INNER JOIN   CATEGORIES AS Categoria ON   Producto.CategoryID = Categoria.CategoryID
WHERE  Categoria.CategoryName = 'Grains/Cereals' ;

/* 65. Consulta que utiliza una filtración por fecha para encontrar pedidos realizados después de una fecha específica junto con información de clientes y empleados en la base de datos NORTHWIND. */
SELECT  Pedido.OrderID AS 'idPedido', Cliente.ContactName AS 'Nombre Cliente',  Empleado.FirstName AS 'Nombre Empleado',  Pedido.OrderDate AS 'Fecha Pedido'
FROM   ORDERS AS Pedido
INNER JOIN  CUSTOMERS AS Cliente ON  Pedido.CustomerID = Cliente.CustomerID
INNER JOIN  EMPLOYEES AS Empleado ON   Pedido.EmployeeID = Empleado.EmployeeID
WHERE   Pedido.OrderDate > '1998-05-04 00:00:00.000';

/* 66. Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos junto con información de proveedores y categorías en la base de datos NORTHWIND. */
SELECT  Producto.ProductName AS 'Nombre Producto',  Categoria.CategoryName AS 'Categoria',  Proveedor.CompanyName AS 'Proveedor'
FROM  PRODUCTS AS Producto
INNER JOIN  SUPPLIERS AS Proveedor ON  Producto.SupplierID = Proveedor.SupplierID
INNER JOIN CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID
WHERE  Categoria.CategoryName = 'Seafood' AND Proveedor.CompanyName = 'Tokyo Traders';

/* 67. Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos junto con información de categorías en la base de datos NORTHWIND. */
SELECT   Producto.ProductName AS 'NombreProducto',  Categoria.CategoryName AS 'Categoria'
FROM  PRODUCTS AS Producto
INNER JOIN  CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID
WHERE   Categoria.CategoryName = 'Confections' OR Producto.ProductName LIKE '%Northwoods Cranberry Sauce%';

/* 68. Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos junto con información de categorías en la base de datos NORTHWIND. */
SELECT   Producto.ProductName AS 'NombreProducto',  Categoria.CategoryName AS 'Categoria'
FROM  PRODUCTS AS Producto
INNER JOIN  CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID
WHERE   Categoria.CategoryName = 'Dairy Products' OR Producto.ProductName LIKE '%Aniseed Syrup%';

/* 69. Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos junto con información de categorías en la base de datos NORTHWIND. */
SELECT   Producto.ProductName AS 'NombreProducto',  Categoria.CategoryName AS 'Categoria'
FROM  PRODUCTS AS Producto
INNER JOIN  CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID
WHERE   Categoria.CategoryName = 'Meat/Poultry' OR Producto.ProductName LIKE '%Chang%';

/* 70. Consulta que combina información de pedidos y clientes utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 5 caracteres del nombre del cliente. */
SELECT Pedido.OrderID AS 'Número Pedido',SUBSTRING(Cliente.CompanyName, 1, 5) AS 'Primeros 5 Caracteres Nombre Cliente'
FROM ORDERS AS Pedido
INNER JOIN  CUSTOMERS AS Cliente ON Pedido.CustomerID = Cliente.CustomerID;

/* 71. Consulta que combina información de empleados y pedidos utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 3 caracteres del apellido del empleado. */
SELECT Empleado.EmployeeID AS 'ID de Empleado',SUBSTRING(Empleado.LastName, 1, 3) AS 'Primeros 3 Caracteres Apellido Empleado'
FROM  EMPLOYEES AS Empleado
INNER JOIN ORDERS AS Pedido ON Empleado.EmployeeID = Pedido.EmployeeID;

/* 72. Consulta que combina información de productos y categorías utilizando INNER JOIN en la base de datos NORTHWIND. Se extraen los primeros 10 caracteres del nombre del producto. */
SELECT  Producto.ProductID AS 'IDProducto', SUBSTRING(Producto.ProductName, 1, 10) AS 'Primeros 10 Caracteres Nombre Producto'
FROM  PRODUCTS AS Producto
INNER JOIN   CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID;

/*73. Consulta obtiene el nombre de producto, nombre de categoria */
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID;

/*74. Consulta obtiene el nombre del producto, descontinuado, nombre de categoria, descripcion*/
SELECT Products.ProductName as 'Nombre de Producto', Products.Discontinued as 'Descontinuado', Categories.CategoryName as 'Nombre de Categoria', Categories.Description as 'Descripcion'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID;

/*75. Consulta obtiene el nombre del producto, descontinuado, nombre de categoria, descripcion*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Orden'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;

/*76. Consulta obtiene Nombre del empleado, apellido, id de orden, orden de fecha, fecha de requerido*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de Orden', Orders.OrderDate as 'Orden de Fecha', Orders.RequiredDate as 'Fecha de Requerido'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;

/*77. Consulta obtiene nombre de ship, nombre de compañia, numero de compañia*/
SELECT Orders.ShipName as 'Nombre de Shíp', Shippers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Numero de Orden'
FROM Shippers
LEFT JOIN Orders ON Shippers.ShipperID = Orders.ShipVia;

/*78. Consulta obtiene nombre de ship, nombre de compañia, numero de compañia, telefono*/
SELECT Orders.ShipName as 'Nombre de Shíp', Shippers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Numero de Orden', Shippers.Phone as 'Telefono'
FROM Shippers
LEFT JOIN Orders ON Shippers.ShipperID = Orders.ShipVia;

/*79. Consulta obtiene el nombre de la compañia, orden de fecha*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderDate as 'Orden de Fecha'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

/*80. Consulta obtiene el nombre de la compañia, nombre de contacto, ciudad, orden de fecha, fecha de requerido*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Customers.ContactName as 'Nombre de Contacto', Customers.City as 'Ciudad', Orders.OrderDate as 'Orden de Fecha', Orders.RequiredDate as 'Feche de requerido'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

/*81. Consulta obtiene el nombre de la compañia, nombre de contacto, ciudad, orden de fecha, fecha de requerido*/
SELECT Products.ProductName as 'Nombre de Producto', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

/*82. Consulta obtiene el nombre de producto, precio por unidad, unidades en stock, nombre de compañia, direccion, nombre de contacto, nombre de compañia, telefono*/
SELECT Products.ProductName as 'Nombre de Producto', Products.UnitPrice as 'Precio por Unidad', Products.UnitsInStock as 'Unidades en stock', Suppliers.CompanyName as 'Nombre de Compañia', Suppliers.Address as 'Direccion',
Suppliers.ContactName as 'Nombre de Contacto', Suppliers.CompanyName as 'Nombre de Compañia', Suppliers.Phone as 'Telefono'
FROM Products
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;



/* 83 Consulta obtiene el nombre de compañia, id de orden, region*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Id de Orden', Customers.Region as 'Region'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;



/*consulta con LEFT JOIN para combinar las tablas "Productos" y "Categorías" 
en función del ID de categoría (CategoryID). Luego, se aplica una condición WHERE
para filtrar los resultados y seleccionar solo los productos que pertenecen a una categoría específica.*/



/* 84 Consulta obtiene el nombre de producto, nombre de categoria*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Meat/Poultry';



/* 85 Consulta obtiene el nombre de compañia, nombre de producto*/
SELECT Suppliers.CompanyName as 'Nombre de Compañia', Products.ProductName as 'Nombre de Producto'
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE Suppliers.CompanyName = 'New England Seafood Cannery';



/* 86 Consulta obtiene el nombre de empleado, apellido de empleado, id de orden*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de Orden'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE Employees.LastName = 'King';



/* 87 Consulta obtiene el id de orden, nombre de ship, nombre de compañia*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship',Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Shippers.CompanyName = 'Speedy Express';



/* 88 Consulta obtiene el nombre de compañia, id de orden y where espesifica Simons bistro*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Id de Orden'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CompanyName = 'Simons bistro';



/*Consulta con LEFT JOIN para combinar las tablas "Employees", "Orders", "EmployeeTerritories" y "Territories" 
en función de las relaciones entre ellas. Devolverá los nombres de los empleados, los ID de los pedidos y
las descripciones de los territorios asignados a cada empleado. 
Si un empleado no tiene pedidos o territorios asignados, las columnas respectivas mostrarán NULL.*/


/* 89 Consulta obtiene el nombre de empleado, apellido, id de orden, territorio de descripcion*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de Orden', Territories.TerritoryDescription as 'Territorio de Descripcion'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
LEFT JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
LEFT JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID;



/* 90 Consulta obtiene el nombre de producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;


/* 91 Consulta obtiene el nombre de producto, cantidad, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto',  [Order Details].Quantity as 'Cantidad', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;


/* 92 Consulta obtiene el id de orden, id de producto, nombre de compañia*/
SELECT Orders.OrderID as 'Id de orden', [Order Details].ProductID as 'Id de Producto',Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID;



/* 93 Consulta obtiene el nombre de la compañia, id de orden, id de producto, cantidad*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Id de Orden', [Order Details].ProductID as 'Id de Producto', [Order Details].Quantity as 'Cantidad'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID;



/*LEFT JOIN para combinar las tablas mencionadas en función de las relaciones entre empleados,
órdenes, empleados y territorios. Luego, aplica una condición WHERE para 
filtrar los resultados y seleccionar empleados y órdenes asociadas con un territorio específico*/


/* 94 Consulta obtiene el nombre de empleado, apellido de empleado, id de orden, territorio de descripcion*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de orden', Territories.TerritoryDescription as 'Territorio de Descripcion'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
LEFT JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
LEFT JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
WHERE Territories.TerritoryDescription = 'Bloomfield Hills ';



/* 95 Consulta obtiene el nombre de empleado, apellido de empleado, id de orden, territorio de descripcion*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de orden', Territories.TerritoryDescription as 'Territorio de Descripcion'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
LEFT JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
LEFT JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
WHERE Territories.TerritoryDescription = 'Cambridge';



/* 96 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Dairy Products';



/* 97 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Beverages';




/* 98 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Condiments';




/* 99 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName  as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Confections';




/* 100 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Dairy Products';




/* 101 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Grains/Cereals';



/* 102 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Produce';



/* 103 Consulta obtiene el nombre del producto, cantidad, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto',  [Order Details].Quantity as 'Cantidad', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.CompanyName = 'Aux joyeux ecclésiastiques';


/* 104 Consulta obtiene el id de orden, id de producto, nombre de compañia*/
SELECT Orders.OrderID as 'Id de Orden', [Order Details].ProductID as 'Id de Producto',
    Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderDate >= '1996-07-04 00:00:00.000' AND Orders.OrderDate <= '1996-07-11 00:00:00.000';



/* 105 Consulta obtiene el id de orden, id de producto, nombre de compañia*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Id de Orden', [Order Details].ProductID as 'Id de Producto', [Order Details].Quantity as 'Cantidad'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Customers.CompanyName = 'Ana Trujillo Emparedados y helados';


------------------------


/* 106 Consulta obtiene el nombre de empleado con apellido, id de orden*/
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado',
    Orders.OrderID as 'Id de orden'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;



/* 107 Consulta obtiene el nombre de empleado con apellido, id de orden*/
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado',
    Orders.OrderID as 'Id de orden'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
where Orders.OrderID = '10787' ;



/* 108 Consulta obtiene el nombre de compañia, numero de pedido*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Count(Orders.OrderID) AS 'Numero de Pedidos' FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
GROUP BY Customers.CompanyName;



/* 109 Consulta obtiene el nombre de producto, orden de cantidad*/
SELECT   Products.ProductName as 'Nombre de Producto',
  COUNT([Order Details].ProductID) AS 'Orden de Cantidad'
FROM Products
LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
GROUP BY Products.ProductName;




/* 110 Consulta obtiene el nombre de producto, orden de cantidad*/
SELECT  Products.ProductName as 'Nombre de Producto',
 COUNT([Order Details].ProductID) AS 'Orden de Cantidad'
FROM Products
LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE Products.ProductName LIKE '%Queso Cabrales%'
GROUP BY Products.ProductName;



/* 111 Consulta obtiene el id de orden, nommbre de producto, cantidad*/
SELECT Orders.OrderID as 'Id de Orden', Products.ProductName as 'Nombre de Producto', [Order Details].Quantity as 'Cantidad'
FROM Orders
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
LEFT JOIN Products ON [Order Details].ProductID = Products.ProductID;


/* 112 Consulta obtiene el id de orden, nommbre de producto, cantidad*/
SELECT Orders.OrderID as 'Id de Orden', Products.ProductName as 'Nombre de Producto', [Order Details].Quantity as 'Cantidad'
FROM Orders
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
LEFT JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE [Order Details].Quantity > 10;




/* 113 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  de la orden */
SELECT Employees.EmployeeID as 'Id de empleado',Orders.OrderID as 'Id de Orden',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerido'
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.OrderID = '10250';
/**/

/*
 114 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  del empleado */
SELECT Employees.EmployeeID as 'Id de empleado',Orders.OrderID as 'Id de Orden',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerido'
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID = '3';


/*
 115 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  del empleado */
SELECT Employees.EmployeeID as 'Id de empleado',Orders.OrderID as 'Id de Orden',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerido'
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID = '8';


/* 116 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  del empleado */
SELECT Employees.EmployeeID as 'Id de empleado',Orders.OrderID as 'Id de Orden',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerido'
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID = '1';
/**/

/* 117 consulta obtiene el ID del pedido  y el nombre de la compañia y where para buscar especificamente la compañia*/
SELECT Orders.OrderID as 'Id de Orden', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Shippers.CompanyName = 'United Package';
/**/
/* 118 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente la compañia y nombre del transportista*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipName = 'Ernst Handel' and Shippers.CompanyName= 'United Package';


/* 119 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente la compañia y nombre del transportista*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders 
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipName = 'Hanari Carnes' and Shippers.CompanyName= 'Federal Shipping';


/**/
/* 120 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '10265';
/**/

/* 121 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '11061';
/**/

/* 122 consulta obtiene el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '10269';



/*123Consulta que combina información de productos y detalles de pedidos utilizando LEFT JOIN en la base de datos NORTHWIND. 
Se extraen los primeros 5 caracteres del nombre del producto.*/
SELECT Producto.ProductID AS 'ID de Producto',
  SUBSTRING(Producto.ProductName, 1, 5) AS 'Primeros 5 Caracteres Nombre Producto'
FROM   PRODUCTS AS Producto
LEFT JOIN   [Order Details] AS Detalle ON  Producto.ProductID = Detalle.ProductID;

/*124Consulta que combina información de pedidos y transportistas utilizando LEFT JOIN en la base de datos NORTHWIND. 
Se extraen los primeros 4 caracteres del nombre del transportista.*/
SELECT Pedido.OrderID AS 'Número de Pedido', SUBSTRING(Transportista.CompanyName, 1, 4) AS 'Primeros 4 Caracteres Nombre Transportista'
FROM  ORDERS AS Pedido
LEFT JOIN  SHIPPERS AS Transportista ON  Pedido.ShipVia = Transportista.ShipperID;

/*125 Consulta que combina información de detalles de pedidos y pedidos utilizando LEFT JOIN en la base de datos NORTHWIND.
Se extraen los primeros 5 caracteres del nombre del producto.*/
SELECT Detalle.OrderID AS 'Número de Pedido',SUBSTRING(Producto.ProductName, 1, 14) AS 'Primeros 14 Caracteres Nombre Producto'
FROM [Order Details] AS Detalle
LEFT JOIN   ORDERS AS Pedido ON  Detalle.OrderID = Pedido.OrderID
LEFT JOIN PRODUCTS AS Producto ON  Detalle.ProductID = Producto.ProductID
WHERE Producto.ProductName = 'Queso Manchego La Pastora';

/*126 Consulta que combina información de productos y proveedores utilizando LEFT JOIN en la base de datos NORTHWIND. 
Se extraen los primeros 8 caracteres del nombre del proveedor.*/
SELECT Producto.ProductID AS 'ID de Producto',
       SUBSTRING(Proveedor.CompanyName, 1, 11) AS 'Primeros 10 Caracteres Compañía Proveedor'
FROM   PRODUCTS AS Producto
LEFT JOIN  SUPPLIERS AS Proveedor
ON  Producto.SupplierID = Proveedor.SupplierID
WHERE Proveedor.CompanyName = 'New Orleans Cajun Delights';

/*127 Consulta que combina información de pedidos, clientes y empleados utilizando LEFT JOIN en la base de datos NORTHWIND.
Se extraen los primeros 5 caracteres del nombre del cliente.*/
SELECT  Pedido.OrderID AS 'Número de Pedido',
        SUBSTRING(Cliente.ContactName, 1, 5) AS 'Primeros 5 Caracteres Contacto Cliente',
        SUBSTRING(Empleado.LastName, 1, 5) AS 'Primeros 5 Caracteres Nombre Empleado'
FROM ORDERS AS Pedido
LEFT JOIN  CUSTOMERS AS Cliente ON Pedido.CustomerID = Cliente.CustomerID
LEFT JOIN EMPLOYEES AS Empleado ON  Pedido.EmployeeID = Empleado.EmployeeID
WHERE Cliente.ContactName = 'Jaime Yorres';

/*128 Consulta que combina información de asignaciones de empleados a territorios, territorios y empleados utilizando LEFT JOIN en la base de datos NORTHWIND. 
Se extraen los primeros 7 caracteres del nombre del territorio.*/
SELECT  Asignacion.EmployeeID AS 'ID de Empleado',SUBSTRING(Territorio.TerritoryDescription, 1, 7) AS 'Primeros 5 Caracteres Descripción Territorio',
  SUBSTRING(Empleado.LastName, 1, 5) AS 'Primeros 5 Caracteres Apellido Empleado'
FROM  EMPLOYEETERRITORIES AS Asignacion
LEFT JOIN TERRITORIES AS Territorio ON  Asignacion.TerritoryID = Territorio.TerritoryID
LEFT JOIN EMPLOYEES AS Empleado ON  Asignacion.EmployeeID = Empleado.EmployeeID ;

/*129 Consulta que combina información de proveedores, productos y categorías utilizando LEFT JOIN en la base de datos NORTHWIND. 
Se extraen los primeros 10 caracteres del nombre del producto.*/
SELECT 
  Proveedor.CompanyName AS 'Nombre de Proveedor',
  SUBSTRING(Producto.ProductName, 1, 10) AS 'Primeros 10 Caracteres Nombre Producto',
  Categoria.CategoryName AS 'Nombre Categoria'
FROM  PRODUCTS AS Producto
LEFT JOIN  SUPPLIERS AS Proveedor ON Producto.SupplierID = Proveedor.SupplierID
LEFT JOIN CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID;

/*130 Consulta que utiliza HAVING para encontrar clientes que han realizado más de 3 pedidos en la base de datos NORTHWIND.*/
SELECT  Cliente.CustomerID, COUNT(Pedido.OrderID) AS 'Total Pedidos'
FROM  CUSTOMERS AS Cliente
LEFT JOIN  ORDERS AS Pedido ON   Cliente.CustomerID = Pedido.CustomerID
GROUP BY  Cliente.CustomerID
HAVING  COUNT(Pedido.OrderID) > 3;

/*131 Consulta que utiliza HAVING para encontrar empleados que hayan gestionado más de 10 pedidos en la base de datos NORTHWIND.*/
SELECT  Empleado.EmployeeID, COUNT(Pedido.OrderID) AS 'Total Pedidos Gestionados'
FROM  EMPLOYEES AS Empleado
LEFT JOIN ORDERS AS Pedido ON  Empleado.EmployeeID = Pedido.EmployeeID
GROUP BY  Empleado.EmployeeID
HAVING COUNT(Pedido.OrderID) > 10;

/*132 Consulta que utiliza HAVING para encontrar categorías de productos con más de 5 productos en la base de datos NORTHWIND.*/
SELECT   Categoria.CategoryName AS 'Nombre Categoria',  COUNT(Producto.ProductID) AS 'Total Productos'
FROM   CATEGORIES AS Categoria
LEFT JOIN  PRODUCTS AS Producto ON   Categoria.CategoryID = Producto.CategoryID
GROUP BY   Categoria.CategoryName
HAVING  COUNT(Producto.ProductID) > 5;

/* 133 Consulta que utiliza HAVING para encontrar productos con más de 100 unidades vendidas en detalles de pedidos en la base de datos NORTHWIND.*/
SELECT Producto.ProductName AS 'Nombre Producto', SUM(Detalle.Quantity) AS 'Total Unidades Vendidas'
FROM  PRODUCTS AS Producto
LEFT JOIN  [Order Details] AS Detalle
ON  Producto.ProductID = Detalle.ProductID
GROUP BY   Producto.ProductName
HAVING  SUM(Detalle.Quantity) > 100;

/*134 Consulta que utiliza HAVING para encontrar transportistas que han entregado más de 50 pedidos en la base de datos NORTHWIND.*/
SELECT  Transportista.CompanyName AS 'Nombre Transportista',COUNT(Pedido.OrderID) AS 'Total Pedidos Entregados'
FROM  SHIPPERS AS Transportista
LEFT JOIN  ORDERS AS Pedido ON  Transportista.ShipperID = Pedido.ShipVia
GROUP BY  Transportista.CompanyName
HAVING   COUNT(Pedido.OrderID) > 50;

/*135 Consulta que utiliza una filtración por fecha para encontrar detalles de pedidos de productos vendidos después de una 
fecha específica en la base de datos NORTHWIND.*/
SELECT  Detalle.OrderID AS 'Numero Pedido',  Detalle.ProductID AS 'ID Producto',  Detalle.Quantity AS 'Cantidad', Pedido.OrderDate AS 'Fecha Buscada'
FROM [Order Details] AS Detalle
LEFT JOIN ORDERS AS Pedido ON  Detalle.OrderID = Pedido.OrderID
WHERE  Pedido.OrderDate > '1998-05-05 00:00:00.000';

/*136 Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos en la base de datos NORTHWIND.*/
SELECT  Producto.ProductName AS 'Nombre Producto', Categoria.CategoryName AS 'Tipo Producto',  Proveedor.CompanyName AS 'Nombre Compañía'
FROM   PRODUCTS AS Producto
LEFT JOIN  SUPPLIERS AS Proveedor ON  Producto.SupplierID = Proveedor.SupplierID
LEFT JOIN   CATEGORIES AS Categoria ON   Producto.CategoryID = Categoria.CategoryID
WHERE  Categoria.CategoryName = 'Grains/Cereals';

/*137 Consulta que utiliza una filtración por fecha para encontrar pedidos realizados después de una fecha específica junto con información de clientes 
y empleados en la base de datos NORTHWIND.*/
SELECT  Pedido.OrderID AS 'ID Pedido', Cliente.ContactName AS 'Nombre Cliente',  Empleado.FirstName AS 'Nombre Empleado',  Pedido.OrderDate AS 'Fecha Pedido'
FROM   ORDERS AS Pedido
LEFT JOIN  CUSTOMERS AS Cliente ON  Pedido.CustomerID = Cliente.CustomerID
LEFT JOIN  EMPLOYEES AS Empleado ON   Pedido.EmployeeID = Empleado.EmployeeID
WHERE   Pedido.OrderDate > '1998-05-04 00:00:00.000';

/*138 Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos junto con información de proveedores
y categorías en la base de datos NORTHWIND.*/
SELECT  Producto.ProductName AS 'Nombre Producto',  Categoria.CategoryName AS 'Categoria',  Proveedor.CompanyName AS 'Proveedor'
FROM  PRODUCTS AS Producto
LEFT JOIN  SUPPLIERS AS Proveedor ON  Producto.SupplierID = Proveedor.SupplierID
LEFT JOIN CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID
WHERE  Categoria.CategoryName = 'Seafood' AND Proveedor.CompanyName = 'Tokyo Traders';

/*139 Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos junto con información de categorías
en la base de datos NORTHWIND.*/
SELECT   Producto.ProductName AS 'Nombre Producto',  Categoria.CategoryName AS 'Categoria'
FROM  PRODUCTS AS Producto
LEFT JOIN  CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID
WHERE   Categoria.CategoryName = 'Confections' OR Producto.ProductName LIKE '%Northwoods Cranberry Sauce%';

/*140 Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos junto con información de categorías
en la base de datos NORTHWIND.*/
SELECT   Producto.ProductName AS 'Nombre Producto',  Categoria.CategoryName AS 'Categoria'
FROM  PRODUCTS AS Producto
LEFT JOIN  CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID
WHERE   Categoria.CategoryName = 'Dairy Products' OR Producto.ProductName LIKE '%Aniseed Syrup%';

/*141 Consulta que utiliza una filtración por tipo (CategoryName) y marca (SupplierName) de productos junto con información de categorías
en la base de datos NORTHWIND.*/
SELECT   Producto.ProductName AS 'Nombre Producto',  Categoria.CategoryName AS 'Categoria'
FROM  PRODUCTS AS Producto
LEFT JOIN  CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID
WHERE   Categoria.CategoryName = 'Meat/Poultry' OR Producto.ProductName LIKE '%Chang%';

/* 142 Consulta que combina información de pedidos y clientes utilizando LEFT JOIN en la base de datos NORTHWIND.
Se extraen los primeros 5 caracteres del nombre del cliente.*/
SELECT Pedido.OrderID AS 'ID Pedido',SUBSTRING(Cliente.CompanyName, 1, 5) AS 'Primeros 5 Caracteres Nombre Cliente'
FROM ORDERS AS Pedido
LEFT JOIN  CUSTOMERS AS Cliente ON Pedido.CustomerID = Cliente.CustomerID;

/*143 Consulta que combina información de empleados y pedidos utilizando LEFT JOIN en la base de datos NORTHWIND.
Se extraen los primeros 3 caracteres del apellido del empleado.*/
SELECT Empleado.EmployeeID AS 'ID Empleado',SUBSTRING(Empleado.LastName, 1, 3) AS 'Primeros 3 Caracteres Apellido Empleado'
FROM  EMPLOYEES AS Empleado
LEFT JOIN ORDERS AS Pedido ON Empleado.EmployeeID = Pedido.EmployeeID;

/* 144 Consulta que combina información de productos y categorías utilizando LEFT JOIN en la base de datos NORTHWIND. 
Se extraen los primeros 10 caracteres del nombre del producto.*/
SELECT  Producto.ProductID AS 'ID Producto', SUBSTRING(Producto.ProductName, 1, 10) AS 'Primeros 10 Caracteres Nombre Producto'
FROM  PRODUCTS AS Producto
LEFT JOIN   CATEGORIES AS Categoria ON  Producto.CategoryID = Categoria.CategoryID;
