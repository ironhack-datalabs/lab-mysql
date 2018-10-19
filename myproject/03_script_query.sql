
--
-- SELECTS
--

-- Reviews del usuario 1
SELECT * FROM mydb.Reviews WHERE Users_id = 1;

-- title y text de Reviews cuya calificación (stars) sea igual a 2 en una tabla con Titulo y Texto como encabezamiento
SELECT title AS Titulo, text AS Texto FROM mydb.Reviews WHERE stars = 2;

-- productos cuyo departamento (sección) empiece por  la cadena 'thin'
SELECT * FROM mydb.Products WHERE mydb.Products.department LIKE 'thin%';


-- JOINS

-- Reviews escritas por los usuarios llamados alberto
SELECT * FROM mydb.Reviews LEFT JOIN mydb.Users ON mydb.Reviews.Users_id = Users.id WHERE Users.name = 'alberto';

-- Reviews escritas por los usuarios que empiecen por 'a'
SELECT * FROM mydb.Reviews LEFT JOIN mydb.Users ON mydb.Reviews.Users_id = Users.id WHERE Users.name LIKE 'a%';

-- nombres de usuario y estrellas de los reviews con más de 1 estrella cuyo nombre empiece por 'alberto'. Cambiando la cabecera de la tabla de salida por 'nombre de usuario' y 'estrellas'
SELECT mydb.Users.name AS 'nombre de usuario', mydb.Reviews.stars AS 'estrellas'
FROM mydb.Reviews INNER JOIN mydb.Users ON mydb.Users.id = mydb.Reviews.Users_id 
WHERE mydb.Users.name LIKE 'alberto%' AND mydb.Reviews.stars > 1;

--
-- TABLA TEMPORAL
--
-- temporal: usuarios cuyo email contenga la cadena 'gmai'
CREATE TEMPORARY TABLE mydb.usuarios_gmai 
SELECT * FROM mydb.Users WHERE email LIKE '%@gmai%';

-- Utilizamos la tabla temporal para obtener las reviews de dichos usuarios que tienen un trust rate mayor que 0.4
SELECT * FROM mydb.usuarios_gmai LEFT JOIN mydb.Reviews ON mydb.usuarios_gmai.id = mydb.Reviews.Users_id WHERE mydb.usuarios_gmai.trust_rate > 0.4;

-- Utilizamos la tabla temporal para obtener las reviews de dichos usuarios que tienen una valoración mayor de 2 estrellas
SELECT * FROM mydb.usuarios_gmai LEFT JOIN mydb.Reviews ON mydb.usuarios_gmai.id = mydb.Reviews.Users_id WHERE mydb.Reviews.stars > 2;






