# Modelado-y-Diccionario-de-Datos

# Diccionario de datos de la base de datos control hospitalario 

1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto  | Sistema de Control Hospitalario |
| Descripción | Base de datos para el control hospitalario |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Juan Raúl Rangel Contreras |
| SGBD | SQLServer |

2. Descripción del sistema de base de datos

Un hospital registra información de sus pacientes.
> De cada paciente se almacena lo siguiente:

- Identificador
- Nombre
- Fecha de nacimiento

> De cada expediente médico se debe almacenar:

- Número de expediente.
- Fecha de apertura.
- Tipo de sangre.

3. Catálogo de Resntrincciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

4. Diccionario de Datos

### Tabla: Paciente


| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPaciente | INT | - | PK, AI, NN | Identificador único del paciente |
| Nombre | VARCHAR | 50 | NN | Nombre del paciente |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del paciente |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido del paciente |
| Fechanaci | DATE | - | NN | Fecha de nacimiento del paciente |

---

### Tabla: Expediente

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numexp | INT | - | PK, AI, NN | Identificador único del expediente |
| Fechaaper | DATE | - | NN | Fecha de apertura del expediente |
| Tiposangre | VARCHAR | 5 | NN | Tipo sanguíneo del paciente |
| id_paciente | INT | - | FK, NN, UQ | Referencia al paciente asociado |

5. Relaciones entre tablas

| Relacioón | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Paciente -> Expediente | 1:N    | Un paciente tiene muchos expedientes médicos  |

6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Expediente | id_paciente | Paciente (id_paciente) |

7. Integridad Referencial  

| Regla | Descripción |
| :--- | :--- |
| 01 | No se puede registrar un expediente para un paciente inexistente |
| 02 | Un paciente solo puede tener un expediente |

8. Reglas del Negocio 

| Codigo | Regla |
| :--- | :--- |
| 01 | Cada paciente debe tener exactamente un expediente médico.|
| 02 | Cada expediente médico pertenece a un único paciente.|
| 03 | No puede existir un expediente sin paciente.|
| 04 | No puede existir un paciente sin expediente.|

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej1](/ima/Eje1.1.png)

------------------

# Diccionario de datos de la base de datos control escolar 

1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto  | Sistema de Control Escolar Universidad |
| Descripción | Base de datos para el control escolar universitario |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Juan Raúl Rangel Contreras |
| SGBD | SQLServer |

2. Descripción del sistema de base de datos

Una universidad administra profesores y cursos

> De cada profesor se almacena:

- numero de profesor
- nombre
- especialidad 

> De cada curso se almacena:

- numero de curso 
- Nombre del curso
- Creditos

3. Catálogo de Resntrincciones Utilizadas

| Codigo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |
| FK | Foreign Key |


### Tabla: Profesor

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numprofesro | INT | - | PK, AI, NN | Identificador único del profesor |
| Nombre | VARCHAR | 50 | NN | Nombre del profesor |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del profesor |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido del profesor |

---

### Tabla: Curso

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numcurso | INT | - | PK, AI, NN | Identificador único del curso |
| NombreCurso | VARCHAR | 100 | NN | Nombre del curso |
| Creditos | INT | 2 | NN | Créditos asignados al curso |
| numProf | INT | - | FK, NN | Profesor que imparte el curso |

---

### Tabla: Especialidad

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numesp | INT | - | PK, AI, NN | Identificador único de la especialidad |
| Nombre | VARCHAR | 100 | NN | Nombre de la especialidad |
| NumProf | INT | - | FK, NN | Profesor asociado a la especialidad |

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Profesor → Curso | 1:N | Un profesor puede impartir muchos cursos |
| Profesor → Especialidad | 1:N | Un profesor puede tener varias especialidades |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Curso | numProf | Profesor (Numprofesro) |
| Especialidad | NumProf | Profesor (Numprofesro) |

---

7. Integridad Referencial  

| Regla | Descripción |
| :--- | :--- |
| 01 | No se puede registrar un curso con un profesor inexistente |
| 02 | No se puede registrar una especialidad para un profesor inexistente |

