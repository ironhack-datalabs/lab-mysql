-- APPEND QUERIES
-- This is the first example of append query where the values of the parameters have been called
INSERT INTO actors 
(`id`, `first_name`, `last_name`, `gender`)
VALUES
('930000','Jose','Coronado','M'),
('920001', 'Penelope', 'Cruz', 'F');


-- This is the second example of append query where the attributes are not called directly but in second plane"
INSERT INTO actors
VALUES
('920002','Maribel','Verdu','F'),
('920003','Javier','Bardem','M');


-- This is the third example of append query where the attributes are called in a different order
INSERT INTO actors 
(`gender`, `last_name`,`first_name` ,`id`)
VALUES
('M', 'Sacristan', 'Jose', '920004')


--UPDATE QUERIES
-- This is another type of update query que convierte el valor
UPDATE actors SET first_name = 'Manuel' WHERE actors.id='930000'



-- DELETE QUERY
-- The following code will delete the latest register that was created in the actors table
DELETE FROM actors WHERE id='920004';



-- MAKE TABLE QUERY
-- The following clause will create a permanent table showing the 10 movies with higher rank from 1997
CREATE TABLE TOP10Year1997
SELECT movies.id, movies.name, movies.rank
FROM movies
WHERE movies.year=1997
order by movies.rank desc
LIMIT 10;

-- For checking results:
SELECT * FROM TOP10Year1997



-- JOINS
-- The following is an inner join between movies and movies_genres that will show the count of movies with rank higher than 6 when grouped by rank
SELECT count(movies.id), movies.rank FROM movies
INNER JOIN movies_genres 
ON movies_genres.movie_id=movies.id 
WHERE movies.rank >6
GROUP BY movies.rank;

-- The following left join lists the actors that have perform the role narrator and that exist in the table actors
SELECT actors.first_name, actors.last_name, roles.role FROM actors
LEFT JOIN roles
ON actors.id=roles.actor_id
WHERE roles.role='narrator'

-- The example below is exactly the same as in the example above but using a right join meaning that it will list all register from the table roles.
SELECT actors.first_name, actors.last_name, roles.role FROM actors
RIGHT JOIN roles
ON actors.id=roles.actor_id
WHERE roles.role='narrator'



-- SUBQUERY
-- The below will return the a table counting the amount of actors with the same last name that were listed in the nested right join
FROM 
(SELECT actors.first_name, actors.last_name, roles.role FROM actors
RIGHT JOIN roles
ON actors.id=roles.actor_id
WHERE roles.role='narrator') summary
GROUP BY last_name



-- TEMPORARY TABLE
-- The below creates a temporary table (that will be deleted once the session is closed) that will show total numbers of actors by gender
CREATE TEMPORARY TABLE totalActorsPerGender 
SELECT count(actors.id), actors.gender
FROM actors
GROUP BY actors.gender;

select * from totalActorsPerGender



-- UNION
-- The below will return a list where the first registers will show the name and last name of all directors whose last name is "Abajo".
-- Once all are listed, it will start showing movies that were released in 2000
SELECT directors.first_name, directors.last_name FROM directors
LEFT JOIN movies_directors 
ON directors.id=movies_directors.director_id
WHERE directors.last_name = 'Abajo'
UNION
SELECT movies.name, movies.year FROM movies
LEFT JOIN movies_directors
ON movies.id=movies_directors.movie_id
WHERE movies.year=2000