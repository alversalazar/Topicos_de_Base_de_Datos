
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


/* 3 Consulta Seleccionar los nombres de los empleados y su descripcion de territorio en la que se asignan where especifica el terrirtorio*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Territories.TerritoryDescription as 'Descripcion de Territorio'
FROM Employees
INNER JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
 WHERE Territories.TerritoryDescription = 'Santa Clara '; 


 /* 4 Consulta seleccionar los nombres de los empleados y su descripcion de territorio en la que se asignan where especifica el terrirtorio*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Territories.TerritoryDescription as 'Descripcion de Territorio'
FROM Employees
INNER JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
 WHERE Territories.TerritoryDescription = 'Bloomfield Hills '; 


/* 5 consulta selecciona el nombre de la categoría de productos y el nombre de los productos. */
SELECT Categories.CategoryName as 'Nombre de Categoria', Products.ProductName as 'Nombre de Producto'
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID;



/* 6 consulta obtiene ID de orden, el nombre de la compañia, la fecha de orden, el contactor 
y WHERE busca espesificamente . */
SELECT Orders.OrderID as 'Id de Orden', Customers.CompanyName as 'Nombre de Compañia',Orders.OrderDate as 'Fecha de Orden', Customers.ContactName as 'Nombre de Contacto'
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderID = '10251 ';  


/* 7 consulta obtiene ID de orden, el nombre de la compañia, la fecha de orden, el contactor 
y WHERE busca espesificamente . */
SELECT Orders.OrderID as 'Id de Orden', Customers.CompanyName as 'Nombre de compañia',Orders.OrderDate as 'Fecha de Orden', Customers.ContactName as 'Nombre de Contacto'
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderID = '10874 ' and Customers.CompanyName= 'Godos Cocina Típica ' ;  


/* 8 consulta obtiene ID de orden, el nombre de la compañia, la fecha de orden, el contactor 
y WHERE busca espesificamente . */
SELECT Orders.OrderID as 'Id de Orden', Customers.CompanyName as 'Nombre de compañia',Orders.OrderDate as 'Fecha de Orden', Customers.ContactName as 'Nombre de Contacto'
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderID = '10253 ';  


/* 9 consulta selecciona el ID del pedido , el nombre del cliente,
el nombre del empleado y solo devuelve los registros donde la fecha de envío no sea nula*/
SELECT Orders.OrderID as 'Id de Orden', Customers.CompanyName as 'Nombre de compañia', Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado'
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.ShippedDate IS NOT NULL;


/* 10 consulta obtiene el ID del pedido , el nombre del producto  y la cantidad de productos en cada pedido. 
 solo devolverá registros donde la fecha de envío (ShippedDate) no sea nula. */
SELECT Orders.OrderID as 'Id de Orden', Products.ProductName as 'Nombre de Producto', [Order Details].Quantity as 'Cantidades'
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Orders.ShippedDate IS NOT NULL;



/* 11 consulta obtiene el ID de la orden  y el nombre del producto  y
solo devuelve los registros donde el nombre del producto coincide con el valor especificado  WHERE*/
SELECT Orders.OrderID as 'Id de Orden', Products.ProductName as 'Nombre de Producto'
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Products.ProductName = 'Mozzarella di Giovanni';




/* 12 consulta obtiene el nombre de la categoría, el nombre del producto y el nombre del proveedor*/
SELECT Categories.CategoryName as 'Nombre de Categoria', Products.ProductName as 'Nombre de Producto', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;



/* 13 consulta obtiene el nombre de la categoría, el nombre del producto y el nombre del proveedor 
espesificando la categoria */
SELECT Categories.CategoryName as 'Nombre de Categoria', Products.ProductName as 'Nombre de Producto', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Seafood';



/* 14 consulta obtiene el nombre de la categoría, el nombre del producto y el nombre del proveedor 
espesificando la categoria */
SELECT Categories.CategoryName as 'Nombre de Categoria', Products.ProductName as 'Nombre de Producto', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Condiments';



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

/* 23 consulta OBTIEne el ID del pedido  y el nombre de la compañia y where para buscar especificamente la compañia*/
SELECT Orders.OrderID as 'Nombre de Categoria', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Shippers.CompanyName = 'United Package';
/**/
/* 24 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente la compañia y nombre del transportista*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipName = 'Ernst Handel' and Shippers.CompanyName= 'United Package';

/* 25 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente la compañia y nombre del transportista*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipName = 'Hanari Carnes' and Shippers.CompanyName= 'Federal Shipping';

/**/
/* 26 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '10265';
/**/

/* 27 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '11061';
/**/

/* 28 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
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


/* 45 Consulta Obtine los primeros 8 de cada tabla de category y Product */
select *                                                             
From Categories A														  
inner join Products B												 
on (B.ProductID = A.CategoryID)

