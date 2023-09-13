/* 1 Consulta que cuenta el número de ventas realizadas en cada tienda*/
SELECT STORES.stor_name AS 'Nombre de Tienda', COUNT(SALES.ord_num) AS 'Número de Ventas'
FROM STORES
INNER JOIN SALES ON STORES.stor_id = SALES.stor_id
GROUP BY STORES.stor_name;


/* 2 Consulta Obtine referencia de titulo nombre de titulo el tipo y la realeza del libro el where espesifica cuantos titulos ahi con ese nombre */
select A.title_id as 'Referencia de titulo',A.title as 'Nombre de titulo',A.type as 'Tipo de titulo',B.royalty as 'Realeza de libro'
From titles A														  
inner join roysched B												  
on (B.title_id = A.title_id)
where A.title IN ('But Is It User Friendly?')

/* 3 Consulta de Lista las tiendas y sus ventas ordenadas por fecha */
SELECT Stores.stor_name AS 'Nombre de la Tienda', Sales.ord_date AS 'Fecha de Venta'
FROM Stores
INNER JOIN Sales ON Stores.stor_id = Sales.stor_id
ORDER BY Sales.ord_date;

/* 4 Consulta que Muestra los descuentos en mayúsculas junto con las tiendas */
SELECT upper(Discounts.discounttype) AS 'Tipo de Descuento en Mayúsculas', Stores.stor_name AS 'Nombre de la Tienda'
FROM Discounts
INNER JOIN Stores ON Discounts.stor_id = Stores.stor_id;

/* 5 Consulta de Lista los nombres de autores en minúsculas con sus respectivos libros */
SELECT LOWER(Authors.au_fname) AS 'Nombre del Autor en Minúsculas', Titles.title AS 'Título del Libro'
FROM TitleAuthor
INNER JOIN Authors ON TitleAuthor.au_id = Authors.au_id
INNER JOIN Titles ON TitleAuthor.title_id = Titles.title_id;


/* 6 Consulta que Encuentra la máxima cantidad vendida por título */
SELECT Titles.title AS 'Título', MAX(Sales.qty) AS 'Máxima Cantidad Vendida'
FROM Sales
INNER JOIN Titles ON Sales.title_id = Titles.title_id
GROUP BY Titles.title;

/* 7 Consulta que Encuentra la mínima cantidad vendida por título */
SELECT Titles.title AS 'Título', MIN(Sales.qty) AS 'Mínima Cantidad Vendida'
FROM Sales
INNER JOIN Titles ON Sales.title_id = Titles.title_id
GROUP BY Titles.title;

/* 8 Consulta: Muestra los títulos en mayúsculas junto con los nombres de las editoriales */
SELECT UPPER(Titles.title) AS 'Título en Mayúsculas', Publishers.pub_name AS 'Nombre de la Editorial'
FROM Titles
INNER JOIN Publishers ON Titles.pub_id = Publishers.pub_id;

/* 9 Consulta: Lista los nombres de empleados en minúsculas junto con sus departamentos */
SELECT LOWER(employee.fname) AS 'Nombre del Empleado en Minúsculas'
FROM Publishers
INNER JOIN employee ON Publishers.pub_id = employee.emp_id;

/* 10 Consulta: Encuentra la mínima cantidad vendida por tienda */
SELECT Stores.stor_name AS 'Nombre de la Tienda', MIN(Sales.qty) AS 'MINIMA Cantidad Vendida'
FROM Stores
INNER JOIN Sales ON Stores.stor_id = Sales.stor_id
INNER JOIN Titles ON Sales.title_id = Titles.title_id
GROUP BY Stores.stor_name;

/* 11 Consulta: Encuentra la máxima cantidad vendida por tienda */
SELECT Stores.stor_name AS 'Nombre de la Tienda', MAX(Sales.qty) AS 'Máxima Cantidad Vendida'
FROM Stores
INNER JOIN Sales ON Stores.stor_id = Sales.stor_id
INNER JOIN Titles ON Sales.title_id = Titles.title_id
GROUP BY Stores.stor_name;

/* 12 Consulta: Lista los nombres de editoriales con el total de ventas, ordenados por editorial y título */
SELECT Publishers.pub_name AS 'Nombre de la Editorial', Titles.title AS 'Título', SUM(Sales.qty) AS 'Total de Ventas'
FROM Publishers
INNER JOIN Titles ON Publishers.pub_id = Titles.pub_id
INNER JOIN Sales ON Titles.title_id = Sales.title_id
GROUP BY Publishers.pub_name, Titles.title
ORDER BY Publishers.pub_name, Titles.title;

