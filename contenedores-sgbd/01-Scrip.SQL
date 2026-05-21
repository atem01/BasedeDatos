CREATE DATABASE pruebabd;

CREATE TABLE tbl1 (
id INT,
nombre VARCHAR (30)
);

INSERT into tbl1
VALUES (1, 'Pepito'),
	   (2, 'Luis'),
	   (3, 'Luar');

SELECT *
FROM tbl1;