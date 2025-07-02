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
-- Table structure for table `t_adoption_info`
--

DROP TABLE IF EXISTS `t_adoption_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_adoption_info` (
  `adoption_info_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '动物名字',
  `species` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '物种',
  `gender` enum('母','公') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `health_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '健康状态',
  `sterilization_status` enum('未绝育','已绝育','不详') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '绝育状态',
  `base_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '暂无' COMMENT '所在基地',
  `discovery_time` date NOT NULL COMMENT '发现时间',
  `discovery_place` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发现地点',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '补充描述',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片url',
  `adoption_status` enum('可领养','已被领养') COLLATE utf8mb4_unicode_ci DEFAULT '可领养' COMMENT '领养状态',
  `upload_record_id` int DEFAULT NULL,
  `adopted_time` datetime DEFAULT NULL COMMENT '领养时间',
  PRIMARY KEY (`adoption_info_id`),
  UNIQUE KEY `uk_adoption_info` (`name`,`species`,`discovery_time`),
  KEY `fk_adoption_info_upload` (`upload_record_id`),
  CONSTRAINT `fk_adoption_info_upload` FOREIGN KEY (`upload_record_id`) REFERENCES `t_upload_records` (`upload_record_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='领养信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_adoption_info`
--

LOCK TABLES `t_adoption_info` WRITE;
/*!40000 ALTER TABLE `t_adoption_info` DISABLE KEYS */;
INSERT INTO `t_adoption_info` VALUES (1,'小熊','狗','公','轻微脱水','已绝育','暂无','2025-06-28','成都市锦江区静安路1号','有点胆小，不要对它大声喊叫','bear.jpg','可领养',1,NULL),(2,'花花','猫','母','健康','不详','暂无','2025-06-28','成都市武侯区玉林路24号','不喜欢吃猫粮，建议准备罐头','无','可领养',2,NULL);
/*!40000 ALTER TABLE `t_adoption_info` ENABLE KEYS */;
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