/* 13 Consulta: Lista nombres de empleados y títulos de libros por editorial, ordenados alfabéticamente */
SELECT employee.fname AS 'Nombre del Empleado', employee.lname AS 'Apellido del Empleado', Titles.title AS 'Título del Libro'
FROM Publishers
INNER JOIN employee ON Publishers.pub_id = employee.emp_id
INNER JOIN Titles ON Publishers.pub_id = Titles.pub_id
ORDER BY employee.lname, Titles.title;

/* 14 Consulta: Lista nombres de editoriales en mayúsculas, ordenados alfabéticamente */
SELECT UPPER(Publishers.pub_name) AS 'Nombre de la Editorial en Mayúsculas'
FROM Titles
INNER JOIN Publishers ON Titles.pub_id = Publishers.pub_id
ORDER BY UPPER(Publishers.pub_name);



/* 15 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica solo los titulos UNDECIDED*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
inner join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('UNDECIDED')

/* 16. Obtener la cantidad mínima de ventas por tienda */
SELECT STORES.stor_name AS 'Nombre de Tienda', MIN(SALES.qty) AS 'Cantidad Mínima Vendida'
FROM STORES
INNER JOIN SALES ON STORES.stor_id = SALES.stor_id
GROUP BY STORES.stor_name;

/* 17. Obtener la cantidad máxima de ventas por tienda */
SELECT STORES.stor_name AS 'Nombre de Tienda', MAX(SALES.qty) AS 'Cantidad Máxima Vendida'
FROM STORES
INNER JOIN SALES ON STORES.stor_id = SALES.stor_id
GROUP BY STORES.stor_name;

/* 18 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica solo los titulos psychology*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
inner join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('psychology')

/* 19 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica solo los titulos trad_cook*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
inner join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('trad_cook')


/* 20 Consulta Obtine las dos tablas de empleados y trabajos*/
select *--A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From employee A														  
inner join jobs B												  
on (B.job_id = A.job_id)
--where A.type IN ('trad_cook')

select * from employee
select * from jobs

select * from pub_info


select * from titles
select * from titleauthor
select * from publishers

/* 21 Consulta Obtine los titulos de los libros y numeros de autor*/
SELECT titles.title as 'Titulo de Libro', titleauthor.au_id as 'Numero de autor'
FROM titles
INNER JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
WHERE titles.type = 'business';

 /* 22 Consulta Obtine numeros de empleado, nombre, descripcion de si trabajo*/
SELECT employee.emp_id as 'Numero de Empleado', employee.fname as 'Nombre de Empleado', jobs.job_desc as 'Descripcion de trabajo' 
FROM employee
INNER JOIN jobs ON employee.job_id = jobs.job_id;


/* 23 Consulta Obtine los numeros de empleado y el nombre de la publicadora*/
SELECT employee.emp_id as 'Numero de Empleado', publishers.pub_name as 'Nombre de Publicadora'
FROM employee
INNER JOIN publishers ON employee.pub_id = publishers.pub_id;

/* 24 consulta obtiene los la suma de cantidades de ventas por tienda */
SELECT STORES.stor_name AS 'Nombre de Tienda', SUM(SALES.qty) AS 'Total de Cantidad Vendida'
FROM STORES
INNER JOIN SALES ON STORES.stor_id = SALES.stor_id
GROUP BY STORES.stor_name;

/* 25 consulta obtiene los fechas de pedido y nombres de tiendas */
SELECT SALES.ord_date AS 'Fecha de Pedido', STORES.stor_name AS 'Nombre de Tienda'
FROM SALES
INNER JOIN STORES ON SALES.stor_id = STORES.stor_id;

/* 26 consulta obtiene los nombres de tiendas y cantidad promedio de ventas superiores a 50 */
SELECT STORES.stor_name AS 'Nombre de Tienda', AVG(SALES.qty) AS 'Cantidad Promedio'
FROM STORES
INNER JOIN SALES ON STORES.stor_id = SALES.stor_id
GROUP BY STORES.stor_name
HAVING AVG(SALES.qty) > 50;


/* 27 Consulta Obtine los indicadores de titulo, realeza */
SELECT titles.title_id as 'Indicador de titulo', roysched.royalty as 'Realeza'
FROM titles
INNER JOIN roysched ON titles.title_id = roysched.title_id;


