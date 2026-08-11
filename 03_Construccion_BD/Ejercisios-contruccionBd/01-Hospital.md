```sql

CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE paciente (
    num_paciente INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    fecha_nacimiento DATE NOT NULL,

    CONSTRAINT pk_paciente
    PRIMARY KEY (num_paciente)
);
GO

CREATE TABLE expediente (
    num_expediente INT IDENTITY(1,1) NOT NULL,
    fecha_apertura DATE NOT NULL,
    tipo_sangre VARCHAR(5) NOT NULL,
    id_paciente INT NOT NULL,

    CONSTRAINT pk_expediente
    PRIMARY KEY (num_expediente),

    CONSTRAINT uq_expediente_id_paciente
    UNIQUE (id_paciente),

    CONSTRAINT fk_expediente_paciente
    FOREIGN KEY (id_paciente)
    REFERENCES paciente (num_paciente)
);
GO

-- Pacientes
INSERT INTO Paciente (Nombre, Apellido1, Apellido2, Fechanaci)
VALUES
('Juan', 'Pérez', 'López', '2000-05-15'),
('María', 'García', 'Hernández', '1998-10-20');

-- Expedientes
INSERT INTO Expediente (FechaAper, TipoSangre, id_paciente)
VALUES
('2026-07-28', 'O+', 1),
('2026-07-28', 'A-', 2);
```

## Diagrama 1 Hospital
![Diagrama 1-Hospital](/img/construccion/1Paciente_Expediente.jpeg)