8. Reglas del Negocio 

| Codigo | Regla |
| :--- | :--- |
| 01 | Un profesor puede impartir varios cursos |
| 02 | Un curso solo puede ser impartido por un profesor |
| 03 | Puede existir un profesor que actualmente no imparta cursos |
| 04 | Todo curso debe estar asignado a un profesor |

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej2](/ima/Eje2.2.png)

------------------

# Diccionario de datos tabla de Alumnos,incriben,materias

1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto  | Sistema de Control de Inscripciones |
| Descripción | Base de datos para el control de inscripciones |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Juan Raúl Rangel Contreras |
| SGBD | SQLServer |

2. Descripción del sistema de base de datos

Una escuela administra alumnos y materias

> De cada alumno se almacena:

- Matricula
- Nombre
- Semestre

> De cada materia:

- Clave de la materia
- Nombre de la materia
- Creditos

3. Catálogo de Resntrincciones Utilizadas

| Codigo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |
| FK | Foreign Key |

4. Diccionario de Datos

### Tabla: Alumno


| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdAlumno | INT | - | PK, AI, NN | Identificador único del alumno |
| Matricula | VARCHAR | 10 | NN, UQ | Matrícula institucional |
| Nombre | VARCHAR | 100 | NN | Nombre del alumno |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido |
| Semestre | INT | 2 | NN | Semestre actual del alumno |

---

### Tabla: Materia


| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdMateria | INT | - | PK, AI, NN | Identificador único de la materia |
| NombreMat | VARCHAR | 100 | NN | Nombre de la materia |
| Creditos | INT | 2 | NN | Créditos asignados a la materia |

---

### Tabla: INSCRIBE

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdMateria | INT | - | PK, FK, NN | Materia inscrita |
| IdAlumno | INT | - | PK, FK, NN | Alumno inscrito |
| FechaInscripcion | DATE | - | NN | Fecha de inscripción |
| Califin | DECIMAL | 5,2 | NULL | Calificación final obtenida |

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno → INSCRIBE | 1:N | Un alumno puede realizar muchas inscripciones |
| Materia → INSCRIBE | 1:N | Una materia puede tener muchos alumnos inscritos |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| INSCRIBE | IdAlumno | Alumno (IdAlumno) |
| INSCRIBE | IdMateria | Materia (IdMateria) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| 01 | No se puede registrar una inscripción para un alumno inexistente |
| 02 | No se puede registrar una inscripción para una materia inexistente |
| 03 | No se puede duplicar la inscripción del mismo alumno a la misma materia |

---

8. Reglas del Negocio 

| Codigo | Regla |
| :--- | :--- |
| 01 | Un alumno puede inscribirse en varias materias |
| 02 | Una materia puede tener muchos alumnos inscritos |
| 03 | Puede existir una materia sin alumnos inscritos |
| 04 | Todo alumno debe estar inscrito en al menos una materia |
| 05 | De cada inscripción se desea almacenar: Fecha de inscripción y Calificación final |

---

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej3](/ima/Eje3.3.png)

----------------------

# Diccionario de datos de la tabla Clientes,realiza,pedidos

1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto  | Sistema de Control Empresarial |
| Descripción | Base de datos para el control empresarial |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Juan Raúl Rangel Contreras |
| SGBD | SQLServer |

2. Descripción del sistema de base de datos

Una empresa se dedica a la venta de productos al por mayor, y necesita registrar lo siguiente:

> De los clientes necesita almacenar:

- Identificador del cliente
- nombre del cliente, el cual es una persona moral

> De los pedidos de la venta:

- Numero del producto
- Nombre del producto
- Precio del producto

3. Catálogo de Resntrincciones Utilizadas

| Codigo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |
| FK | Foreign Key |

## 4. Diccionario de Datos

### Tabla: Cliente

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdCliente | INT | - | PK, AI, NN | Identificador único del cliente |
| Nombre | VARCHAR | 100 | NN | Nombre del cliente |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido |

---

