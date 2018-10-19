Pasos que segui: 

1) Me descargue una base de datos de la misma pagina oficial de MYSQL que tienen una base de datos de ejemplo llamada WORLD
2) Agrego 2 tablas nuevas llamadas "Economy" y "Population", esto para cumplir con el requisito de que sean al menos 5 tablas.
 
La tabla Economy la creo con el siguiente script: 

	CREATE TABLE `world`.`Economy` (
  	`econ_code` VARCHAR(45) NOT NULL,
  	`inflation_rate` VARCHAR(45) NULL,
  	`unemployment_rate` VARCHAR(45) NULL,
  	`exports` VARCHAR(45) NULL,
  	`imports` VARCHAR(45) NULL,
  	PRIMARY KEY (`econ_code`));

La tabla Population la creo con el siguiente script: 

	CREATE TABLE `world`.`Population` (
  	`pop_code` INT NOT NULL,
  	`fertility_rate` VARCHAR(45) NULL,
  	`life_expectancy` VARCHAR(45) NULL,
  	`size` VARCHAR(45) NULL,
  	PRIMARY KEY (`pop_code`));

3) Creo los diagramas haciendo el Reverse Engineer y creo las relaciones de las nuevas dos tablas con la de Country, ambas son one to one. 

4) Queria hacer un Forward Enginer del nuevo diagrama, pero cuando lo hago y corro el script no me aparecen las tablas, asi que opto por a\'f1adir manualmente los atributos que necesito en las tablas originales.

5) Creo en las tablas de Economy y en Population un nuevo atributo de country_code para poder enlazarlas con country al momento de hacer busquedas. 

Para ello: 

	ALTER TABLE `world`.`Economy` 
	ADD COLUMN `country_code` VARCHAR(45) NULL AFTER `imports`;

	ALTER TABLE `world`.`Population` 
	ADD COLUMN `country_code` VARCHAR(45) NULL AFTER `size`,

6) Relleno la tabla por Workbench, que seria equivalente a hacerlo a traves de la terminal siguiendo el codigo:
	INSERT INTO `world`.`NOMBRE TABLA` (`nombre columna`) VALUES ('valo')
	Ejemplo: INSERT INTO `world`.`Economy` (`econ_code`) VALUES ('AFG');


7) Hago los querys solicitados:

7.1)97 Mostrar el nombre de las 10 ciudades donde hay mayor esperanza de vida registrada- 

SELECT world.city.Name, world.country.LifeExpectancy
FROM world.city
INNER JOIN world.country
ON world.city.CountryCode = world.country.Code
ORDER BY world.country.LifeExpectancy DESC
LIMIT 10 

7.2)  -- Mostrar el nombre de las ciudades que se hablan ingles y cuya poblacion del pais es mayor a 50 millones de habitantes --

SELECT city.Name
FROM city
INNER JOIN (
	SELECT country.name, country.population,country.Code
	FROM country
	INNER JOIN countrylanguage
	ON country.Code=countrylanguage.CountryCode
	WHERE countrylanguage.Language ='English'
	AND country.population > 50000000) as summary
ON city.CountryCode=summary.code


7.3)  -- Muestra el lenguaje que se habla en cada pais, se debe mostrar el pais aunque no tenga un lenguaje asignado --\
SELECT  country.Name, Language
FROM country
LEFT JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode

7.4)97 -- Cuales son los 5 paises en que mayores lenguajes se hablan?, que cantidad de lenguajes son? -- \

 SELECT language, count(language)
 FROM country
 INNER JOIN countrylanguage
 ON country.Code = countrylanguage.countrycode
 GROUP BY language
 ORDER BY count(language) DESC
 LIMIT 5