/* 28 Consulta Obtine los indicadores de titulo, realeza */
SELECT titles.title_id as 'Indicador de titulo', sales.qty as 'Numero QYT'
FROM titles
INNER JOIN sales ON titles.title_id = sales.title_id;


/* 29 Consulta Obtine el numero de autor numero de ordenamiento, nombre, apellido, ciudad  */
SELECT titleauthor.au_id as 'Numero de autor',titleauthor.au_ord as 'Numero de ordenamiento', authors.au_lname as 'Apellido de autor',authors.au_fname as 'Nombre de autor',authors.city as 'Ciudad'
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id;


/* 30 Consulta Obtine numero de tienda, fecha de ordenamiento, nombre de tienda, ciudad */
SELECT sales.stor_id as 'Numero de tienda',sales.ord_date as 'Fecha de ordenamiento', stores.stor_name as 'Nombre de tienda', stores.city as 'Ciudad'
FROM sales
INNER JOIN stores ON sales.stor_id = stores.stor_id;

/* 31 Consulta Obtine numero de tienda, nombre de tienda, su direccion, descontinuado */
SELECT stores.stor_id as 'Numero de tienda', stores.stor_name as 'Nombre de tienda',stores.stor_address as 'Direccion', discounts.discounttype as 'Descontinuado'
FROM stores
INNER JOIN discounts ON stores.stor_id = discounts.stor_id;


/* 32 Consulta Obtine el id de empleado, nombre de empleado, descripcion de su trabajo y el where espesifica el id del empleado MMS49649F*/
SELECT employee.emp_id as 'Empleado id', employee.fname as 'Nombre De Empleado', jobs.job_desc as 'Descripcion de Trabajo'
FROM employee 
INNER JOIN jobs ON employee.job_id = jobs.job_id
WHERE employee.emp_id = 'MMS49649F';   


/* 33 Consulta Obtine el id de empleado, nombre de la publicadora y el where espesifica solo de la publicadora Scootney Books*/
SELECT employee.emp_id as 'Empleado id', publishers.pub_name as 'Nombre de Publicadora'
FROM employee
INNER JOIN publishers ON employee.pub_id = publishers.pub_id
WHERE publishers.pub_name = 'Scootney Books';  


/* 34 Consulta Obtine el titulo de libro, nombre de la publicadora y where espesifica el libro de The Psychology of Computer Cooking*/
SELECT titles.Title as 'Tutulo de libro', publishers.pub_name as 'Nombre de Publlicadora'
FROM titles
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
WHERE titles.title = 'The Psychology of Computer Cooking'; 


/* 35 Consulta Obtine identificador de publicacion, nombre de la publicadora, informacion de publicacion y el where espesifica el id de su publicacion 9952*/
SELECT pub_info.pub_id as 'Identificador de publicacion', publishers.pub_name as 'Nombre de la publicadora', pub_info.pr_info as 'Informacion de la publicacion'
FROM pub_info
INNER JOIN publishers ON pub_info.pub_id = publishers.pub_id
WHERE pub_info.pub_id = '9952';


/* 36 Consulta Obtine id de tutulo y numero de autor y where espesifica el numero de un autor*/
SELECT titles.title_id as 'Id de Titulo', titleauthor.au_id as 'Numero de autor'
FROM titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id
WHERE titleauthor.au_id = '648-92-1872';



/* 37 Consulta Obtine id de titulo, tipo de libro, precio, rango alto, rango bajo, realeza de libro y where espesifica el id de titulo BU1032*/
SELECT titles.title_id as 'id de titulo',titles.type as 'Tipo de libro',titles.price as 'Precio de libro', roysched.hirange as 'Rango alto',roysched.lorange as 'Rango bajo', roysched.royalty as 'Realeza de libro'
FROM titles
INNER JOIN roysched ON titles.title_id = roysched.title_id
WHERE titles.title_id = 'BU1032';


/* 38 Consulta Obtine id de titulo, tipo de libro, precio de libro, ordenamiento de numero, fecha de ordenamiento, numero qyt y where espesifica el id de titulo PS3333*/
SELECT titles.title_id as 'id de titulo',titles.type as 'Tipo de libro',titles.price as 'Precio de libro',sales.ord_num as 'Ordenamiento de numero',sales.ord_date as 'Fecha de ordenamiento', sales.qty as 'Numero QYT'
FROM titles
INNER JOIN sales ON titles.title_id = sales.title_id
WHERE titles.title_id = 'PS3333'; 



