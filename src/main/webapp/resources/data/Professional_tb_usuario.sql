-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Professional
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` varchar(200) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `celular` varchar(9) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `presentacion` text,
  `tipo_login` varchar(20) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `id_ubigeo` int(11) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_ubigeo_idx` (`id_ubigeo`),
  CONSTRAINT `fk_ubigeo` FOREIGN KEY (`id_ubigeo`) REFERENCES `tb_ubigeo` (`id_ubigeo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'110495257321975923163','Gabriel','Sánchez Villacorta','gabriel.sanchezv27@gmail.com',NULL,'1994-07-27','https://lh4.googleusercontent.com/-KVr0_2FBhEg/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rdPEUpKKJgA-jUfFlFRIsqIdJeIgw/s96-c/photo.jpg','',0,NULL,'facebook','2019-10-26 22:04:51',150117,'proff'),(2,'112221373659922313575','Gabriel','Sanchez','gabriel@plazapoints.com',NULL,NULL,'https://lh5.googleusercontent.com/-1vOxXmboqYE/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rcUbtR0KDKXsnOe-DEiSyHw_XP3aQ/s96-c/photo.jpg',NULL,NULL,NULL,'facebook','2019-10-26 22:04:51',0,'client'),(4,'105824755067481443452','Gabriel','Sanchez V.','gslu2717@gmail.com',NULL,NULL,'https://lh3.googleusercontent.com/a-/AAuE7mBkWKKW69_FXKH_jelIuCkYXNKNGPJE0L2MQUs59g=s96-c',NULL,0,NULL,'facebook','2019-10-27 21:17:05',0,'proff'),(5,'114495295286473726977','Luis','z','luisz160897@gmail.com',NULL,NULL,'https://lh3.googleusercontent.com/a-/AAuE7mDTigSx3ZiEIMAN0O19jaeg1595cECIgQomBZVRGw=s96-c',NULL,0,NULL,'facebook','2019-11-27 19:48:04',0,'proff'),(14,'105317260085999348489','Belen','Roque','belenroque27@gmail.com',NULL,NULL,'https://lh3.googleusercontent.com/a-/AAuE7mBxkE2K7X_0zw6iD-VEDqXSRMelsoZNEZTc5Yx9=s96-c','',0,NULL,'facebook','2019-12-03 21:31:14',150104,'proff'),(15,'110457753414177840093','Manuel','Carbajal','manuelcarbajal519@gmail.com',NULL,NULL,'https://lh3.googleusercontent.com/a-/AAuE7mAR9VG_zZO0kIRd7dNzJD90NMepf7z6fk3V5j1pxeo=s96-c',NULL,NULL,NULL,'facebook','2019-12-03 21:38:34',0,NULL);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-03 22:33:07
