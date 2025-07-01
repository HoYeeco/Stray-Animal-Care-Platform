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
-- Table structure for table `t_upload_records`
--

DROP TABLE IF EXISTS `t_upload_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_upload_records` (
  `upload_record_id` int NOT NULL AUTO_INCREMENT,
  `reporter` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上报人',
  `reporter_phone` char(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '动物名字',
  `species` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '物种',
  `gender` enum('母','公') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `health_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '健康状态',
  `sterilization_status` enum('未绝育','已绝育','不详') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '绝育状态',
  `discovery_time` date NOT NULL COMMENT '发现时间(YYYY-MM-DD)',
  `discovery_place` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发现地点',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '补充描述',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`upload_record_id`),
  CONSTRAINT `chk_reporter_phone` CHECK (regexp_like(`reporter_phone`,_utf8mb4'^[0-9]{11}$'))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='上报记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_upload_records`
--

LOCK TABLES `t_upload_records` WRITE;
/*!40000 ALTER TABLE `t_upload_records` DISABLE KEYS */;
INSERT INTO `t_upload_records` VALUES (1,'何可可','17509901122','小熊','狗','母','轻微脱水','已绝育','2025-06-27','成都市锦江区静安路1号停车场E区','有点胆小','bear.jpg'),(2,'祝缨','18351512200','花花','猫','母','健康','不详','2025-06-28','成都市武侯区玉林路24号后门保安亭','不喜欢吃猫粮','11');
/*!40000 ALTER TABLE `t_upload_records` ENABLE KEYS */;
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
