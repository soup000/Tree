-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: abills
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `trees_type`
--

DROP TABLE IF EXISTS `trees_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trees_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type_of_tree` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trees_type`
--

LOCK TABLES `trees_type` WRITE;
/*!40000 ALTER TABLE `trees_type` DISABLE KEYS */;
INSERT INTO `trees_type` VALUES (1,'Глицевi'),(2,'Ягодні'),(3,'Вічнозелені'),(19,'Ажурні');
/*!40000 ALTER TABLE `trees_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trees_species`
--

DROP TABLE IF EXISTS `trees_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trees_species` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(3) unsigned NOT NULL,
  `species` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `trees_species_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `trees_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trees_species`
--

LOCK TABLES `trees_species` WRITE;
/*!40000 ALTER TABLE `trees_species` DISABLE KEYS */;
INSERT INTO `trees_species` VALUES (1,1,'Ялинка'),(2,2,'Яблуня'),(3,3,'Туя'),(4,3,'Сосна'),(26,2,'Груша'),(27,2,'Слива'),(28,3,'Смерека'),(29,2,'Калина');
/*!40000 ALTER TABLE `trees_species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trees_tree`
--

DROP TABLE IF EXISTS `trees_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trees_tree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ext_id` varchar(20) DEFAULT NULL,
  `species_id` smallint(5) unsigned NOT NULL,
  `age` smallint(5) unsigned NOT NULL,
  `coordx` double(20,14) NOT NULL DEFAULT '0.00000000000000',
  `coordy` double(20,14) NOT NULL DEFAULT '0.00000000000000',
  `status` varchar(40) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `species_id` (`species_id`),
  CONSTRAINT `trees_tree_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `trees_species` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trees_tree`
--

LOCK TABLES `trees_tree` WRITE;
/*!40000 ALTER TABLE `trees_tree` DISABLE KEYS */;
INSERT INTO `trees_tree` VALUES (1,NULL,1,90,48.53030000000000,25.04764000000000,'Здорове',NULL),(2,NULL,4,32,48.53020000000000,25.04850000000000,'Хворе',NULL),(3,NULL,3,20,48.52984000000000,25.04845000000000,'Здорове',NULL);
/*!40000 ALTER TABLE `trees_tree` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-07 15:54:20
