# Contruccion de Base de Datos don Lenguaje SQL

El lenguaje SQL (Struture Query Lenguage), se divide en 5 grandes categorias:

1. DDl (Data Definition Lenguage)
2. DML (Data Manipulation lenguage)
3. DQL (Data Query lenguage)
4. DCL (Data Control Lenguage -Controla permisos) - GRANT,REVOKE
5. TCL (Transaction Control Lenguage - Controla Transacciones) - BEGIN TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT 


## SQL-DDl

**Lenguaje de Definicion de Datos**

Se utiliza para ***crea y modifica la estructura*** de una base de datos

con DDL trabajamos sobre la base de datos:

- __Base de datos__
- __Tablas__
- __Restricciones
- Vistas
- indices
- esquemas 
- Store Procedures
- Fuctions 
- Triggers

**Comandos Principales**

| Comandos | Funcion |
| :--- | :--- |
| CREATE | Crea objetos de la base de datos |
| ALTER | Modifica objetos de la base de datos  |
| DROP | Elimina objetos de la base de datos |
| TRUNCATE | Vacia la tabla |
| RENAME | Renombra Objeots (Segun el SGBD) |


## SQL-DML

**Lenguaje de Manipulacion de la informacion almacenada**

Sirve para **tabajar con la informacion almacenada**

**Comandos Principales**

| Comandos | Funcion |
| :--- | :--- |
| INSERT | Inserta Registros |
| UPDATE | Actualiza Registros  |
| DELETE | Elimina Registros |

## SQL-DQL

**Lenguaje de consulta de datos**

Su funcion es **Consultar informacion**

Este es probablemente el grupo mas utilizado 

**Comandos Principales**

| Comandos | Funcion |
| :--- | :--- |
| Select | Consultar Informacion |

Generalmente se convina con:

- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOOIN (LEFT, RIGHT, INNER, FULL, CROSS)
- DISTINCT
- TOP/LIMIT
- Funciones de Agregado (SUM, AVG, MIN, MAX, COUNT)
- Window Fuctions (Funciones de Ventana) 


## Nomenclatura para la Contruccion de la base de datos (Snake case)

La nomenclatura o convencion que mas se recomienda hoy si se busca una nomenclatura moderna,
portable y alineada con buenas practicas en distintos motores de base de datos

La razon es que funciones de forma consistente en **SQL Server,MYSQL o MariaDB** y especialmente en **POSTGRESQL**, donde los identificadores sin comillas se convierten
automaticamente a minusculas. Con **snake_case** evita problemas de mayusculas y hace que las consultas sean mas legibles.


| Objeto | Convencion | Ejemplo |
|:----------|:---------:|----------:|
| Bases de Datos | Snake_case | control_escolar |
| Esquema | Snake_case | ventas, rh, seguridad |
| Tabla | Singular en Snake_case | cliente, pedido, detalle_pedido |
| columna | Snake_case | cliente_id, fecha_registro, correo_electronico |
| PK |<tabla>_id | cliente_id, producto_id |
| FK |Igual que la PK referencial| cliente_id, producto_id |
| Tabla Puente |<tabla1>_<Tabla2> | alumno_curso, producto_proveedor |

## Nombrar las Restricciones

- pk_cliente
- fk_pedido_cliente
- uq_cliente_correo_electronuco
- ck_producto_precio
- df_cliente_activo
- ix_pedido_fecha

**Prefijos**

- pk (Primay Key)
- fk (Foreign Key)
- uq (Unique)
- ck (check)
- df (Default)
- ix (index)

## Alter Table
permite modificar una tabla existente 

Puede:

- Agragar columnas 
- Eliminar columnas
- Modificar columnas
- Agreagr restricciones0

commit se terminaron los temas de SQL-LDD con los comandos CREATE, ALTER, DROP, aplicados a Tablas y restriciones.
se Comenzo con el trabajo de creacion de un diagrama logico a fisico aplicado cada una de las instrucciones SQL.