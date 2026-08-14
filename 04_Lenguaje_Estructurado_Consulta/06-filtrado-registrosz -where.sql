/*
SINTAXIS GENERAL:

	SELECT
		columna_1,
		columna_2,
		columna_n
		FROM tabla
		WHERE condicion;


		ORDER SINTACTICO (CONSULTAS)

		SELECT
		FROM
		JOIN/ON
		WHERE
		GROUP BY
		HAVING
		ORDER BY

		ORDEN DE EJECUCION

		FROM / JOIN
		WHERE
		GROUP BY
		HAVING
		SELECT
		DISTINCT
		ORDER BY
		TOP

*/

-- Seleccionar lo datos de los clientes donde su numero de cliente sea 25
SELECT
	c.id_cliente AS [numero_cliente]
	
	
 FROM clientes AS c;

-- seleccionar todas las categorias que sean de computo
SELECT
c.id_categoria,
c.nombre
 FROM categorias AS c;
 WHERE c.nombre = 'computo'

-- Seleccionar los datos del Cliente1

-- Seleccionar los datos de los clientes que no pertenecen al departamento 1

-- Seleccionar los productos cuyo precio sea superiro a $490

-- Seleccionar los productos con existencia critica inferior a 10 unidades

-- Seleccionar los empleados con salario de 30000 y mas

-- Seleccionar todas las ventas realizadas el 24 de diciembre de 2025
-- manejo de fechas
-- las fechas deben ir entre comillas y seguir el formato AAAA--MM--DD

SELECT
v.id_venta,
v.fecha,
v.id_cliente,
v.id_empleado
v.id_empleado
FROM ventas AS v
WHERE fecha= '2025-12-24';

SELECT
v.id_venta,
v.fecha,
   YEAR (v.fecha) AS [AÑO],
   MONTH (v.fecha) AS [Mes],
   DAY (v.fecha) AS [Dia]
   FORMat(v.fecha, 'MMMM') AS [Mes en ingles],
    FORMat(v.fecha, 'MMMM', 'es-ES') AS [Mes en Espñaol],
	 FORMat(v.fecha, 'MMMM', 'es-ES') AS [Mes en Espñaol],





FROM ventas AS v;

-- Comparaciones con expreciones calculadas
-- WHERE tambien puede evaluar un calculo

-- Mostrar productos cuyo valor del inventario sea mayor a $50,000

SELECT 
P.nombre,
P.codigo,
P.precio,
P.existencia,
(p.precio* p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio* p.existencia) > 50000

ORDER BY valor_inventario DESC;
GO

-- Operador Logico AND
-- Mostrar productos con preco entre 200 y 300 que ademas tenga menos de
-- 50 unidades

