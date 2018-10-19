# Caso Amazon v2
**Autor**: garcia.cobo.alberto@gmail.com

**tags**: Workbench, SQL, git, github, EER, Amazon, query

**archivos**: Abrir en orden según su número para que se creen la BD, se inserten datos y luego se ejecuten las query: 
1. 01_script_create.sql
2. 02_script_insert_datos.sql
3. 03_script_query.sql
4. diagrama.png 
5. README.md


### Selección de la base de datos

Tenemos 2 opciones, extraerla de una web o usar nuestro propio proyecto anterior. En ambos casos he encontrado problemas pero me decanto por solucionar las incongruencias de mi propio proyecto y trabajar con **scripts de creación de database, insertar datos y ejecutar querys.** 

### Fallo a la hora de extraer un BD de la web sugerida
Obtenemos el siguiente fallo al importar de la web sugerida una base de datos seleccionada
```
14:44:12 Dumping Accidents (upravna_enota)
Running: /usr/lib/mysql-workbench/mysqldump --defaults-file="/tmp/tmpfVz7Ll/extraparams.cnf"  --user=guest --host=relational.fit.cvut.cz --protocol=tcp --port=3306 --default-character-set=utf8 --skip-triggers "Accidents" "upravna_enota"
mysqldump: Couldn't execute 'SELECT COLUMN_NAME,                       JSON_EXTRACT(HISTOGRAM, '$."number-of-buckets-specified"')                FROM information_schema.COLUMN_STATISTICS                WHERE SCHEMA_NAME = 'Accidents' AND TABLE_NAME = 'upravna_enota';': Unknown table 'COLUMN_STATISTICS' in information_schema (1109)

Operation failed with exitcode 2
14:44:13 Dumping Accidents (oseba)
Running: /usr/lib/mysql-workbench/mysqldump --defaults-file="/tmp/tmpZBQ9hS/extraparams.cnf"  --user=guest --host=relational.fit.cvut.cz --protocol=tcp --port=3306 --default-character-set=utf8 --skip-triggers "Accidents" "oseba"
mysqldump: Couldn't execute 'SELECT COLUMN_NAME,                       JSON_EXTRACT(HISTOGRAM, '$."number-of-buckets-specified"')                FROM information_schema.COLUMN_STATISTICS                WHERE SCHEMA_NAME = 'Accidents' AND TABLE_NAME = 'oseba';': Unknown table 'COLUMN_STATISTICS' in information_schema (1109)

Operation failed with exitcode 2
14:44:46 Dumping Accidents (nesreca)
Running: /usr/lib/mysql-workbench/mysqldump --defaults-file="/tmp/tmpjdDjKA/extraparams.cnf"  --user=guest --host=relational.fit.cvut.cz --protocol=tcp --port=3306 --default-character-set=utf8 --skip-triggers "Accidents" "nesreca"
mysqldump: Couldn't execute 'SELECT COLUMN_NAME,                       JSON_EXTRACT(HISTOGRAM, '$."number-of-buckets-specified"')                FROM information_schema.COLUMN_STATISTICS                WHERE SCHEMA_NAME = 'Accidents' AND TABLE_NAME = 'nesreca';': Unknown table 'COLUMN_STATISTICS' in information_schema (1109)

Operation failed with exitcode 2
14:45:29 Dumping Accidents views and/or routines and/or events
Running: /usr/lib/mysql-workbench/mysqldump --defaults-file="/tmp/tmpD4bGqb/extraparams.cnf"  --user=guest --host=relational.fit.cvut.cz --protocol=tcp --port=3306 --default-character-set=utf8 --skip-triggers  --no-data  --no-create-db --no-create-info --routines "Accidents"
mysqldump: Couldn't execute 'SELECT COLUMN_NAME,                       JSON_EXTRACT(HISTOGRAM, '$."number-of-buckets-specified"')                FROM information_schema.COLUMN_STATISTICS                WHERE SCHEMA_NAME = 'Accidents' AND TABLE_NAME = 'nesreca';': Unknown table 'COLUMN_STATISTICS' in information_schema (1109)

Operation failed with exitcode 2
14:45:31 Export of /home/alberto/dumps/Dump20181018 (2) has finished with 4 errors
```
Los compañeros han encontrado la forma de solucionarlo así que os remito a sus repositorios para solucionarlo
### Fallo el ejecutar el script de iter3.sql
Al ejecutar el scrip de la iteración 3 y 4 del resultante del ejercicio de ayer obtenemos este error. El script fue generado automáticamente por Workbench tras un **forward engenier** así que supongo que mi diagrama relacional no era tan bueno como yo pensaba. 
```
15:28:24	CREATE TABLE IF NOT EXISTS `mydb`.`ProductOwners_sells_Products` (   `id` INT NOT NULL,   `Products_id` INT NOT NULL,   `ProductOwners_id` INT NOT NULL,   PRIMARY KEY (`id`),   INDEX `fk_ProductOwners_has_Products_Products1_idx` (`Products_id` ASC) VISIBLE,   INDEX `fk_ProductOwners_has_Products_ProductOwners1_idx` (`ProductOwners_id` ASC) VISIBLE,   CONSTRAINT `fk_ProductOwners_has_Products_ProductOwners1`     FOREIGN KEY (`ProductOwners_id` , `Products_id`)     REFERENCES `mydb`.`ProductOwners` (`id` , `id`)     ON DELETE RESTRICT     ON UPDATE RESTRICT,   CONSTRAINT `fk_ProductOwners_has_Products_Products1`     FOREIGN KEY (`Products_id`)     REFERENCES `mydb`.`Products` (`id`)) ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4	Error Code: 1822. Failed to add the foreign key constraint. Missing index for constraint 'fk_ProductOwners_has_Products_ProductOwners1' in the referenced table 'ProductOwners'	0,00088 sec

```
### Solución
Tras buscar en Stackoverflow y no encontrar una solución, sólo una intuición de como se declaran las Foreign Key editamos el script LINEA A LINEA para localizar el fallo y vemos esta estructura en muchas de las tablas. 
```
-- -----------------------------------------------------
-- Table `mydb`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reviews` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `text` VARCHAR(1000) NULL DEFAULT NULL,
  `date` VARCHAR(45) NULL DEFAULT NULL,
  `stars` INT NULL DEFAULT NULL,
  `Users_id` INT NOT NULL,
  `Products_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Reviews_Users1_idx` (`Users_id` ASC) VISIBLE,
  INDEX `fk_Reviews_Products1_idx` (`Products_id` ASC, `Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Products1`
    FOREIGN KEY (`Products_id` , `Users_id`)
    REFERENCES `mydb`.`Products` (`id` , `id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Reviews_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `mydb`.`Users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
```

Se soluciona quitando parámetros redundantes **que marco en negrita** que hay sido generados automáticamente por Workbench y nos genera el fallo. 

```
-- -----------------------------------------------------
-- Table `mydb`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reviews` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `text` VARCHAR(1000) NULL DEFAULT NULL,
  `date` VARCHAR(45) NULL DEFAULT NULL,
  `stars` INT NULL DEFAULT NULL,
  `Users_id` INT NOT NULL,
  `Products_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Reviews_Users1_idx` (`Users_id` ASC) VISIBLE,
  INDEX `fk_Reviews_Products1_idx` (`Products_id` ASC**, `Users_id` ASC**) VISIBLE,
  CONSTRAINT `fk_Reviews_Products1`
    FOREIGN KEY (`Products_id` **, `Users_id`**)
    REFERENCES `mydb`.`Products` (`id` **, `id`**)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Reviews_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `mydb`.`Users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
```
### Use database
Recordar que hay que incluir en los script la siguiente sentencia para que seleccione la base de datos correcta. En mi caso está incluido en el primer archivo (01_script_create.sql)
```
USE `mydb` ;
```

### Insertando datos
Para generar datos usamos el import/export wizard seleccionando la opción con el botón derecho del ratón sobre la tabla. Exportamos la tabla vacia en un CSV y lo editamos añadiendole datos coheretes, posteriormente importamos. 

**Hay que tener cuidado en el orden de insertar CSVs ya que no si hace referencia un una foreign key que todavía no existe dará error**

Orden usado: 
1. Countries
2. DeliveryCompanies
3. ProductOwners
4. Products
5. Users
6. Users_buys_Products
7. Users_likes_Products
8. Shipments
9. Shipments_has_Products
10. Reviews
11. ProductOwners_sells_Products


Nos encontramos con una complicación que es el tipo de dato DATE en las fechas de algunos parámetros. Hay que investigar como insertarlos. Por ahora lo dejamos vacio ya que puede ser null. Dejamos esto para la siguiente mejora. 


Al ejecutar el script que carga los datos nos da un error: 
```
17:57:05	LOCK TABLES `Countries` WRITE	Error Code: 1046. No database selected Select the default DB to be used by double-clicking its name in the SCHEMAS list in the sidebar.	0,00015 sec
```
Hacemos caso y lo único que hay que hacer es doble clic en el schema 'mydb' y ejecutar el script. 

### Ejemplo de inserción de datos
Vamos a insertar el pais Sudáfrica con datos aceptables. 
```
INSERT INTO `Countries` VALUES (9,'Sudafrica','54','Sudafrica',5000000);
```
Esto nos sirve como ejemplo para cualquier tabla. 

### Creando querys
Las querys que he ejecutado son las siguientes: 

#### SELECTS

```
-- Reviews del usuario 1
SELECT * FROM mydb.Reviews WHERE Users_id = 1;

-- title y text de Reviews cuya calificación (stars) sea igual a 2 en una tabla con Titulo y Texto como 
-- encabezamiento
SELECT title AS Titulo, text AS Texto FROM mydb.Reviews WHERE stars = 2;

-- productos cuyo departamento (sección) empiece por  la cadena 'thin'
SELECT * FROM mydb.Products WHERE mydb.Products.department LIKE 'thin%';

-- Cálculo compuesto de una combinación de variables
SELECT 
mydb.Products.id, 
mydb.Products.name, 
mydb.Products.price AS p, 
mydb.Products.cuantity_available_for_sale AS n, 
mydb.Products.price/mydb.Products.cuantity_available_for_sale AS average
FROM mydb.Products;
```

#### JOINS
```
-- Reviews escritas por los usuarios llamados alberto
SELECT * FROM mydb.Reviews 
LEFT JOIN mydb.Users ON mydb.Reviews.Users_id = Users.id 
WHERE Users.name = 'alberto';

-- Reviews escritas por los usuarios que empiecen por 'a'
SELECT * FROM mydb.Reviews 
LEFT JOIN mydb.Users ON mydb.Reviews.Users_id = Users.id 
WHERE Users.name LIKE 'a%';

-- nombres de usuario y estrellas de los reviews con más de 1 estrella cuyo nombre empiece por 'alberto'. 
-- Cambiando la cabecera de la tabla de salida por 'nombre de usuario' y 'estrellas'
SELECT mydb.Users.name AS 'nombre de usuario', mydb.Reviews.stars AS 'estrellas'
FROM mydb.Reviews INNER JOIN mydb.Users ON mydb.Users.id = mydb.Reviews.Users_id 
WHERE mydb.Users.name LIKE 'alberto%' AND mydb.Reviews.stars > 1;
```

#### TABLA TEMPORAL
```
-- temporal: usuarios cuyo email contenga la cadena 'gmai'
CREATE TEMPORARY TABLE mydb.usuarios_gmai 
SELECT * FROM mydb.Users WHERE email LIKE '%@gmai%';

-- Utilizamos la tabla temporal para obtener las reviews de dichos usuarios que tienen un trust rate 
-- mayor que 0.4
SELECT * FROM mydb.usuarios_gmai 
LEFT JOIN mydb.Reviews ON mydb.usuarios_gmai.id = mydb.Reviews.Users_id 
WHERE mydb.usuarios_gmai.trust_rate > 0.4;

-- Utilizamos la tabla temporal para obtener las reviews de dichos usuarios que tienen una valoración 
-- mayor de 2 estrellas
SELECT * FROM mydb.usuarios_gmai 
LEFT JOIN mydb.Reviews ON mydb.usuarios_gmai.id = mydb.Reviews.Users_id 
WHERE mydb.Reviews.stars > 2;
```






