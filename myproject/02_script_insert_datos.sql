-- MySQL dump 10.13  Distrib 8.0.12, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (1,'España','34','Madrid',50000000),(2,'Francia','35','Madrid',50000001),(3,'Alemania','36','Madrid',234235234),(4,'Porutugal','37','Madrid',50000003),(5,'USA','38','Madrid',3000002),(6,'Canada','39','Madrid',50000005),(7,'Italia','40','Madrid',23452345),(8,'Dinamarca','41','Madrid',50000007);
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `DeliveryCompanies`
--

LOCK TABLES `DeliveryCompanies` WRITE;
/*!40000 ALTER TABLE `DeliveryCompanies` DISABLE KEYS */;
INSERT INTO `DeliveryCompanies` VALUES (1,'seur','calle falsa',3465,'1',1),(2,'mrv','calle rara',2345,'3',3),(3,'gsm','Calle 123',567,'2',2),(4,'correos','avenida policaca',34565,'1',1);
/*!40000 ALTER TABLE `DeliveryCompanies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ProductOwners`
--

LOCK TABLES `ProductOwners` WRITE;
/*!40000 ALTER TABLE `ProductOwners` DISABLE KEYS */;
INSERT INTO `ProductOwners` VALUES (1,'El corte Ingles','dummy text ever si',2345,1,23452345,'1','542'),(2,'Virgin','asdfa',23452,1,23452345,'2','7654'),(3,'Fnac','asdfasfasdfas',2345,1,86578,'2','4322'),(4,'Respsol','asdfasfda',234,0,5678568,'1','2334'),(5,'Casa','asfdasfasfa',234,0,5685685,'3','542');
/*!40000 ALTER TABLE `ProductOwners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ProductOwners_sells_Products`
--

LOCK TABLES `ProductOwners_sells_Products` WRITE;
/*!40000 ALTER TABLE `ProductOwners_sells_Products` DISABLE KEYS */;
INSERT INTO `ProductOwners_sells_Products` VALUES (1,1,4),(2,2,3),(3,3,2),(4,4,1),(5,1,4),(6,2,3),(7,3,2),(8,4,1),(9,1,4),(10,2,3),(11,3,2),(12,4,1),(13,1,4),(14,2,3),(15,3,2),(16,4,1),(17,1,4),(18,2,3),(19,3,2),(20,4,1);
/*!40000 ALTER TABLE `ProductOwners_sells_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'Cosa 1',34,34,1,'fishing'),(2,'Cosa 2',4,3,1,'houses'),(3,'Cosa 3',234,234,1,'computers'),(4,'Cosa 4',545,4,1,'thin1'),(5,'Cosa 5',3,2,1,'thin2'),(6,'Cosa 6',3,24,3,'thin3'),(7,'Cosa 7',3,5,3,'thin4'),(8,'Cosa 8',5,5,3,'thin5'),(9,'Cosa 9',5,3,4,'thin6');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,'asdfad','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,1,1,3),(2,'asfdas','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,2,2,1),(3,'asdfad','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,2,3,2),(4,'gfdg','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,5,1,3),(5,'bgfbf','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,1,2,1),(6,'asdfad','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,2,3,2),(7,'asfdas','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,2,1,3),(8,'asdfad','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,5,2,1),(9,'gfdg','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,1,3,2),(10,'bgfbf','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,2,1,3),(11,'asdfad','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,2,2,1),(12,'asfdas','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,5,3,2),(13,'asdfad','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,1,1,3),(14,'gfdg','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,2,2,1),(15,'bgfbf','Lorem Ipsum is simply dummy text of the printing and typesetting industry',NULL,2,3,2);
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Shipments`
--

LOCK TABLES `Shipments` WRITE;
/*!40000 ALTER TABLE `Shipments` DISABLE KEYS */;
INSERT INTO `Shipments` VALUES (1,'ok',NULL,NULL,1,1),(2,'ok',NULL,NULL,2,2),(3,'ok',NULL,NULL,3,3),(4,'ended',NULL,NULL,1,1),(5,'ended',NULL,NULL,2,2),(6,'way',NULL,NULL,3,3),(7,'ok',NULL,NULL,1,1),(8,'ok',NULL,NULL,2,2),(9,'ok',NULL,NULL,3,3),(10,'ended',NULL,NULL,1,1),(11,'ended',NULL,NULL,2,2),(12,'way',NULL,NULL,3,3),(13,'ok',NULL,NULL,1,1),(14,'ok',NULL,NULL,2,2),(15,'ok',NULL,NULL,3,3),(16,'ok',NULL,NULL,1,1),(17,'ok',NULL,NULL,1,1),(18,'ok',NULL,NULL,2,2),(19,'ended',NULL,NULL,3,3);
/*!40000 ALTER TABLE `Shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Shipments_has_Products`
--

LOCK TABLES `Shipments_has_Products` WRITE;
/*!40000 ALTER TABLE `Shipments_has_Products` DISABLE KEYS */;
INSERT INTO `Shipments_has_Products` VALUES (1,1,1),(2,2,2),(3,3,3),(4,1,2),(5,2,3),(6,3,1),(7,1,2),(8,2,3),(9,3,1),(10,1,2),(11,2,3),(12,3,1),(13,1,2),(14,2,3),(15,3,1),(16,1,2),(17,2,1),(18,3,2),(19,2,3);
/*!40000 ALTER TABLE `Shipments_has_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'carlos','Delicias 99',NULL,1,0.3,'male','456','asdfasf@gmail.com',64564563,1),(2,'alberto','prado',NULL,1,0.4,'male','4523','fasdfasdf@f.com',2352345,2),(3,'belen','casa falsa',NULL,0,0.5,'female','234','ferrin@gmai.com',2354235,3),(4,'elena','sol',NULL,0,0.6,'female','1234','esto@gmai.com',2352345,1),(5,'cristina','gran via',NULL,0,0.7,'female','123','asdf@gmai.com',235235,1);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Users_buys_Products`
--

LOCK TABLES `Users_buys_Products` WRITE;
/*!40000 ALTER TABLE `Users_buys_Products` DISABLE KEYS */;
INSERT INTO `Users_buys_Products` VALUES (1,1,1),(2,2,1),(3,3,2),(4,1,3),(5,2,1),(6,3,2),(7,1,3),(8,2,1),(9,3,2),(10,1,3),(11,2,1),(12,3,2),(13,1,3),(14,2,1),(15,3,2),(16,1,3),(17,1,1),(18,2,2),(19,3,3);
/*!40000 ALTER TABLE `Users_buys_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Users_likes_Products`
--

LOCK TABLES `Users_likes_Products` WRITE;
/*!40000 ALTER TABLE `Users_likes_Products` DISABLE KEYS */;
INSERT INTO `Users_likes_Products` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,1,1),(6,2,2),(7,3,3),(8,4,4),(9,1,5),(10,2,1),(11,3,2),(12,4,3),(13,1,4),(14,2,5),(15,3,1),(16,1,2),(17,2,3),(18,3,4),(19,4,5);
/*!40000 ALTER TABLE `Users_likes_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-18 17:52:23
