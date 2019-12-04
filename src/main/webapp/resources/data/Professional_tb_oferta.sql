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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_oferta`
--

LOCK TABLES `tb_oferta` WRITE;
/*!40000 ALTER TABLE `tb_oferta` DISABLE KEYS */;
INSERT INTO `tb_oferta` VALUES (10,1,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a turpis ornare, congue est in, blandit nisl. Ut risus arcu, lacinia sit amet turpis finibus, egestas mollis risus. Nulla cursus iaculis mattis. Sed accumsan, enim id laoreet placerat, urna tellus posuere ligula, vel placerat tortor mi quis tortor. Ut scelerisque et leo nec iaculis. In rutrum, velit luctus egestas finibus, ex mi tincidunt sapien, vel maximus dui urna et velit. Proin non semper sem. In pharetra magna et ipsum ornare, a fringilla elit convallis. Nulla dapibus consequat finibus. Ut blandit ultrices risus, malesuada semper ligula. Pellentesque placerat nunc nulla, ac dapibus neque sagittis eget. Cras molestie ullamcorper elit placerat vehicula.',120),(11,14,8,'Phasellus sit amet auctor velit. Proin quis sapien tortor. Maecenas porta, velit at semper dictum, magna elit rhoncus purus, nec lobortis ante lorem ac lacus. Suspendisse sit amet tincidunt ante. In at pellentesque nibh. Nulla facilisi. Suspendisse potenti. Morbi diam arcu, dapibus sit amet condimentum ut, condimentum a libero. Aenean ornare ex id lectus mattis, vitae venenatis elit elementum. In pellentesque pharetra urna quis maximus. Pellentesque et rhoncus nisi. Duis feugiat, enim id consectetur malesuada, nisl lorem congue est, nec vehicula metus mauris vitae massa. Suspendisse potenti. Cras ac nulla sapien. In rutrum dapibus lacus at posuere. In hendrerit pellentesque ipsum, vitae consequat enim eleifend eget.',230),(12,14,4,'Nullam eget pharetra dui. Etiam feugiat, arcu ac posuere condimentum, tellus diam consequat enim, eu facilisis dui ipsum in enim. Nam posuere rutrum magna ac egestas. Nullam sodales odio vel tincidunt sollicitudin. Nam mollis mi quis tristique cursus. Nunc ultricies finibus sapien, id interdum elit eleifend dignissim. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc tincidunt magna quis porttitor tincidunt. Suspendisse ac convallis sem. Praesent at accumsan sem.',90);
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

-- Dump completed on 2019-12-03 22:33:06
