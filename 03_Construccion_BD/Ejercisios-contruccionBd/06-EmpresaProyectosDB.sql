CREATE DATABASE EmpresaProyectosDB;
GO

USE EmpresaProyectosDB;
GO


CREATE TABLE department (
    number INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    manager VARCHAR(15) NULL,
    start_date DATE NOT NULL,

    CONSTRAINT pk_department
    PRIMARY KEY (number),

    CONSTRAINT uq_department_name
    UNIQUE (name),

    CONSTRAINT uq_department_manager
    UNIQUE (manager)
);
GO


CREATE TABLE employee (
    ssn VARCHAR(15) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(150) NOT NULL,
    birth_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    sex CHAR(1) NOT NULL,
    dept_number INT NOT NULL,

    CONSTRAINT pk_employee
    PRIMARY KEY (ssn),

    CONSTRAINT ck_employee_salary
    CHECK (salary > 0),

    CONSTRAINT ck_employee_sex
    CHECK (sex IN ('M', 'F')),

    CONSTRAINT fk_employee_department
    FOREIGN KEY (dept_number)
    REFERENCES department (number)
);
GO


-- El gerente del departamento debe ser un empleado
ALTER TABLE department
ADD CONSTRAINT fk_department_manager
FOREIGN KEY (manager)
REFERENCES employee (ssn);
GO


CREATE TABLE locations (
    id_location INT NOT NULL,
    dept_number INT NOT NULL,
    location VARCHAR(100) NOT NULL,

    CONSTRAINT pk_locations
    PRIMARY KEY (id_location, dept_number),

    CONSTRAINT fk_locations_department
    FOREIGN KEY (dept_number)
    REFERENCES department (number)
);
GO


CREATE TABLE projects (
    number INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    dept_number INT NOT NULL,

    CONSTRAINT pk_projects
    PRIMARY KEY (number),

    CONSTRAINT fk_projects_department
    FOREIGN KEY (dept_number)
    REFERENCES department (number)
);
GO


CREATE TABLE dependent (
    id_dependent INT IDENTITY(1,1) NOT NULL,
    ssn VARCHAR(15) NOT NULL,
    name VARCHAR(100) NOT NULL,
    sex CHAR(1) NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,

    CONSTRAINT pk_dependent
    PRIMARY KEY (id_dependent),

    CONSTRAINT fk_dependent_employee
    FOREIGN KEY (ssn)
    REFERENCES employee (ssn),

    CONSTRAINT ck_dependent_sex
    CHECK (sex IN ('M', 'F'))
);
GO


CREATE TABLE works_on (
    ssn VARCHAR(15) NOT NULL,
    project_number INT NOT NULL,
    hours DECIMAL(5,2) NOT NULL,

    CONSTRAINT pk_works_on
    PRIMARY KEY (ssn, project_number),

    CONSTRAINT fk_works_on_employee
    FOREIGN KEY (ssn)
    REFERENCES employee (ssn),

    CONSTRAINT fk_works_on_project
    FOREIGN KEY (project_number)
    REFERENCES projects (number),

    CONSTRAINT ck_works_on_hours
    CHECK (hours > 0)
);
GO


INSERT INTO department (
    name,
    manager,
    start_date
)
VALUES
('Desarrollo de Software', NULL, '2025-01-15'),
('Redes y Telecomunicaciones', NULL, '2025-02-10'),
('Recursos Humanos', NULL, '2025-03-01');
GO


INSERT INTO employee (ssn, first_name, last_name, address, birth_date, salary, sex, dept_number)
VALUES
(
    'EMP001',
    'Carlos',
    'Ramírez',
    'Tula de Allende, Hidalgo',
    '1985-04-12',
    28000.00,
    'M',
    1
),
(
    'EMP002',
    'María',
    'Hernández',
    'Tepeji del Río, Hidalgo',
    '1988-09-25',
    27000.00,
    'F',
    2
),
(
    'EMP003',
    'Ana',
    'López',
    'Atitalaquia, Hidalgo',
    '1990-06-18',
    25000.00,
    'F',
    3
),
(
    'EMP004',
    'Juan',
    'Pérez',
    'Tlaxcoapan, Hidalgo',
    '1998-02-14',
    16500.00,
    'M',
    1
),
(
    'EMP005',
    'Luis',
    'Martínez',
    'Tula de Allende, Hidalgo',
    '1995-11-08',
    17500.00,
    'M',
    2
),
(
    'EMP006',
    'Sofía',
    'Gómez',
    'Tepeji del Río, Hidalgo',
    '1997-07-21',
    16000.00,
    'F',
    3
);
GO

