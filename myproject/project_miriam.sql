USE University;

-- Primero ver los cursos que tenemos
SELECT * FROM course;

-- Añadimos 5 cursos más.

INSERT INTO University.course
(`course_id`, `rating`, `diff`)
VALUES 
('12', '3', '5'),
('13', '4', '6'),
('14', '2', '4'),
('15', '1', '3'),
('16', '2', '1'),
('17', '1', '2');

# Problema, no he leido/entendido el error que me ha salido cuando he ejecutado por segunda vez 
#el comando. Avisaba de que la primary key estaba duplicada entonces la he cambiado y he añadido 
# cinco cursos más cambiando la primary key. 

INSERT INTO University.course
(`course_id`, `rating`, `diff`)
VALUES 
('123', '3', '5'),
('456', '4', '6'),
('789', '2', '4'),
('165', '1', '3'),
('180', '2', '1'),
('198', '1', '2');

-- Después me he dado cuenta de los primeros si estaban insertados. En total, 10 cursos he añadido. 

#Hacemos un INNER Join para conocer el nivel de salario de los profesores. 
SELECT *
FROM prof
INNER JOIN RA
ON prof.prof_id = RA.prof_id;


-- Creamos un INNER JOIN para conocer la capacidad de enseñanza de los profesores. 
SELECT prof.prof_id, prof.popularity, RA.capability
FROM prof
INNER JOIN RA
on prof.prof_id = RA.prof_id;

-- Queremos crear una tabla temporal para conocer el grado de satisfacción de los estudiantes y su inteligencia
CREATE TEMPORARY TABLE University.intelligence_3
SELECT student.student_id, student.intelligence, registration.sat
FROM University.student 
INNER JOIN University.registration
ON student.student_id = registration.student_id
ORDER BY registration.sat DESC;

-- Comprobamos 
select *
from University.intelligence_3;

-- Conocer el número de profesores que tienen una popularidad mayor o igual que 2. <br>
-- Nos damos cuenta que tenemos un numero pequeño de profesores y antes insertamos más profesores con un INSERT INTO. 
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

-- Comprobamos que se han isertado los nuevos datos. <br>
SELECT *
FROM prof;

-- Para conocer los valores que existen en el atributo popularidad. <br>
SELECT popularity
FROM prof
GROUP BY popularity;

-- Para conocer cuántos profesores tienen x rango de popularidad >= 2

SELECT COUNT(prof_id), popularity
FROM prof
WHERE POPULARITY >=2
GROUP BY popularity
ORDER BY COUNT(prof_id) DESC;