SELECT 
P.nombre,
P.codigo,
P.precio,
P.existencia,
(p.precio* p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio >= 200
	 AND 
	 p.precio <= 300
	 AND 
	 p.existencia < 50;

-- Clausula BETWEE

SELECT 
P.nombre,
P.codigo,
P.precio,
P.existencia,
(p.precio* p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio BETWEEN 200 AND 300
AND
p.existencia>50;

-- Mostrar los empleado del departamento 1 cuyo salario sea superior a 25000

SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE e.id_departamento = 1
	AND 
	e.salario>25000;

-- Mostrar los productos con existencia inferior a 10 o superior a 190
SELECT
p.nombre,
p.codigo,
p.precio,
p.existencia,
(p.precio* p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.existencia<10 
OR 
p.codigo>190;

-- Mostrar productos que no tengan precio mayor a 400
SELECT
p.nombre,
p.codigo,
p.precio,
p.existencia,
(p.precio* p.existencia) AS valor_inventario
FROM productos AS p
WHERE NOT (p.precio > 400);

SELECT
p.nombre,
p.codigo,
p.precio,
p.existencia,
(p.precio* p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio <= 400;


-- Seleccionar los empleados que pertenezcan al departamento 1,
-- al departamento 2 y con salario mayor a 25000

SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE (e.id_departamento = 1
OR
e.id_departamento = 2)
AND
e.salario > 25000;


-- OPERADOR BETWEEN
--BETWEEN permite comprobar si un valor se encuentra dentro de un rango
-- inclusivo

/*=================================================================================================
	SINTAXIS 

	WHERE columna BETWEEN limite_inferior AND limite_superior;

===================================================================================================*/

-- Mostrar los empleados con salario entre $15,000.0 y $ 20,000.0, incluyendo
-- ambos limites

SELECT
	e.id_empleado,
	e.nombre,
	e.salario
	FROM empleados AS e
	WHERE e.salario BETWEEN 15000.0 AND 20000.0
	ORDER BY 3 DESC ;

	
SELECT
	e.id_empleado,
	e.nombre,
	e.salario
	FROM empleados AS e
	WHERE e.salario >= 15000
	AND 
	e.salario <=20000;

	-- Seleccionar los productos donde el precio este entre $100 y $200

	SELECT
p.nombre,
p.codigo,
p.precio,
p.existencia,
(p.precio* p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio <= 400;

-- Seleccionar los empleados que pertenezcan al departamento 1,
-- al departamento 2 y con salario mayor a 25000

SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE (e.id_departamento = 1
OR
e.id_departamento = 2)
AND
e.salario > 25000;


-- OPERADOR BETWEEN
--BETWEEN permite comprobar si un valor se encuentra dentro de un rango
-- inclusivo

/*=================================================================================================
	SINTAXIS 

	WHERE columna BETWEEN limite_inferior AND limite_superior;

===================================================================================================*/

-- Mostrar los empleados con salario entre $15,000.0 y $ 20,000.0, incluyendo
-- ambos limites

SELECT
	e.id_empleado,
	e.nombre,
	e.salario
	FROM empleados AS e
	WHERE e.salario BETWEEN 15000.0 AND 20000.0
	ORDER BY 3 DESC ;

	
SELECT
	e.id_empleado,
	e.nombre,
	e.salario
	FROM empleados AS e
	WHERE e.salario >= 15000
	AND 
	e.salario <=20000;

	-- Seleccionar los productos donde el precio este entre $100 y $200

	SELECT
p.nombre,
p.codigo,
p.precio,
p.existencia,
(p.precio* p.existencia) AS valor_inventario
FROM productos AS p
WHERE  >= 15000
	AND 
	e.salario <=20000;

	-- Selecciona las ventas realizadas del 1 de enero de 2025 al 
	-- 10 de enero de 2025

	SELECT
	v.id_venta AS numero_venta,
	v.id_cliente AS cliente,
	v.id_empleado AS vendedor,
	v.fecha AS fecha_venta,
	UPPER(FORMAT (v.fecha, 'MMMM', 'es-ES')) AS [mes_venta],
	UPPER(FORMAT (v.fecha, 'dddd', 'es-ES')) AS [dia_venta],
	DATEPART(YEAR, v.fecha) AS [año_venta]
	FROM ventas AS v
	WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
	ORDER BY fecha_venta ASC;

	-- not BETWEEN 
	-- RECUEPERAR VALORESQUE SE ENCUENTRAN FUERA 

	-- Seleccionar los productos donde el precio este entre $100 y $400

		SELECT
p.nombre,
p.codigo,
p.precio,
p.existencia,
(p.precio* p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio NOT BETWEEN 100 AND 400;

/*OPERADOR IN 
PERMITE COMPORBAR UNA COLUMNA CON UNA LISTYA DE VALORES 


==============================================================

WHERE COLUMNA IN (VALOR_1, VALOR_2 , VALOR_N)

ES EQUIVALENTE A VARIAS CONDICIONES CONECTADAS CON OR 

==============================================================

-- MOSTRAR LOS PRODUCTOS PERTENECIENTES A LAS CATEGORIAS 1 ,7, 12

*/

	SELECT
p.nombre,
p.codigo,
p.precio,
p.id_categoria
FROM productos AS p
WHERE p.id_categoria in (1,7,12)
ORDER BY 4;

	SELECT
p.nombre,
p.codigo,
p.precio,
p.id_categoria
FROM productos AS p
WHERE p.id_categoria =  1 
or 
p.id_categoria =  7
or p.id_categoria =  12
ORDER BY p.id_categoria;

-- seleccionar los departamentos de ventas , ti  y direccion 

	SELECT
p.id_departamento,
p.nombre
FROM  departamento AS p
WHERE p.nombre in ('ventas ','ti' ,' direccion');
