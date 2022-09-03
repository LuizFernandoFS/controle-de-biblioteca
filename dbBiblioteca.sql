-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: dbBiblioteca
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbAutor`
--

DROP TABLE IF EXISTS `tbAutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbAutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAutor`
--

LOCK TABLES `tbAutor` WRITE;
/*!40000 ALTER TABLE `tbAutor` DISABLE KEYS */;
INSERT INTO `tbAutor` VALUES (35,'Charles Duhig'),(36,'Charles Duhig'),(37,'Dale Carnegie'),(38,'Mark Zukenberg'),(39,'LAST TEST'),(40,'JOVEM PAN'),(41,'Dale Carnegie'),(42,'Jonas Darknes'),(43,'Steve Jobs'),(44,'sla'),(45,'Led Zeppelin'),(46,'Luiz Fernando'),(47,'Cansado'),(48,'Dale Carnegie'),(49,'Miguel Cervantes'),(50,'Anne Frank'),(51,'William Shakespeare'),(52,'George Orwell'),(53,'Antoine de Saint-Exupéry'),(54,'Machado de Assis'),(55,'Isaac Asimov'),(56,'Homero'),(57,'Dante Alighieri'),(58,'Kevin Malone'),(59,'Dale Carnegie'),(60,'Mark Manson'),(61,'Homero'),(62,'Mary Shelley'),(63,'teste'),(64,'William Shakespeare'),(65,'George Orwell'),(66,'Miguel De Cervantes'),(67,'teste'),(68,'William Shakespeare'),(69,'Homero'),(70,'Dante Alighieri'),(71,'William Shakespeare'),(72,' JK Rowling'),(73,'George Orwell'),(74,'Lev Tolstoi'),(75,'Harper Lee'),(76,'Luiz Fernando');
/*!40000 ALTER TABLE `tbAutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbLivro`
--

DROP TABLE IF EXISTS `tbLivro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbLivro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `dataCriacao` date DEFAULT NULL,
  `autor` int NOT NULL,
  `status` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autor` (`autor`),
  CONSTRAINT `tbLivro_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `tbAutor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbLivro`
--

LOCK TABLES `tbLivro` WRITE;
/*!40000 ALTER TABLE `tbLivro` DISABLE KEYS */;
INSERT INTO `tbLivro` VALUES (57,'A Sutil Arte De Ligar O Foda-se','2022-08-31',60,'DISPONIVEL'),(58,'Odisseia','2022-08-31',61,'DISPONIVEL'),(59,'Frankenstein','2022-08-31',62,'DISPONIVEL'),(62,'1984','2022-09-03',65,'DISPONIVEL'),(63,'Dom Quixote','2022-09-03',66,'DISPONIVEL'),(65,'Hamlet','2022-09-03',68,'DISPONIVEL'),(66,'Ilíada','2022-09-03',69,'DISPONIVEL'),(67,'A Divina Comédia','2022-09-03',70,'DISPONIVEL'),(68,'Romeu e Julieta','2022-09-03',71,'DISPONIVEL'),(69,'Harry Potter','2022-09-03',72,'DISPONIVEL'),(70,'A Revolução dos Bichos','2022-09-03',73,'DISPONIVEL'),(71,'Guerra e Paz','2022-09-03',74,'DISPONIVEL'),(72,'O Sol é Para Todos','2022-09-03',75,'DISPONIVEL');
/*!40000 ALTER TABLE `tbLivro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbUsuario`
--

DROP TABLE IF EXISTS `tbUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbUsuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(65) NOT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(24) NOT NULL,
  `tipo` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUsuario`
--

LOCK TABLES `tbUsuario` WRITE;
/*!40000 ALTER TABLE `tbUsuario` DISABLE KEYS */;
INSERT INTO `tbUsuario` VALUES (1,'admin','admin@email.com','admin','admin'),(2,'luiz','luiz@email.com','luiz','usuario'),(3,'jorge','jorjão@email.com','jorge','usuario'),(4,'jhenifer','jhenifer@email.com','jhenifer','usuario'),(5,'jefferson','jefferson.chaves@ifpr.edu.br','jefferson','usuario');
/*!40000 ALTER TABLE `tbUsuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-03 19:10:03