/* 39 Consulta Obtine id de autor, numero de ordenamiento, apellido de autor, nombre de autor, ciudad y where espesifica el apellido de autor Panteley*/
SELECT titleauthor.au_id as 'Id de Autor',titleauthor.au_ord as 'Numero de ordenamiento', authors.au_lname as 'Apellido de autor',authors.au_fname as 'Nombre de autor',authors.city as 'Ciudad'
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id
WHERE authors.au_lname = 'Panteley';



/* 40 Consulta Obtine id de tienda, fecha de ordenamiento, nombre de tienda, ciudad y where espesifica el nombre de la tienda News & Brews*/
SELECT sales.stor_id as 'ID de Tienda',sales.ord_date as 'Fecha de ordenamiento', stores.stor_name as 'Nombre de Tienda', stores.city as 'Ciudad'
FROM sales
INNER JOIN stores ON sales.stor_id = stores.stor_id
WHERE stores.stor_name = 'News & Brews'; 


/* 41 Consulta Obtine id de tienda, fecha de ordenamiento, nombre de tienda, ciudad y where espesifica el apellido del autor MacFeather*/
SELECT titleauthor.au_id as 'Id de Autor',titleauthor.au_ord as 'Numero de ordenamiento', authors.au_lname as 'Apellido de Autor',authors.au_fname as 'Nombre de Autor',authors.city as 'Ciudad'
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id
WHERE authors.au_lname = 'MacFeather'; 



/* 42 Consulta Obtine Nombre de la tienda y cuenta las cantidades que vendio*/
SELECT stores.stor_name as 'Nombre de Tienda', COUNT(sales.qty) as 'Cantidad de Ventas'
FROM stores
INNER JOIN sales ON stores.stor_id = sales.stor_id
INNER JOIN discounts ON stores.stor_id = discounts.stor_id
GROUP BY stores.stor_name;



/* 43 Consulta Obtine nombre concatenado con apellido, titulo de libro*/
SELECT CONCAT(authors.au_fname, ' ', authors.au_lname) as 'Nombre de Autor', titles.title as 'Titulo de Libro'
FROM titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id;



/* 44 Consulta Obtine Nombre de publiacadora, total de sus ventas*/
SELECT Publishers.pub_name as 'Nombre de Publicadora', SUM(sales.qty) as 'Total de Ventas'
FROM Publishers
INNER JOIN titles ON Publishers.pub_id = titles.pub_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY Publishers.pub_name;



/* 45 Consulta Obtine Nombre de empleado, descripcion, nombre de publicadora*/
SELECT employee.fname as 'Nombre de Empleado', jobs.job_desc as 'Descripcion de Trabajo', publishers.pub_name as 'Nombre de publicadora '
FROM employee
INNER JOIN jobs ON employee.job_id = jobs.job_id
INNER JOIN publishers ON employee.pub_id = publishers.pub_id;


/* 46 Consulta Obtine nombre de empleado, nombre de publicadora, tirulo de libro, where espesifica solo un empleado, una publicadora, un solo titulo*/
SELECT employee.fname as 'Nombre de Empleado', publishers.pub_name as 'Nombre de Publicadora', titles.title as 'Titulo de Libro'
FROM employee
INNER JOIN publishers ON employee.pub_id = publishers.pub_id
INNER JOIN titles ON publishers.pub_id = titles.pub_id
WHERE employee.fname = 'Maria' AND publishers.pub_name = 'Algodata Infosystems' AND titles.title = 'But Is It User Friendly?';




/* 47 Consulta Obtine id de publicacion, numero de empleados, numero de titulos, count cuenta los empleados y titulos*/
SELECT publishers.pub_id as 'Id de Publicacion', COUNT(employee.emp_id) as 'Numero de Empleados', COUNT(titles.title_id) as 'Numero de Titulos'
FROM employee
INNER JOIN publishers ON employee.pub_id = publishers.pub_id
INNER JOIN titles ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_id;




/* 48 Consulta Obtine nombre de tienda, ventas qyt, descontinuados where espesifica el nombre de una tienda Bookbeat*/
SELECT stores.stor_name as 'Nombre de Tienda', sales.qty as 'Ventas QYT', discounts.discounttype as 'Descontinuados'
FROM stores
INNER JOIN sales ON stores.stor_id = sales.stor_id
INNER JOIN discounts ON stores.stor_id = discounts.stor_id
WHERE stores.stor_name = 'Bookbeat' ;




