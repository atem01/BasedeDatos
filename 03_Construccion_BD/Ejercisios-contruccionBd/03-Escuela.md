```sql

CREATE DATABASE Escuela;
GO

USE Escuela;
GO

CREATE TABLE alumno (
    id_alumno INT IDENTITY(1,1) NOT NULL,
    matricula VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    semestre INT NOT NULL,

    CONSTRAINT pk_alumno
    PRIMARY KEY (id_alumno),

    CONSTRAINT uq_alumno_matricula
    UNIQUE (matricula),

    CONSTRAINT ck_alumno_semestre
    CHECK (semestre BETWEEN 1 AND 12)
);
GO

CREATE TABLE materia (
    id_materia INT IDENTITY(1,1) NOT NULL,
    nombre_materia VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,

    CONSTRAINT pk_materia
    PRIMARY KEY (id_materia),

    CONSTRAINT ck_materia_creditos
    CHECK (creditos > 0)
);
GO

CREATE TABLE inscribe (
    id_materia INT NOT NULL,
    id_alumno INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    calificacion DECIMAL(5,2) NULL,

    CONSTRAINT pk_inscribe
    PRIMARY KEY (id_materia, id_alumno),

    CONSTRAINT fk_inscribe_materia
    FOREIGN KEY (id_materia)
    REFERENCES materia(id_materia),

    CONSTRAINT fk_inscribe_alumno
    FOREIGN KEY (id_alumno)
    REFERENCES alumno(id_alumno),

    CONSTRAINT ck_inscribe_calificacion
    CHECK (calificacion BETWEEN 0 AND 10 OR calificacion IS NULL)
);
GO

INSERT INTO alumno (matricula, nombre, apellido1, apellido2, semestre)
VALUES
('202400001', 'Juan', 'Pérez', 'López', 1),
('202400002', 'María', 'García', 'Hernández', 2),
('202400003', 'Carlos', 'Ramírez', 'Santos', 3),
('202400004', 'Ana', 'Martínez', NULL, 4),
('202400005', 'Luis', 'Torres', 'Gómez', 5);
GO

INSERT INTO materia (nombre_materia, creditos)
VALUES
('Base de Datos', 8),
('Programación', 10),
('Redes', 7),
('Matemáticas', 6),
('Ingeniería de Software', 9);
GO

INSERT INTO inscribe (id_materia, id_alumno, fecha_inscripcion, calificacion)
VALUES
(1, 1, '2026-08-01', 9.50),
(2, 1, '2026-08-01', 8.70),
(3, 2, '2026-08-01', 9.20),
(4, 3, '2026-08-01', 7.80),
(5, 4, '2026-08-01', NULL),
(1, 5, '2026-08-01', 10.00);
GO

```
## Diagrama 3 Escuela
![Diagrama 3-Escuela](/img/construccion/3Alumno_inscribe.jpeg)