/* 46 Consulta Obtine el nombre de la categoria las unidades disponibles y el where espesifica el valor de 10:00 por unidad */
select A.CategoryName as 'Nombre de categoria',B.UnitsInStock as 'Unidades en Stock',B.UnitPrice as 'Precio por unidad' 
From Categories A														  
inner join Products B												  
on (B.CategoryID = A.CategoryID)											  
where B.UnitPrice IN ('10.00')		


/* 47 Consulta Obtine el nombre de la categoria las unidades que quedan y el where espesifica las que ya estan descontinuadas */
select A.CategoryName as 'Nombre de categoria',B.UnitsInStock as 'Unidades en Stock',B.Discontinued as 'Descontinuadas' 
From Categories A														  
inner join Products B												  
on (B.CategoryID = A.CategoryID)											  
where B.Discontinued IN ('0')		


/* 48 Consulta Obtine el nombre de la categoria las unidades que quedan y el where espesifica las que ya estan descontinuadas */
select A.CategoryName as 'Nombre de categoria',B.UnitsInStock as 'Unidades en Stock',B.Discontinued as 'Descontinuadas' 
From Categories A														  
inner join Products B												  
on (B.CategoryID = A.CategoryID)											  
where B.Discontinued IN ('1')		


/* 49 Consulta Obtine el nombre del producto de que compañia viene y donde esta su direccion */
select A.ProductName as 'Nombre de producto',B.CompanyName as 'Nombre de compañia',B.Address as 'Direccion de compañia' 
From Products A														  
inner join Suppliers B												  
on (B.SupplierID = A.ProductID)											  

/**/
/* 50 Consulta Obtine el nombre del producto su precio la compañia que lo hace su direccion codigo postal y el where espesifica que solo de usa */
select A.ProductName as 'Nombre de producto',A.UnitPrice as 'Precio de producto',B.CompanyName as 'Nombre de compañia',B.Address as 'Direccion de compañia',B.PostalCode as 'Codigo postal',B.Country as 'Pais'  
From Products A														  
inner join Suppliers B												  
on (B.SupplierID = A.ProductID)		
where B.Country IN ('USA')


/**/
/**/
/**/
/**/

--select * from Employees
--select * from EmployeeTerritories
--select * from Categories

--select * from Customers
--select * from CustomerDemographics
--select * from CustomerCustomerDemo
--select * from [Order Details]
--select * from Orders
--select * from Products
--select * from Region
--select * from Shippers
--select * from Suppliers
--select * from Territories

--select * from Categories
--select * from Products
--select * from Suppliers



/*consulta utiliza LEFT JOIN para combinar las tablas "Productos" y "Categorías" en función del ID de categoría (CategoryID). 
Devolverá todos los productos y mostrará la categoría a la que están asignadas, si tienen una. 
Si un producto no está asignado a una categoría, la columna "CategoryName" mostrará NULL. y asi igual en las demas*/

/* 51 Consulta obtiene el nombre de producto, nombre de categoria */
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID;


/* 52 Consulta obtiene el nombre del producto, descontinuado, nombre de categoria, descripcion*/
SELECT Products.ProductName as 'Nombre de Producto',Products.Discontinued as 'Descontinuado', Categories.CategoryName as 'Nombre de Categoria',Categories.Description as 'Descripcion'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID;


/* 53 Consulta obtiene el nombre del producto, descontinuado, nombre de categoria, descripcion*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Orden'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;


/* 54 Consulta obtiene Nombre del empleado, apellido, id de orden, orden de fecha, fecha de requerido*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de Orden', Orders.OrderDate as 'Orden de Fecha',Orders.RequiredDate as 'Fecha de Requerido'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;


/* 55 Consulta obtiene nombre de ship, nombre de compañia, numero de compañia*/
SELECT Orders.ShipName as 'Nombre de Shíp',Shippers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Numero de Orden'
FROM Shippers
LEFT JOIN Orders ON Shippers.ShipperID = Orders.ShipVia;


/* 56 Consulta obtiene nombre de ship, nombre de compañia, numero de compañia, telefono*/
SELECT Orders.ShipName as 'Nombre de Shíp',Shippers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Numero de Orden',Shippers.Phone as 'Telefono'
FROM Shippers
LEFT JOIN Orders ON Shippers.ShipperID = Orders.ShipVia;



/* 57 Consulta obtiene el nombre de la compañia, orden de fecha*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderDate as 'Orden de Fecha'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


/* 58 Consulta obtiene el nombre de la compañia, nombre de contacto, ciudad, orden de fecha, fecha de requerido*/
SELECT Customers.CompanyName as 'Nombre de Compañia',Customers.ContactName as 'Nombre de Contacto',Customers.City as 'Ciudad', Orders.OrderDate as 'Orden de Fecha', Orders.RequiredDate as 'Feche de requerido'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;