### Tabla: Pedido

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdPedido | INT | - | PK, AI, NN | Identificador único del pedido |
| Fecha | DATE | - | NN | Fecha de registro del pedido |
| IdCliente | INT | - | FK, NN | Cliente que realizó el pedido |

---

### Tabla: Producto

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdProducto | INT | - | PK, AI, NN | Identificador único del producto |
| NombreProducto | VARCHAR | 100 | NN | Nombre del producto |
| Precio | DECIMAL | 10,2 | NN | Precio base del producto |

---

### Tabla: Contiene

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdPedido | INT | - | PK, FK, NN | Pedido asociado |
| IdProducto | INT | - | PK, FK, NN | Producto incluido |
| ContenidoVenta | INT | 10 | NN | Cantidad vendida del producto |
| PrecioVenta | DECIMAL | 10,2 | NN | Precio aplicado al momento de la venta |

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Cliente → Pedido | 1:N | Un cliente puede realizar muchos pedidos |
| Pedido → Contiene | 1:N | Un pedido puede contener varios productos |
| Producto → Contiene | 1:N | Un producto puede aparecer en muchos pedidos |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Pedido | IdCliente | Cliente (IdCliente) |
| Contiene | IdPedido | Pedido (IdPedido) |
| Contiene | IdProducto | Producto (IdProducto) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| 01 | No se puede registrar un pedido para un cliente inexistente |
| 02 | No se puede agregar un producto inexistente a un pedido |
| 03 | No se puede eliminar un pedido si tiene productos asociados |

---

8. Reglas del Negocio 

| Codigo | Regla |
| :--- | :--- |
| 01 | Un cliente puede realizar muchos pedidos |
| 02 | Cada pedido pertenece a un solo cliente |
| 03 | Un pedido contiene varios productos |
| 04 | Un producto puede aparecer en muchos pedidos |
| 05 | Un pedido debe contener almenos un productos |
| 06 | Un producto puede no haber sido vendido |
| 07 | El detalle del pedido no existe sin pedido |
| 08 | El detalle del pedido no existe sin producto |
| 09 | El detalle del pedido almacena cantidad vendida y precio de venta |

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej4](/ima/Eje4.4.png)

----------------------

# Diccionario de Datos de la tabla Manayer

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Administración Empresarial |
| Descripción | Base de datos para la administración de empleados, departamentos, proyectos y dependientes |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Juan Raúl Rangel Contreras |
| SGBD | SQL Server |

---

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Empleados
- Departamentos
- Ubicaciones
- Proyectos
- Dependientes
- Asignación de trabajo

Permite controlar la estructura organizacional de la empresa y la participación de empleados en proyectos.

---

## 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

---

## 4. Diccionario de Datos

### Tabla: Employec

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSn | VARCHAR | 15 | PK, NN | Número identificador del empleado |
| FirstName | VARCHAR | 50 | NN | Nombre |
| LastName | VARCHAR | 50 | NN | Apellidos |
| Address | VARCHAR | 150 | NN | Dirección |
| Bdate | DATE | - | NN | Fecha de nacimiento |
| Salary | DECIMAL | 10,2 | NN | Salario |
| Sex | CHAR | 1 | NN | Sexo |
| Jef | VARCHAR | 15 | FK | Jefe directo |

---

### Tabla: Department

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, AI, NN | Identificador del departamento |
| Name | VARCHAR | 100 | NN, UQ | Nombre del departamento |
| manager | VARCHAR | 15 | FK, UQ, NN | Empleado responsable |
| Startdate | DATE | - | NN | Fecha de inicio del gerente |

---

### Tabla: Locations

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumLocation | INT | - | PK, NN | Identificador de ubicación |
| NumberDep | INT | - | PK, FK, NN | Departamento asociado |
| Location | VARCHAR | 100 | NN | Nombre o dirección de ubicación |

---

### Tabla: Projects

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, AI, NN | Identificador del proyecto |
| Name | VARCHAR | 100 | NN | Nombre del proyecto |
| Location | VARCHAR | 100 | NN | Ubicación del proyecto |
| NumberDsp | INT | - | FK, NN | Departamento responsable |
| NameDef | VARCHAR | 100 | FK, NN | Departamento asignado |

