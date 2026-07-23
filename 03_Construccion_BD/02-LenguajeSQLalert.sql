-- Alter
create database bdejemplo;
go

use bdejemplo;
go


create table alumno (
	Alumno_id int not null identity (1,1),
	nombre varchar (20) not null,
	apellido_paterno varchar (15) not null,
	apellido_materno varchar (15) null
	
	);
go

-- agragar columna
alter table alumno
add telefono varchar(20);
-- alter table columnas
alter table alumno
add 
curp char(18),
rfc char(13) not null;
go

-- modificar un campo 
alter table alumno 
alter column 
telefono varchar(30);
go

--  restricciones 
-- primary key

alter table alumno 
add constraint pk_alumno
primary key (alumno_id);

-- foreing key 
create table carrera (
	carerra_id int not null identity(1,1),
	nombre varchar (30) not null,
);
go

alter table carrera 
add constraint pk_carrera
primary key (carrera_id);
go

alter table carrera 
add carrear_id int not null;
go

alter table alumno 
add constraint pk_alumno_carrera
foreign key (carrera_id)
references carrera(carrera_id)
on delete cascade
on update no action;


-- check

alter table alumno 
add edad int not null;

-- restriccioneas check

alter table alumno 
add constraint ck_alumno_edad
check (edad>0);

