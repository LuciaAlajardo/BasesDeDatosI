
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_spotify
-- ------------------------------------------------------
-- Server version	8.0.25

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

create database if not exists proyecto_spotify;
use proyecto_spotify;
--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `idAlbum` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `iddiscografica` int DEFAULT NULL,
  `idArtista` int DEFAULT NULL,
  `imagenportada` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAlbum`),
  KEY `IdDiscografica_idx` (`iddiscografica`),
  KEY `idArtista_idx` (`idArtista`),
  CONSTRAINT `idArtista` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`),
  CONSTRAINT `IdDiscografica` FOREIGN KEY (`iddiscografica`) REFERENCES `discografica` (`idDiscografica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Is There Anybody Out There',4,1,'imagenalbum.jpg'),(2,'Radio Sampler ‎2xCD',4,1,NULL),(3,'Delicate Sound Of Thunder',4,1,'imagenalbum.jpg'),(4,'Abbey Road',5,4,NULL),(6,'Use Your Illusion II',6,5,NULL),(7,'Appetite for Destruction',6,5,'imagenalbum.jpg'),(8,'True Blue',7,7,NULL),(9,'Like A Virgin ',7,7,'imagenalbum.jpg'),(10,'Fito Paez',4,8,NULL),(11,'Antología',3,8,'imagenalbum.jpg'),(12,'Diego Torres',4,9,NULL),(13,'Loba',1,10,'imagenalbum.jpg'),(14,'Pies Descalzos',3,10,NULL),(15,'Papi Juancho',1,11,'imagenalbum.jpg'),(16,'Vives',1,12,NULL),(17,'OCEAN',3,13,'imagenalbum.jpg'),(18,'Cello Concertos',28,14,NULL),(19,'\"Plays Weir, Finnissy, Newman And Skempton\"',44,15,'imagenalbum.jpg'),(20,'My father Knew Charles Ives and Harmonielehre',42,16,NULL),(21,'Pied Piper Fantasy',48,17,'imagenalbum.jpg'),(22,'Le Secret De La Vie',54,18,NULL),(23,'Solo Works',35,19,'imagenalbum.jpg'),(24,'Charlie Parker Sextet',33,20,NULL),(25,'Relaxin With The Miles Davis Quintet',47,21,'imagenalbum.jpg'),(26,'Dizzy Gillespie And His All-Stars',41,22,NULL),(27,'King Of The Tenor Sax',29,23,'imagenalbum.jpg'),(28,'Distinctive Song Styling',31,24,NULL),(29,'Yes Indeed!',25,25,'imagenalbum.jpg'),(30,'Chet Baker In New York',50,26,NULL),(31,'Son Con Guaguancó',55,27,'imagenalbum.jpg'),(32,'Maestra Vida',37,28,NULL),(33,'El Malo',37,29,'imagenalbum.jpg'),(34,'La Voz',38,30,NULL),(35,'Tito Rodriguez At The Palladium',58,31,'imagenalbum.jpg'),(36,'Amor Y Alegria',27,32,NULL),(37,'Adios Nonino',56,33,'imagenalbum.jpg'),(38,'Así Cantaba Carlitos',46,34,NULL),(39,'Cuando El Río Suena',43,35,'imagenalbum.jpg'),(40,'Alma De Bohemio',40,36,NULL),(41,'Aura',53,37,'imagenalbum.jpg'),(42,'Monton De Vida',34,38,NULL),(43,'Let Me Ride',38,39,'imagenalbum.jpg'),(44,'Kamikaze',24,40,NULL),(45,'Doggystyle',30,41,'imagenalbum.jpg'),(46,'The Black Album',51,42,NULL),(47,'Check Your Head',26,43,'imagenalbum.jpg'),(48,'Late Registration',52,44,NULL),(49,'Back To Mine',45,45,'imagenalbum.jpg'),(50,'Play It Loud!',39,46,NULL),(51,'Biosfera',32,47,'imagenalbum.jpg'),(52,'The Remixes',49,48,NULL),(53,'Ignition Key',57,49,'imagenalbum.jpg'),(54,'Dance Baby',34,50,NULL);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET