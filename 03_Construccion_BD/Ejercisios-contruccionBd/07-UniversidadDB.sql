CREATE DATABASE UniversidadDB;
GO

USE UniversidadDB;
GO

CREATE TABLE Alumno (
    Matricula VARCHAR(10) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    FechaNaci DATE NOT NULL,

    CONSTRAINT pk_alumno
    PRIMARY KEY (Matricula),

    CONSTRAINT uq_alumno_correo
    UNIQUE (Correo),

    CONSTRAINT ck_alumno_fecha_nacimiento
    CHECK (FechaNaci <= CAST(GETDATE() AS DATE))
);
GO

CREATE TABLE Credencial (
    NumeroCredencial VARCHAR(20) NOT NULL,
    FechaExp DATE NOT NULL,
    Vigencia DATE NOT NULL,
    Matricula VARCHAR(10) NOT NULL,

    CONSTRAINT pk_credencial
    PRIMARY KEY (NumeroCredencial),

    CONSTRAINT uq_credencial_matricula
    UNIQUE (Matricula),

    CONSTRAINT ck_credencial_vigencia
    CHECK (Vigencia > FechaExp),

    CONSTRAINT fk_credencial_alumno
    FOREIGN KEY (Matricula)
    REFERENCES Alumno (Matricula)
);
GO

CREATE TABLE Telefono (
    ClaveTel INT NOT NULL,
    Matricula VARCHAR(10) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,

    CONSTRAINT pk_telefono
    PRIMARY KEY (ClaveTel, Matricula),

    CONSTRAINT uq_telefono_numero
    UNIQUE (Telefono),

    CONSTRAINT fk_telefono_alumno
    FOREIGN KEY (Matricula)
    REFERENCES Alumno (Matricula)
);
GO

CREATE TABLE Departamento (
    NumDep INT NOT NULL,
    NombreDep VARCHAR(80) NOT NULL,
    Edificio VARCHAR(50) NOT NULL,

    CONSTRAINT pk_departamento
    PRIMARY KEY (NumDep),

    CONSTRAINT uq_departamento_nombre
    UNIQUE (NombreDep)
);
GO

CREATE TABLE Profesor (
    NumProf INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NOT NULL,
    NumDep INT NOT NULL,

    CONSTRAINT pk_profesor
    PRIMARY KEY (NumProf),

    CONSTRAINT fk_profesor_departamento
    FOREIGN KEY (NumDep)
    REFERENCES Departamento (NumDep)
);
GO

CREATE TABLE Materia (ClaveMateria VARCHAR(10) NOT NULL,
    NombreMat VARCHAR(80) NOT NULL,
    Creditos INT NOT NULL,
    NumProf INT NOT NULL,

    CONSTRAINT _materia
    PRIMARY KEY (ClaveMateria),

    CONSTRAINT ck_materia_creditos
    CHECK (Creditos > 0),

    CONSTRAINT fk_materia_profesor
    FOREIGN KEY (NumProf)
    REFERENCES Profesor (NumProf)
);
GO

CREATE TABLE Cursa (
    Matricula VARCHAR(10) NOT NULL,
    ClaveMat VARCHAR(10) NOT NULL,
    FechaInscrip DATE NOT NULL,
    Calif DECIMAL(4,2) NULL,

    CONSTRAINT pk_cursa
    PRIMARY KEY (Matricula, ClaveMat),

    CONSTRAINT fk_cursa_alumno
    FOREIGN KEY (Matricula)
    REFERENCES Alumno (Matricula),

    CONSTRAINT fk_cursa_materia
    FOREIGN KEY (Clavet)
    REFERENCES Materia (ClaveMateria),

    CONSTRAINT ck_cursa_calificacion
    CHECK (Calif BETWEEN 0 AND 10 OR Calif IS NULL)
);
GO

CREATE TABLE Proyecto (
    NumProy INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Presupuesto DECIMAL(12,2) NOT NULL,
    NumDep INT NOT NULL,

    CONSTRAINT pk_proyecto
    PRIMARY KEY (NumProy),

    CONSTRAINT ck_proyecto_presupuesto
    CHECK (Presupuesto > 0),

    CONSTRAINT fk_proyecto_departamento
    FOREIGN KEY (NumDep)
    REFERENCES Departamento (NumDep)
);
GO

CREATE TABLE Participa (
    NumProf INT NOT NULL,
    NumProy INT NOT NULL,
    FechaInicio DATE NOT NULL,
    Rol VARCHAR(50) NOT NULL,

    CONSTRAINT pk_participa
    PRIMARY KEY (NumProf, NumProy),

    CONSTRAINT fk_participa_profesor
    FOREIGN KEY (NumProf)
    REFERENCES Profesor (NumProf),

    CONSTRAINT fk_participa_proyecto
    FOREIGN KEY (NumProy)
    REFERENCES Proyecto (NumProy)
);
GO

CREATE TABLE Dependiente (
    NombreDep VARCHAR(80) NOT NULL,
    NumProf INT NOT NULL,
    FechaNaci DATE NOT NULL,
    Parentesco VARCHAR(30) NOT NULL,

    CONSTRAINT pk_dependiente
    PRIMARY KEY (NombreDep, NumProf),

    CONSTRAINT fk_dependiente_profesor
    FOREIGN KEY (NumProf)
    REFERENCES Profesor (NumProf),

    CONSTRAINT ck_dependiente_fecha_nacimiento
    CHECK (FechaNaci <= CAST(GETDATE() AS DATE))
);
GO

INSERT INTO Alumno (Matricula, Nombre, Apellido1, Apellido2, Correo, FechaNaci)
VALUES
('20240001', 'Juan', 'Pérez', 'López', 'juan.perez@uttt.edu.mx', '2004-05-12'),
('20240002', 'María', 'García', 'Hernández', 'maria.garcia@uttt.edu.mx', '2003-11-20'),
('20240003', 'Carlos', 'Ramírez', 'Santos', 'carlos.ramirez@uttt.edu.mx', '2004-02-15'),
('20240004', 'Ana', 'Martínez', 'Ruiz', 'ana.martinez@uttt.edu.mx', '2005-01-08'),
('20240005', 'Luis', 'Torres', 'Gómez', 'luis.torres@uttt.edu.mx', '2003-09-30');
GO

INSERT INTO Credencial (NumeroCredencial, FechaExp, Vigencia, Matricula)
VALUES
('CR-0001', '2025-01-15', '2028-01-15', '20240001'),
('CR-0002', '2025-01-15', '2028-01-15', '20240002'),
('CR-0003', '2025-01-16', '2028-01-16', '20240003'),
('CR-0004', '2025-01-16', '2028-01-16', '20240004'),
('CR-0005', '2025-01-17', '2028-01-17', '20240005');
GO

INSERT INTO Telefono (ClaveTel, Matricula, Telefono)
VALUES
(1, '20240001', '7731234567'),
(2, '20240001', '7731112233'),
(1, '20240002', '7732345678'),
(1, '20240003', '7733456789'),
(1, '20240004', '7734567890'),
(1, '20240005', '7735678901');
GO

INSERT INTO Departamento (NumDep, NombreDep, Edificio)
VALUES
(1, 'Tecnologías de la Información', 'Edificio A'),
(2, 'Redes y Telecomunicaciones', 'Edificio B'),
(3, 'Administración', 'Edificio C');
GO

INSERT INTO Profesor (NumProf, Nombre, Apellido1, Apellido2, NumDep)
VALUES
(101, 'Roberto', 'Sánchez', 'Luna', 1),
(102, 'Laura', 'Hernández', 'Díaz', 1),
(103, 'Miguel', 'Torres', 'Vargas', 2),
(104, 'Patricia', 'Gómez', 'Reyes', 2),
(105, 'Fernando', 'López', 'Castro', 3);
GO

INSERT INTO Materia (ClaveMateria, NombreMat, Creditos, NumProf)
VALUES
('BD001', 'Base de Datos', 8, 101),
('POO001', 'Programación Orientada a Objetos', 8, 102),
('RED001', 'Redes de Computadoras', 7, 103),
('SEG001', 'Seguridad Informática', 7, 104),
('ADM001', 'Administración de Proyectos', 6, 105);
GO

INSERT INTO Cursa (Matricula, ClaveMat, FechaInscrip, Calif)
VALUES
('20240001', 'BD001', '2026-01-12', 9.50),
('20240001', 'POO001', '2026-01-12', 8.70),
('20240002', 'BD001', '2026-01-12', 9.20),
('20240002', 'RED001', '2026-01-13', 8.50),
('20240003', 'RED001', '2026-01-13', 7.80),
('20240003', 'SEG001', '2026-01-13', 9.00),
('20240004', 'POO001', '2026-01-14', NULL),
('20240004', 'ADM001', '2026-01-14', 8.60),
('20240005', 'SEG001', '2026-01-14', 9.80),
('20240005', 'ADM001', '2026-01-14', 9.10);
GO

INSERT INTO Proyecto (NumProy, Nombre, Presupuesto, NumDep)
VALUES
(201, 'Sistema de Control Escolar', 150000.00, 1),
(202, 'Aplicación de Transporte Universitario', 95000.00, 1),
(203, 'Modernización de la Red Universitaria', 250000.00, 2),
(204, 'Sistema de Seguridad de Red', 180000.00, 2),
(205, 'Plataforma de Gestión Administrativa', 120000.00, 3);
GO

INSERT INTO Participa (NumProf, NumProy, FechaInicio, Rol)
VALUES
(101, 201, '2026-02-01', 'Líder del proyecto'),
(102, 201, '2026-02-01', 'Desarrolladora'),
(102, 202, '2026-02-15', 'Líder de desarrollo'),
(103, 203, '2026-03-01', 'Administrador de red'),
(104, 203, '2026-03-01', 'Especialista en seguridad'),
(104, 204, '2026-03-10', 'Líder de seguridad'),
(105, 205, '2026-04-01', 'Coordinador');
GO

INSERT INTO Dependiente (NombreDep, NumProf, FechaNaci, Parentesco)
VALUES
('Sofía Sánchez', 101, '2012-05-15', 'Hija'),
('Daniel Sánchez', 101, '2015-08-20', 'Hijo'),
('José Hernández', 102, '1985-10-10', 'Esposo'),
('Mariana Torres', 103, '2014-03-25', 'Hija'),
('Carlos Gómez', 104, '1984-07-18', 'Esposo'),
('Andrea López', 105, '2010-12-04', 'Hija');
GO