/* 49 Consulta Obtine nombre de publicadora, nombre de titulo, ventas qyt where espesifica el nombre de titulo Silicon Valley Gastronomic Treats*/
SELECT Publishers.pub_name as 'Nombre de Publicadora', titles.title as 'Titulo de Libro', sales.qty as 'Ventas QYT'
FROM Publishers
INNER JOIN titles ON Publishers.pub_id = titles.pub_id
INNER JOIN sales ON titles.title_id = sales.title_id
WHERE titles.title = 'Silicon Valley Gastronomic Treats' ;



/* 50 Consulta Obtine nombre de publicadora, nombre de titulo, ventas qyt where espesifica el nombre de titulo Straight Talk About Computers*/
SELECT Publishers.pub_name as 'Nombre de Publicadora', titles.title as 'Titulo de Libro', sales.qty as 'Ventas QYT'
FROM Publishers
INNER JOIN titles ON Publishers.pub_id = titles.pub_id
INNER JOIN sales ON titles.title_id = sales.title_id
WHERE titles.title = 'Straight Talk About Computers' ;



/* 51 Consulta Obtine nombre de autor, nombre de publicadora, titulo de libro, where espesifica el nombre del autor, nombre de su publicadora, nombre de su titulo*/
SELECT employee.fname as 'Nombre de Autor', publishers.pub_name as 'Nombre de Publicadora', titles.title as 'Titulo de Libro'
FROM employee
INNER JOIN publishers ON employee.pub_id = publishers.pub_id
INNER JOIN titles ON publishers.pub_id = titles.pub_id
WHERE employee.fname = 'Martin' AND publishers.pub_name = 'New Moon Books' AND titles.title = 'Prolonged Data Deprivation: Four Case Studies';






/* 52 Consulta Obtine nombre de publicadora, nombre de titulo, ventas qyt where espesifica el nombre de titulo Life Without Fear*/
SELECT Publishers.pub_name as 'Nombre de Publicadora', titles.title as 'Titulo de Libro', sales.qty as 'Ventas QYT'
FROM Publishers
INNER JOIN titles ON Publishers.pub_id = titles.pub_id
INNER JOIN sales ON titles.title_id = sales.title_id
WHERE titles.title = 'Life Without Fear' ;






/* 53 Consulta Obtine la union de las dos tablas roysched y titles */
select *
From titles A														  
left join roysched B												  
on (B.title_id = A.title_id)



/* 54 Consulta Obtine referencia de titulo nombre de titulo el tipo y la realeza del libro el where espesifica cuantos titulos ahi con ese nombre */
select A.title_id as 'Referencia de titulo',A.title as 'Nombre de titulo',A.type as 'Tipo de titulo',B.royalty as 'Realeza de libro'
From titles A														  
left join roysched B												  
on (B.title_id = A.title_id)
where A.title IN ('But Is It User Friendly?')



/* 55 Consulta Obtine nombre de titulos los precios cuando se publicaron y su realeza */
select A.title as 'Nombre de titulo',A.price as 'Precio de titulo',A.pubdate as 'Publicado',B.royalty as 'Realeza de libro'
From titles A														  
left join roysched B												  
on (B.title_id = A.title_id)




/* 56 Consulta Obtine nombre de titulo precio del titulo y su informacion acerca del libro */
select A.title as 'Nombre de titulo',A.price as 'Precio de titulo',B.pr_info as 'Informacion'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)



/* 57 Consulta Obtine el tipo de libro las unidades qe vendio su informacion y su referencia */
select A.type as 'Tipo de libro',A.ytd_sales as 'Unidades vendidas',B.pr_info as 'Informacion',B.pub_id as 'Referencia'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)



/* 58 Consulta Obtine el tipo de libro las unidades qe vendio su informacion y su referencia y el where espesifica el libro que nomas se quiere ver business */
select A.type as 'Tipo de libro',A.ytd_sales as 'Unidades vendidas',B.pr_info as 'Informacion',B.pub_id as 'Referencia'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('business')



/* 59 Consulta Obtine el tipo de libro las unidades qe vendio su informacion y su referencia y el where espesifica el libro que nomas se quiere ver mod_cook */
select A.type as 'Tipo de libro',A.ytd_sales as 'Unidades vendidas',B.pr_info as 'Informacion',B.pub_id as 'Referencia'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('mod_cook')



/* 60 Consulta Obtine el tipo de libro las unidades qe vendio su informacion y su referencia y el where espesifica el libro que nomas se quiere ver UNDECIDED*/
select A.type as 'Tipo de libro',A.ytd_sales as 'Unidades vendidas',B.pr_info as 'Informacion',B.pub_id as 'Referencia'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('UNDECIDED')



