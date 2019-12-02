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
-- Table structure for table `tb_oferta`
--

DROP TABLE IF EXISTS `tb_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_oferta` (
  `id_oferta` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL,
  `descripcion` text,
  `precio_hora` double DEFAULT NULL,
  PRIMARY KEY (`id_oferta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_oferta`
--

LOCK TABLES `tb_oferta` WRITE;
/*!40000 ALTER TABLE `tb_oferta` DISABLE KEYS */;
INSERT INTO `tb_oferta` VALUES (1,1,3,'Descripción De Albañilería',120),(2,1,2,'Descripción de gasfiteria',200),(4,1,9,'Descripción de multiservicios',150),(5,1,3,'Ut efficitur malesuada magna, in condimentum orci dictum dictum. Nam erat enim, ultrices ac tellus in, pharetra interdum enim. Sed mi tellus, facilisis et bibendum sit amet, fermentum quis ligula. Maecenas facilisis, tellus rhoncus luctus dictum, metus sapien bibendum leo, ut pharetra felis justo eu augue. Aliquam ultricies tincidunt nibh, mattis ultrices nulla eleifend vel. In euismod, ipsum id euismod bibendum, nulla ligula gravida arcu, vel elementum felis lacus eget nisi. Phasellus mauris sapien, malesuada in venenatis non, vulputate id diam. Nam leo purus, rutrum in viverra ut, fermentum at augue. Mauris rhoncus nisl nec sapien luctus, ut tempor nisl maximus. Donec finibus erat et nibh blandit sollicitudin. Nunc leo dui, luctus nec eros eu, pretium pellentesque ligula.',120),(6,1,3,'lkfjslkdjf',123),(7,1,9,'AAAAAAA',220);
/*!40000 ALTER TABLE `tb_oferta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01 19:23:41
