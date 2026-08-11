/* =====================================
SQL-LDD en SQLServer

Archivo: 06-filtrado-registros-where

Descripcion: Recuperar unicamente las filas que complen determinadas condiciones mediente la consulta where

===================================== */

/* sintaxis genral

select 
	columna_1
	columna_2
	columna_3
	columna_n
from tabla 
WHERE condicion;

oreden sintatico (consultas)

select 
from
join / o 
where
group by 
having 
orden by

orden de ejecusion 
from / join
where
group by 
havyng 
select 
distinct
order by
top
*/

-- selecciona los datos de los clientes donde su numero de cliente sean 25
select 
	c.id_cliente as [numero_cliente];
	concat (c.nombre , ' ' ,c.apellido_paterno,
	' ' , c.apellido_materno) as [nombre completo],
	c.correo
from clientes as c
where c.id_cliente = 25;
go

-- selecciona todas las categorias que sean de Computo
select
	c.id_categoria
	c.nombre
from categorias as c 
where c.nombre = 'computo';
go

-- seleccionar los datos de clientes del cliente1

-- seleccionar los datos de los clientes que no permanetscan al departamento1

--selcionar los productos cuyo precio sea superior a $490

-- selccioanr los productos con existencia critica inferior a 10 unidades 

-- seleccioanr lo empleados con salario de $30000 o mas 

-- seleccionar todas las ventas realizadasa el 24 de diciembre de 2025

-- manejo de fechas
--las fechas deven que ir entre comillas y seguir el formato AAAA-MM-DD

select 
    v.id_venta,
    v.fecha,
    year (v.fecha) as [año],
    month (v.fecha) as [mes],
    day (v.fecha) as [dia],
    format (v.fecha, 'MMMM') as [Mes en ingles],
    upper (format (v.fecha, 'MMMM', 'es-ES')) as [Mes en español],
    format (v.fecha, 'MMM') as [Mes abreviado],
    format (v.fecha, 'MMM', 'es-ES') as [Mes abreviado en español],
    format (v.fecha, 'dddd') as [dia en ingles],
    upper (format (v.fecha, 'dddd', 'es-ES')) as [dia en español],
    format (v.fecha, 'ddd') as [dia abreviado], 
    v.id_cliente,
    v.id_empleado
from ventas as v
where v.fecha = '2025-12-24';

