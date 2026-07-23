
create database comercializadora;
go

-- utilizar la basse de datos 
use comercializadora;
go

/*================CREAR TABLA PRODUCTO=========================*/
create table producto(
	prducto_id char(5) not null,
	fabricante_id char(3) not null,
	descripcion varchar (40) not null,
	precio decimal (10,2) not null,
	existencia int not null
	constraint pk_producto
	primary key (prducto_id, fabricante_id),
	constraint uq_producto_descripcion
	unique (descripcion),
	constraint ck_producto_precio
	check (precio>0),
	constraint ck_producto_existencia
	check (existencia between 1 and 100)
);
go

/*================CREAR TABLA REPRECENTANTE=========================*/

CREATE table representante(
	representante_id int not null identity(1,1)
	constraint pk_representante
	primary key,
	nombre varchar (20) not null ,
	apellido_paterno varchar (15)not null,
	apellido_materno varchar (15) null,
	fecha_contrato date not null,
	fecha_nacimiento date not null,
	puesto varchar (15) not null,
	cuota decimal(10,2) not null
	constraint ck_representante_cuota
	check (cuota>0.0),
	venta decimal(10,2) null
	constraint ck_representante_venta
	check(venta>0.0),
	representante_id_jefe int --foreign key recursiva o jerarquica
	constraint fk_representante_representante
	foreign key (representante_id_jefe)
	references representante (representante_id),
	oficina_id int not null,-- foreign key de oficina 
	created_at datetime2 not null 
	constraint df_representante_created_at
	default sysdatetime(),
	update_at datetime2 not null
	constraint df_representante_update_at
	default sysdatetime ()

);
go

drop table representante

/*================CREAR TABLA REPRECENTANTE=========================*/


CREATE TABLE oficina (
    oficina_id INT NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    region VARCHAR(20) NOT NULL,
    objetivo DECIMAL(10,2) NOT NULL,
    venta DECIMAL(10,2) NOT NULL,
    created_at DATETIME2 NOT NULL
        CONSTRAINT df_oficina_created_at
        DEFAULT SYSDATETIME(),
    updated_at DATETIME2 NOT NULL
        CONSTRAINT df_oficina_update_at
        DEFAULT SYSDATETIME(),
    representante_id INT NOT NULL,
    CONSTRAINT pk_oficina
        PRIMARY KEY (oficina_id),
    CONSTRAINT uq_oficina_ciudad
        UNIQUE (ciudad),
    CONSTRAINT ck_oficina_region
        CHECK (region IN ('Este', 'Oeste')),
    CONSTRAINT ck_oficina_objetivo
        CHECK (objetivo > 0.0),
    CONSTRAINT ck_oficina_venta
        CHECK (venta > 0.0),
    CONSTRAINT fk_oficina_representante
        FOREIGN KEY (representante_id)
        REFERENCES representante(representante_id)
);
GO

/*================AGREGAR LOS CAMPOS DE ADITORIA A PRODUCTO=========================*/

alter table producto
add 
created_at datetime2 not null,
updated_at datetime2 not null;
go

alter table producto 
add constraint df_producto_created_at
default sysdatetime() for created_at;
go

alter table producto 
add constraint df_producto_updated_at
default sysdatetime() for updated_at;
go


/*================AGREGAR LA FOREIGN KEY A REPRESENTANTE DE OFICINA=========================*/

alter table representante 
add constraint fk_representante_oficina
foreign key (oficina_id)
references oficina(oficina_id);
go

/*================CREATE TABLA CLIENTE=========================*/

CREATE TABLE cliente(
    cliente_id INT NOT NULL IDENTITY
	CONSTRAINT pk_cliente
	PRIMARY KEY,
	empresa VARCHAR (30) NOT NULL
	CONSTRAINT uq_cliente_empresa
	UNIQUE,
	limite_credito DECIMAL(10, 2) NOT NULL
	CONSTRAINT ck_cliente_limite_credito
	CHECK (limite_credito BETWEEN 1000 AND 100000),
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME(),
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_cliente_updated_at
	DEFAULT SYSDATETIME(),
	representante_id INT NOT NULL -- Foreign key de Representante
	CONSTRAINT fk_cliente_representante
	FOREIGN KEY (representante_id)
	REFERENCES representante (representante_id)
);
GO



/*================CREATE TABLA PEDIDO=========================*/

create table pedido(
	pedido_id int not null identity (1,1)
	constraint pk_pedido
	primary key,
	fecha_pedido date not null,
	constraint df_pedido_fecha_pedido
	default getdate(),
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_pedido_created_at
	DEFAULT SYSDATETIME(),
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_pedido_updated_at
	DEFAULT SYSDATETIME(),
	cliente_id int not null 
	constraint fk_pedido_cliente
	foreign key (cliente_id)
	references cliente (cliente_id),
	representante_id int not null,
	constraint fk_pedido_representante
	foreign key (representante_id)
	references representante (representante_id)

);
go

/*================CREATE TABLA DETALLE PEDIDO=========================*/

	CREATE TABLE detalle_pedido (
       pedido_id INT NOT NULL,
	   producto_id CHAR(5) NOT NULL,
       fabricante_id CHAR(3) NOT NULL,
	   cantidad INT NOT NULL
	   CONSTRAINT ck_detalle_pedido_cantidad
	   CHECK (cantidad > 0.0),
	   precio_venta DECIMAL (10,2) NOT NULL
	   CONSTRAINT ck_detalle_pedido_precio_venta
	   CHECK (precio_venta >0.0),
	   created_at DATETIME2 NOT NULL
	   CONSTRAINT df_detalle_precio_created_at
	   DEFAULT SYSDATETIME(),
	   updated_at DATETIME2 NOT NULL 
	   CONSTRAINT df_detalle_venta_updated_at
	   DEFAULT SYSDATETIME(),
	   CONSTRAINT pk_detalle_venta
	   PRIMARY KEY (pedido_id, producto_id, fabricante_id),
	   CONSTRAINT fk_detalle_pedido_pedido
	   FOREIGN KEY (pedido_id)
	   REFERENCES pedido (pedido_id),
	   CONSTRAINT fk_detalle_pedido_producto
	   FOREIGN KEY (producto_id, fabricante_id)
	   REFERENCES producto (prducto_id, fabricante_id)
);
GO