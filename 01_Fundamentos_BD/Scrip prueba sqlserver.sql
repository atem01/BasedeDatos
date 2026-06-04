    CREATE DATABASE EJEMPLOBD;
    GO
    USE EJEMPLOBD;
    GO

    -- SQL -LDD
    CREATE TABLE CATEGORIA(
        Categoria_ID int not null,
        Nombre varchar(50) not null,
        CONSTRAINT PK_CATEGORIA
        PRIMARY KEY (Categoria_ID)

    );

    CREATE TABLE producto(
        producto_id INT NOT NULL PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        precio MONEY NOT NULL,
        existencia INT NOT NULL,
        categoria_id INT NOT NULL,
        CONSTRAINT fk_producto_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categoria (categoria_id)
    );

    -- Ejemplo MariaDB -- 

    # Crea una base de datos
    CREATE DATABASE prueba_atributo;

    # Utiliza la base de datos
    USE prueba_atributo;

    # Creacion de tabla empleado
    CREATE TABLE empleado(
    id int not null PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 varchar (15) NOT NULL, 
    apellido2 varchar (15) NULL,
    fecha_ingreso DATE NOT NULL
    );
    INSERT INTO empleado
    VALUES (1, 'Roberiano', 'Robles', 'De la torre', '1983-04-06');


    select 
    *, year(Fecha_Ingreso),month(Fecha_Ingreso),day(Fecha_Ingreso)
    from empleado;
    Alter table empleado
    add column Fecha_naci date not null;
    
    UPDATE empleado 
    SET 
        Fecha_naci = '1983-04-06'
    WHERE
        id = 1;
        
    SELECT nombre, 
    apellido1, 
    apellido2, 
    Fecha_Ingreso, 
    Fecha_naci,
    timestamp (year, Fecha_naci, - curdate()) AS Edad
    FROM empleado;