/* 59 Consulta obtiene el nombre de la compañia, nombre de contacto, ciudad, orden de fecha, fecha de requerido*/
SELECT Products.ProductName as 'Nombre de Producto', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;



/* 60 Consulta obtiene el nombre de producto, precio por unidad, unidades en stock, nombre de compañia, direccion, nombre de contacto, nombre de compañia, telefono*/
SELECT Products.ProductName as 'Nombre de Producto',Products.UnitPrice as 'Precio por Unidad',Products.UnitsInStock as 'Unidades en stock',Suppliers.CompanyName as 'Nombre de Compañia' , Suppliers.Address as 'Direccion',
Suppliers.ContactName as 'Nombre de Contacto',Suppliers.CompanyName as 'Nombre de Compañia', Suppliers.Phone as 'Telefono'
FROM Products
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;



/* 61 Consulta obtiene el nombre de compañia, id de orden, region*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Id de Orden', Customers.Region as 'Region'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;



/*consulta con LEFT JOIN para combinar las tablas "Productos" y "Categorías" 
en función del ID de categoría (CategoryID). Luego, se aplica una condición WHERE
para filtrar los resultados y seleccionar solo los productos que pertenecen a una categoría específica.*/



/* 62 Consulta obtiene el nombre de producto, nombre de categoria*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Meat/Poultry';



/* 63 Consulta obtiene el nombre de compañia, nombre de producto*/
SELECT Suppliers.CompanyName as 'Nombre de Compañia', Products.ProductName as 'Nombre de Producto'
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE Suppliers.CompanyName = 'New England Seafood Cannery';



/* 64 Consulta obtiene el nombre de empleado, apellido de empleado, id de orden*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de Orden'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE Employees.LastName = 'King';



/* 65 Consulta obtiene el id de orden, nombre de ship, nombre de compañia*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de Ship',Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Shippers.CompanyName = 'Speedy Express';



/* 66 Consulta obtiene el nombre de compañia, id de orden y where espesifica Simons bistro*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Id de Orden'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CompanyName = 'Simons bistro';



/*Consulta con LEFT JOIN para combinar las tablas "Employees", "Orders", "EmployeeTerritories" y "Territories" 
en función de las relaciones entre ellas. Devolverá los nombres de los empleados, los ID de los pedidos y
las descripciones de los territorios asignados a cada empleado. 
Si un empleado no tiene pedidos o territorios asignados, las columnas respectivas mostrarán NULL.*/


/* 67 Consulta obtiene el nombre de empleado, apellido, id de orden, territorio de descripcion*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de Orden', Territories.TerritoryDescription as 'Territorio de Descripcion'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
LEFT JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
LEFT JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID;



/* 68 Consulta obtiene el nombre de producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;


/* 69 Consulta obtiene el nombre de producto, cantidad, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto',  [Order Details].Quantity as 'Cantidad', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;


/* 70 Consulta obtiene el id de orden, id de producto, nombre de compañia*/
SELECT Orders.OrderID as 'Id de orden', [Order Details].ProductID as 'Id de Producto',Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID;



/* 71 Consulta obtiene el nombre de la compañia, id de orden, id de producto, cantidad*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Id de Orden', [Order Details].ProductID as 'Id de Producto', [Order Details].Quantity as 'Cantidad'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID;



/*LEFT JOIN para combinar las tablas mencionadas en función de las relaciones entre empleados,
órdenes, empleados y territorios. Luego, aplica una condición WHERE para 
filtrar los resultados y seleccionar empleados y órdenes asociadas con un territorio específico*/


/* 72 Consulta obtiene el nombre de empleado, apellido de empleado, id de orden, territorio de descripcion*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de orden', Territories.TerritoryDescription as 'Territorio de Descripcion'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
LEFT JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
LEFT JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
WHERE Territories.TerritoryDescription = 'Bloomfield Hills ';



/* 73 Consulta obtiene el nombre de empleado, apellido de empleado, id de orden, territorio de descripcion*/
SELECT Employees.FirstName as 'Nombre de Empleado', Employees.LastName as 'Apellido de Empleado', Orders.OrderID as 'Id de orden', Territories.TerritoryDescription as 'Territorio de Descripcion'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
LEFT JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
LEFT JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
WHERE Territories.TerritoryDescription = 'Cambridge';



/* 74 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Dairy Products';



/* 75 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Beverages';




/* 76 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Condiments';




/* 77 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName  as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Confections';




/* 78 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Dairy Products';




/* 79 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Grains/Cereals';



/* 80 Consulta obtiene el nombre del producto, nombre de categoria, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto', Categories.CategoryName as 'Nombre de Categoria', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Produce';



/* 81 Consulta obtiene el nombre del producto, cantidad, nombre de compañia*/
SELECT Products.ProductName as 'Nombre de Producto',  [Order Details].Quantity as 'Cantidad', Suppliers.CompanyName as 'Nombre de Compañia'
FROM Products
LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.CompanyName = 'Aux joyeux ecclésiastiques';


