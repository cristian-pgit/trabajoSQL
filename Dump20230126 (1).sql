CREATE DATABASE  IF NOT EXISTS `capacitacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `capacitacion`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: capacitacion
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
-- Table structure for table `asistentes`
--

DROP TABLE IF EXISTS `asistentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistentes` (
  `idasistentes` int NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `edad` tinyint NOT NULL,
  `capacitacion_idcapacitacion` int NOT NULL,
  PRIMARY KEY (`idasistentes`,`capacitacion_idcapacitacion`),
  KEY `capacitacion_idcapacitacion_idx` (`capacitacion_idcapacitacion`),
  CONSTRAINT `capacitacion_idcapacitacion` FOREIGN KEY (`capacitacion_idcapacitacion`) REFERENCES `capacitacion` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistentes`
--

LOCK TABLES `asistentes` WRITE;
/*!40000 ALTER TABLE `asistentes` DISABLE KEYS */;
INSERT INTO `asistentes` VALUES (10110,'ELVER GALARGA',19,2),(10112,'FULANITO DETAL',21,7),(10113,'FLORENCIO FLORES',22,3),(10114,'ILABACA ZEPEDA',24,4),(10115,'ROSAMEL TRONCOSO',25,5),(10116,'ZOYLA CERDA',23,6),(10117,'ELTON TITO',21,7),(10118,'DOLORES DELANO',22,8),(10119,'LOLA MENTO',22,9),(10120,'ZOILA VACA',18,1),(10121,'ALAN BRITO',21,2),(10122,'BENITO CAMELO',22,3),(10123,'ZAMPA TESTE',24,4),(10124,'MARY CONAZO',25,5),(10125,'ROSA MELANO',23,6),(10126,'ELSA CAPUNTAS',21,7),(10127,'JOREGE NITALES',22,8),(10128,'ARMANDO CASAS',22,9),(10129,'ELBA SURITA',19,10),(245003,'PERICO LOSPALOTES',18,1);
/*!40000 ALTER TABLE `asistentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacitacion`
--

DROP TABLE IF EXISTS `capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capacitacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rut_cliente` varchar(15) NOT NULL DEFAULT '00.000.000-0',
  `dia` varchar(10) NOT NULL,
  `hora` varchar(5) NOT NULL,
  `lugar` varchar(50) NOT NULL,
  `duracion` int NOT NULL,
  `num_asistentes` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`rut_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacitacion`
--

LOCK TABLES `capacitacion` WRITE;
/*!40000 ALTER TABLE `capacitacion` DISABLE KEYS */;
INSERT INTO `capacitacion` VALUES (1,'11.111.111-1','Lunes','12:30','Vina',120,'2'),(2,'22.222.222-2','Martes','11:00','Valpo',120,'2'),(3,'33.333.333-3','Miercoles','11:30','vina',120,'2'),(4,'44.444.444-4','Jueves','12:00','Valpo',120,'21'),(5,'55.555.555-5','Viernes','10:00','concon',10,'81'),(6,'66.666.666-6','Lunes','10:00','Vina',5,'120'),(7,'77.777.777-7','Martes','09:00','Valpo',120,'5'),(8,'88.888.888-8','Miercoles','08:30','Vina',60,'34'),(9,'1-9','Jueves','09:30','Valpo',30,'21'),(10,'2-7','Viernes','12:30','La Florida',20,'80');
/*!40000 ALTER TABLE `capacitacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-26 13:59:13
