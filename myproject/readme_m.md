# MySQL Project

## Paso 1
En Workbench en mi servidor local <br>
* 1. Create a new schema <br>
* 2. Name - University

## Paso 2
En la terminal, en la carpeta donde quiero que este mi archivo .sql conectarse a un servidor remoto y descargar la base de datos "University" <br>
$ mysqldump --column-statistics=0 -u guest -p -h relational.fit.cvut.cz University > University.sql<br>

Incluimos "column statistics=0" porque nos daba error al importar desde workbench. (error solucionado por Belen y Ivan). <br>

Ahora tenemos nuestra base de datos en local. <br>

## Paso 3
Incluir nuestro archivo descargado "University" en nuestra carpeta de trabajo a nuestro esquema creado en **Paso 1* en workbench. <br>
* File - Run SQL Scrip <br>
**Enlazar con nuestra base de datos University en ajustes* <br>

## Paso 4
Generar el diagrama de nuestro SQL Scrip <br>
* 1. Database <br>
* 2. Reversee Engineer <br>
* 3. Next... <br>
* 4. Select "University" **archivo .sql en nuestra carpeta de trabajo* <br>

## Paso 5
* 1. Screen shot de nuestro diagrama <br>
* 2. GUARDAR en nuestra carpeta de trabajo <br>

## Paso 6
Entender nuestra database: entidades, iteraciones, atributos, etc. <br>

5 tablas: 3 tablas con key primary (Cursos, Profesores y Estudiantes) y 2 tablas creadas a partir de relaciones:
* 1. **Registro** relación de dos tablas cursos y estudiantes 2 keys foráneas Curso_id y Estudiante_id <br>
* 2. **RA** relación de dos tablas, estudiantes y profesores. 2 Keys foráneas estudiantes_id y profesor_id <br>


## Paso 7
Una vez entendida todas las relaciones de nuestra DataBase, incluir algunos datos en la tabla. Elegimos la tabla cursos para incluir más cursos. <br>
* 1. SELECT * FROM University.course; <br>
* 2. Conocer los tipos de datos que hay en cada atributo de la tabla. En workbench "Field Types": course_id (INT), rating (VARCHAR) y diff (VARCHAR). <br>
* 3. Añadir 5 cursos más: <br>

INSERT INTO University.course
(`course_id`, `rating`, `diff`)
VALUES 
('12', '3', '5'),
('13', '4', '6'),
('14', '2', '4'),
('15', '1', '3'),
('16', '2', '1'),
('17', '1', '2');

Problema, no he leido/entendido el error que me ha salido cuando he ejecutado por segunda vez el comando. Avisaba de que la primary key estaba duplicada entonces la he cambiado y he añadido cinco cursos más cambiando la primary key. <br>

INSERT INTO University.course
(`course_id`, `rating`, `diff`)
VALUES 
('123', '3', '5'),
('456', '4', '6'),
('789', '2', '4'),
('165', '1', '3'),
('180', '2', '1'),
('198', '1', '2'); <br>

En total he añadido 10 cursos. <br>

## Paso 8 
Para poder conocer el salario medio de los profesores, tengo que hacer un inner join entre las tablas RA y prof. <br>

SELECT *
FROM prof
INNER JOIN RA
ON prof.prof_id = RA.prof_id; <br>

He seleccionado todo desde RA para poder conocer la relación entre la popularidad y capacidad de enseñanza y el salario medio de los profesores. <br>

## Paso 9 
Para poder conocer la capacidad de enseñanza de los profesores realizamos un INNER JOIN. <br>

SELECT prof.prof_id, prof.popularity, RA.capability
FROM prof
INNER JOIN RA
on prof.prof_id = RA.prof_id; <br>

## Paso 10
Queremos conocer el grado de satisfacción de los estudiantes y su inteligencia. Para ello creamos una tabla temporal que contengan los datos de Student y Registration. Y queremos que la tabla ordene los datos según la satisfacción y en orden descendente (primero los de mayor satisfacción)

CREATE TEMPORARY TABLE University.intelligence_3
SELECT student.student_id, student.intelligence, registration.sat
FROM University.student 
INNER JOIN University.registration
ON student.student_id = registration.student_id
ORDER BY registration.sat DESC;

## Paso 11
Comprobamos que nuestra tabla temporal se ha creado con los datos correctos. <br>

select *
from University.intelligence_3;


## Paso 12 
Conocer el número de profesores que tienen una popularidad mayor o igual que 2. <br>
Nos damos cuenta que tenemos un numero pequeño de profesores y antes insertamos más profesores con un INSERT INTO. 

INSERT INTO University.prof
(`prof_id`, `popularity`, `teachingability`)
VALUES
('10', '1', '3'),
('11', '3', '2'),
('12', '2', '1'),
('13', '3', '1'), 
('14', '3', '2'), 
('15', '2', '2'), 
('16', '3', '1');
<br>

Comprobamos que se han isertado los nuevos datos. <br>
SELECT *
FROM prof;
<br>

Para conocer los valores que existen en el atributo popularidad. <br>
SELECT popularity
FROM prof
GROUP BY popularity;
<br>

Número de profesores que tienen una popularidad mayor o igual que 2. <br>

SELECT COUNT(prof_id), popularity
FROM prof
WHERE POPULARITY >=2
GROUP BY popularity
ORDER BY COUNT(prof_id) DESC;

