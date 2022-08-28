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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbAutor`
--

LOCK TABLES `tbAutor` WRITE;
/*!40000 ALTER TABLE `tbAutor` DISABLE KEYS */;
INSERT INTO `tbAutor` VALUES (35,'Charles Duhig'),(36,'Charles Duhig'),(37,'Dale Carnegie'),(38,'Mark Zukenberg'),(39,'LAST TEST'),(40,'JOVEM PAN'),(41,'Dale Carnegie'),(42,'Jonas Darknes'),(43,'Steve Jobs'),(44,'sla'),(45,'Led Zeppelin'),(46,'Luiz Fernando'),(47,'Cansado'),(48,'Dale Carnegie'),(49,'Miguel Cervantes'),(50,'Anne Frank'),(51,'William Shakespeare'),(52,'George Orwell'),(53,'Antoine de Saint-Exupéry'),(54,'Machado de Assis'),(55,'Isaac Asimov'),(56,'Homero'),(57,'Dante Alighieri'),(58,'Kevin Malone');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbLivro`
--

LOCK TABLES `tbLivro` WRITE;
/*!40000 ALTER TABLE `tbLivro` DISABLE KEYS */;
INSERT INTO `tbLivro` VALUES (33,'O Poder do Hábito','2022-08-24',36,'DISPONIVEL'),(45,'Como Fazer Amigos e Influenciar Pessoas','2022-08-27',48,'EMPRESTADO'),(46,'Dom Quixote','2022-08-27',49,'DISPONIVEL'),(47,'Diário','2022-08-27',50,'INDISPONIVEL'),(48,'Hamlet','2022-08-27',51,'DISPONIVEL'),(50,'O Pequeno Príncipe','2022-08-27',53,'DISPONIVEL'),(51,'Dom Casmurro','2022-08-27',54,'DISPONIVEL'),(52,'Eu, Robô','2022-08-27',55,'DISPONIVEL'),(53,'Odisseia','2022-08-27',56,'DISPONIVEL'),(54,'A Divina Comédia','2022-08-27',57,'DISPONIVEL'),(55,'The Office','2022-09-07',58,'DISPONIVEL');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUsuario`
--

LOCK TABLES `tbUsuario` WRITE;
/*!40000 ALTER TABLE `tbUsuario` DISABLE KEYS */;
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

-- Dump completed on 2022-08-28 15:55:08
