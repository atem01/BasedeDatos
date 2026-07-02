# Diccionario de Datos de BD contro, escolar 

1. Informacion General

| Elementos | Valor |
| :--- | :--- |
| Proyecto  | Sistema de control Escolar |
| Version | 1.0|
| Fecha | Juno 2026 |
| Elabora | Juan Raul Rangel Contreras |
| SGBD | SQLServer|

2. Describe del Sistema de BD

El sistema administra 

- Carrera
- Alumnos
- Profesores
- Materias
- Grupos
- Incripciones

Permite controlar la oferta educativa y la inscripcion de los estudiantes 

3. catalogo de Restricciones utilizadas

| Codigo | significa |
| :--- | :--- |
| PK  | primary key |
| FK | Foreign key |
| NN | Not Null |
| UN | Unique |
| AI | Auto Increment |
| CK | Check |
| FK | Foreign key |
| DF | Default |

4. Diccionario de Datos

**Tabla:** Carrera

**Descripcion:** __Almacena las Carreras ofertadas por la Universidad__

| Campo | Tipo | Longitud | Restriccion | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| ID_Carrera | INT | - | PK, AI, NN | Identificador unico de la carrera |
| Nombre | Varchar | 100 | UQ, NN | Nombre de la carrera |
| Duracion_Cuatrimestre | INT | - | NN, CH(>0) | Duracion de Cuatrimestre |
| Nombre | Varchar | 100 | UQ, NN | Nombre de la carrera |

---

**Tabla:** Alumno

**Descripcion:** __Almacena las Informacion de los Estudiantes__

| Campo | Tipo | Longitud | Restriccion | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| ID_Alumno | INT | - | PK, AI, NN | Identificador unico de la carrera |
| Matricula | Varchar | 10 | UQ, NN | Matricula Instutucional |
| Nombre | Varchar | 50 | NN | Nombre de la Estudiante |
| Apellido_Paterno | Varchar | 50 | NN | Apellido Paterno|
| Apellido_Materno | Varchar | 50 | Null | Apellido Materno|
| Correo | Varchar | 100 | UQ, NN | Correo institucional |
| Fecha_Naci | Date | - | NN | Fecha de nacimiento|
| ID_Carrera | INT | - | FK, NN | Carrera a la que Pertenece|

---

5. Relaciones del Sistema

| Relacion | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Carrea -> Alumno | 1:N | Una carrera tiene muchos alumnos    |
| Carrera -> Materia | 1:N | Una Carreta tiene muchas materias    |
| Profesor -> Grupo | 1:N | Un Profesro puede Impartir varios Grupos |
| Alumno -> Incripcion | 1:N | Un alumno puede tener varias incripciones |
| Materia -> Grupo| 1:N | Una materia puede tener varias inscripciones |
| Grupo -> Incripcion | 1:N | Un grupo puede tener muchas alumnos |

6. Matriz de Claves Foraneas

| Tabla | Campo FK | Descripción |
|:----------|:---------:|----------:|
| Alumno | ID_Carrera| Carrea (ID_Carrera) |
| Materia |  ID_Carrera | Carrea (ID_Carrera) |
| Grupo | ID_Profesor | Profesro (ID_profesor) |
| Grupo |  ID_Materia | Materia (ID_Mateia) |
| Incripcion |  ID_Alumno | Carrea (ID_alumno) |
| Incripcion |  ID_grupo | Carrea (ID_Grupo) |

7. Integridad Referencial

| Regla | Descripcion |
| :--- | :--- |
| IR-01  | No puede registrar un alumno con una carrera inexistente |
| IR-02  | No puede crear un grupo para una materia inexistente |
| IR-03  | No se puede crear u  grupo para un profesor inexistente |

8. Regla del Negocio

| Codigo | Regla |
| :--- | :--- |
| RN-01  | Un alumno pertenece solo a una sola carrera |
| RN-02  | Una carrera puede tener alumnos |
| RN-03  | Una carrera puede tener muchas materias |

9. Diagrama Relacional

![Eje 1](/Imagen/ER/Ejercicio3-R%20-%20Página%201.png)