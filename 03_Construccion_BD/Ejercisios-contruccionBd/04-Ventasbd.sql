CREATE DATABASE VentasDB;
GO

USE VentasDB;
GO


CREATE TABLE cliente (
    id_cliente INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,

    CONSTRAINT pk_cliente
    PRIMARY KEY (id_cliente)
);
GO


CREATE TABLE producto (
    id_producto INT IDENTITY(1,1) NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_producto
    PRIMARY KEY (id_producto),

    CONSTRAINT ck_producto_precio
    CHECK (precio > 0)
);
GO


CREATE TABLE pedido (
    id_pedido INT IDENTITY(1,1) NOT NULL,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,

    CONSTRAINT pk_pedido
    PRIMARY KEY (id_pedido),

    CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES cliente (id_cliente)
);
GO


CREATE TABLE contiene (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    contenido_venta INT NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_contiene
    PRIMARY KEY (id_pedido, id_producto),

    CONSTRAINT fk_contiene_pedido
    FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido),

    CONSTRAINT fk_contiene_producto
    FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto),

    CONSTRAINT ck_contiene_cantidad
    CHECK (contenido_venta > 0),

    CONSTRAINT ck_contiene_precio_venta
    CHECK (precio_venta > 0)
);
GO

INSERT INTO cliente (nombre, apellido1, apellido2)
VALUES
('Juan', 'Pérez', 'López'),
('María', 'García', 'Hernández'),
('Carlos', 'Martínez', NULL),
('Ana', 'Ramírez', 'Santos'),
('Luis', 'Torres', 'Gómez');
GO

INSERT INTO producto (nombre_producto, precio)
VALUES
('Teclado', 450.00),
('Mouse', 280.50),
('Monitor', 3200.00),
('Memoria USB', 180.00),
('Audífonos', 750.00);
GO

INSERT INTO pedido (fecha, id_cliente)
VALUES
('2026-07-28', 1),
('2026-07-28', 2),
('2026-07-29', 3),
('2026-07-29', 1),
('2026-07-30', 4);
GO

INSERT INTO contiene (id_pedido, id_producto, contenido_venta, precio_venta)
VALUES
(1, 1, 2, 450.00),
(1, 2, 1, 280.50),
(2, 3, 1, 3200.00),
(3, 4, 3, 180.00),
(4, 5, 2, 700.00),
(5, 2, 1, 280.50);
GO

