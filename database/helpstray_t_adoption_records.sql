-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: helpstray
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `t_adoption_records`
--

DROP TABLE IF EXISTS `t_adoption_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_adoption_records` (
  `adoption_record_id` int NOT NULL AUTO_INCREMENT,
  `adoption_info_id` int NOT NULL COMMENT '被领养动物ID',
  `pet_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '被领养动物名字',
  `adopter_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '领养人名字',
  `adopter_gender` enum('女','男') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '领养人性别',
  `age` tinyint unsigned NOT NULL COMMENT '年龄(0-100岁)',
  `id_card` char(18) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身份证号码',
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '住址',
  `contact_phone` char(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `adoption_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '领养时间',
  PRIMARY KEY (`adoption_record_id`),
  UNIQUE KEY `uk_adoption_unique` (`adoption_info_id`),
  CONSTRAINT `fk_adoption_records_info` FOREIGN KEY (`adoption_info_id`) REFERENCES `t_adoption_info` (`adoption_info_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_age` CHECK ((`age` between 0 and 100)),
  CONSTRAINT `chk_contact_phone` CHECK (regexp_like(`contact_phone`,_utf8mb4'^[0-9]{11}$')),
  CONSTRAINT `chk_id_card` CHECK (regexp_like(`id_card`,_utf8mb4'^[0-9A-Z]{18}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='领养记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_adoption_records`
--

LOCK TABLES `t_adoption_records` WRITE;
/*!40000 ALTER TABLE `t_adoption_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_adoption_records` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-01 12:08:25
