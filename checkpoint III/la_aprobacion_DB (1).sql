CREATE DATABASE  IF NOT EXISTS `la_aprobacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `la_aprobacion`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: la_aprobacion
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `huesped_id` int NOT NULL,
  `habitacion_numero` int NOT NULL,
  `fecha_entrada` datetime NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `importe` float(12,2) NOT NULL,
  `forma_pago_id` int NOT NULL,
  PRIMARY KEY (`id`,`huesped_id`,`habitacion_numero`),
  KEY `fk_huesped_has_habitacion_habitacion1_idx` (`habitacion_numero`),
  KEY `fk_huesped_has_habitacion_huesped1_idx` (`huesped_id`),
  KEY `fk_checkin_forma_pago1_idx` (`forma_pago_id`),
  CONSTRAINT `fk_checkin_forma_pago1` FOREIGN KEY (`forma_pago_id`) REFERENCES `forma_pago` (`id`),
  CONSTRAINT `fk_huesped_has_habitacion_habitacion1` FOREIGN KEY (`habitacion_numero`) REFERENCES `habitacion` (`numero`),
  CONSTRAINT `fk_huesped_has_habitacion_huesped1` FOREIGN KEY (`huesped_id`) REFERENCES `huesped` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
INSERT INTO `checkin` VALUES (1,40,49,'2019-01-14 11:05:00','2019-01-19 08:48:00',23750.00,2),(2,35,16,'2019-02-14 11:32:00','2019-01-22 09:45:00',4750.00,1),(3,37,16,'2019-01-14 11:32:00','2019-01-19 09:45:00',4750.00,2),(4,20,3,'2019-02-17 10:34:00','2019-02-19 08:09:00',23750.00,3),(5,25,35,'2019-02-28 10:34:00','2019-02-22 09:14:00',16680.00,3),(6,42,27,'2019-03-01 10:40:00','2019-03-06 08:03:00',41700.00,3),(7,41,27,'2019-03-01 10:40:00','2019-03-06 08:03:00',8340.00,3),(8,18,5,'2019-03-04 12:36:00','2019-02-23 08:53:00',33360.00,2),(9,42,25,'2019-04-04 12:36:00','2019-04-11 10:57:00',23750.00,4),(10,41,25,'2019-04-04 12:36:00','2019-04-11 10:57:00',9500.00,4),(11,21,5,'2019-03-22 11:32:00','2019-03-28 09:27:00',25020.00,4),(12,25,37,'2019-03-29 11:32:00','2019-03-15 08:42:00',4750.00,2),(13,49,31,'2019-04-03 10:48:00','2019-04-09 08:40:00',9500.00,2),(14,11,9,'2019-04-22 12:25:00','2019-04-26 08:42:00',34125.00,4),(15,41,22,'2019-05-26 10:48:00','2019-05-19 08:59:00',13650.00,4),(16,42,22,'2019-05-26 10:48:00','2019-05-19 08:59:00',20475.00,4),(17,56,22,'2019-05-26 10:48:00','2019-05-19 08:59:00',13650.00,4),(18,25,12,'2019-06-01 12:16:00','2019-06-07 10:10:00',8340.00,4),(19,40,35,'2019-06-16 12:16:00','2019-03-30 09:56:00',8340.00,2),(20,44,40,'2019-07-13 12:42:00','2019-07-17 09:49:00',25020.00,1),(21,49,36,'2019-07-17 12:42:00','2019-04-11 08:37:00',6825.00,3),(22,60,21,'2019-08-02 12:45:00','2019-04-08 09:10:00',14250.00,4),(23,56,24,'2019-08-02 12:15:00','2019-04-08 09:00:00',41700.00,4),(24,59,22,'2019-08-08 10:20:00','2019-08-14 09:43:00',6825.00,4),(25,16,23,'2019-08-16 10:20:00','2019-05-04 09:32:00',9500.00,3),(26,24,6,'2019-08-22 10:04:00','2019-08-26 09:52:00',13650.00,2),(27,23,6,'2019-08-22 10:04:00','2019-08-26 09:52:00',6825.00,2),(28,43,3,'2019-09-03 10:04:00','2019-05-05 08:44:00',19000.00,3),(29,38,3,'2019-09-21 10:04:00','2019-05-05 08:44:00',4750.00,3),(30,44,17,'2019-10-08 10:13:00','2019-06-14 08:23:00',33360.00,1),(31,46,17,'2019-10-08 10:13:00','2019-06-14 08:23:00',25020.00,1),(32,35,16,'2019-12-12 10:54:00','2019-12-15 10:26:00',4750.00,4),(33,19,14,'2019-12-16 10:54:00','2019-06-24 09:03:00',6825.00,1),(34,40,10,'2019-12-20 11:11:00','2019-12-25 09:10:00',34125.00,1),(35,59,8,'2020-01-01 11:11:00','2019-07-25 10:12:00',33360.00,3),(36,3,11,'2020-01-01 11:31:00','2019-07-25 10:22:00',14250.00,3),(37,49,16,'2020-01-04 10:16:00','2019-07-26 09:52:00',14250.00,1),(38,48,42,'2020-02-12 10:49:00','2019-08-04 10:30:00',19000.00,4),(39,23,18,'2020-02-20 12:15:00','2019-08-19 10:49:00',8340.00,2),(40,1,40,'2020-03-06 11:50:00','2020-03-08 08:11:00',25020.00,1),(41,55,39,'2020-03-29 11:50:00','2019-08-28 08:17:00',20475.00,3),(42,5,36,'2020-04-07 10:17:00','2020-04-09 10:16:00',13650.00,4),(43,33,49,'2020-04-09 10:17:00','2019-09-06 08:40:00',23750.00,4),(44,20,10,'2020-04-28 12:24:00','2020-05-05 09:55:00',34125.00,2),(45,34,49,'2020-05-05 12:24:00','2019-09-12 09:33:00',14250.00,4),(46,31,49,'2020-05-05 12:24:00','2019-09-12 09:33:00',9500.00,4),(47,6,45,'2020-05-05 12:08:00','2019-09-24 08:53:00',9500.00,2),(48,3,48,'2020-05-07 12:34:00','2020-05-10 08:45:00',16680.00,1),(49,2,17,'2020-05-27 12:34:00','2019-10-10 09:09:00',25020.00,2),(50,17,19,'2020-06-06 12:30:00','2020-06-11 09:25:00',27300.00,1),(51,11,23,'2020-06-06 12:09:00','2020-06-11 09:55:00',19000.00,1),(52,55,11,'2020-06-11 12:09:00','2019-12-20 10:33:00',23750.00,1),(53,19,16,'2020-06-13 12:49:00','2020-06-18 09:43:00',23750.00,3),(54,11,47,'2020-06-19 12:49:00','2019-12-23 08:32:00',14250.00,1),(55,45,24,'2020-06-21 12:49:00','2019-12-23 08:32:00',41700.00,1),(56,15,49,'2020-06-22 11:05:00','2019-12-23 09:35:00',9500.00,3),(57,17,25,'2020-06-23 11:15:00','2020-06-27 09:13:00',14250.00,4),(58,21,23,'2020-06-28 10:34:00','2020-06-30 08:03:00',23750.00,3),(59,12,6,'2020-06-28 10:44:00','2020-06-30 08:32:00',6825.00,3),(60,26,32,'2020-07-02 10:34:00','2020-01-16 09:48:00',6825.00,1),(61,40,35,'2020-07-02 11:35:00','2020-07-08 10:14:00',41700.00,3),(62,34,23,'2020-08-06 11:35:00','2020-02-14 10:33:00',14250.00,3),(63,31,7,'2020-08-12 12:36:00','2020-08-19 10:38:00',20475.00,1),(64,28,7,'2020-08-12 12:36:00','2020-08-19 10:38:00',6825.00,1),(65,15,21,'2020-09-02 12:36:00','2020-03-07 08:48:00',14250.00,3),(66,59,7,'2020-10-08 11:49:00','2020-10-10 10:54:00',20475.00,4),(67,53,43,'2020-10-14 11:49:00','2020-03-12 10:22:00',20475.00,2),(68,41,11,'2020-10-23 11:14:00','2020-10-28 09:11:00',14250.00,3),(69,33,22,'2020-11-11 11:14:00','2020-04-09 09:05:00',34125.00,2),(70,55,12,'2020-11-22 12:58:00','2020-11-29 10:09:00',33360.00,4),(71,39,3,'2020-11-27 12:58:00','2020-04-15 09:34:00',9500.00,3),(72,1,4,'2020-11-27 12:18:00','2020-04-15 09:33:00',27300.00,3),(73,44,25,'2020-11-29 10:20:00','2020-12-03 09:04:00',23750.00,3),(74,59,7,'2020-12-11 10:20:00','2020-04-23 08:32:00',6825.00,4),(75,55,27,'2020-12-25 10:39:00','2020-12-27 10:58:00',16680.00,3),(76,35,33,'2021-01-05 10:39:00','2020-05-11 09:20:00',25020.00,2),(77,9,9,'2021-01-05 10:31:00','2020-05-11 09:25:00',27300.00,2),(78,54,11,'2021-01-23 10:36:00','2021-01-29 10:44:00',4750.00,4),(79,31,49,'2021-01-29 11:07:00','2021-02-04 09:41:00',19000.00,2),(80,7,5,'2021-02-02 10:36:00','2020-05-08 09:21:00',41700.00,3),(81,35,1,'2021-02-03 11:07:00','2020-05-19 08:45:00',41700.00,3),(82,58,16,'2021-02-04 12:38:00','2021-02-11 10:08:00',19000.00,2),(83,55,16,'2021-02-04 12:38:00','2021-02-11 10:08:00',4750.00,2),(84,23,5,'2021-02-06 12:38:00','2020-05-14 09:06:00',16680.00,2),(85,21,16,'2021-02-24 12:34:00','2021-02-28 08:38:00',9500.00,1),(86,17,45,'2021-02-27 12:34:00','2020-05-29 09:45:00',14250.00,1),(87,18,18,'2021-02-27 12:37:00','2021-03-02 09:42:00',8340.00,4),(88,18,19,'2021-02-28 12:37:00','2020-06-18 10:10:00',13650.00,1),(89,26,30,'2021-03-04 11:03:00','2021-03-09 10:10:00',20475.00,3),(90,32,2,'2021-03-05 11:03:00','2020-06-22 08:11:00',33360.00,1),(91,21,2,'2021-03-23 10:47:00','2021-03-25 08:56:00',25020.00,1),(92,48,43,'2021-03-29 10:47:00','2020-06-28 09:23:00',20475.00,2),(93,46,32,'2021-04-18 10:25:00','2021-04-24 10:46:00',27300.00,2),(94,34,3,'2021-04-18 10:15:00','2021-04-24 10:16:00',19000.00,2),(95,46,2,'2021-05-03 10:25:00','2020-07-05 10:10:00',41700.00,4),(96,32,39,'2021-05-10 10:25:00','2021-05-13 08:44:00',20475.00,3),(97,21,11,'2021-05-11 10:25:00','2020-06-27 10:55:00',4750.00,3),(98,22,44,'2021-05-11 10:10:00','2021-05-18 08:39:00',27300.00,1),(99,10,44,'2021-05-17 10:10:00','2020-07-01 08:44:00',20475.00,3),(100,22,44,'2021-05-17 10:10:00','2020-07-01 08:44:00',6825.00,3),(101,19,32,'2021-05-18 11:10:00','2021-05-23 10:37:00',20475.00,1),(102,31,41,'2021-05-31 11:10:00','2020-06-26 08:33:00',41700.00,3),(103,18,44,'2021-07-13 12:07:00','2021-07-18 08:46:00',13650.00,2),(104,16,44,'2021-07-13 12:07:00','2021-07-18 08:46:00',6825.00,2),(105,13,29,'2021-07-19 12:07:00','2020-07-03 10:35:00',13650.00,2),(106,44,4,'2021-07-25 11:41:00','2021-07-29 10:14:00',20475.00,2),(107,58,26,'2021-07-29 10:07:00','2021-07-31 09:13:00',25020.00,2),(108,36,42,'2021-08-09 11:41:00','2020-07-09 08:18:00',23750.00,1),(109,33,42,'2021-08-09 11:41:00','2020-07-09 08:18:00',23750.00,1),(110,23,4,'2021-09-01 10:07:00','2020-07-10 08:54:00',27300.00,1),(111,43,48,'2021-09-02 10:07:00','2021-09-04 09:13:00',25020.00,2),(112,41,21,'2021-09-09 11:25:00','2021-09-15 09:33:00',4750.00,2),(113,43,31,'2021-09-16 11:25:00','2020-08-21 10:39:00',19000.00,1),(114,47,40,'2021-10-04 11:25:00','2021-10-07 09:33:00',41700.00,2),(115,16,29,'2021-10-04 11:55:00','2021-10-07 09:31:00',6825.00,2),(116,51,24,'2021-10-06 11:12:00','2021-10-10 09:51:00',8340.00,3),(117,18,44,'2021-10-23 11:12:00','2020-08-24 08:01:00',13650.00,1),(118,14,18,'2021-11-12 11:12:00','2021-11-16 09:51:00',33360.00,3),(119,16,18,'2021-11-12 11:12:00','2021-11-16 09:51:00',33360.00,3),(120,46,4,'2021-12-01 12:19:00','2021-12-07 08:39:00',20475.00,1),(121,58,48,'2021-12-22 12:19:00','2020-09-09 10:05:00',8340.00,4),(122,29,9,'2021-12-24 12:19:00','2021-12-30 08:12:00',6825.00,1),(123,28,42,'2021-12-24 12:25:00','2021-12-30 08:15:00',9500.00,1),(124,30,21,'2021-12-24 12:30:00','2021-12-30 08:25:00',23750.00,1),(125,31,4,'2021-12-24 12:35:00','2021-12-30 08:30:00',27300.00,1),(126,18,40,'2021-12-24 12:39:00','2021-12-30 08:42:00',41700.00,1),(127,14,31,'2021-12-24 12:40:00','2021-12-30 08:45:00',9500.00,1),(128,58,44,'2021-12-24 12:25:00','2021-12-30 08:48:00',20475.00,1),(129,41,29,'2021-12-24 12:30:00','2021-12-30 08:55:00',13650.00,1),(130,42,29,'2021-12-24 12:35:00','2021-12-30 08:55:00',20475.00,1),(131,56,29,'2021-12-24 12:39:00','2021-12-30 08:55:00',34125.00,1);
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(10) NOT NULL,
  `costo_diario` float(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'Basic',4750.00),(2,'Classic',6825.00),(3,'Premium',8340.00);
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decoracion`
--

