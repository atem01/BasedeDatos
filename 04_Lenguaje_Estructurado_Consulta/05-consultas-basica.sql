/* =====================================
SQL-LDD en SQLServer

Archivo: 05-consultas-basica.sql

Descripcion: Instruccion a la ejecusion de las primeras consultas de recuperacion de datos

===================================== */

USE comercialdb;
go

-- Utilizando el operador asterisco (*), no es muy recomendable 
-- *, todas las columnas

select *
from productoss;

-- seleccionar columnas necesarias (proyeccion)

select 
	nombre
from estado;
go

SELECT 
	codigo,
	nombre,
	precio
FROM PRODUCTOS;
GO

SELECT 
	nombre,
	apellido paterno,
	telefono,
	correo
FROM clientes;
GO

SELECT 
	nombre,	apellido paterno telefono, orreo
FROM clientes;
GO

-- Alias de columna 
-- Es un nombre temporal asignado a una columna dentro del resultado de una consulta

select
	codigo AS codigo producto,
	nombre AS Nombre producto,
	precio AS precio unitario
FROM productos;
go

-- Otro metodo para no poner los (_) giones bajos 
select
	codigo AS [codigo producto],
	nombre AS [Nombre producto],
	precio AS precio unitario -- Aqi esta mal porque nsi no e pone marca el ultimo (Unitario)
FROM productos;
go

-- Otro metodo para no poner los (_) giones bajos 
select
	codigo AS 'codigo producto',
	nombre AS 'Nombre producto',
	precio AS 'precio unitario'
FROM productos;
go
-- Otra forma de poner alias (no recomandada)
select
	codigo codigo producto,
	nobre Nombre producto,
	precio precio unitario
FROM productos;
go

--Alias de Tabla 

SELECT
	p.codigo,
	p,nombre,
	p.precio
FROM productos AS p;
GO

SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos;
GO

SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos AS p;
GO

SELECT
	categorias.id_categoria,
	categorias.nombre AS [ nombre_categoria],
	id_producto AS ucto,
	producto.nombre  AS [ nombre_producto]
FROM categorias;
INNER JOIN 
productos
on categorias.id_categoria = prodctos.id_categoria;
GO

SELECT
	c.id_categoria,
	c.nombre AS [ nombre_categoria],
	id_producto AS ucto,
	p..nombre  AS [ nombre_producto]
FROM categorias AS c;
INNER JOIN 
productos
on categorias.id_categoria = prodctos.id_categoria;
GO


SELECT
	
FROM productos AS p;
INNER JOIN 
productos
on categorias.id_categoria = prodctos.id_categoria;
GO

-- columna Calculada
--seleccionar los datos de losproductos y el valor del inventario 
/*
	()
	*,/
	%
	+,-
*/

select 
	p.codigo AS #,
	p.nombre AS [nombre producto],
	p.precio AS [Precio producto], 
	p.exisencia AS [Existenci de producto],
	precio * existencia As valor_inventario
from productos AS p;

-- todo:ver ejemplos con campos calculados y operadores aritmeticos 

	git satus 
gid add .

git commit se trabajo con kis fundamentos de la instruccion  
SELECT, alias de columna y alias de tabla, campos calculados con operaciones
con suma resta multiplicaciion divicion y modulos y las instrucciones DISTICNT 
TOP Y TOP PERCENT