---

### Tabla: WORKS_ON

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSn | VARCHAR | 15 | PK, FK, NN | Empleado asignado |
| NumberProj | INT | PK, FK, NN | Proyecto asignado |
| Hours | DECIMAL | 5,2 | NN | Horas trabajadas |

---

### Tabla: Dependent

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Name | VARCHAR | 100 | PK, NN | Nombre del dependiente |
| SSn | VARCHAR | 15 | PK, FK, NN | Empleado asociado |
| Sex | CHAR | 1 | NN | Sexo |
| Relationship | VARCHAR | 50 | NN | Relación con el empleado |
| Bdate | DATE | - | NN | Fecha de nacimiento |

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Employee → Department | 1:1 | Un empleado administra un departamento |
| Department → Employee | 1:N | Un departamento tiene varios empleados |
| Department → Locations | 1:N | Un departamento puede tener varias ubicaciones |
| Department → Projects | 1:N | Un departamento administra proyectos |
| Employee → WORKS_ON | 1:N | Un empleado participa en varios proyectos |
| Projects → WORKS_ON | 1:N | Un proyecto tiene varios empleados |
| Employee → Dependent | 1:N | Un empleado puede tener varios dependientes |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Employee | Jef | Employee (SSn) |
| Department | manager | Employee (SSn) |
| Locations | NumberDep | Department (Number) |
| Projects | NumberDsp | Department (Number) |
| WORKS_ON | SSn | Employee (SSn) |
| WORKS_ON | NumberProj | Projects (Number) |
| Dependent | SSn | Employee (SSn) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| 01 | No se puede asignar un gerente inexistente |
| 02 | No se puede asignar un proyecto a un departamento inexistente |
| 03 | No se puede registrar horas para empleados inexistentes |
| 04 | No se puede registrar dependientes para empleados inexistentes |

---

## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| 01 | Un empleado puede participar en varios proyectos |
| 02 | Un departamento tiene un único gerente |
| 03 | Un empleado puede tener varios dependientes |
| 04 | Un proyecto pertenece a un único departamento |

---

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej5](/ima/Eje5.5.png)

---------

# Diccionario de Datos de la Base de Datos Empresa

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Administración Empresarial |
| Descripción | Base de datos para administrar empleados, departamentos, ubicaciones y proyectos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Juan Raúl Rangel Contreras |
| SGBD | SQL Server |

---

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Empleados
- Departamentos
- Ubicaciones
- Proyectos
- Dependientes
- Asignación de empleados a proyectos

Permite controlar la estructura organizacional y la participación de empleados en distintos proyectos.

---

## 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

---

## 4. Diccionario de Datos

### Tabla: Employee

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSn | VARCHAR | 15 | PK, NN | Identificador del empleado |
| FirstName | VARCHAR | 50 | NN | Nombre |
| LastName | VARCHAR | 50 | NN | Apellidos |
| Address | VARCHAR | 150 | NN | Dirección |
| Bdate | DATE | - | NN | Fecha de nacimiento |
| Salary | DECIMAL | 10,2 | NN | Salario |
| Sex | CHAR | 1 | NN | Sexo |
| IdDependent | INT | FK | Referencia al dependiente |

---

### Tabla: Department

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, AI, NN | Identificador del departamento |
| manager | VARCHAR | 15 | FK, UQ, NN | Empleado responsable |
| Startdate | DATE | - | NN | Fecha de inicio |
| Name | VARCHAR | 100 | NN, UQ | Nombre del departamento |

---

### Tabla: Locations

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumLocation | INT | - | PK, NN | Identificador de ubicación |
| NumberDep | INT | - | PK, FK, NN | Departamento asociado |
| Location | VARCHAR | 100 | NN | Nombre o dirección |


---

### Tabla: Projects

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, AI, NN | Identificador del proyecto |
| Location | VARCHAR | 100 | NN | Ubicación del proyecto |
| Name | VARCHAR | 100 | NN | Nombre del proyecto |
| NameDep | VARCHAR | 100 | FK, NN | Departamento responsable |

