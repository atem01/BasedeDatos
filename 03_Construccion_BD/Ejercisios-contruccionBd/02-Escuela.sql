CREATE DATABASE Escuela;
GO

USE Escuela;
GO

CREATE TABLE profesor (
    num_profesor INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    created_at DATETIME2 NOT NULL
        CONSTRAINT df_profesor_created_at
        DEFAULT SYSDATETIME(),
    updated_at DATETIME2 NOT NULL
        CONSTRAINT df_profesor_updated_at
        DEFAULT SYSDATETIME(),

    CONSTRAINT pk_profesor
    PRIMARY KEY (num_profesor)
);
GO


CREATE TABLE curso (
    num_curso INT IDENTITY(1,1) NOT NULL,
    nombre_curso VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    num_prof INT NOT NULL,
    created_at DATETIME2 NOT NULL
        CONSTRAINT df_curso_created_at
        DEFAULT SYSDATETIME(),
    updated_at DATETIME2 NOT NULL
        CONSTRAINT df_curso_updated_at
        DEFAULT SYSDATETIME(),

    CONSTRAINT pk_curso
    PRIMARY KEY (num_curso),

    CONSTRAINT ck_curso_creditos
    CHECK (creditos > 0),

    CONSTRAINT fk_curso_profesor
    FOREIGN KEY (num_prof)
    REFERENCES profesor (num_profesor)
);
GO


CREATE TABLE especialidad (
    num_especialidad INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    num_prof INT NOT NULL,
    created_at DATETIME2 NOT NULL
        CONSTRAINT df_especialidad_created_at
        DEFAULT SYSDATETIME(),
    updated_at DATETIME2 NOT NULL
        CONSTRAINT df_especialidad_updated_at
        DEFAULT SYSDATETIME(),

    CONSTRAINT pk_especialidad
    PRIMARY KEY (num_especialidad),

    CONSTRAINT fk_especialidad_profesor
    FOREIGN KEY (num_prof)
    REFERENCES profesor (num_profesor)
);
GO

INSERT INTO profesor (nombre, apellido1, apellido2)
VALUES
('Juan', 'Pérez', 'López'),
('María', 'García', 'Hernández'),
('Carlos', 'Martínez', 'Sánchez'),
('Ana', 'Ramírez', NULL),
('Luis', 'Torres', 'Gómez');
GO

INSERT INTO curso (nombre_curso, creditos, num_prof)
VALUES
('Base de Datos', 8, 1),
('Programación', 10, 2),
('Redes', 7, 3),
('Inteligencia Artificial', 9, 4),
('Desarrollo Web', 6, 5);
GO

INSERT INTO especialidad (nombre, num_prof)
VALUES
('Bases de Datos', 1),
('Desarrollo de Software', 2),
('Redes y Telecomunicaciones', 3),
('Inteligencia Artificial', 4),
('Ciberseguridad', 5);
GO