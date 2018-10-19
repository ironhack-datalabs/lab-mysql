-- Mostrar el nombre de las 10 ciudades donde hay mayor esperanza de vida registrada- 

SELECT world.city.Name, world.country.LifeExpectancy
FROM world.city
INNER JOIN world.country
ON world.city.CountryCode = world.country.Code
ORDER BY world.country.LifeExpectancy DESC
LIMIT 10 ;

-- Mostrar el nombre de las ciudades que se hablan ingles y cuya poblacion del pais es mayor a 50 millones de habitantes --

SELECT city.Name
FROM city
INNER JOIN (
	SELECT country.name, country.population,country.Code
	FROM country
	INNER JOIN countrylanguage
	ON country.Code=countrylanguage.CountryCode
	WHERE countrylanguage.Language = "English"
	AND country.population > 50000000) as summary
    
ON city.CountryCode=summary.code

 -- Muestra el lenguaje que se habla en cada pais, se debe mostrar el pais aunque no tenga un lenguaje asignado --
SELECT  country.Name, Language
FROM country
LEFT JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode

-- Cuales son los 5 paises en que mayores lenguajes se hablan?, que cantidad de lenguajes son? -- 

 SELECT language, count(language)
 FROM country
 INNER JOIN countrylanguage
 ON country.Code = countrylanguage.countrycode
 GROUP BY language
 ORDER BY count(language) DESC
 LIMIT 5