---

### Tabla: WORKS_ON


| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSn | VARCHAR | 15 | PK, FK, NN | Empleado asignado |
| NumberProj | INT | PK, FK, NN | Proyecto asignado |
| Hours | DECIMAL | 5,2 | NN | Horas trabajadas |


---

### Tabla: Dependent


| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdDependent | INT | - | PK, AI, NN | Identificador del dependiente |
| SSn | VARCHAR | 15 | FK, NN | Empleado asociado |
| Name | VARCHAR | 100 | NN | Nombre del dependiente |
| Sex | CHAR | 1 | NN | Sexo |
| Relationship | VARCHAR | 50 | NN | Relación con el empleado |
| Bdate | DATE | - | NN | Fecha de nacimiento |

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Department → Employee | 1:N | Un departamento tiene varios empleados |
| Department → Locations | 1:N | Un departamento puede tener varias ubicaciones |
| Department → Projects | 1:N | Un departamento administra varios proyectos |
| Employee → Dependent | 1:N | Un empleado puede tener varios dependientes |
| Employee → WORKS_ON | 1:N | Un empleado participa en varios proyectos |
| Projects → WORKS_ON | 1:N | Un proyecto puede tener varios empleados |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Employee | IdDependent | Dependent (IdDependent) |
| Department | manager | Employee (SSn) |
| Locations | NumberDep | Department (Number) |
| Projects | NameDep | Department (Name) |
| WORKS_ON | SSn | Employee (SSn) |
| WORKS_ON | NumberProj | Projects (Number) |
| Dependent | SSn | Employee (SSn) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| 01 | No se puede asignar un gerente inexistente |
| 02 | No se puede registrar un dependiente para un empleado inexistente |
| 03 | No se puede asignar horas a proyectos inexistentes |
| 04 | No se puede registrar una ubicación para departamentos inexistentes |

---

## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| 01 | Un departamento tiene un único gerente |
| 02 | Un empleado puede participar en varios proyectos |
| 03 | Un empleado puede registrar varios dependientes |
| 04 | Un proyecto pertenece únicamente a un departamento |

---

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej6](/ima/Eje5.6.png)

## 1. Información General universidad

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Administración Universitaria |
| Descripción | Base de datos para administrar alumnos, profesores, materias, departamentos, proyectos y credenciales |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Juan Raúl Rangel Contreras |
| SGBD | SQL Server |

---

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Alumnos
- Profesores
- Materias
- Departamentos
- Credenciales
- Teléfonos de alumnos
- Dependientes de profesores
- Proyectos de investigación
- Inscripción de alumnos a materias
- Participación de profesores en proyectos

Permite controlar la información académica y administrativa de una institución educativa.

---

## 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| CK | Check |
| DF | Default |

---

# 4. Diccionario de Datos

## Tabla: Alumno

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 10 | PK, NN | Identificador único del alumno |
| Nombre | VARCHAR | 50 | NN | Nombre del alumno |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido |
| Correo | VARCHAR | 100 | NN | Correo electrónico |
| FechaNaci | DATE | - | NN | Fecha de nacimiento |

---

## Tabla: Telefono

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ClaveTel | INT | - | PK, NN | Identificador del teléfono |
| Matricula | VARCHAR | 10 | PK, FK, NN | Alumno propietario |
| Telefono | VARCHAR | 15 | NN | Número telefónico |


---

## Tabla: Credencial

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumeroCredencial | VARCHAR | 20 | PK, NN | Número de credencial |
| FechaExp | DATE | - | NN | Fecha de expedición |
| Vigencia | DATE | - | NN | Fecha de vencimiento |
| Matricula | VARCHAR | 10 | FK, UQ, NN | Alumno propietario |

---

## Tabla: Profesor

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProf | INT | - | PK, NN | Número del profesor |
| Nombre | VARCHAR | 50 | NN | Nombre |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido |
| NumDep | INT | - | FK, NN | Departamento al que pertenece |

---