/* 61 Consulta Obtine el tipo de libro las unidades qe vendio su informacion y su referencia y el where espesifica el libro que nomas se quiere ver popular_comp*/
select A.type as 'Tipo de libro',A.ytd_sales as 'Unidades vendidas',B.pr_info as 'Informacion',B.pub_id as 'Referencia'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('popular_comp')


/* 62 Consulta Obtine el tipo de libro las unidades qe vendio su informacion y su referencia y el where espesifica el libro que nomas se quiere ver psychology*/
select A.type as 'Tipo de libro',A.ytd_sales as 'Unidades vendidas',B.pr_info as 'Informacion',B.pub_id as 'Referencia'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('psychology')




/* 63 Consulta Obtine el tipo de libro las unidades qe vendio su informacion y su referencia y el where espesifica el libro que nomas se quiere ver trad_cook*/
select A.type as 'Tipo de libro',A.ytd_sales as 'Unidades vendidas',B.pr_info as 'Informacion',B.pub_id as 'Referencia'
From titles A														  
left join pub_info B
on (B.pub_id = A.pub_id)
where A.type IN ('trad_cook')


/* 64 Consulta Obtine nombre de titulo publicado y logo del titulo*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)


/* 65 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica solo los titulos business*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('business')




/* 66 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica solo los titulos mod_cook*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('mod_cook')


/* 67 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica solo los titulos UNDECIDED*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('UNDECIDED')


/* 68 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica el precio de libro*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.price IN ('20.95')



/* 69 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica solo los titulos popular_comp*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('popular_comp')




/* 70 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica solo los titulos psychology*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('psychology')



/* 71 Consulta Obtine nombre de titulo publicado y logo del titulo where espesifica solo los titulos trad_cook*/
select A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From titles A														  
left join pub_info B												  
on (B.pub_id = A.pub_id)
where A.type IN ('trad_cook')


/* 72 Consulta Obtine las dos tablas de empleados y trabajos*/
select *--A.title as 'Nombre de titulo',A.pubdate as 'Publicado',B.logo as 'logo de titulo'
From employee A														  
left join jobs B												  
on (B.job_id = A.job_id)



/* 73 Consulta Obtine los titulos de los libros y numeros de autor*/
SELECT titles.title as 'Titulo de Libro', titleauthor.au_id as 'Numero de autor'
FROM titles
left JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
WHERE titles.type = 'business';



/* 74 Consulta Obtine numeros de empleado, nombre, descripcion de si trabajo*/
SELECT employee.emp_id as 'Numero de Empleado', employee.fname as 'Nombre de Empleado', jobs.job_desc as 'Descripcion de trabajo' 
FROM employee
left JOIN jobs ON employee.job_id = jobs.job_id;


/* 75 Consulta Obtine los numeros de empleado y el nombre de la publicadora*/
SELECT employee.emp_id as 'Numero de Empleado', publishers.pub_name as 'Nombre de Publicadora'
FROM employee
left JOIN publishers ON employee.pub_id = publishers.pub_id;


/* 76 Consulta Obtine los nombres de los libros y el nombre de la publicadora*/
SELECT titles.Title as 'Titulos de libros', publishers.pub_name as 'Nombre de Publicadora'
FROM titles
left JOIN publishers ON titles.pub_id = publishers.pub_id;



/* 77 Consulta Obtine los nombres de los libros y el nombre de la publicadora*/
SELECT pub_info.pub_id as 'Indicador de numero', publishers.pub_name as 'Nombre', pub_info.pr_info as 'Informacion'
FROM pub_info
left JOIN publishers ON pub_info.pub_id = publishers.pub_id;



/* 78 Consulta Obtine los indicadores de titulo y numero de autor*/
SELECT titles.title_id as 'Indicador de titulo', titleauthor.au_id as 'Numero de autor'
FROM titles
left JOIN titleauthor ON titles.title_id = titleauthor.title_id;



/* 79 Consulta Obtine los indicadores de titulo, realeza */
SELECT titles.title_id as 'Indicador de titulo', roysched.royalty as 'Realeza'
FROM titles
left JOIN roysched ON titles.title_id = roysched.title_id;



/* 80 Consulta Obtine los indicadores de titulo, realeza */
SELECT titles.title_id as 'Indicador de titulo', sales.qty as 'Numero QYT'
FROM titles
left JOIN sales ON titles.title_id = sales.title_id;


