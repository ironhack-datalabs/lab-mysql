# Caso Amazon v2
**Autor**: garcia.cobo.alberto@gmail.com
**tags**: Workbench, SQL, git, github, EER, Amazon, query
**archivos**: 

### Selección de la base de datos

Tenemos 2 opciones, extraerla de una web o usar nuestro propio proyecto anterior. En ambos casos he encontrado problemas pero me decanto por solucionar las incongruencias de mi propio proyecto y crear **scripts de creación de database, insertar datos y ejecutar querys.** 

### Fallo a la hora de extraer un BD de la web sugerida
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

### Fallo el ejecutar el script de iter3.sql
Al ejecutar el scrip de la iteración 3 y 4 del ejercicio de ayer obtenemos este error. 
```
15:28:24	CREATE TABLE IF NOT EXISTS `mydb`.`ProductOwners_sells_Products` (   `id` INT NOT NULL,   `Products_id` INT NOT NULL,   `ProductOwners_id` INT NOT NULL,   PRIMARY KEY (`id`),   INDEX `fk_ProductOwners_has_Products_Products1_idx` (`Products_id` ASC) VISIBLE,   INDEX `fk_ProductOwners_has_Products_ProductOwners1_idx` (`ProductOwners_id` ASC) VISIBLE,   CONSTRAINT `fk_ProductOwners_has_Products_ProductOwners1`     FOREIGN KEY (`ProductOwners_id` , `Products_id`)     REFERENCES `mydb`.`ProductOwners` (`id` , `id`)     ON DELETE RESTRICT     ON UPDATE RESTRICT,   CONSTRAINT `fk_ProductOwners_has_Products_Products1`     FOREIGN KEY (`Products_id`)     REFERENCES `mydb`.`Products` (`id`)) ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4	Error Code: 1822. Failed to add the foreign key constraint. Missing index for constraint 'fk_ProductOwners_has_Products_ProductOwners1' in the referenced table 'ProductOwners'	0,00088 sec

```
### Solución
Tras buscar en Stackoverflow y no encontrar una solución, sólo una intuición de como se declaran las Foreigh Key editamos el script ORDEN A ORDEN y vemos esto en una de las tablas. 
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

Se soluciona quitando parámetros redundantes **que marco en negrita** que hay sido generados automáticamente por Workbench y nos crea este fallo. 

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

### Insertando datos
Para generar datos usamos el import/export wizard seleccionando la opción con el botón derecho del ratón sobre la tabla. Exportamos la tabla vacia en un CSV y lo editamos añadiendole datos coheretes, posteriormente importamos. 

Hay que tener cuidado en el orden de insertar CSVs ya que no si hace referencia un una foreign key que todavía no existe dará error

Orden usado
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






