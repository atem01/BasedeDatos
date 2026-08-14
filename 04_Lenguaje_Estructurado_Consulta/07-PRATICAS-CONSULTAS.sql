-- Mostrar las ventas realizadas en Francia, brazil y belgica
-- de 10 de julio e 1996 al 31 de Diciembre de 1998, que tenga Region de Envio,
-- para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedido de la mas
-- cercana a la mas antigua
select 
o.Orders as numero_Order ,
o.CustomerId as cliente ,
o.shipCountry as ligar_envio,
o.Order as fecha_Order
UPPER(FORMAT(o.orderData , 'mmmm','es-Es')) as sec_order
UPPER(FORMAT(o.orderData , 'dddd','es-Es')) as  dia_order
DATAPART(YEAR,o.OderDate) as an_order
o.shipRegion as region
from orders as o
where  o .ShipCountry in ('france','brazil','belgica')
and 
o.custmerID in ('vicente','hanar','super')
and
whereshipRegion is not null
and 
o.OrderData between ('1998';'07','10' and '1998','12','24')
ORDER BY fecha_order DESC:

SELECT 
OrderID,
OderDate
shipRegion
FROM Order
whereshipRegion is null;

SELECT 
OrderID,
OderDate
shipRegion
FROM Order
whereshipRegion is not null;
/*===================================================
operadores prinicvipales  like 


los principales ppueden contenter comdinos 
llosprincipales 
son
comodin sgnificado 
#       cero, uno a varias veces caracteres 
{abc}        exatamente  un caratecer
[a-f]       un caracter inluido en la lista 
[*abc]        un caracter incluido en el rango 

comodin # 
--representa % cualquier cantidad fr caracter , inlucyendo caracteres
-- comienza 
--where  nombre lime 'cliente %'

--  sgnificado comienzan con cliente 1  --termina con 
-- WHERE correo lime %mail.com
-- vslores q termina con email.com


- contiene
-- where donde nombre like '%a%'
-- sginificado valores q contiene el caracter a en cualquier posicion 



-- mostra los producto donde el codigo comienze con b0001

*/

SELECT 
p.codigo,
p.nombre,
p.precio
FROM productos as p
where p.codigo like 'b00%';
	
	--

SELECT 
o.orderID,
o.OrderDate,
o/Prodcutos,
p.unitprice
FROOM order as o
inner join
[Order_Detalls] as nd
on o.OrderID = OrderID
inner join 
on o.productos  = p.productoID 
where o.OrderDate between '1998', '07','10' and '1998' , '12' , '24';
and p.product 



SELECT 
o.orderID,
o.OrderDate,
o/Prodcutos,
p.unitprice
FROOM order as o
inner join
[Order_Detalls] as nd
on o.OrderID = OrderID
inner join 
on o.productos  = p.productoID 
where p.productName ='chan';



SELECT 
c.customerID
c.CompanyName ,
c.ContactName
FROM customers as c
where c.costomer like '%1%';

 --mostra todos los datos de los cliente donde su correo termine en or con 10 @email.com

 SELECT 
    c.id_cliente ,
	c.nombre ,
	c.correo
 FROM cliente as c ;
 where c.correo like '@email.com';


 -- mostra los datos o los prudctos  donde el nombre contenga  el caracter uno 


 SELECT 
 c.codigo,
 c.nombre,
 c.precio
 FROM productos as c
 where p.nombre like '%1%'
-
-- comdine de un caracter 
-- el guin bajo ent exactamente un caracter 


--selecionar los datos de los productos q contegan los datos del producto donde el codigo cominze p000
--carcter adiccional 

SELECT
p.codigo,
p.nombre,
p.precio
FROM producto as p
where p.codigo like 'p000_';


SELECT
p.codigo,
p.nombre,
p.precio
FROM producto as p
where p.codigo like 'p000%';