/* 81 Consulta Obtine el numero de autor numero de ordenamiento, nombre, apellido, ciudad  */
SELECT titleauthor.au_id as 'Numero de autor',titleauthor.au_ord as 'Numero de ordenamiento', authors.au_lname as 'Apellido de autor',authors.au_fname as 'Nombre de autor',authors.city as 'Ciudad'
FROM titleauthor
left JOIN authors ON titleauthor.au_id = authors.au_id;


/* 82 Consulta Obtine numero de tienda, fecha de ordenamiento, nombre de tienda, ciudad */
SELECT sales.stor_id as 'Numero de tienda',sales.ord_date as 'Fecha de ordenamiento', stores.stor_name as 'Nombre de tienda', stores.city as 'Ciudad'
FROM sales
left JOIN stores ON sales.stor_id = stores.stor_id;


/* 83 Consulta Obtine numero de tienda, nombre de tienda, su direccion, descontinuado */
SELECT stores.stor_id as 'Numero de tienda', stores.stor_name as 'Nombre de tienda',stores.stor_address as 'Direccion', discounts.discounttype as 'Descontinuado'
FROM stores
left JOIN discounts ON stores.stor_id = discounts.stor_id;



/* 84 Consulta Obtine el id de empleado, nombre de empleado, descripcion de su trabajo y el where espesifica el id del empleado MMS49649F*/
SELECT employee.emp_id as 'Empleado id', employee.fname as 'Nombre De Empleado', jobs.job_desc as 'Descripcion de Trabajo'
FROM employee 
left JOIN jobs ON employee.job_id = jobs.job_id
WHERE employee.emp_id = 'MMS49649F';  



/* 85 Consulta Obtine el id de empleado, nombre de la publicadora y el where espesifica solo de la publicadora Scootney Books*/
SELECT employee.emp_id as 'Empleado id', publishers.pub_name as 'Nombre de Publicadora'
FROM employee
left JOIN publishers ON employee.pub_id = publishers.pub_id
WHERE publishers.pub_name = 'Scootney Books'; 



/* 86 Consulta Obtine el titulo de libro, nombre de la publicadora y where espesifica el libro de The Psychology of Computer Cooking*/
SELECT titles.Title as 'Tutulo de libro', publishers.pub_name as 'Nombre de Publlicadora'
FROM titles
left JOIN publishers ON titles.pub_id = publishers.pub_id
WHERE titles.title = 'The Psychology of Computer Cooking'; 



/* 87 Consulta Obtine identificador de publicacion, nombre de la publicadora, informacion de publicacion y el where espesifica el id de su publicacion 9952*/
SELECT pub_info.pub_id as 'Identificador de publicacion', publishers.pub_name as 'Nombre de la publicadora', pub_info.pr_info as 'Informacion de la publicacion'
FROM pub_info
left JOIN publishers ON pub_info.pub_id = publishers.pub_id
WHERE pub_info.pub_id = '9952';



/* 88 Consulta Obtine id de tutulo y numero de autor y where espesifica el numero de un autor*/
SELECT titles.title_id as 'Id de Titulo', titleauthor.au_id as 'Numero de autor'
FROM titles
left JOIN titleauthor ON titles.title_id = titleauthor.title_id
WHERE titleauthor.au_id = '648-92-1872';



/* 89 Consulta Obtine id de titulo, tipo de libro, precio, rango alto, rango bajo, realeza de libro y where espesifica el id de titulo BU1032*/
SELECT titles.title_id as 'id de titulo',titles.type as 'Tipo de libro',titles.price as 'Precio de libro', roysched.hirange as 'Rango alto',roysched.lorange as 'Rango bajo', roysched.royalty as 'Realeza de libro'
FROM titles
left JOIN roysched ON titles.title_id = roysched.title_id
WHERE titles.title_id = 'BU1032';



/* 90 Consulta Obtine id de titulo, tipo de libro, precio de libro, ordenamiento de numero, fecha de ordenamiento, numero qyt y where espesifica el id de titulo PS3333*/
SELECT titles.title_id as 'id de titulo',titles.type as 'Tipo de libro',titles.price as 'Precio de libro',sales.ord_num as 'Ordenamiento de numero',sales.ord_date as 'Fecha de ordenamiento', sales.qty as 'Numero QYT'
FROM titles
left JOIN sales ON titles.title_id = sales.title_id
WHERE titles.title_id = 'PS3333'; 