DROP TABLE IF EXISTS `decoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoracion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoracion`
--

LOCK TABLES `decoracion` WRITE;
/*!40000 ALTER TABLE `decoracion` DISABLE KEYS */;
INSERT INTO `decoracion` VALUES (1,'Griega'),(2,'Hindú'),(3,'Italiana'),(4,'Colonial'),(5,'Urbana'),(6,'Campestre'),(7,'Tropical');
/*!40000 ALTER TABLE `decoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `legajo` int NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `numero_documento` char(9) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `domicilio` varchar(70) NOT NULL,
  `pais_id` int NOT NULL,
  `telefono_movil` char(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sector_id` int NOT NULL,
  `inactivo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`legajo`),
  UNIQUE KEY `tipoDocumento` (`numero_documento`),
  KEY `fk_empleado_pais1_idx` (`pais_id`),
  KEY `fk_empleado_sector1_idx` (`sector_id`),
  CONSTRAINT `fk_empleado_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`),
  CONSTRAINT `fk_empleado_sector1` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Martín','Guillermina Lucia','34492471','1986-11-07','Simón Bolívar 155',4,'+5491155332223','guillermina.lucia@eldescubierto.com',2,0),(2,'Ontiveros Telle','John David','32896895','1984-12-03','Calle Manuel Oribe 1100',4,'+5491155332223','john.david@eldescubierto.com',2,0),(3,'Miranda','Maria Agustina','28357530','1980-10-29','P. A. Sarmiento 542',1,'+5491159001005','maria.agustina@eldescubierto.com',1,1),(4,'Aguirre','Maria Guadalupe','29985131','1981-10-18','Manuel Eyzaguirre 1260',1,'+5492646747787','maria.guadalupe@eldescubierto.com',1,0),(5,'Medina','Sofia Magdalena','37259212','1989-07-01','Villa Lourdes Mza. D Casa 22',1,'+5492646747787','sofia.magdalena@eldescubierto.com',1,0),(6,'Garcia','Nadia','34604889','1986-10-19','Av. libertador 4250 este',1,'+5493426457811','nadia2000@eldescubierto.com',4,0),(7,'Torres León','Laura Martina','37756563','1989-09-18','Barrio Neuquen mnblc. A piso 4 dpto. 2',1,'+5493515904588','laura.martina@eldescubierto.com',4,0),(8,'Aguilera Rivarola','Lucio Enrique','37954657','1989-02-12','Av. Sarmiento 4122',1,'+5493426457811','lucio.enrique@eldescubierto.com',5,0),(9,'Manrique Tello','Gabriel Eduardo','36142472','1988-12-11','Luis Alberto Lacalle 300 piso 2 dpto. 10',5,'+5493515685588','gabriel.eduardo@eldescubierto.com',5,0),(10,'Cabrera Peña','Marcelo','25640857','1977-03-11','Barrio Los Andes mnblc. B piso 2 dpto. C',5,'+5492645665002','marcelo50@eldescubierto.com',3,0),(11,'Roma','Miguel Angel','26524699','1978-11-01','9 de Julio 3300',5,'+5493515685588','miguel.angel@eldescubierto.com',3,0),(12,'Manrique','Marcela Elisa','38451274','1990-02-26','Rosalind Franklin 1233',4,'+573105604570','marcela.elisa@eldescubierto.com',4,0),(13,'De Los Santos','Mario','27832339','1979-12-17','Las palmeras 2388',4,'+5493416100500','mario2045@eldescubierto.com',2,0),(14,'Peña','Verónica','37613783','1989-09-12','Las palmeras 200 casa 15',4,'+5493416100500','veronica2010@eldescubierto.com',5,0),(15,'Macias','Nelson Adrián','32890537','1984-07-05','James K. Polk 77',1,'+5493515701005','nelson.adri@eldescubierto.com',5,0),(16,'Tello Aguilera','Camilo Daniel','26618374','1978-08-05','Saturnino Sarasa 122',1,'+5491153015204','camilo.daniel@eldescubierto.com',4,1),(17,'De Los Santos','Ernesto Segundo','35427536','1987-12-29','Villa Nueva 300',1,'+5491153015204','ernesto.segundo@eldescubierto.com',3,0),(18,'Gutierrez','Valentina','37903440','1989-01-30','Av. libertador 4750 este',1,'+5493515770010','valentina1233@eldescubierto.com',3,1),(19,'Acuña','Lucia Verónica','30709180','1982-01-26','Av. Sarmiento 93 sur',1,'+5492616442221','lucia.vero@eldescubierto.com',2,0),(20,'Bruno Maroni','Andres','27521630','1979-10-15','V. Barco Vargas 999',1,'+5499416441010','andres@eldescubierto.com',3,0),(21,'Alaníz','Pablo Ariel','36416872','1988-09-28','Ángela Camacho 566',1,'+562239092001','pablo.ariel@eldescubierto.com',4,0),(22,'Pérez Tello','Virginia','32657225','1984-06-21','Av. Rosalind Franklin 600',1,'+56224733622','virginia41@eldescubierto.com',3,0),(23,'Beltran Figueroa','Maria celeste','27842438','1979-08-22','San Luis 1300 este',1,'+5492645661478','maria.celeste@eldescubierto.com',5,0),(24,'Martín Mercado','Dante Jose','38540113','1990-08-01','Av. Sarmiento 702 oeste',1,'+573105582411','dante.jose@eldescubierto.com',3,0),(25,'Mercado','Angeles','37540173','1989-09-03','Córdoba 1211 sur',1,'+573105582411','angeles@eldescubierto.com',4,0);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Efectivo'),(2,'Tarjeta de débito'),(3,'Tarjeta de crédito'),(4,'Transferencia');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitacion` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `clase_id` int NOT NULL,
  `decoracion_id` int NOT NULL,
  `capacidad_maxima` tinyint NOT NULL DEFAULT '2',
  PRIMARY KEY (`numero`),
  KEY `fk_habitacion_clase1_idx` (`clase_id`),
  KEY `fk_habitacion_decoracion1_idx` (`decoracion_id`),
  CONSTRAINT `fk_habitacion_clase1` FOREIGN KEY (`clase_id`) REFERENCES `clase` (`id`),
  CONSTRAINT `fk_habitacion_decoracion1` FOREIGN KEY (`decoracion_id`) REFERENCES `decoracion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (1,3,2,3),(2,3,4,3),(3,1,3,2),(4,2,2,3),(5,3,1,2),(6,2,5,2),(7,2,5,4),(8,3,2,3),(9,2,3,3),(10,2,1,2),(11,1,3,2),(12,3,5,4),(13,2,3,2),(14,2,1,2),(15,2,4,2),(16,1,2,4),(17,3,5,3),(18,3,5,3),(19,2,2,3),(20,1,4,4),(21,1,4,3),(22,2,2,3),(23,1,4,2),(24,3,2,3),(25,1,2,4),(26,3,5,4),(27,3,2,3),(28,3,1,4),(29,2,5,2),(30,2,3,2),(31,1,4,4),(32,2,1,4),(33,3,4,3),(34,2,1,4),(35,3,3,3),(36,2,5,4),(37,1,4,4),(38,1,2,3),(39,2,3,4),(40,3,2,4),(41,3,4,4),(42,1,3,3),(43,2,4,2),(44,2,1,3),(45,1,3,3),(46,2,1,3),(47,1,4,3),(48,3,3,3),(49,1,3,4);
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion_x_servicio_basico`
--

DROP TABLE IF EXISTS `habitacion_x_servicio_basico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitacion_x_servicio_basico` (
  `habitacion_numero` int NOT NULL,
  `servicio_basico_id` int NOT NULL,
  PRIMARY KEY (`habitacion_numero`,`servicio_basico_id`),
  KEY `fk_habitacion_has_servicio_basico_servicio_basico1_idx` (`servicio_basico_id`),
  KEY `fk_habitacion_has_servicio_basico_habitacion1_idx` (`habitacion_numero`),
  CONSTRAINT `fk_habitacion_has_servicio_basico_habitacion1` FOREIGN KEY (`habitacion_numero`) REFERENCES `habitacion` (`numero`),
  CONSTRAINT `fk_habitacion_has_servicio_basico_servicio_basico1` FOREIGN KEY (`servicio_basico_id`) REFERENCES `servicio_basico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion_x_servicio_basico`
--

LOCK TABLES `habitacion_x_servicio_basico` WRITE;
/*!40000 ALTER TABLE `habitacion_x_servicio_basico` DISABLE KEYS */;
INSERT INTO `habitacion_x_servicio_basico` VALUES (1,1),(2,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(12,1),(13,1),(14,1),(15,1),(17,1),(18,1),(19,1),(22,1),(24,1),(26,1),(27,1),(28,1),(29,1),(30,1),(32,1),(33,1),(34,1),(35,1),(36,1),(39,1),(40,1),(41,1),(43,1),(44,1),(46,1),(48,1),(1,2),(2,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(12,2),(13,2),(14,2),(15,2),(17,2),(18,2),(19,2),(22,2),(24,2),(26,2),(27,2),(28,2),(29,2),(30,2),(32,2),(33,2),(34,2),(35,2),(36,2),(39,2),(40,2),(41,2),(43,2),(44,2),(46,2),(48,2),(1,3),(2,3),(5,3),(8,3),(12,3),(17,3),(18,3),(24,3),(26,3),(27,3),(28,3),(33,3),(35,3),(40,3),(41,3),(48,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,4),(17,4),(18,4),(19,4),(20,4),(21,4),(22,4),(23,4),(24,4),(25,4),(26,4),(27,4),(28,4),(29,4),(30,4),(31,4),(32,4),(33,4),(34,4),(35,4),(36,4),(37,4),(38,4),(39,4),(40,4),(41,4),(42,4),(43,4),(44,4),(45,4),(46,4),(47,4),(48,4),(49,4),(4,5),(6,5),(7,5),(9,5),(10,5),(13,5),(14,5),(15,5),(19,5),(22,5),(29,5),(30,5),(32,5),(34,5),(36,5),(39,5),(43,5),(44,5),(46,5),(1,6),(2,6),(5,6),(8,6),(12,6),(17,6),(18,6),(24,6),(26,6),(27,6),(28,6),(33,6),(35,6),(40,6),(41,6),(48,6),(1,7),(2,7),(5,7),(8,7),(12,7),(17,7),(18,7),(24,7),(26,7),(27,7),(28,7),(33,7),(35,7),(40,7),(41,7),(48,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(11,8),(12,8),(13,8),(14,8),(15,8),(16,8),(17,8),(18,8),(19,8),(20,8),(21,8),(22,8),(23,8),(24,8),(25,8),(26,8),(27,8),(28,8),(29,8),(30,8),(31,8),(32,8),(33,8),(34,8),(35,8),(36,8),(37,8),(38,8),(39,8),(40,8),(41,8),(42,8),(43,8),(44,8),(45,8),(46,8),(47,8),(48,8),(49,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(9,9),(10,9),(11,9),(12,9),(13,9),(14,9),(15,9),(16,9),(17,9),(18,9),(19,9),(20,9),(21,9),(22,9),(23,9),(24,9),(25,9),(26,9),(27,9),(28,9),(29,9),(30,9),(31,9),(32,9),(33,9),(34,9),(35,9),(36,9),(37,9),(38,9),(39,9),(40,9),(41,9),(42,9),(43,9),(44,9),(45,9),(46,9),(47,9),(48,9),(49,9),(1,10),(2,10),(3,10),(4,10),(5,10),(6,10),(7,10),(8,10),(9,10),(10,10),(11,10),(12,10),(13,10),(14,10),(15,10),(16,10),(17,10),(18,10),(19,10),(20,10),(21,10),(22,10),(23,10),(24,10),(25,10),(26,10),(27,10),(28,10),(29,10),(30,10),(31,10),(32,10),(33,10),(34,10),(35,10),(36,10),(37,10),(38,10),(39,10),(40,10),(41,10),(42,10),(43,10),(44,10),(45,10),(46,10),(47,10),(48,10),(49,10);
/*!40000 ALTER TABLE `habitacion_x_servicio_basico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huesped`
--

DROP TABLE IF EXISTS `huesped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huesped` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `pasaporte` char(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `domicilio` varchar(70) NOT NULL,
  `pais_id` int NOT NULL,
  `telefono_movil` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_huesped_pais1_idx` (`pais_id`),
  CONSTRAINT `fk_huesped_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huesped`
--

LOCK TABLES `huesped` WRITE;
/*!40000 ALTER TABLE `huesped` DISABLE KEYS */;
INSERT INTO `huesped` VALUES (1,'Rubén Arias','Ana Gabriela','38942900','1990-02-01','Av. A. Fernandez',1,'+5491152020333','anafer@gamil.com'),(2,'Carranza','Leonardo Ariel','36746538','1988-11-19','Av. G. Santos 1520',1,'+5492645123322','leonardo.ariel@eldescubierto.com'),(3,'Valencia Rojas','Brenda Carolina','37345803','1989-03-03','Esteban Echeverria 3547',1,'+5492645123322','brenda.carolina@eldescubierto.com'),(4,'Castillo','Guillermo','36469414','1988-05-19','George Washington 211',1,'+5493816123004','guillermo@eldescubierto.com'),(5,'Torres','Juan Carlos','38831484','1990-07-06','Villa Angelica mnblc. F piso 2 dpto. 3',1,'+5493816123004','juan.carlos@eldescubierto.com'),(6,'López','Mabel','35221895','1987-09-05','Benjamin Harrison 710',4,'+573122611571','mabel440@eldescubierto.com'),(7,'Camacho Olave','Yesica melina','32141469','1984-04-05','Calle Tucumán 547',4,'+573122611571','yesica.melina@eldescubierto.com'),(8,'Barragan Aya','Antonella Vanesa','29690439','1981-03-03','Av. Adriana Ocampo 455',1,'+5491155331001','antonella.vanesa@eldescubierto.com'),(9,'González','Mariela Luciana','36624994','1988-05-28','Esteban Echeverria 1145',1,'+5491155331001','mariela.luciana@eldescubierto.com'),(10,'Morales','Miguel','27571470','1979-05-02','John F. Kennedy 451',1,'+5491154050112','miguel785@eldescubierto.com'),(11,'Russo','Luís Alberto','34223972','1986-02-20','George Washington 1277',1,'+5491154050112','luis.alberto@eldescubierto.com'),(12,'Naranjo','Adriana','36747633','1988-05-11','John Adam 544 este',5,'+5493426112020','adriana1103@eldescubierto.com'),(13,'Miranda Tello','Luís Enrique','26530220','1978-10-05','Callejón Libertad 1410',5,'+5493426112020','luis.enrique@eldescubierto.com'),(14,'Sosa Muñoz ','Cristian Nicolás','26271476','1978-01-21','JOSÉ MARÍA CAMPO SERRANO 211',1,'+573105582234','cristian.nicolas@eldescubierto.com'),(15,'Redondo','Angel','33886897','1985-12-05','Ángela Camacho 122',1,'+573105582234','angel445@eldescubierto.com'),(16,'Farina','Lizeth Daniela','30293388','1982-02-16','Carlos Ibáñez piso 2 dpto. A',5,'+5491158108107','lizeth.daniela@eldescubierto.com'),(17,'Chauchet Zamora','Diego Armando','27405672','1979-08-13','Av. Rosa Parks 239',5,'+5491158108107','diego.armando@eldescubierto.com'),(18,'González Romero','Verónica Edith','33575258','1985-01-29','Saturnino Sarasa 710',19,'+5493835100521','veronica.edith@eldescubierto.com'),(19,'Ramirez Muñoz ','Lucía Romina','34503352','1986-02-11','Las palmeras 200 casa 154',19,'+5493835100521','lucia.romina@eldescubierto.com'),(20,'Gómez Cuellar','Luis Angel','35696443','1987-03-03','Córdoba 122 sur',1,'+56921233122','luis.angel@eldescubierto.com'),(21,'Romero Alonso','Mariela Lorena','31441676','1983-04-13','Álvaro Uribe 5100',1,'+56921233122','mariela.lorena@eldescubierto.com'),(22,'Garcia Enrique','María Carina','29534262','1981-11-02','Villa Angelica mnblc. B piso 2 dpto. 4',1,'+5493816748870','maria.carina@eldescubierto.com'),(23,'Mercado','Pedro','29845224','1981-02-02','Libertad 3200',1,'+5493816748870','pedro6411@eldescubierto.com'),(24,'Miranda','Zoe Valentina','25866771','1977-03-11','José Mujica 540',4,'+562239093455','zoe.valentina@eldescubierto.com'),(25,'Colonia Díaz','Carla Andrea','33707272','1985-03-12','Av. Sarmiento 92 oeste',4,'+562239093455','carla.andrea@eldescubierto.com'),(26,'Medina','Juan Luis','27822930','1979-06-02','Av España 1477 sur',4,'+5492645887741','medina@gamil.com'),(27,'Manrique','Maria Laura','38799833','1990-01-15','San Martin 325 oeste',1,'+5492645814545','manrique@gmail.com'),(28,'Acuña Ruiz','David','34799541','1986-12-04','Juan Antonio Lavalleja piso 4 dpto. 13',1,'+5499416441020','david@hotmail.com'),(29,'Alaníz','Mario Rubén','33639571','1985-09-21','Juan Antonio Lavalleja piso 2 dpto. 11',1,'+59824157067','mario.ruben@gmail.com'),(30,'Torres','Camilo','34201102','1986-05-27','25 De Mayo 533',1,'+5492645881234','camilo@hotmail.com'),(31,'Martinez Páez','Patricia Liliana','34870528','1986-10-25','25 de Mayo 522',1,'+5491153013300','patricia.liliana@gmail.com'),(32,'Tello','María Virginia','36634271','1988-08-30','Villa Lourdes Mza. H Casa 10',5,'+562239109080','maria.virginia@hotmail.com'),(33,'Mercado','Joel','38171354','1990-09-13','Benjamin Harrison 984',4,'+5491155110014','joel@hotmail.com'),(34,'Acuña','Marian','28462765','1980-01-09','Calle John F. Kennedy 100',1,'+5493815201055','marian@gmail.com'),(35,'Castro','Nicole','26247227','1978-02-23','Calle 5 y Santa Rosa 457',1,'+5492646334001','nicole@hotmail.com'),(36,'Mercado Alaníz','Paulina Estela','28534744','1980-04-12','Córdoba 1254 sur',1,'+5492616120045','paulina.estela@hotmail.com'),(37,'Farina','Daniel Fernando','33180401','1985-07-05','Av. Daniela Santos 1550',1,'+5492664551002','daniel.fernando@hotmail.com'),(38,'Ferreyra','Carlos Martín','28301869','1980-10-23','George Washington 245',1,'+5491153456987','carlos.martin@hotmail.com'),(39,'Cabrera','Ignacio Andrés','36898197','1988-03-02','Calle 13 Dpto. 22',1,'+573105604100','ignacio.andres@hotmail.com'),(40,'Gómez Arguello','Armando Joel','25830199','1977-09-22','Esteban Echeverria 1100',1,'+5493416106060','armando.joel@hotmail.com'),(41,'Salcedo','Sonia Estefanía','29207884','1981-08-04','John F. Kennedy 240',1,'+569984904451','sonia.estefania@live.com'),(42,'Manentti','Abraham David','35189509','1987-03-05','Libertad 3250',1,'+5492645887744','abraham.david@hotmail.com'),(43,'Gómez','Juan David','31409672','1983-07-13','Ángela Camacho 544',1,'+573106415577','juan.david@live.com'),(44,'Suárez López','Maria Luciana','26232425','1978-04-12','Av. Rosa Parks 2330',4,'+5491155161247','maria.luciana@gmail.com'),(45,'Gonzalez Pérez','Martina','30941683','1982-08-02','Saturnino Sarasa 756',4,'+5492646220012','martina@hotmail.com'),(46,'Beltran','Ariadna Lucia','29628992','1981-10-13','Álvaro Uribe 544',1,'+5492665457710','ariadna.lucia@hotmail.com'),(47,'Garcia','Catalina Denise','27132910','1979-08-13','Villa Angelica mnblc. G piso 5 dpto. 3',1,'+5499416123123','catalina.denise@hotmail.com'),(48,'López Beltran','Daniela','37123536','1989-05-04','Av. Sarmiento 952 oeste',1,'+5491152004577','daniela@gmail.com'),(49,'Vargas Ariza','Ana Belen','35211101','1987-07-26','Simón Bolívar 1255',1,'+59824224578','ana.belen@gmail.com'),(50,'Figueroa Martínez','Maria Alejandra','29145430','1981-02-09','Manuel Eyzaguirre 1200',1,'+5491151234471','maria.alejandra@gmail.com'),(51,'Puerta Castro','Lorena Sofía','25334462','1977-06-28','P. A. Sarmiento 122',1,'+5491159088900','lorena.sofia@hotmail.com'),(52,'Pérez Gómez','Pablo Ariel','28453962','1980-09-03','9 de Julio 300 este',5,'+56921000145','pablo.ariel@hotmail.com'),(53,'Gutierrez Díaz','Victoria Belen','32409271','1984-11-09','Las palmeras 200 casa 10',19,'+573105001255','victoria.belen@live.com'),(54,'Aguirre','David Antonio','30272434','1982-09-08','Villa Don Tomás Mza. A Casa 6',5,'+5491155062278','david.antonio@gmail.com'),(55,'Gonzalez','Virginia','34616295','1986-06-11','Av. Emmeline Pankhurst 3410',1,'+5499415662580','virginia@yahoo.com'),(56,'Palermo','Serena Martina','25550593','1977-07-16','Manuel Blanco Encalada 1455',5,'+5493815662312','serena.martina@hotmail.com'),(57,'Peña','Carla Trinidad','38952421','1990-07-03','Barrio Los Andes mnblc. A piso 2 dpto. B',5,'+5499416445500','carla.trinidad@yahoo.com'),(58,'Mercado','Mariana Edith','33961814','1985-05-27','Barrio Neuquen mnblc. B piso 3 dpto. 5',5,'+5493515998070','mariana.edith@hotmail.com'),(59,'Salcedo','Zoe','32768528','1984-08-08','John Adam 5573 este',19,'+5491151233215','zoe@hotmail.com'),(60,'Cantoni Castro','Patricia Abigaíl','35299138','1987-02-08','Benjamin Harrison 9822',19,'+5531521037054','patricia.abi@gmail.com'),(61,'Olave Torres','Santiago Alberto','26805908','1978-05-12','Carlos Ibáñez piso 3 dpto. 13',1,'+5492616445500','santiago.alberto@gmail.com'),(62,'Figueroa Martín','Simon Juan','38119149','1990-04-11','Luis Alberto Lacalle 300 piso 6 dpto. 13',1,'+56221233681','simon.juan@gmail.com'),(63,'Vargas Gonzalez','Ricardo Emanuel','36844192','1988-08-13','Ramón Freire Serrano 4500',1,'+5499416566806','ricardo.emanuel@gmail.com'),(64,'Vasquez Saiz','Juan David','32187653','1984-10-18','Villa Don Tomás Mza. C Casa 26',1,'+5492805448024','juan.david@live.com'),(65,'Espinel','Damián Alejandro','31461343','1983-01-30','Ada Lovelace piso 2 dpto. 10',1,'+5491155004711','dami.alejandro@gmail.com'),(66,'Ontiveros','Omar','26628101','1978-09-14','Simón Bolívar 4582',1,'+5491159875587','omar@hotmail.com'),(67,'Díaz Ferreyra','Lucia','30325337','1982-07-23','Av. libertador 3578 este',1,'+569984850530','lucia@hotmail.com'),(68,'Cabrera','Tamara','37742561','1989-06-09','Av. almirante brown 1255',1,'+5493515991155','tamara@hotmail.com'),(69,'Torres Peña','Mario Manuel','34829178','1986-01-01','Las palmas 4511 sur',4,'+5491151231414','mar2021x@gmail.com'),(70,'Gonzalez Gonzalez ','Ariel','30533191','1982-11-30','Buenos Aires 300',4,'+5499415655122','arielgonz@yahoo.com');
/*!40000 ALTER TABLE `huesped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Argentina'),(2,'Bolivia'),(3,'Brasil'),(4,'Chile'),(5,'Colombia'),(6,'Costa Rica'),(7,'Cuba'),(8,'Ecuador'),(9,'El Salvador'),(10,'Guatemala'),(11,'Haití'),(12,'Honduras'),(13,'México'),(14,'Nicaragua'),(15,'Panamá'),(16,'Paraguay'),(17,'Perú'),(18,'República Dominicana'),(19,'Uruguay'),(20,'Venezuela');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id` int NOT NULL,
  `huesped_id` int NOT NULL,
  `servicio_extra_id` int NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad_hora` tinyint NOT NULL,
  `importe` float(12,2) NOT NULL,
  `forma_pago_id` int NOT NULL,
  PRIMARY KEY (`huesped_id`,`servicio_extra_id`,`id`),
  KEY `fk_huesped_has_servicio_extra_servicio_extra1_idx` (`servicio_extra_id`),
  KEY `fk_huesped_has_servicio_extra_huesped1_idx` (`huesped_id`),
  KEY `fk_reserva_forma_pago1_idx` (`forma_pago_id`),
  CONSTRAINT `fk_huesped_has_servicio_extra_huesped1` FOREIGN KEY (`huesped_id`) REFERENCES `huesped` (`id`),
  CONSTRAINT `fk_huesped_has_servicio_extra_servicio_extra1` FOREIGN KEY (`servicio_extra_id`) REFERENCES `servicio_extra` (`id`),
  CONSTRAINT `fk_reserva_forma_pago1` FOREIGN KEY (`forma_pago_id`) REFERENCES `forma_pago` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (31,1,1,'2020-03-07 09:00:00',3,12000.00,4),(39,2,2,'2020-05-28 08:00:00',2,7000.00,4),(38,3,4,'2020-05-08 06:00:00',1,2000.00,1),(33,5,3,'2020-04-08 10:00:00',3,15000.00,3),(37,6,4,'2020-05-06 07:00:00',2,4000.00,2),(65,7,4,'2021-02-03 07:00:00',2,4000.00,1),(82,10,2,'2021-05-18 06:00:00',2,7000.00,2),(43,11,1,'2020-06-20 06:00:00',2,8000.00,1),(40,11,2,'2020-06-07 07:00:00',2,7000.00,3),(11,11,4,'2019-04-23 07:00:00',3,6000.00,2),(86,13,2,'2021-07-20 06:00:00',3,10500.00,4),(97,14,3,'2021-11-13 09:00:00',2,10000.00,4),(45,15,1,'2020-06-23 07:00:00',1,4000.00,3),(52,15,2,'2020-09-03 08:00:00',3,10500.00,3),(19,16,2,'2019-08-17 10:00:00',1,3500.00,2),(70,17,1,'2021-02-28 07:00:00',2,8000.00,1),(46,17,3,'2020-06-24 07:00:00',1,5000.00,1),(96,18,1,'2021-10-24 07:00:00',2,8000.00,1),(72,18,2,'2021-03-01 07:00:00',3,10500.00,2),(85,18,2,'2021-07-14 09:00:00',3,10500.00,1),(6,18,4,'2019-03-05 06:00:00',1,2000.00,1),(71,18,4,'2021-02-28 08:00:00',1,2000.00,3),(83,19,2,'2021-05-19 09:00:00',3,10500.00,2),(25,19,3,'2019-12-17 07:00:00',3,15000.00,3),(42,19,3,'2020-06-14 10:00:00',2,10000.00,2),(3,20,1,'2019-02-18 09:00:00',2,8000.00,1),(35,20,1,'2020-04-29 07:00:00',3,12000.00,2),(8,21,1,'2019-03-23 09:00:00',3,12000.00,1),(47,21,1,'2020-06-29 10:00:00',2,8000.00,2),(75,21,2,'2021-03-24 07:00:00',1,3500.00,4),(80,21,3,'2021-05-12 08:00:00',1,5000.00,1),(69,21,4,'2021-02-25 10:00:00',2,4000.00,3),(81,22,3,'2021-05-12 10:00:00',1,5000.00,4),(30,23,1,'2020-02-21 06:00:00',1,4000.00,4),(68,23,1,'2021-02-07 08:00:00',1,4000.00,3),(90,23,1,'2021-09-02 10:00:00',2,8000.00,4),(20,23,3,'2019-08-23 10:00:00',3,15000.00,2),(13,25,1,'2019-06-02 08:00:00',2,8000.00,4),(4,25,3,'2019-03-01 09:00:00',2,10000.00,4),(9,25,4,'2019-03-30 08:00:00',2,4000.00,4),(48,26,4,'2020-07-03 08:00:00',2,4000.00,4),(73,26,4,'2021-03-05 08:00:00',3,6000.00,3),(100,29,4,'2021-12-25 06:00:00',1,2000.00,4),(64,31,2,'2021-01-30 06:00:00',1,3500.00,4),(51,31,3,'2020-08-13 10:00:00',1,5000.00,1),(84,31,3,'2021-06-01 10:00:00',2,10000.00,3),(74,32,1,'2021-03-06 08:00:00',3,12000.00,4),(79,32,3,'2021-05-11 10:00:00',2,10000.00,4),(34,33,3,'2020-04-10 10:00:00',3,15000.00,2),(56,33,3,'2020-11-12 07:00:00',2,10000.00,4),(36,34,2,'2020-05-06 06:00:00',1,3500.00,2),(50,34,4,'2020-08-07 10:00:00',3,6000.00,4),(24,35,1,'2019-12-13 07:00:00',3,12000.00,2),(66,35,2,'2021-02-04 07:00:00',2,7000.00,2),(2,35,3,'2019-02-15 09:00:00',2,10000.00,3),(62,35,4,'2021-01-06 10:00:00',1,2000.00,4),(89,36,3,'2021-08-10 10:00:00',3,15000.00,2),(22,38,4,'2019-09-22 09:00:00',3,6000.00,2),(58,39,3,'2020-11-28 08:00:00',1,5000.00,4),(14,40,1,'2019-06-17 06:00:00',1,4000.00,4),(26,40,1,'2019-12-21 08:00:00',2,8000.00,1),(49,40,3,'2020-07-03 06:00:00',3,15000.00,2),(1,40,4,'2019-01-15 09:00:00',1,2000.00,1),(55,41,2,'2020-10-24 06:00:00',1,3500.00,3),(92,41,3,'2021-09-10 08:00:00',3,15000.00,4),(12,41,4,'2019-04-27 10:00:00',1,2000.00,1),(7,42,3,'2019-03-05 10:00:00',2,10000.00,4),(5,42,4,'2019-03-02 06:00:00',3,6000.00,3),(93,43,1,'2021-09-17 10:00:00',1,4000.00,3),(91,43,2,'2021-09-03 07:00:00',2,7000.00,4),(21,43,3,'2019-09-04 09:00:00',1,5000.00,4),(87,44,1,'2021-07-26 06:00:00',2,8000.00,4),(59,44,2,'2020-11-30 06:00:00',1,3500.00,1),(15,44,4,'2019-07-14 09:00:00',2,4000.00,2),(23,44,4,'2019-10-09 06:00:00',1,2000.00,2),(44,45,4,'2020-06-22 09:00:00',2,4000.00,3),(78,46,3,'2021-05-04 08:00:00',1,5000.00,1),(98,46,3,'2021-12-02 06:00:00',2,10000.00,4),(77,46,4,'2021-04-19 09:00:00',1,2000.00,3),(94,47,4,'2021-10-05 10:00:00',2,4000.00,3),(29,48,1,'2020-02-13 09:00:00',1,4000.00,2),(76,48,2,'2021-03-30 09:00:00',3,10500.00,1),(10,49,1,'2019-04-04 07:00:00',3,12000.00,4),(28,49,1,'2020-01-05 07:00:00',1,4000.00,4),(16,49,3,'2019-07-18 10:00:00',1,5000.00,4),(95,51,2,'2021-10-07 08:00:00',3,10500.00,3),(54,53,2,'2020-10-15 10:00:00',2,7000.00,1),(63,54,3,'2021-01-24 10:00:00',3,15000.00,1),(61,55,1,'2020-12-26 06:00:00',1,4000.00,3),(41,55,2,'2020-06-12 08:00:00',1,3500.00,3),(32,55,3,'2020-03-30 10:00:00',1,5000.00,2),(57,55,4,'2020-11-23 08:00:00',2,4000.00,4),(88,58,1,'2021-07-30 06:00:00',2,8000.00,2),(99,58,1,'2021-12-23 07:00:00',3,12000.00,1),(67,58,4,'2021-02-05 07:00:00',3,6000.00,1),(18,59,1,'2019-08-09 09:00:00',1,4000.00,4),(60,59,1,'2020-12-12 06:00:00',3,12000.00,1),(53,59,2,'2020-10-09 07:00:00',2,7000.00,3),(27,59,4,'2020-01-02 07:00:00',3,6000.00,1),(17,60,1,'2019-08-03 10:00:00',3,12000.00,1);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'Administración'),(4,'Lavandería'),(5,'Limpieza'),(3,'Mantenimiento'),(2,'Recepción');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_basico`
--

DROP TABLE IF EXISTS `servicio_basico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_basico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_basico`
--

LOCK TABLES `servicio_basico` WRITE;
/*!40000 ALTER TABLE `servicio_basico` DISABLE KEYS */;
INSERT INTO `servicio_basico` VALUES (1,'Aire acondicionado'),(2,'Almuerzo'),(3,'Cena'),(4,'Desayuno'),(5,'PlayStation 3'),(6,'PlayStation 4'),(7,'Servicio al cuarto'),(8,'Teléfono'),(9,'Televisión'),(10,'Wifi'),(11,'Xbox 360');
/*!40000 ALTER TABLE `servicio_basico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_extra`
--

DROP TABLE IF EXISTS `servicio_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_extra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `costo_hora` float(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_extra`
--

LOCK TABLES `servicio_extra` WRITE;
/*!40000 ALTER TABLE `servicio_extra` DISABLE KEYS */;
INSERT INTO `servicio_extra` VALUES (1,'Cancha de tenis',4000.00),(2,'Cancha de paddle',3500.00),(3,'Cancha de basket ball',5000.00),(4,'Sauna',2000.00);
/*!40000 ALTER TABLE `servicio_extra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20 19:34:16
