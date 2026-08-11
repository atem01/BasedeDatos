CREATE DATABASE EmpresaDB;
GO

USE EmpresaDB;
GO


CREATE TABLE employee (
    ssn VARCHAR(15) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(150) NOT NULL,
    birth_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    sex CHAR(1) NOT NULL,
    jefe VARCHAR(15) NULL,
    dno INT NOT NULL,

    CONSTRAINT pk_employee
    PRIMARY KEY (ssn),

    CONSTRAINT ck_employee_salary
    CHECK (salary > 0),

    CONSTRAINT ck_employee_sex
    CHECK (sex IN ('M', 'F')),

    CONSTRAINT fk_employee_jefe
    FOREIGN KEY (jefe)
    REFERENCES employee (ssn)
);
GO


CREATE TABLE department (
    number INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    manager VARCHAR(15) NOT NULL,
    start_date DATE NOT NULL,

    CONSTRAINT pk_department
    PRIMARY KEY (number),

    CONSTRAINT uq_department_name
    UNIQUE (name),

    CONSTRAINT uq_department_manager
    UNIQUE (manager)
);
GO


CREATE TABLE locations (
    num_location INT NOT NULL,
    number_dep INT NOT NULL,
    location VARCHAR(100) NOT NULL,

    CONSTRAINT pk_locations
    PRIMARY KEY (num_location, number_dep),

    CONSTRAINT fk_locations_department
    FOREIGN KEY (number_dep)
    REFERENCES department (number)
);
GO


CREATE TABLE projects (
    number INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    number_dsp INT NOT NULL,

    CONSTRAINT pk_projects
    PRIMARY KEY (number),

    CONSTRAINT fk_projects_department
    FOREIGN KEY (number_dsp)
    REFERENCES department (number)
);
GO


CREATE TABLE dependent (
    name VARCHAR(100) NOT NULL,
    ssn VARCHAR(15) NOT NULL,
    sex CHAR(1) NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,

    CONSTRAINT pk_dependent
    PRIMARY KEY (name, ssn),

    CONSTRAINT fk_dependent_employee
    FOREIGN KEY (ssn)
    REFERENCES employee (ssn),

    CONSTRAINT ck_dependent_sex
    CHECK (sex IN ('M', 'F'))
);
GO

INSERT INTO employee (ssn, first_name, last_name, address, birth_date, salary, sex, jefe, dno)
VALUES
(
    'EMP001',
    'Carlos',
    'Ramírez',
    'Tula de Allende, Hidalgo',
    '1985-04-12',
    28000.00,
    'M',
    NULL,
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
    NULL,
    2
),
(
    'EMP003',
    'Juan',
    'Pérez',
    'Atitalaquia, Hidalgo',
    '1995-02-14',
    16000.00,
    'M',
    'EMP001',
    1
),
(
    'EMP004',
    'Ana',
    'López',
    'Tlaxcoapan, Hidalgo',
    '1997-07-20',
    17500.00,
    'F',
    'EMP002',
    2
),
(
    'EMP005',
    'Luis',
    'Martínez',
    'Tula de Allende, Hidalgo',
    '1993-11-08',
    18000.00,
    'M',
    'EMP001',
    1
);
GO