/* 91 Consulta Obtine id de autor, numero de ordenamiento, apellido de autor, nombre de autor, ciudad y where espesifica el apellido de autor Panteley*/
SELECT titleauthor.au_id as 'Id de Autor',titleauthor.au_ord as 'Numero de ordenamiento', authors.au_lname as 'Apellido de autor',authors.au_fname as 'Nombre de autor',authors.city as 'Ciudad'
FROM titleauthor
left JOIN authors ON titleauthor.au_id = authors.au_id
WHERE authors.au_lname = 'Panteley';




/* 92 Consulta Obtine id de tienda, fecha de ordenamiento, nombre de tienda, ciudad y where espesifica el nombre de la tienda News & Brews*/
SELECT sales.stor_id as 'ID de Tienda',sales.ord_date as 'Fecha de ordenamiento', stores.stor_name as 'Nombre de Tienda', stores.city as 'Ciudad'
FROM sales
left JOIN stores ON sales.stor_id = stores.stor_id
WHERE stores.stor_name = 'News & Brews'; 




/* 93 Consulta Obtine id de tienda, fecha de ordenamiento, nombre de tienda, ciudad y where espesifica el apellido del autor MacFeather*/
SELECT titleauthor.au_id as 'Id de Autor',titleauthor.au_ord as 'Numero de ordenamiento', authors.au_lname as 'Apellido de Autor',authors.au_fname as 'Nombre de Autor',authors.city as 'Ciudad'
FROM titleauthor
left JOIN authors ON titleauthor.au_id = authors.au_id
WHERE authors.au_lname = 'MacFeather'; 




/* 94 Consulta Obtine Nombre de la tienda y cuenta las cantidades que vendio*/
SELECT stores.stor_name as 'Nombre de Tienda', COUNT(sales.qty) as 'Cantidad de Ventas'
FROM stores
left JOIN sales ON stores.stor_id = sales.stor_id
left JOIN discounts ON stores.stor_id = discounts.stor_id
GROUP BY stores.stor_name;




/* 95 Consulta Obtine nombre concatenado con apellido, titulo de libro*/
SELECT CONCAT(authors.au_fname, ' ', authors.au_lname) as 'Nombre de Autor', titles.title as 'Titulo de Libro'
FROM titles
left JOIN titleauthor ON titles.title_id = titleauthor.title_id
left JOIN authors ON titleauthor.au_id = authors.au_id;



/* 96 Consulta Obtine Nombre de publiacadora, total de sus ventas*/
SELECT Publishers.pub_name as 'Nombre de Publicadora', SUM(sales.qty) as 'Total de Ventas'
FROM Publishers
left JOIN titles ON Publishers.pub_id = titles.pub_id
left JOIN sales ON titles.title_id = sales.title_id
GROUP BY Publishers.pub_name;




/* 97 Consulta Obtine Nombre de empleado, descripcion, nombre de publicadora*/
SELECT employee.fname as 'Nombre de Empleado', jobs.job_desc as 'Descripcion de Trabajo', publishers.pub_name as 'Nombre de publicadora '
FROM employee
INNER JOIN jobs ON employee.job_id = jobs.job_id
INNER JOIN publishers ON employee.pub_id = publishers.pub_id;



/* 98 Consulta Obtine nombre de empleado, nombre de publicadora, tirulo de libro, where espesifica solo un empleado, una publicadora, un solo titulo*/
SELECT employee.fname as 'Nombre de Empleado', publishers.pub_name as 'Nombre de Publicadora', titles.title as 'Titulo de Libro'
FROM employee
left JOIN publishers ON employee.pub_id = publishers.pub_id
left JOIN titles ON publishers.pub_id = titles.pub_id
WHERE employee.fname = 'Maria' AND publishers.pub_name = 'Algodata Infosystems' AND titles.title = 'But Is It User Friendly?';




/* 99 Consulta Obtine id de publicacion, numero de empleados, numero de titulos, count cuenta los empleados y titulos*/
SELECT publishers.pub_id as 'Id de Publicacion', COUNT(employee.emp_id) as 'Numero de Empleados', COUNT(titles.title_id) as 'Numero de Titulos'
FROM employee
left JOIN publishers ON employee.pub_id = publishers.pub_id
left JOIN titles ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_id;


/* 100 Consulta Obtine nombre de tienda, ventas qyt, descontinuados where espesifica el nombre de una tienda Bookbeat*/
SELECT stores.stor_name as 'Nombre de Tienda', sales.qty as 'Ventas QYT', discounts.discounttype as 'Descontinuados'
FROM stores
left JOIN sales ON stores.stor_id = sales.stor_id
left JOIN discounts ON stores.stor_id = discounts.stor_id
WHERE stores.stor_name = 'Bookbeat' ;