## Tabla: Departamento

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumDep | INT | - | PK, NN | Identificador del departamento |
| NombreDep | VARCHAR | 80 | NN | Nombre del departamento |
| Edificio | VARCHAR | 50 | NN | Edificio donde se encuentra |

---

## Tabla: Materia

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ClaveMateria | VARCHAR | 10 | PK, NN | Clave de la materia |
| NombreMat | VARCHAR | 80 | NN | Nombre de la materia |
| Creditos | INT | - | NN | Número de créditos |
| NumProf | INT | - | FK, NN | Profesor que imparte la materia |

---

## Tabla: Cursa

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 10 | PK, FK, NN | Alumno inscrito |
| ClaveMat | VARCHAR | 10 | PK, FK, NN | Materia inscrita |
| FechaInscrip | DATE | - | NN | Fecha de inscripción |
| Calif | DECIMAL | 4,2 | - | Calificación obtenida |

---

## Tabla: Dependiente

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NombreDep | VARCHAR | 80 | PK, NN | Nombre del dependiente |
| NumProf | INT | - | PK, FK, NN | Profesor asociado |
| FechaNaci | DATE | - | NN | Fecha de nacimiento |
| Parentesco | VARCHAR | 30 | NN | Relación familiar |


---

## Tabla: Proyecto

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProy | INT | - | PK, NN | Identificador del proyecto |
| Nombre | VARCHAR | 100 | NN | Nombre del proyecto |
| Presupuesto | DECIMAL | 12,2 | NN | Presupuesto asignado |

---

## Tabla: Participa

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProf | INT | - | PK, FK, NN | Profesor participante |
| NumProy | INT | - | PK, FK, NN | Proyecto asignado |
| Rol | VARCHAR | 50 | NN | Rol desempeñado en el proyecto |

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno → Teléfono | 1:N | Un alumno puede registrar varios teléfonos |
| Alumno → Credencial | 1:1 | Cada alumno posee una única credencial |
| Alumno → Cursa | 1:N | Un alumno puede cursar varias materias |
| Materia → Cursa | 1:N | Una materia puede ser cursada por varios alumnos |
| Profesor → Materia | 1:N | Un profesor puede impartir varias materias |
| Departamento → Profesor | 1:N | Un departamento tiene varios profesores |
| Profesor → Dependiente | 1:N | Un profesor puede registrar varios dependientes |
| Profesor → Participa | 1:N | Un profesor puede participar en varios proyectos |
| Proyecto → Participa | 1:N | Un proyecto puede tener varios profesores |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Telefono | Matricula | Alumno (Matricula) |
| Credencial | Matricula | Alumno (Matricula) |
| Materia | NumProf | Profesor (NumProf) |
| Profesor | NumDep | Departamento (NumDep) |
| Cursa | Matricula | Alumno (Matricula) |
| Cursa | ClaveMat | Materia (ClaveMateria) |
| Dependiente | NumProf | Profesor (NumProf) |
| Participa | NumProf | Profesor (NumProf) |
| Participa | NumProy | Proyecto (NumProy) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| 01 | No puede registrarse un teléfono para un alumno inexistente. |
| 02 | No puede existir una credencial sin un alumno asociado. |
| 03 | No puede asignarse una materia a un profesor inexistente. |
| 04 | No puede registrarse un profesor en un departamento inexistente. |
| 05 | No puede inscribirse un alumno en una materia inexistente. |
| 06 | No puede registrarse un dependiente para un profesor inexistente. |
| 07 | No puede registrarse la participación de un profesor en un proyecto inexistente. |

---

## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| 01 | Cada alumno posee una única credencial institucional. |
| 02 | Un alumno puede registrar varios números telefónicos. |
| 03 | Un alumno puede inscribirse en varias materias. |
| 04 | Cada materia es impartida por un solo profesor. |
| 05 | Un profesor pertenece únicamente a un departamento. |
| 06 | Un profesor puede participar en varios proyectos de investigación. |
| 07 | Un proyecto puede contar con varios profesores participantes. |
| 08 | Un profesor puede registrar varios dependientes. |

---

## 9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej7](/ima/Eje0.7.png)

