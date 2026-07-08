-- contruccion de Bases de datos con SQL-LDD (create, Alter, Drop)

-- Crear una base de datos
create database universidad;
go

-- usar la bd 
use universidad;
go

-- Crear una tabla
create table alumno(
	alumnos_id int,
	nombre varchar(50),
	apellido_paterno varchar(25),
	apellido_materno varchar(25),
	fecha_nacimiento date,
	correo varchar(50)

);
go


insert into alumno
values (1,'Arcadia','Vaca','Del Corral','1986-04-07', 'correo@correo.com')

insert into alumno
values (1,'Kevin','Cabeza','De Borrego','1942-05-01', 'correo@correo.com')

select *
from alumno;

-- Restricciones

/*
	las restricciones son reglas que garantizan la integridad de los datos

	las mas utilizadas son:
	-- PRYMARY KEY
	-- FOREIGN KEY
	-- NOT NULL
	-- CHECK
	--DEFAULT
*/

DROP TABLE alumno;
go

-- PRYMARY KEY
create table alumno(
	alumno_id int primary key,
	nombre varchar(50),
	correo varchar(50),
);
go

insert into alumno
values (1, 'Luis','coreo@correo.com');

insert into alumno
values (2, 'Roberta','coreo@correo.com');

drop table alumno;

-- PRYMARY KEY
create table alumno(
	alumno_id int not null ,
	nombre varchar(50),
	correo varchar(50),
	constraint pk_alumno
	primary key (alumno_id)
);
go

insert into alumno
values (1, 'Luis','coreo@correo.com');

insert into alumno
values (1, 'Roberta','coreo@correo.com');

drop table alumno;

-- PRYMARY KEY CON IDENTITY
create table alumno(
	alumno_id int IDENTITY(1,1) PRIMARY KEY ,
	nombre varchar(50),
	correo varchar(50),
);
go

insert into alumno
values ('Luis','coreo@correo.com');

insert into alumno
values ('Roberta','coreo@correo.com');

select* from alumno;

create table alumno(
	alumno_id int not null IDENTITY(1,1) ,
	nombre varchar(50),
	correo varchar(50),
	constraint pk_alumno
	primary key (alumno_id)
);
go

-- NOT NULL

create table profesor (
	profesor_id int not null identity (1,1),
	numero_nomina varchar(20) not null,
	nombre varchar(15) not null,
	apellido_materno varchar(20) not null,
	apellido_paterno varchar(20) null,
	fecha_ingreso date,
	constraint pk_profesor
	primary key(profesor_id)
);
go

insert into profesor
values ('5554558645','luis','Hernandez',null,'2027-05-07');

insert into profesor(numero_nomina,nombre, apellido_materno)
values ('asdis546','Ricarda','Sonric');

select * from profesor;

--Restriccion UNIQUE

create table categoria(
	caegoria_id int not null primary key identity(1,1),
	nombre varchar(20) not null unique,
	activo bit not null 
);
go

insert into categoria
values (upper(' carnes_firas'), 1);

insert into categoria
values (upper(' carnes_firas'), 1);

drop table categoria;
go

-----

create table categoria(
	categoria_id int not null identity(1,1)
	constraint pk_categoria
	primary key (categoria_id),
	nombre varchar(20) not null
	constraint uq_categoria_nombre
	unique,
	activo bit not null
);
go

drop table categoria;
go

create table categoria(
	categoria_id int not null identity(1,1),
	nombre varchar(20) not null,
	activo bit not null,
	constraint pk_categoria
	primary key (categoria_id),
	constraint uq_categoria_nombre
	unique (nombre)
);
go

drop table categoria;
go


-- Resticcion default

create table categoria(
	categoria_id int not null identity(1,1),
	nombre varchar(20) not null,
	activo bit not null default 1,
	constraint pk_categoria
	primary key (categoria_id),
	constraint uq_categoria_nombre
	unique (nombre)
);
go

insert into categoria (nombre,activo)
values ('carnes Frias',default);

insert into categoria (nombre)
values ('lacteos');

select * from categoria
go

-- TODO: crear tablas de las otras dos formas 

-- TODO: CHECK