/* 82 Consulta obtiene el id de orden, id de producto, nombre de compañia*/
SELECT Orders.OrderID as 'Id de Orden', [Order Details].ProductID as 'Id de Producto',
    Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderDate >= '1996-07-04 00:00:00.000' AND Orders.OrderDate <= '1996-07-11 00:00:00.000';



/* 83 Consulta obtiene el id de orden, id de producto, nombre de compañia*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Orders.OrderID as 'Id de Orden', [Order Details].ProductID as 'Id de Producto', [Order Details].Quantity as 'Cantidad'
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Customers.CompanyName = 'Ana Trujillo Emparedados y helados';


------------------------


/* 84 Consulta obtiene el nombre de empleado con apellido, id de orden*/
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado',
    Orders.OrderID as 'Id de orden'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;



/* 85 Consulta obtiene el nombre de empleado con apellido, id de orden*/
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado',
    Orders.OrderID as 'Id de orden'
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
where Orders.OrderID = '10787' ;



/* 86 Consulta obtiene el nombre de compañia, numero de pedido*/
SELECT Customers.CompanyName as 'Nombre de Compañia', Count(Orders.OrderID) AS 'Numero de Pedidos' FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
GROUP BY Customers.CompanyName;



/* 87 Consulta obtiene el nombre de producto, orden de cantidad*/
SELECT   Products.ProductName as 'Nombre de Producto',
  COUNT([Order Details].ProductID) AS 'Orden de Cantidad'
FROM Products
LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
GROUP BY Products.ProductName;




/* 88 Consulta obtiene el nombre de producto, orden de cantidad*/
SELECT  Products.ProductName as 'Nombre de Producto',
 COUNT([Order Details].ProductID) AS 'Orden de Cantidad'
FROM Products
LEFT JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE Products.ProductName LIKE '%Queso Cabrales%'
GROUP BY Products.ProductName;



/* 89 Consulta obtiene el id de orden, nommbre de producto, cantidad*/
SELECT Orders.OrderID as 'Id de Orden', Products.ProductName as 'Nombre de Producto', [Order Details].Quantity as 'Cantidad'
FROM Orders
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
LEFT JOIN Products ON [Order Details].ProductID = Products.ProductID;


/* 90 Consulta obtiene el id de orden, nommbre de producto, cantidad*/
SELECT Orders.OrderID as 'Id de Orden', Products.ProductName as 'Nombre de Producto', [Order Details].Quantity as 'Cantidad'
FROM Orders
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
LEFT JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE [Order Details].Quantity > 10;




/* 91 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  de la orden */
SELECT Employees.EmployeeID as 'Id de empleado',Orders.OrderID as 'Id de Orden',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerido'
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.OrderID = '10250';
/**/

/*
 92 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  del empleado */
SELECT Employees.EmployeeID as 'Id de empleado',Orders.OrderID as 'Id de Orden',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerido'
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID = '3';


/*
 93 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  del empleado */
SELECT Employees.EmployeeID as 'Id de empleado',Orders.OrderID as 'Id de Orden',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerido'
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID = '8';


/* 94 consulta obtiene el ID del empleado y la orden y nombre completo del empleado concatenando FirstName y LastName  y
la fecha de la orden y where busca el ID  del empleado */
SELECT Employees.EmployeeID as 'Id de empleado',Orders.OrderID as 'Id de Orden',CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Nombre de Empleado', Orders.OrderDate as 'Fecha de Orden', Orders.RequiredDate as 'Fecha de Requerido'
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID = '1';
/**/

/* 95 consulta OBTIEne el ID del pedido  y el nombre de la compañia y where para buscar especificamente la compañia*/
SELECT Orders.OrderID as 'Id de Orden', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Shippers.CompanyName = 'United Package';
/**/
/* 96 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente la compañia y nombre del transportista*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipName = 'Ernst Handel' and Shippers.CompanyName= 'United Package';


/* 97 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente la compañia y nombre del transportista*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders 
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipName = 'Hanari Carnes' and Shippers.CompanyName= 'Federal Shipping';


/**/
/* 98 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '10265';
/**/

/* 99 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '11061';
/**/

/* 100 consulta OBTIEne el ID del pedido  y el nombre de la compañia , 
y where para buscar especificamente el ID*/
SELECT Orders.OrderID as 'Id de Orden',Orders.ShipName as 'Nombre de ship', Shippers.CompanyName as 'Nombre de Compañia', Shippers.Phone as 'Telefono'
FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID = '10269';