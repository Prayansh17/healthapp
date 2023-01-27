-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: healthapp
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `psychiatrist`
--

DROP TABLE IF EXISTS `psychiatrist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psychiatrist` (
  `id` int NOT NULL,
  `name1` varchar(255) NOT NULL,
  `patient_count` int DEFAULT '0',
  `hospital_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `psychiatrist_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychiatrist`
--

LOCK TABLES `psychiatrist` WRITE;
/*!40000 ALTER TABLE `psychiatrist` DISABLE KEYS */;
INSERT INTO `psychiatrist` VALUES (1,'John Smith',20,1),(2,'Jane Doe',15,2),(3,'Bob Johnson',25,3),(4,'Alex Brown',30,4),(5,'Amy Taylor',10,1),(6,'Brian Mitchell',15,2),(7,'Bella Thompson',20,3),(8,'Chris Gomez',25,4),(9,'Daniel Martinez',30,1),(10,'David Anderson',20,2),(11,'Emily Thomas',25,3),(12,'Emma Moore',30,4),(13,'Ethan Jackson',20,1),(14,'Isabella Garcia',25,2),(15,'Jacob Martinez',30,3),(16,'James Rodriguez',20,4),(17,'Madison Avery',25,1),(18,'Mia Turner',30,2),(19,'Nathan Phillips',20,3),(20,'Noah Lewis',25,4),(21,'Olivia Young',30,1),(22,'Aiden Walker',20,2),(23,'Landon Parker',25,3),(24,'Caden James',30,4),(25,'Jonathan Rogers',20,1),(26,'Kaylee Edwards',25,2),(27,'Makayla Stewart',30,3),(28,'Avery Cook',20,4),(29,'Aaliyah Cooper',25,1),(30,'Evelyn Nelson',30,2),(31,'Abigail Carter',20,3),(32,'Isabelle Mitchell',25,4),(33,'Sophia Thompson',30,1),(34,'Mila Garcia',20,2),(35,'Aubree Martinez',25,3),(36,'Brooklyn Rodriguez',30,4),(37,'Bella Parker',20,1),(38,'Adalynn James',25,2),(39,'Avery Rogers',30,3),(40,'Eleanor Edwards',20,4),(41,'Natalie Stewart',25,1),(42,'Landon Cook',30,2),(43,'Eden Cooper',20,3),(44,'Aubree Nelson',25,4),(45,'Ellie Carter',30,1),(46,'Brooklyn Mitchell',20,2),(47,'Aubree Thompson',25,3),(48,'Eleanor Garcia',30,4),(49,'Natalie Martinez',20,1),(50,'Landon Rodriguez',25,2);
/*!40000 ALTER TABLE `psychiatrist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-27 14:46:15
